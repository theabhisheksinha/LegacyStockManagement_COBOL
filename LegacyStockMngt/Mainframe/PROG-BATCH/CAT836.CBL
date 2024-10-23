000001* PDX    - CAT836   C0272583 12/12/08 09:46:07 TBLAMUR            00001000
LRM002* SSR 0061164 POSITION TRANSFER FUND(PTF)                                 
000001* PDX    - CAT836   C0226130 10/20/05 11:50:04 TBLAMUR            00001000
LRM001* SSR 44394 CONTENTION ABEND.  ADD CLIENT NBR TO CURSOR                   
000001* PDX    - CAT836   C0222889 06/29/05 15:37:12 TBLAMUR            00001000
000001* PDX    - CAT836   C0218852 04/08/05 16:37:24 TBLAMUR            00001000
000001* PDX    - CAT836   C0149951 02/08/01 16:34:13 TBTIKUO            00001000
000001* PDX    - CAT836   C0120592 01/18/99 11:42:15 TBYOHON            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT836.                                                      
      *---------------------------------------------------------------*         
      *REMARKS.                                                       *         
      *                                                               *         
      *  THIS PROGRAM - CREATES THE IE (REGISTERED REP) NOTIFICATION  *         
      *                 REPORT FOR NEW DELIVERS 1 DAY ON THE ACATS    *         
      *                 TRANSFER FILE                                 *         
      *               - THE REPORT IS IN CLIENT, REGISTERED REP,      *         
      *                 BRANCH AND ACCOUNT NUMBER SEQUENCE.           *         
      *                                                               *         
      *---------------------------------------------------------------*         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT  REPORT-FILE         ASSIGN  TO  UT-S-REPORT.                 
                                                                                
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.                    
                                                                                
           EJECT                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
       FILE SECTION.                                                            
                                                                                
       FD  REPORT-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC                  PIC X(143).                              
                                                                                
       SD  SORT-FILE.                                                           
       01  SORT-REC.                                                            
           05  S-CLIENT                PIC 9(03).                               
           05  S-REG-REP               PIC X(03).                               
           05  S-BRANCH                PIC X(03).                               
           05  S-ACCOUNT               PIC X(05).                               
           05  S-CONTROLLER            PIC X(03).                               
           05  FILLER                  PIC X(200).                              
           EJECT                                                                
      *****************************************************************         
       WORKING-STORAGE  SECTION.                                                
      *****************************************************************         
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT836'.          
                                                                                
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.               
                                                                                
       77  PEND-PROC-DATE                   PIC X(06)  VALUE ' '.               
                                                                                
       77  WS-DATE                          PIC 9(06)  VALUE 0.                 
                                                                                
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.             
                                                                                
       77  ABEND-CODE-4000      COMP        PIC S9(4)  VALUE +4000.             
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.             
                                                                                
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.             
                                                                                
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.                
                                                                                
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.                
                                                                                
       77  B1-SUB                           PIC 9(4)    VALUE 0.                
       77  B11-SUB                          PIC 9(4)    VALUE 0.                
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.                
       77  B1-SUB1                          PIC 9(4)    VALUE 0.                
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.                
       77  B1-SUB2                          PIC 9(4)    VALUE 0.                
       77  B3-SUB                           PIC 9(4)    VALUE 0.                
       77  B4-SUB                           PIC 9(4)    VALUE 0.                
       77  B5-SUB                           PIC 9(4)    VALUE 0.                
       77  B6-SUB                           PIC 9(4)    VALUE 0.                
       77  CNTL-SUB                         PIC 9(4)    VALUE 0.                
       77  T-SUB1                           PIC 9(4)    VALUE 0.                
       77  T-SUB2                           PIC 9(4)    VALUE 0.                
       77  LINECNT                          PIC 9(4)    VALUE 99.               
       77  PAGECNT                          PIC 9(4)    VALUE 0.                
       77  ACAT-BYPASS-CLI                  PIC 9(3)    VALUE 0.                
       77  ACAT-EXTRACT-CLI                 PIC 9(3)    VALUE 0.                
       77  ACAT-CLI-P                       PIC 9(3)    VALUE 0.                
LRM001 77  WS-CURRENT-CLIENT                PIC X(04)   VALUE '0000'.           
                                                                                
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-ENTRY-FOUND                          VALUE 'Y'.               
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-SEARCH-END                           VALUE 'Y'.               
                                                                                
       77  B1-RANGE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-FOUND                          VALUE 'Y'.               
           88  B1-RANGE-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-RANGE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-SEARCH-END                     VALUE 'Y'.               
                                                                                
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-TIME                         VALUE 'Y'.               
                                                                                
       77  ACAT-HDR-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-HDR                                VALUE 'Y'.               
                                                                                
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-EOF                                VALUE 'Y'.               
                                                                                
       77  ADR-ACCT-TEST                    PIC X(02)  VALUE '  '.              
           88  ADR-IRA                                 VALUE '03' '04'          
                                                             '05'.              
       77  ACAT-DELIVER-SW                  PIC X      VALUE 'Y'.               
           88  ACAT-FIRST-DELIVER                      VALUE 'Y'.               
                                                                                
       77  ACAT-CLI-TOT-SW                  PIC X      VALUE ' '.               
           88  ACAT-CLIENT-TOTAL                       VALUE 'Y'.               
                                                                                
       77  ACAT-NAME-ADDR-STATUS            PIC X      VALUE ' '.               
           88  ACAT-NAME-ADDR-FOUND                    VALUE '1'.               
           88  ACAT-NAME-ADDR-NOT-FOUND                VALUE '2'.               
                                                                                
       01  WS-COUNTERS.                                                         
           05  ACAT-BYP-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-DTL-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-ACPT-RECS           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-REJ-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           EJECT                                                                
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUTS    '.                 
       COPY GETNACOB.                                                           
       01  GETNA-SEGMENT-INCLUDES.                                              
       COPY NASEGHDR.                                                           
       COPY NASEGPPA.                                                           
       COPY NASEGPPB.                                                           
       COPY NASEGPPI.                                                           
       COPY NNASGPPN.                                                           
       COPY NASEGEND.                                                           
TCK001 COPY STUBCPY.                                                            
                                                                                
      ******************************************************************CAT520  
      * DB2 ERROR MESSAGE AREA                                         *CAT520  
      ******************************************************************CAT520  
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT520  
       01  W-DB2-MESSAGE-AREA.                                          CAT520  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT520  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT520  
                   INDEXED BY W-DB2-IDX.                                CAT520  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT520  
                                                                        CAT520  
       01  W-DB2-ERR-MSG-OUT.                                           CAT520  
           05  FILLER            PIC X(04) VALUE '**  '.                CAT520  
           05  W-ERR-MSG-OUT     PIC X(50) VALUE SPACE.                 CAT520  
           05  FILLER            PIC X(12) VALUE '=> SQLCODE: '.        CAT520  
           05  W-SQLCODE-OUT     PIC -999.                              CAT520  
                                                                        CAT520  
           COPY BPDATESC.                                                       
           COPY BHINFO.                                                         
           COPY BHACAT.                                                         
           COPY BHBTS2.                                                         
           COPY BHATB.                                                          
           EJECT                                                                
       01  HDR1.                                                                
           05  FILLER                  PIC X       VALUE SPACES.                
           05  FILLER                  PIC X(10)   VALUE ' CAT836 - '.          
           05  H1-CLIENT               PIC X(3).                                
           05  FILLER                  PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME          PIC X(30).                               
           05  FILLER                  PIC X(3)   VALUE SPACES.                 
           05  FILLER                  PIC X(74)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO                PIC ZZ9.                                 
                                                                                
       01  HDR2.                                                                
           05  FILLER                  PIC X(57) VALUE SPACES.                  
           05  FILLER                  PIC X(60) VALUE                          
               'NEW OUTGOING ACATS '.                                           
           05  FILLER                  PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE.                                                    
               10  H2-MM               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-DD               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-YY               PIC X(2).                                
                                                                                
       01  HDR3.                                                                
           05  FILLER                  PIC X(59)  VALUE SPACES.                 
           05  FILLER                  PIC X(61)  VALUE                         
               'SEND TO TOA '.                                                  
                                                                                
       01  HDR4.                                                                
           05  FILLER                  PIC X(20)  VALUE SPACES.                 
           05  FILLER                  PIC X(38)  VALUE                         
               'NA LINE 1 .........................'.                           
           05  FILLER                  PIC X(38)  VALUE                         
               'NA LINE 2 .........................'.                           
           05  FILLER                  PIC X(35)  VALUE                         
               'NA LINE 3 .........................'.                           
                                                                                
       01  HDR5.                                                                
           05  FILLER                  PIC X(28)  VALUE                         
               '  RR  ACCOUNT  CNTL'.                                           
           05  FILLER                  PIC X(21)  VALUE                         
               'SHORT NAME '.                                                   
           05  FILLER                  PIC X(36)  VALUE                         
               'ACCT TYPE    STATE   ZIPCODE '.                                 
           05  FILLER                  PIC X(35)  VALUE                         
               'DATES-OPENED   LST MT     LST ST '.                             
                                                                                
       01  HDR6.                                                                
           05  FILLER                  PIC X(24)  VALUE                         
               '  -----------------'.                                           
           05  FILLER                  PIC X(25)  VALUE                         
               '--------------------'.                                          
           05  FILLER                  PIC X(36)  VALUE                         
               '---------    -----   ------- '.                                 
           05  FILLER                  PIC X(35)  VALUE                         
               '---------------------------------'.                             
                                                                                
       01  DETAIL-LINE-1.                                                       
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-RR                  PIC X(3).                                
           05  FILLER                  PIC X     VALUE SPACE.                   
           05  DL1-BRANCH              PIC X(3).                                
           05  FILLER                  PIC X     VALUE '-'.                     
           05  DL1-ACCOUNT             PIC X(5).                                
           05  FILLER                  PIC X     VALUE SPACE.                   
           05  DL1-CONTROLLER          PIC X(3).                                
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-NAME1               PIC X(35).                               
           05  FILLER                  PIC X(3)  VALUE SPACES.                  
           05  DL1-NAME2               PIC X(35).                               
           05  FILLER                  PIC X(3)  VALUE SPACES.                  
           05  DL1-NAME3               PIC X(35).                               
                                                                                
       01  DETAIL-LINE-2.                                                       
           05  FILLER                  PIC X(24)  VALUE SPACES.                 
           05  DL2-SHORT-NAME          PIC X(20).                               
           05  FILLER                  PIC X(05)  VALUE SPACES.                 
           05  DL2-ACCT-TYPE           PIC X(10).                               
           05  FILLER                  PIC X(04)  VALUE SPACES.                 
           05  DL2-STATE               PIC X(02).                               
           05  FILLER                  PIC X(07)  VALUE SPACES.                 
           05  DL2-ZIPCODE             PIC X(5).                                
           05  FILLER                  PIC X(10)  VALUE SPACES.                 
           05  DL2-DTE-OPENED.                                                  
               10  DL2-DO-MM           PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DO-DD           PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DO-YY           PIC X(2).                                
           05  FILLER                  PIC X(05)  VALUE SPACES.                 
           05  DL2-DTE-LST-MT.                                                  
               10  DL2-DLM-MM          PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DLM-DD          PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DLM-YY          PIC X(2).                                
           05  FILLER                  PIC X(03)  VALUE SPACES.                 
           05  DL2-DTE-LST-ST.                                                  
               10  DL2-DLS-MM          PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DLS-DD          PIC X(2).                                
               10  FILLER              PIC X      VALUE '/'.                    
               10  DL2-DLS-YY          PIC X(2).                                
                                                                                
       01  MSG-LINE                    PIC X(133).                              
                                                                                
       01  NO-ACTV-LINE.                                                        
           05  FILLER                  PIC X(40)  VALUE SPACES.                 
           05  NAL-MSG                 PIC X(90).                               
                                                                                
       01  PRINTAREA.                                                           
           05  PRINTSPACE.                                                      
               10  CC                  PIC X.                                   
               10  PRINT-AREA          PIC X(132).                              
           05  TRACSPACE.                                                       
               10  TRAC-CLI            PIC 9(3) COMP-3.                         
               10  TRAC-CNTL           PIC 9(3) COMP-3.                         
               10  FILLER              PIC X(6) VALUE LOW-VALUES.               
                                                                                
           EJECT                                                                
       COPY ACATDELV.                                                           
           EJECT                                                                
       01  ACAT-DATA-REC.                                                       
           05  ADR-KEY.                                                         
               10  ADR-CLIENT          PIC 9(3).                                
C03310*        10  ADR-REG-REP         PIC X(3).                                
C03310     05  ADR-REG-REP             PIC X(3).                                
           05  ADR-BRANCH              PIC X(3).                                
           05  ADR-ACCOUNT             PIC X(5).                                
           05  ADR-CONTROLLER          PIC 9(3).                                
           05  ADR-CLIENT-NAME         PIC X(30).                               
           05  ADR-NA-LINE1            PIC X(35).                               
           05  ADR-NA-LINE2            PIC X(35).                               
           05  ADR-NA-LINE3            PIC X(35).                               
           05  ADR-SHORT-NAME          PIC X(20).                               
           05  ADR-ACCT-TYPE           PIC X(10).                               
           05  ADR-STATE               PIC X(2).                                
           05  ADR-ZIPCODE             PIC X(5).                                
           05  ADR-DATE-OPENED         PIC 9(8).                                
           05  ADR-DATE-LAST-MAINT     PIC 9(8).                                
           05  ADR-DATE-LAST-STMT      PIC 9(8).                                
           05  ADR-NA-A-IND            PIC X.                                   
               88  NA-RECA-NOT-FND                VALUE '1'.                    
           05  ADR-NA-B-IND            PIC X.                                   
               88  NA-RECB-NOT-FND                VALUE '1'.                    
           05  ADR-NA-I-IND            PIC X.                                   
               88  NA-RECI-NOT-FND                VALUE '1'.                    
           05  ADR-NA-N-IND            PIC X.                                   
               88  NA-RECN-NOT-FND                VALUE '1'.                    
                                                                                
       01  SAVE-KEY.                                                            
           05  SAVE-CLIENT             PIC X(3).                                
C03310*    05  SAVE-REG-REP            PIC X(3).                                
                                                                                
       01  IN-DELIVER-KEY.                                                      
           05  IN-DELIVER-CLIENT       PIC X(3).                                
           05  IN-REG-REP              PIC X(3).                                
                                                                                
       01  WORK-DATE-MMDDYY            PIC X(6).                                
                                                                                
       01  PROC-DATE.                                                           
           05  PD-CC                   PIC X(2).                                
           05  PD-YY                   PIC X(2).                                
           05  PD-MM                   PIC X(2).                                
           05  PD-DD                   PIC X(2).                                
                                                                                
       01  TEMP-DATE                   PIC X(8).                                
                                                                                
       01  BR-ACCT-TEST-AREA.                                                   
           05  BR-ACCT-IN              PIC X(15).                               
           05  FILLER REDEFINES BR-ACCT-IN.                                     
               10  B-CHAR OCCURS 15 TIMES                                       
                                       PIC X.                                   
           05  BR-ACCT-CNV             PIC X(8).                                
           05  FILLER REDEFINES BR-ACCT-CNV.                                    
               10  C-CHAR OCCURS 8 TIMES                                        
                                       PIC X.                                   
           EJECT                                                                
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(03).                          
               05  B1-CL-HIT                PIC X(01).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-DELIVERY-IND          PIC X.                              
               05  B1-RCD-CNT               PIC S9(9) COMP-3.                   
               05  B1-CNTL-RANGE-NO         PIC 9(3)  COMP-3.                   
               05  B1-CNTL-TABLE.                                               
                   07  B1-CNTL-RANGE-ENTRS OCCURS 100 TIMES.                    
                       09  B1-CNTL-BR-LOW   PIC X(3).                           
                       09  B1-CNTL-BR-HIGH  PIC X(3).                           
                       09  B1-CNTL-CODE     PIC 9(3).                           
                                                                                
       01  B1-WORK-TABLE-AREA.                                                  
           03  B1-WRK-TABLE.                                                    
               05  B1-WRK-ADP-CL-NO             PIC 9(03).                      
               05  B1-WRK-CL-HIT                PIC X.                          
               05  B1-WRK-NAME                  PIC X(30).                      
               05  B1-WRK-DELIVERY-IND          PIC X.                          
               05  B1-WRK-RCD-CNT               PIC S9(9) COMP-3.               
               05  B1-WRK-CNTL-RANGE-NO         PIC 9(3)  COMP-3.               
               05  B1-WRK-CNTL-TABLE.                                           
                   07  B1-WRK-CNTL-RANGE-ENTRS OCCURS 100 TIMES.                
                       09  B1-WRK-CNTL-BR-LOW    PIC X(3).                      
                       09  B1-WRK-CNTL-BR-HIGH   PIC X(3).                      
                       09  B1-WRK-CNTL-CODE      PIC 9(3).                      
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
             DECLARE  TFRCRSR  CURSOR FOR                                       
               SELECT                                                           
                   CLIENT_NBR                                                   
                  ,RCV_NBR                                                      
                  ,CMNT_TXT                                                     
                  ,PRCS_DT                                                      
                  ,BRANCH_CD                                                    
                  ,ACCT_CD                                                      
               FROM                                                             
                   VTRNFR                                                       
LRM001         WHERE CLIENT_NBR = :WS-CURRENT-CLIENT                            
                 AND DSTBN_SIDE_CD = 'D'                                        
                 AND (STTS_CD IN ('100', '110')                                 
                 AND DAYS_STTS_QTY = 1                                          
                 AND TRNFR_TYPE_CD = 'FUL')                                     
LRM001           OR (CLIENT_NBR = :WS-CURRENT-CLIENT                            
                 AND DSTBN_SIDE_CD = 'D'                                        
LRM              AND STTS_CD =  '310'                                           
LRM002           AND TRNFR_TYPE_CD IN ('PTR', 'PTF'))                           
               ORDER BY                                                         
                   BRANCH_CD                                                    
                  ,ACCT_CD                                                      
           END-EXEC.                                                            
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID                VALUES ARE              
                       'A' THRU 'Z' '0' THRU '9'.                               
               10  PARM-ABEND               PIC X.                              
                   88  NO-ABEND                         VALUE 'N'.              
                   88  YES-ABEND                        VALUE 'Y'.              
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
       MAINLINE SECTION.                                                        
           COPY MSGCOBO.                                                        
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*** ' PGM-NAME ' BEGINNING INITIAL ROUTINE ***'.            
                                                                                
           PERFORM  100-HOUSEKEEPING THRU                                       
                    100-HOUSEKEEPING-EXIT.                                      
                                                                                
           PERFORM  200-INIT-B1-LOOP THRU                                       
                    200-INIT-B1-LOOP-EXIT.                                      
                                                                                
           IF B1-TBL-CNT = ZERO                                                 
             GO TO 0005-ENDJOB.                                                 
                                                                                
           SORT  SORT-FILE                                                      
                     ASCENDING KEY  S-CLIENT                                    
                                    S-BRANCH                                    
                                    S-ACCOUNT                                   
                                    S-REG-REP                                   
                                    S-CONTROLLER                                
                     INPUT PROCEDURE  300-SORTIN-ROUTINE THRU                   
                                      300-SORTIN-ROUTINE-EXIT                   
                    OUTPUT PROCEDURE  600-SORTOUT-ROUTINE THRU                  
                                      600-SORTOUT-ROUTINE-EXIT.                 
                                                                                
           IF  SORT-RETURN  NOT =  ZERO                                         
                   DISPLAY  'INTERNAL SORT FAILED, SORT RC = '                  
                             SORT-RETURN                                        
TCK001**           CALL 'ILBOABN0'        USING ABEND-CODE-8000                 
TCK001             CALL  ABEND            USING ABEND-CODE-8000                 
           END-IF.                                                              
                                                                                
       0005-ENDJOB.                                                             
           PERFORM  900-ENDJOB-ROUTINE                                          
              THRU  900-ENDJOB-ROUTINE-EXIT.                                    
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       100-HOUSEKEEPING.                                                        
      ******************                                                        
                                                                                
           IF PARM-LENGTH > 0                                                   
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '           
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT836 ABENDED '                                  
TCK001**     CALL 'ILBOABN0'     USING ABEND-CODE-2000.                         
TCK001       CALL  ABEND         USING ABEND-CODE-2000.                         
                                                                                
           IF PARM-STREAM-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'                
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT836 ABENDED '                                  
TCK001*      CALL 'ILBOABN0'     USING ABEND-CODE-2000.                         
TCK001       CALL  ABEND         USING ABEND-CODE-2000.                         
                                                                                
           IF PARM-ABEND = 'N' OR 'Y'                                           
             CONTINUE                                                           
           ELSE                                                                 
             MOVE 'N'    TO PARM-ABEND.                                         
                                                                                
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.                
           MOVE  'C'                     TO BPDATES-REQ-TYPE.                   
TCK001*    CALL  'ZBPDATES'           USING BPDATES-PARAMETERS.                 
TCK001     CALL    BPDATES            USING BPDATES-PARAMETERS.                 
                                                                                
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                         
           MOVE  PD-MM                   TO  H2-MM.                             
           MOVE  PD-DD                   TO  H2-DD.                             
           MOVE  PD-YY                   TO  H2-YY.                             
           MOVE  BPD-PROC-DATE (5:4)     TO  WORK-DATE-MMDDYY (1:4);            
           MOVE  BPD-PROC-DATE (3:2)     TO  WORK-DATE-MMDDYY (5:2);            
                                                                                
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                             
                                                                                
           OPEN OUTPUT REPORT-FILE.                                             
                                                                                
                                                                                
      *                                                                         
      *      MOVE 'Y'  TO  ACAT-EOF-SW                                          
                                                                                
           INITIALIZE B1-TABLE-AREA.                                            
           INITIALIZE B1-WORK-TABLE-AREA.                                       
                                                                                
       100-HOUSEKEEPING-EXIT. EXIT.                                             
           EJECT                                                                
      ***************                                                           
       200-INIT-B1-LOOP.                                                        
      ***************                                                           
                                                                                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY  'B1 TABLE VALUES'.                                          
           MOVE 0                      TO  B1-TBL-CNT.                          
           ADD  1                      TO  B1-SUB.                              
           PERFORM  UNTIL  B1-SUB  >  500                                       
                                                                                
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO             
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N                
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE            
             MOVE  ' '                    TO  BH-B2-INFO-ID                     
TCK001*      CALL  'GETB1V'             USING BH-BROKER-HEADER-INFO             
TCK001       CALL   GETB1V              USING BH-BROKER-HEADER-INFO             
             END-CALL                                                           
                                                                                
             IF  BH-BROKER-ACTIVE                                               
                                                                                
                                                                                
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR                
                   MOVE  ' '                 TO  BH-ACAT-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '434500'            TO  BH-B2-INFO-ID                  
TCK001             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ACAT-INFO                   
                   END-CALL                                                     
                                                                                
                   MOVE  ' '                 TO  BH-BTS2-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '511000'            TO  BH-B2-INFO-ID                  
TCK001             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-BTS2-INFO                   
                   END-CALL                                                     
                 IF  BH-ACAT-ACTIVE                                             
                                                                                
                   IF  BH-ACAT-RR-NOTIFICATION-REPORT = '1'                     
                       ADD 1       TO B1-TBL-CNT                                
                       MOVE  B1-SUB                              TO             
                             B1-ADP-CL-NO               (B1-TBL-CNT)            
                       MOVE BH-BROKER-NAME                       TO             
                             B1-CLI-NAME                (B1-TBL-CNT)            
                       MOVE ZERO                                 TO             
                             B1-RCD-CNT                 (B1-TBL-CNT)            
                       MOVE 'N'                                  TO             
                             B1-CL-HIT                  (B1-TBL-CNT)            
                       MOVE  BH-ACAT-RR-NOTIFICATION-REPORT      TO             
                             B1-DELIVERY-IND            (B1-TBL-CNT)            
                                                                                
                   MOVE  ' '                 TO  BH-ATB-INFO                    
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '451140'            TO  BH-B2-INFO-ID                  
TCK001             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ATB-INFO                    
                   END-CALL                                                     
                     IF BH-ATB-ACTIVE                                           
                         MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-NO    TO             
                               B1-CNTL-RANGE-NO           (B1-TBL-CNT)          
                         PERFORM 210-MOVE-TABLE THRU                            
                                 210-MOVE-TABLE-EXIT                            
                                 VARYING B11-SUB FROM 1 BY 1                    
                                 UNTIL B11-SUB >                                
                                      BH-ATB-ACAT-BR-CONTROL-CODE-NO            
                     END-IF                                                     
                    END-IF                                                      
                   END-IF                                                       
                  END-IF                                                        
                 END-IF                                                         
               ADD  1                      TO  B1-SUB                           
           END-PERFORM.                                                         
           DISPLAY ' '.                                                         
           IF  B1-TBL-CNT =  0                                                  
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'               
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'                      
           END-IF.                                                              
                                                                                
           DISPLAY  'B1 TABLE COUNT - ' B1-TBL-CNT.                             
       200-INIT-B1-LOOP-EXIT.   EXIT.                                           
                                                                                
       210-MOVE-TABLE.                                                          
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE  (B11-SUB)     TO                  
                B1-CNTL-CODE       (B1-TBL-CNT B11-SUB).                        
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-LO (B11-SUB)   TO                  
                B1-CNTL-BR-LOW     (B1-TBL-CNT B11-SUB).                        
           MOVE  BH-ATB-ACAT-BR-CONTROL-CODE-HI ( B11-SUB)  TO                  
                B1-CNTL-BR-HIGH    (B1-TBL-CNT B11-SUB).                        
       210-MOVE-TABLE-EXIT. EXIT.                                               
           EJECT                                                                
       250-OPEN-CURSOR.                                                         
           DISPLAY 'OPENING CURSOR FOR CLIENT ' WS-CURRENT-CLIENT.              
           EXEC SQL                                                             
              OPEN TFRCRSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM  999-SQL-ERROR THRU 999-EXIT                      CAT520  
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT           
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT610 ABENDED '                              
TCK001*       CALL 'ILBOABN0' USING ABEND-CODE-4000.                            
TCK001        CALL  ABEND     USING ABEND-CODE-4000.                            
                                                                                
       260-CLOSE-CURSOR.                                                        
           EXEC SQL CLOSE TFRCRSR    END-EXEC.                                  
                                                                                
      *****************                                                         
       300-SORTIN-ROUTINE  SECTION.                                             
      *****************                                                         
                                                                                
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTINP ROUTINE ***'.            
           PERFORM VARYING B3-SUB FROM 1 BY 1                                   
                     UNTIL B3-SUB > B1-TBL-CNT                                  
               MOVE B1-TABLE (B3-SUB)    TO B1-WRK-TABLE                        
               MOVE '0'                  TO WS-CURRENT-CLIENT(1 : 1)            
               MOVE B1-ADP-CL-NO(B3-SUB) TO WS-CURRENT-CLIENT(2 : 3)            
               PERFORM 250-OPEN-CURSOR                                          
               PERFORM 310-NEXT-ACAT-REC THRU 310-EXIT                          
                  UNTIL SQLCODE NOT = 0                                         
               PERFORM 260-CLOSE-CURSOR                                         
           END-PERFORM.                                                         
                                                                                
           GO TO 390-CHECK-B1-FILE.                                             
                                                                                
       310-NEXT-ACAT-REC.                                                       
                                                                                
           EXEC SQL                                                             
              FETCH                                                             
                 TFRCRSR                                                        
              INTO                                                              
                :CLIENT-NBR                                                     
               ,:RCV-NBR                                                        
               ,:CMNT-TXT                                                       
               ,:PRCS-DT                                                        
               ,:BRANCH-CD                                                      
               ,:ACCT-CD                                                        
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              ADD 1 TO ACAT-DTL-RECS                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT-EOF   TO TRUE                                            
              GO TO 310-EXIT                                                    
           ELSE                                                                 
              PERFORM  999-SQL-ERROR THRU 999-EXIT                      CAT520  
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT          
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                 CAT520  
              DISPLAY '** PROGRAM CAT610 ABENDED '                              
TCK001        CALL  ABEND     USING ABEND-CODE-4004.                            
                                                                                
                                                                                
           IF B1-WRK-CNTL-RANGE-NO = ZERO                                       
             CONTINUE                                                           
           ELSE                                                                 
             MOVE 'N'     TO  B1-RANGE-SEARCH-STATUS                            
             MOVE ' '     TO  B1-RANGE-SEARCH-SWITCH                            
             PERFORM 550-B1-BR-RANGE-SEARCH THRU                                
                     550-B1-BR-RANGE-SEARCH-EXIT                                
                        VARYING B1-SUB2 FROM 1 BY 1                             
                          UNTIL B1-RANGE-SEARCH-END                             
             IF B1-RANGE-SEARCH-STATUS NOT = 'Y'                                
                DISPLAY 'DROP DUE TO B1 BRANCH RANGE ' BRANCH-CD                
                GO TO 300-SORTIN-ROUTINE                                        
           END-IF.                                                              
                                                                                
           INITIALIZE  ACAT-DATA-REC.                                           
                                                                                
           MOVE  '1'                        TO  ADR-NA-A-IND                    
                                                ADR-NA-B-IND                    
                                                ADR-NA-N-IND                    
                                                ADR-NA-I-IND.                   
                                                                                
           MOVE  ' '                        TO  ACAT-NAME-ADDR-STATUS.          
           INITIALIZE  GETNA-PARAMETERS.                                        
           MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
           MOVE  'R'                        TO  GETNA-REQ-FILE.                 
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
           MOVE  PGM-NAME                   TO  GETNA-PGM-NAME.                 
           MOVE  CLIENT-NBR (2 : 3)         TO  ACAT-CLI-P.                     
           MOVE  ACAT-CLI-P                 TO  GETNA-KEY-CLIENT.               
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.            
           MOVE  BRANCH-CD                  TO  GETNA-KEY-BRANCH3-5.            
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.           
           MOVE  ACCT-CD                    TO  GETNA-KEY-ACCOUNT6-10.          
TCK001     CALL   GETNA                   USING GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES          
           END-CALL.                                                            
                                                                                
      * DETERMINE IF ALL SEGMENTS RETURNED                                      
           IF GETNA-RETURN-FOUND  AND                                           
              NOT NAPPA-SEGMENT-MISSING AND                                     
              NOT NAPPB-SEGMENT-MISSING AND                                     
              NOT NNAPPN-SEGMENT-MISSING AND                                    
              NOT NAPPI-SEGMENT-MISSING                                         
             MOVE  SPACE  TO  ADR-NA-A-IND                                      
                              ADR-NA-B-IND                                      
                              ADR-NA-I-IND                                      
                              ADR-NA-N-IND                                      
             GO TO 330-BUILD-SRTREC.                                            
                                                                                
           IF  GETNA-RETURN-FOUND  AND                                          
               NOT  NAPPA-SEGMENT-MISSING                                       
             MOVE SPACE  TO  ADR-NA-A-IND.                                      
                                                                                
           IF  GETNA-RETURN-FOUND  AND                                          
               NOT  NAPPB-SEGMENT-MISSING                                       
             MOVE SPACE  TO  ADR-NA-B-IND.                                      
                                                                                
           IF  GETNA-RETURN-FOUND  AND                                          
               NOT  NAPPI-SEGMENT-MISSING                                       
             MOVE SPACE  TO  ADR-NA-I-IND.                                      
                                                                                
           IF  GETNA-RETURN-FOUND  AND                                          
               NOT  NNAPPN-SEGMENT-MISSING                                      
             MOVE SPACE  TO  ADR-NA-N-IND.                                      
                                                                                
       330-BUILD-SRTREC.                                                        
                                                                                
           MOVE CLIENT-NBR (2 : 3)             TO  ADR-CLIENT.                  
           MOVE B1-WRK-NAME                    TO  ADR-CLIENT-NAME.             
           MOVE BRANCH-CD                      TO  ADR-BRANCH.                  
           MOVE ACCT-CD                        TO  ADR-ACCOUNT.                 
      *    MOVE B1-WRK-CNTL-CODE (CNTL-SUB)    TO  ADR-CONTROLLER.              
                                                                                
      * MOVE FIELDS FROM NAME ADDR SEGMENT A                                    
           IF NOT NAPPA-SEGMENT-MISSING                                         
             MOVE NAPPA-RR1-3                  TO  ADR-REG-REP                  
             MOVE NAPPA-ACCT-TYPES             TO  ADR-ACCT-TYPE                
             MOVE NAPPA-ZIP-CODE (1:5)         TO  ADR-ZIPCODE                  
             MOVE NAPPA-STATE-CODE             TO  ADR-STATE                    
             MOVE NAPPA-DATE-RECORD-ADDED      TO  ADR-DATE-OPENED              
             MOVE NAPPA-DATE-REC-CHANGED       TO  ADR-DATE-LAST-MAINT.         
                                                                                
      * MOVE FIELDS FROM NAME ADDR SEGMENT B                                    
           IF NOT NAPPB-SEGMENT-MISSING                                         
             MOVE NAPPB-NA-LINE (1)            TO  ADR-NA-LINE1                 
             MOVE NAPPB-NA-LINE (2)            TO  ADR-NA-LINE2                 
             MOVE NAPPB-NA-LINE (3)            TO  ADR-NA-LINE3.                
                                                                                
      * MOVE FIELDS FROM NAME ADDR SEGMENT I                                    
           IF NOT NAPPI-SEGMENT-MISSING                                         
             MOVE NAPPI-LAST-STMT-DT           TO  ADR-DATE-LAST-STMT.          
                                                                                
      * MOVE FIELDS FROM NAME ADDR SEGMENT N                                    
           IF NOT NNAPPN-SEGMENT-MISSING                                        
             MOVE NNAPPN-SHORT-NAME-P           TO  ADR-SHORT-NAME.             
           IF NNAPPN-SEGMENT-MISSING                                            
            DISPLAY 'SEGMENT N MISSING - KEY - ' CLIENT-NBR (2 : 3) ' '         
               ADR-REG-REP ' ' BRANCH-CD ' ' ACCT-CD.                           
                                                                                
           MOVE 'Y'  TO  B1-CL-HIT (B1-SUB1-SVE)                                
           RELEASE SORT-REC FROM ACAT-DATA-REC.                                 
           ADD 1 TO ACAT-ACPT-RECS.                                             
           GO TO 310-NEXT-ACAT-REC.                                             
                                                                                
       310-EXIT. EXIT.                                                          
                                                                                
       390-CHECK-B1-FILE.                                                       
           PERFORM 575-B1-NOT-RPTING THRU                                       
                   575-B1-NOT-RPTING-EXIT                                       
                     VARYING B3-SUB FROM 1 BY 1                                 
                       UNTIL B3-SUB > B1-TBL-CNT.                               
                                                                                
                                                                                
       300-SORTIN-ROUTINE-EXIT.  EXIT.                                          
                                                                                
           EJECT                                                                
       550-B1-BR-RANGE-SEARCH.                                                  
                                                                                
           MOVE ZEROS TO ADR-CONTROLLER.                                        
           IF B1-SUB2 > B1-WRK-CNTL-RANGE-NO                                    
             MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                               
             MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                               
             GO TO 550-B1-BR-RANGE-SEARCH-EXIT.                                 
                                                                                
           IF  (BRANCH-CD > B1-WRK-CNTL-BR-LOW (B1-SUB2) OR                     
                BRANCH-CD = B1-WRK-CNTL-BR-LOW (B1-SUB2)) AND                   
               (BRANCH-CD < B1-WRK-CNTL-BR-HIGH (B1-SUB2) OR                    
                BRANCH-CD = B1-WRK-CNTL-BR-HIGH (B1-SUB2))                      
             ADD  1    TO  B1-RCD-CNT (B1-SUB1-SVE)                             
             MOVE B1-SUB2  TO  CNTL-SUB                                         
             MOVE B1-WRK-CNTL-CODE (B1-SUB2) TO ADR-CONTROLLER                  
             MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                               
             MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                               
             GO TO 550-B1-BR-RANGE-SEARCH-EXIT.                                 
                                                                                
       550-B1-BR-RANGE-SEARCH-EXIT.  EXIT.                                      
                                                                                
       575-B1-NOT-RPTING.                                                       
                                                                                
           IF B1-CL-HIT (B3-SUB) NOT = 'Y'                                      
             INITIALIZE ACAT-DATA-REC                                           
             MOVE B1-ADP-CL-NO (B3-SUB) TO ADR-CLIENT                           
             MOVE B1-CLI-NAME  (B3-SUB) TO ADR-CLIENT-NAME                      
             MOVE 999                   TO ADR-CONTROLLER                       
             RELEASE SORT-REC FROM ACAT-DATA-REC.                               
                                                                                
       575-B1-NOT-RPTING-EXIT.    EXIT.                                         
           EJECT                                                                
      *****************                                                         
       600-SORTOUT-ROUTINE  SECTION.                                            
      *****************                                                         
                                                                                
           DISPLAY '*** ' PGM-NAME ' BEGINNING SORTOUT ROUTINE ***'.            
                                                                                
       610-NEXT-REC.                                                            
                                                                                
           RETURN SORT-FILE INTO ACAT-DATA-REC                                  
             AT END GO TO 600-SORTOUT-ROUTINE-EXIT.                             
                                                                                
           IF ACAT-FIRST-TIME                                                   
             MOVE 'N' TO ACAT-FIRST-TIME-SW                                     
             MOVE ADR-KEY  TO  SAVE-KEY.                                        
                                                                                
           IF ADR-KEY = SAVE-KEY                                                
             PERFORM 700-REPORTING THRU                                         
                     700-REPORTING-EXIT                                         
           ELSE                                                                 
             IF ADR-CLIENT = SAVE-CLIENT                                        
               CONTINUE                                                         
             ELSE                                                               
               MOVE ZERO TO PAGECNT                                             
             END-IF                                                             
             PERFORM 750-HEADERS THRU                                           
                     750-HEADERS-EXIT                                           
             PERFORM 700-REPORTING THRU                                         
                     700-REPORTING-EXIT                                         
             MOVE ADR-KEY  TO  SAVE-KEY.                                        
           GO TO 610-NEXT-REC.                                                  
                                                                                
       600-SORTOUT-ROUTINE-EXIT.  EXIT.                                         
                                                                                
           EJECT                                                                
       700-REPORTING.                                                           
           IF LINECNT > 55                                                      
             PERFORM 750-HEADERS THRU                                           
                     750-HEADERS-EXIT.                                          
                                                                                
           IF ADR-CONTROLLER = 999                                              
             MOVE '******* NO ACTIVITY FOR THIS CLIENT ********'                
                                               TO NAL-MSG                       
             MOVE NO-ACTV-LINE                 TO PRINT-AREA                    
             MOVE '0'                          TO CC                            
             PERFORM 725-PRINT-LINE THRU                                        
                     725-PRINT-LINE-EXIT                                        
             GO TO 700-REPORTING-EXIT.                                          
                                                                                
                                                                                
           MOVE ADR-REG-REP                    TO DL1-RR.                       
           MOVE ADR-BRANCH                     TO DL1-BRANCH.                   
           MOVE ADR-ACCOUNT                    TO DL1-ACCOUNT.                  
           IF ADR-CONTROLLER = ZEROS                                            
             MOVE SPACES                       TO DL1-CONTROLLER                
           ELSE                                                                 
             MOVE ADR-CONTROLLER               TO DL1-CONTROLLER.               
           MOVE ADR-NA-LINE1                   TO DL1-NAME1.                    
           MOVE ADR-NA-LINE2                   TO DL1-NAME2.                    
           MOVE ADR-NA-LINE3                   TO DL1-NAME3.                    
                                                                                
           MOVE DETAIL-LINE-1                  TO PRINT-AREA.                   
           MOVE '0'                            TO CC.                           
                                                                                
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT                                          
                                                                                
           MOVE ADR-SHORT-NAME                 TO DL2-SHORT-NAME.               
           MOVE ADR-ACCT-TYPE                  TO DL2-ACCT-TYPE.                
           MOVE ADR-STATE                      TO DL2-STATE.                    
           MOVE ADR-ZIPCODE                    TO DL2-ZIPCODE.                  
           MOVE ADR-DATE-LAST-MAINT            TO TEMP-DATE.                    
           MOVE TEMP-DATE (3:2)                TO DL2-DLM-YY.                   
           MOVE TEMP-DATE (5:2)                TO DL2-DLM-MM.                   
           MOVE TEMP-DATE (7:2)                TO DL2-DLM-DD.                   
           MOVE ADR-DATE-OPENED                TO TEMP-DATE                     
           MOVE TEMP-DATE (3:2)                TO DL2-DO-YY.                    
           MOVE TEMP-DATE (5:2)                TO DL2-DO-MM.                    
           MOVE TEMP-DATE (7:2)                TO DL2-DO-DD.                    
           MOVE ADR-DATE-LAST-STMT             TO TEMP-DATE.                    
           MOVE TEMP-DATE (3:2)                TO DL2-DLS-YY.                   
           MOVE TEMP-DATE (5:2)                TO DL2-DLS-MM.                   
           MOVE TEMP-DATE (7:2)                TO DL2-DLS-DD.                   
                                                                                
           MOVE DETAIL-LINE-2                  TO PRINT-AREA.                   
           MOVE ' '                            TO CC.                           
                                                                                
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
       700-REPORTING-EXIT. EXIT.                                                
                                                                                
       725-PRINT-LINE.                                                          
                                                                                
           WRITE REPORT-REC FROM PRINTAREA.                                     
           IF CC = '1'                                                          
             MOVE 3 TO LINECNT.                                                 
           IF CC = '-'                                                          
             ADD 3 TO LINECNT.                                                  
           IF CC = '0'                                                          
             ADD 2 TO LINECNT.                                                  
           IF CC = ' '                                                          
             ADD 1 TO LINECNT.                                                  
                                                                                
       725-PRINT-LINE-EXIT.  EXIT.                                              
                                                                                
       750-HEADERS.                                                             
                                                                                
           MOVE ADR-CLIENT              TO  TRAC-CLI.                           
                                                                                
           ADD  1       TO  PAGECNT.                                            
           MOVE ADR-CLIENT              TO  H1-CLIENT.                          
           MOVE ADR-CLIENT-NAME         TO  H1-CLIENT-NAME.                     
           MOVE PAGECNT                 TO  H1-PGENO.                           
           MOVE HDR1                    TO  PRINT-AREA.                         
           MOVE '1'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE PD-MM                   TO  H2-MM.                              
           MOVE PD-DD                   TO  H2-DD.                              
           MOVE PD-YY                   TO  H2-YY.                              
           MOVE HDR2                    TO  PRINT-AREA.                         
           MOVE '0'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR3                    TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR4                    TO  PRINT-AREA.                         
           MOVE '0'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR5                    TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR6                    TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
       750-HEADERS-EXIT.  EXIT.                                                 
                                                                                
       900-ENDJOB-ROUTINE.                                                      
                                                                                
           DISPLAY '************** CAT836 CONTROL TOTALS *************'.        
                                                                                
           DISPLAY 'ACAT DETAIL RCDS READ     '     ACAT-DTL-RECS.              
           DISPLAY 'ACAT RCDS BYPASSED        '     ACAT-BYP-RECS.              
           DISPLAY 'ACAT RCDS REJECTED        '     ACAT-REJ-RECS.              
           DISPLAY 'ACAT RCDS ACCEPTED        '     ACAT-ACPT-RECS.             
                                                                                
           CLOSE REPORT-FILE.                                                   
                                                                                
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                           
                                                                                
       999-SQL-ERROR.                                                   CAT520  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT520  
                                    W-DB2-MESSAGE-LEN.                  CAT520  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT520  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT520  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT520  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT520  
                   END-IF                                               CAT520  
           END-PERFORM.                                                 CAT520  
                                                                        CAT520  
       999-EXIT. EXIT.                                                  CAT520  
