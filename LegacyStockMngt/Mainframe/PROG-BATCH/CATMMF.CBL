000001* PDX    - CATMMF   C0351642 04/14/14 14:22:46 TBLAMUR            00001000
LRM005* SSR 83186 RECOMPILE ONLY TO PICKUP NEW CAMS COPYBOOKS.                  
000001* PDX    - CATMMF   C0346697 10/10/13 11:41:54 TBLAMUR            00001000
LRM004* SSR 96477 IDENTIFY BANK DEPOSITORY FINDS.                               
000001* PDX    - CATMMF   C0287084 11/16/09 09:54:24 TBLAMUR            00001000
LRM003* SSR 66946 EXPAND THRESHOLD FUNDS FROM LIMIT 5 TO 999. CALL MODS         
LRM003*  RENAMED GETMMFS ICTLMMFS, CALL GETTH FOR NEW THRESHOLD ENTRIES.        
000001* PDX    - CATMMF   C0278249 04/06/09 08:52:35 TBLAMUR            00001000
LRM002* SSR 63382 ADD GETVNDR CALL AFTER GETMMF TO PASS TO GETRH,               
LRM002* TO CONFORM TO CAMS CHANGE.                                              
000001* PDX    - CATMMF   C0230098 01/17/06 13:29:11 TBLAMUR            00001000
LRM001* SSR 45101 SELECT THRESHOLD SECURITIES (CAMS WILL AUTO LIQUIDATE)        
000001* PDX    - CATMMF   C0195793 09/16/03 12:27:17 TBLAMUR            00001000
000001* RECOMPILE TO RE-ALIGN WITH CAMS CHANGES TO GETRHCPY             00001000
000001* PDX    - CATMMF   C0176254 07/22/02 14:58:30 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         CATMMF  
           SKIP1                                                        CATMMF  
       PROGRAM-ID.    CATMMF.                                           CATMMF  
           SKIP1                                                        CATMMF  
      *INSTALLATION.  AUTOMATIC COMPUTER SERVICES.                      CATMMF  
           SKIP1                                                        CATMMF  
      *DATE-WRITTEN.  JUN 2002.                                         CATMMF  
           SKIP1                                                        CATMMF  
      *DATE-COMPILED.                                                   CATMMF  
           SKIP1                                                        CATMMF  
      *REMARKS.       CREATE MONEY MARKET FUNDS DB2 SAVE FILE           CATMMF  
           SKIP2                                                        CATMMF  
       ENVIRONMENT DIVISION.                                            CATMMF  
           SKIP1                                                        CATMMF  
       CONFIGURATION SECTION.                                           CATMMF  
           SKIP2                                                        CATMMF  
       INPUT-OUTPUT SECTION.                                            CATMMF  
           SKIP2                                                        CATMMF  
       FILE-CONTROL.                                                    CATMMF  
           SELECT  O-MMF-FILE           ASSIGN  TO  UT-S-MMFFL.         CATMMF  
LRM004     SELECT  O-BDF-FILE           ASSIGN  TO  UT-S-BDFFL.         CATMMF  
           EJECT                                                        CATMMF  
       DATA DIVISION.                                                   CATMMF  
       FILE SECTION.                                                    CATMMF  
           SKIP2                                                        CATMMF  
       FD  O-MMF-FILE                                                   CATMMF  
           LABEL RECORDS ARE STANDARD                                   CATMMF  
           BLOCK CONTAINS 0 RECORDS                                     CATMMF  
           RECORDING MODE IS V.                                         CATMMF  
           COPY CATMMF  REPLACING ==:CAT:== BY ==O==.                   CATMMF  
           SKIP3                                                        CATMMF  
LRM004 FD  O-BDF-FILE                                                   CATMMF  
LRM004     LABEL RECORDS ARE STANDARD                                   CATMMF  
LRM004     BLOCK CONTAINS 0 RECORDS.                                    CATMMF  
LRM004 01  O-BDF-RECORD.                                                CATMMF  
LRM004     05  O-BDF-CLIENT         PIC X(04).                                  
LRM004     05  O-BDF-SECURITY       PIC X(07).                                  
LRM004     05  FILLER               PIC X(19).                                  
           EJECT                                                        CATMMF  
      *                                                                 CATMMF  
       WORKING-STORAGE SECTION.                                         CATMMF  
           SKIP2                                                        CATMMF  
       77  FILLER                   PIC X(34)          VALUE            CATMMF  
           'CATMMF  START OF WORKING STORAGE '.                         CATMMF  
LRM003 77  TH-SEC-SUB               PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
LRM003 77  SEC-SUB                  PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
LRM003 77  THRESH-SUB               PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
LRM003 77  TH-THRESH-SUB            PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
LRM003 77  WS-GETTH-THRHL-MAX       PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
LRM004 77  VDR-SUB                  PIC S9(5)  COMP-3 VALUE ZERO.       CATMMF  
       77  WS-SEQUENCE              PIC 9(4).                           CATMMF  
       77  ABEND-CODE               PIC S9(4) COMP SYNC  VALUE ZERO.    CATMMF  
       77  MMF-REC-CNT              PIC 9(06) VALUE ZERO.               CATMMF  
       77  WS-SUB                   PIC S9(4) COMP VALUE ZERO.          CATMMF  
           EJECT                                                        CATMMF  
       01  DATE-WK-AREA.                                                CATMMF  
           03  FILLER                   PIC XX.                         CATMMF  
           03  DATE-YMD                 PIC X(6).                       CATMMF  
           03  DATE-YMD-N REDEFINES DATE-YMD PIC 9(6).                  CATMMF  
           SKIP3                                                        CATMMF  
           COPY STUBCPY.                                                CATMMF  
           03  GETRHS                  PIC X(08)    VALUE 'GETRHS  '.   CATMMF  
           EJECT                                                        CATMMF  
           COPY BPDATESC.                                               CATMMF  
           EJECT                                                        CATMMF  
           COPY MMFSUB.                                                 CATMMF  
           EJECT                                                        CATMMF  
LRM003 01  GETMMFS                       PIC X(8)   VALUE 'GETMMFS '.   CATMMF  
           COPY GETMMFC.                                                CATMMF  
           EJECT                                                        CATMMF  
LRM003     COPY ICTLMMFS.                                               CATMMF  
           EJECT                                                        CATMMF  
           COPY GETRHCPY.                                               CATMMF  
LRM002 01  GETVNDR                       PIC X(8)   VALUE 'GETVNDR '.   CATMMF  
LRM002     COPY ICTLVDR.                                                CATMMF  
LRM002     COPY GETVDRC.                                                CATMMF  
                                                                                
LRM003 01  GETTH                         PIC X(8)   VALUE 'GETTH   '.   CATMMF  
LRM003     COPY GETTHCPY.                                               CATMMF  
           EJECT                                                        CATMMF  
       01  W-ABEND-SQLCODE                  PIC +++++9.                 CATMMF  
       01  W-TABLE-ID                       PIC X(08)  VALUE SPACES.    CATMMF  
       01  W-FUNCTION                       PIC X(30)  VALUE SPACES.    CATMMF  
         EJECT                                                          CATMMF  
       01  WS-SAVE-AREA.                                                CATMMF  
           03  WS-CLIENT                    PIC 9(04).                  CATMMF  
           03  WS-SEQ                       PIC 9(04).                  CATMMF  
      *                                                                 CATMMF  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CATMMF  
       01  B1-TABLE-AREA.                                               CATMMF  
           03  B1-TABLE OCCURS 500 TIMES.                               CATMMF  
               05  B1-ADP-CL-NO             PIC 9(04).                  CATMMF  
               05  B1-CLI-NAME              PIC X(30).                  CATMMF  
               05  B1-STREAM                PIC X(01).                  CATMMF  
               05  B1-STATUS                PIC X(01).                  CATMMF  
               05  B1-ACAT-STATUS           PIC X(01).                  CATMMF  
       01  B1-WORK-FIELEDS.                                             CATMMF  
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CATMMF  
           03  B1-SUB                       PIC 9(03) VALUE 0.          CATMMF  
           03  B1-STREAM-CNT                PIC 9(03) VALUE 0.          CATMMF  
      ******************************************************************CATMMF  
      * B1 HEADER                                                      *CATMMF  
      ******************************************************************CATMMF  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CATMMF  
           COPY BHINFO.                                                 CATMMF  
           EJECT                                                        CATMMF  
      ******************************************************************CATMMF  
      * B1 ACAT SECTION                                                *CATMMF  
      ******************************************************************CATMMF  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CATMMF  
           COPY BHACAT.                                                 CATMMF  
           EJECT                                                        CATMMF  
       LINKAGE SECTION.                                                 CATMMF  
      *                                                                 CATMMF  
       PROCEDURE DIVISION.                                              CATMMF  
           DISPLAY 'CATMMF - CREATE MMF DB2 SAVE FILE'.                 CATMMF  
           DISPLAY ' '.                                                 CATMMF  
           COPY MSGCOBO.                                                CATMMF  
           DISPLAY ' '.                                                 CATMMF  
                                                                        CATMMF  
           PERFORM INIT-RTN.                                            CATMMF  
           PERFORM MAIN-RTN.                                            CATMMF  
                                                                        CATMMF  
           CLOSE  O-MMF-FILE.                                           CATMMF  
LRM004     CLOSE  O-BDF-FILE.                                           CATMMF  
                                                                        CATMMF  
           DISPLAY '** TOTAL MMF REC WRITTEN = ' MMF-REC-CNT.           CATMMF  
           MOVE  ZERO  TO  RETURN-CODE.                                 CATMMF  
                                                                        CATMMF  
           DISPLAY ' '.                                                 CATMMF  
           DISPLAY 'CATMMF - COMPLETED SUCCESFULLY'.                    CATMMF  
           GOBACK.                                                      CATMMF  
           EJECT                                                        CATMMF  
                                                                        CATMMF  
       INIT-RTN.                                                        CATMMF  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CATMMF  
              MOVE  ' '                  TO  BH-BROKER-HEADER-INFO      CATMMF  
                                             BH-ACAT-INFO               CATMMF  
              MOVE  B1-SUB               TO  BH-BROKER-NUMBER-N         CATMMF  
              MOVE  '015'                TO  BH-LOGICAL-RECORD-CODE     CATMMF  
              MOVE  '434500'             TO  BH-B2-INFO-ID              CATMMF  
              CALL  GETB1V             USING BH-BROKER-HEADER-INFO      CATMMF  
                                             BH-ACAT-INFO               CATMMF  
              IF  BH-BROKER-ACTIVE                                      CATMMF  
              AND BH-ACAT-ACTIVE                                        CATMMF  
                  ADD 1 TO B1-TBL-CNT                                   CATMMF  
                  MOVE  BH-BROKER-NUMBER-N                              CATMMF  
                                        TO B1-ADP-CL-NO  (B1-TBL-CNT)   CATMMF  
                  MOVE  BH-BROKER-NAME                                  CATMMF  
                                        TO B1-CLI-NAME   (B1-TBL-CNT)   CATMMF  
                  IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                CATMMF  
                      MOVE BH-BROKER-MINI-MAXI-SUBGROUP                 CATMMF  
                                        TO B1-STREAM     (B1-TBL-CNT)   CATMMF  
                  ELSE                                                  CATMMF  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CATMMF  
                                        TO B1-STREAM     (B1-TBL-CNT)   CATMMF  
                  END-IF                                                CATMMF  
                  MOVE  BH-BROKER-STATUS                                CATMMF  
                                        TO B1-STATUS     (B1-TBL-CNT)   CATMMF  
                  MOVE  BH-ACAT-STATUS                                  CATMMF  
                                        TO B1-ACAT-STATUS(B1-TBL-CNT)   CATMMF  
                  DISPLAY     'CNT=' B1-TBL-CNT                         CATMMF  
                             ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)         CATMMF  
                                 ' ' B1-CLI-NAME   (B1-TBL-CNT)         CATMMF  
                            ' STRM=' B1-STREAM     (B1-TBL-CNT)         CATMMF  
                          ' STATUS=' B1-STATUS     (B1-TBL-CNT)         CATMMF  
                     ' ACAT STATUS=' B1-ACAT-STATUS(B1-TBL-CNT)         CATMMF  
                  ADD 1 TO B1-STREAM-CNT                                CATMMF  
              END-IF                                                    CATMMF  
           END-PERFORM.                                                 CATMMF  
           DISPLAY ' '.                                                 CATMMF  
           DISPLAY  'B1-STREAM-CNT  = ' B1-STREAM-CNT                   CATMMF  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT                      CATMMF  
                    ' # OF ADP CLIENTS THAT ARE ACATS CLIENTS'.         CATMMF  
           DISPLAY ' '.                                                 CATMMF  
                                                                        CATMMF  
           OPEN  OUTPUT O-MMF-FILE.                                     CATMMF  
           OPEN  OUTPUT O-BDF-FILE.                                     CATMMF  
                                                                        CATMMF  
           MOVE  'CATMMF'              TO BPDATES-CALLING-PGM.          CATMMF  
           SET   BPD-CURRENT-DATE-INFO TO TRUE.                         CATMMF  
           MOVE  SPACES          TO  BPDATES-CALENDAR-TYPE.             CATMMF  
           CALL  BPDATES      USING  BPDATES-PARAMETERS.                CATMMF  
                                                                        CATMMF  
           IF NOT BPD-VALID-RETURN                                      CATMMF  
              DISPLAY 'BPDATES CALL ERROR = ' BPDATES-RETURN-CODE       CATMMF  
              MOVE  1101  TO  ABEND-CODE                                CATMMF  
              PERFORM ABEND-JOB.                                        CATMMF  
                                                                        CATMMF  
           MOVE  SPACE           TO  O-MMF-RECORD.                      CATMMF  
           SET   O-MMF-HEADER    TO  TRUE.                              CATMMF  
           MOVE  ZERO            TO  O-MMF-HDR-SEQ.                     CATMMF  
           MOVE  BPD-PROC-DATE   TO  O-MMF-HDR-PROC-DATE.               CATMMF  
           WRITE O-MMF-RECORD.                                          CATMMF  
           ADD 1 TO MMF-REC-CNT.                                        CATMMF  
       EJECT                                                            CATMMF  
      *                                                                 CATMMF  
       MAIN-RTN.                                                        CATMMF  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CATMMF  
                   UNTIL B1-SUB > 500                                   CATMMF  
                                                                        CATMMF  
              IF  B1-STATUS      (B1-SUB) = 'A'                         CATMMF  
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                         CATMMF  
                  MOVE B1-ADP-CL-NO (B1-SUB) TO  WS-CLIENT              CATMMF  
                  MOVE 'CATMMF  '            TO  GETMMF-CALLING-PROGRAM CATMMF  
                  MOVE WS-CLIENT             TO  GETMMF-CLIENT          CATMMF  
                  SET GET-ALL-MMF-SLOTS      TO  TRUE                   CATMMF  
                  CALL  GETMMFS           USING  GETMMF-PARAMETERS      CATMMF  
                                                 ICTL-MMF-TABLE         CATMMF  
                  IF  GETMMF-ACTION-COMPLETE                            CATMMF  
                      PERFORM WRITE-MMF-FILE-RTN                        CATMMF  
                  ELSE                                                  CATMMF  
                  IF  GETMMF-SLOT-NOT-FOUND                             CATMMF  
                      DISPLAY 'NO SLOTS FOUND FOR CLIENT ' WS-CLIENT    CATMMF  
                  ELSE                                                  CATMMF  
                      DISPLAY 'GETMMF FAILED/RETURN-CODE '              CATMMF  
                                             GETMMF-RETURN-CODE         CATMMF  
                      DISPLAY GETMMF-PARAMETERS                         CATMMF  
                      DISPLAY 'SQL CODE ' GETMMF-SQLCODE                CATMMF  
                      MOVE  1102  TO  ABEND-CODE                        CATMMF  
                      PERFORM ABEND-JOB                                 CATMMF  
                  END-IF END-IF                                         CATMMF  
              END-IF                                                    CATMMF  
                                                                        CATMMF  
           END-PERFORM.                                                 CATMMF  
                                                                        CATMMF  
       WRITE-MMF-FILE-RTN.                                              CATMMF  
LRM002     MOVE WS-CLIENT       TO GETVDR-CLIENT.                               
TEST       DISPLAY 'CALLING GETVDR FOR CLIENT ' GETVDR-CLIENT.                  
LRM002     SET  GET-ALL-SECURITIES  TO TRUE.                                    
LRM002     MOVE 'CATMMF'            TO GETVDR-CALLING-PROGRAM                   
LRM002     CALL GETVNDR         USING GETVDR-PARAMETERS                         
LRM002                                ICTL-VDR-TABLE                            
LRM002     END-CALL.                                                            
                                                                                
LRM004     IF GETVDR-ACTION-COMPLETE                                            
LRM004        PERFORM VARYING VDR-SUB FROM 1 BY 1                               
LRM004                  UNTIL VDR-SUB > VDR-MAX                                 
LRM004           IF VDR-VEND-FDIC(VDR-SUB)                                      
LRM004           AND (VDR-FORM-DST(VDR-SUB) OR VDR-FORM-PROMON(VDR-SUB))        
LRM004              DISPLAY 'FOUND BDF MMF ' WS-CLIENT ' '                      
LRM004                      VDR-SECURITY(VDR-SUB)                               
LRM004              MOVE SPACES    TO O-BDF-RECORD                      CATMMF  
LRM004              MOVE WS-CLIENT             TO O-BDF-CLIENT                  
LRM004              MOVE VDR-SECURITY(VDR-SUB) TO O-BDF-SECURITY                
LRM004              WRITE O-BDF-RECORD                                  CATMMF  
LRM004           END-IF                                                         
LRM004        END-PERFORM                                                       
LRM004     END-IF.                                                              
                                                                                
           INITIALIZE GETRH-PARAMETERS                                  CATMMF  
           MOVE WS-CLIENT       TO GETRH-CLIENT4.                       CATMMF  
                                                                                
           MOVE 'CATMMF  '      TO GETRH-CALLING-PROGRAM.               CATMMF  
                                                                        CATMMF  
LRM003     CALL GETRHS USING GETRH-PARAMETERS                           CATMMF  
LRM002                       ICTL-MMF-TABLE                                     
LRM002                       ICTL-VDR-TABLE                             CATMMF  
LRM003     MOVE WS-CLIENT       TO GETTH-CLIENT                                 
LRM003     MOVE 'CATMMF  '      TO GETTH-CALLING-PROGRAM                        
TEST       DISPLAY 'CALLING GETTH FOR CLIENT ' GETTH-CLIENT                     
LRM003     CALL GETTH USING GETTH-PARAMETERS                                    
LRM003                      ICTL-MMF-TABLE                                      
LRM003                      ICTL-VDR-TABLE.                                     
TEST       DISPLAY 'RETURN GETTH FOR CLIENT ' GETTH-CLIENT.                     
LRM003     EVALUATE TRUE                                                        
LRM003        WHEN GETTH-ACTION-COMPLETE                                        
LRM003        WHEN GETTH-NOT-FOUND                                              
LRM003           CONTINUE                                                       
LRM003        WHEN GETTH-DB2-ERROR                                              
LRM003           DISPLAY 'DB2 ERROR GETTING THRESHOLD FUNDS '                   
LRM003           DISPLAY 'SQLCODE = ' GETTH-SQLCODE                             
LRM003           DISPLAY 'CLIENT    ' WS-CLIENT                                 
LRM003           MOVE 3500 TO ABEND-CODE                                        
LRM003           PERFORM ABEND-JOB                                              
LRM003     END-EVALUATE.                                                        
                                                                                
           MOVE 1 TO SEC-SUB.                                           CATMMF  
           MOVE 0 TO WS-SEQUENCE.                                       CATMMF  
           PERFORM  UNTIL SEC-SUB > 998                                 CATMMF  
              IF  MMF-SECURITY (SEC-SUB)  >  SPACES                     CATMMF  
                   ADD 1 TO WS-SEQUENCE                                 CATMMF  
                   MOVE SPACE TO O-MMF-RECORD                           CATMMF  
                   MOVE WS-CLIENT             TO O-MMF-CLIENT-NUM       CATMMF  
                   MOVE WS-SEQUENCE           TO O-MMF-SEQUENCE-NO      CATMMF  
                   MOVE MMF-SECURITY(SEC-SUB) TO O-MMF-SECURITY         CATMMF  
                   MOVE SEC-SUB               TO O-MMF-SWEEP-CODE       CATMMF  
                   MOVE MMF-RDMPT-HRCHY-CD(SEC-SUB)                     CATMMF  
                                              TO O-MMF-REDMPT-HRCHY     CATMMF  
LRM003             MOVE ZERO                  TO O-MMF-THRESHOLD-COUNT          
LRM003             IF MMF-THRHL-IND(SEC-SUB) = 'Y'                              
LRM003             AND GETTH-ACTION-COMPLETE                                    
LRM003                PERFORM LOAD-THRESHOLD-FUND-RTN                           
LRM003             END-IF                                                       
LRM003             WRITE O-MMF-SEURITY-REC                              CATMMF  
                   ADD 1 TO MMF-REC-CNT                                 CATMMF  
              END-IF                                                    CATMMF  
              ADD 1 TO SEC-SUB                                          CATMMF  
           END-PERFORM.                                                 CATMMF  
LRM002     EVALUATE TRUE                                                        
LRM002         WHEN GETVDR-ACTION-COMPLETE                                      
                   PERFORM LOAD-SECONDARY-REDEMTION-RTN                 CATMMF  
LRM002         WHEN GETVDR-NOT-FOUND                                            
LRM002             DISPLAY '*** CLIENT ' WS-CLIENT                              
LRM002                           ' IS NOT ON VENDOR FUND TABLE'                 
LRM002         WHEN OTHER                                                       
LRM002             DISPLAY 'ABNORMAL CONDITION FRO GETVDR'                      
LRM002             DISPLAY 'RETURN-CODE = '  GETVDR-RETURN-CODE                 
LRM002                      '   SQLCODE = '   GETVDR-SQLCODE                    
LRM002                      '   UNKNOWN RETURN CODE FOUND, ABEND'               
LRM002                      ' AT CLIENT NUMBER: ' WS-CLIENT                     
LRM002             MOVE  3345  TO  ABEND-CODE                                   
LRM002             PERFORM ABEND-JOB                                            
LRM002     END-EVALUATE.                                                        
      *                                                                 CATMMF  
LRM003 LOAD-THRESHOLD-FUND-RTN.                                                 
LRM003     SET FSX TO 1                                                         
LRM003     SEARCH GETTH-PRIM-FUND-TBL                                           
LRM003        AT END                                                            
LRM003           DISPLAY 'NO THRESH FUND MATCH ' MMF-SLOT-NBR (SEC-SUB)         
LRM003        WHEN FSX > GETTH-PRIM-TH-FND-CNT                                  
LRM003           DISPLAY 'NO THRESH FUNDS ' MMF-SLOT-NBR (SEC-SUB)              
LRM003        WHEN MMF-SLOT-NBR (SEC-SUB)                                       
LRM003                          = GETTH-PRIM-FUND-SLOT (FSX)                    
LRM003           SET TH-SEC-SUB TO FSX                                          
LRM003           MOVE 0 TO THRESH-SUB TH-THRESH-SUB                             
LRM003           PERFORM GETTH-THRHL-FUND-CNT (FSX) TIMES                       
LRM003              ADD 1 TO TH-THRESH-SUB                                      
LRM003**** SKIP THRESHOLD ENTRY=1, THIS IS ALWAYS SAME SEC AS PRIMARY           
LRM003              IF TH-THRESH-SUB = 1                                        
LRM003                CONTINUE                                                  
LRM003              ELSE                                                        
LRM003                ADD 1 TO THRESH-SUB                                       
LRM003                MOVE GETTH-THRHL-FUND (TH-SEC-SUB, TH-THRESH-SUB)         
LRM003                           TO  O-MMF-THRESHOLD-FUND(THRESH-SUB)           
LRMTST                DISPLAY 'MOVING ' SEC-SUB ',' TH-THRESH-SUB               
LRMTST                             ' TO ' THRESH-SUB                            
LRMTST                        ' '  O-MMF-THRESHOLD-FUND(THRESH-SUB)             
LRM003              END-IF                                                      
LRM003           END-PERFORM                                                    
LRM003           MOVE THRESH-SUB TO O-MMF-THRESHOLD-COUNT                       
LRM003     END-SEARCH.                                                          
LRM003                                                                          
      *                                                                 CATMMF  
       LOAD-SECONDARY-REDEMTION-RTN.                                    CATMMF  
           MOVE WS-CLIENT          TO O-MMF-REDMPT-CLIENT.              CATMMF  
           SET O-MMF-REDMPT-REC    TO TRUE.                             CATMMF  
           MOVE ZERO TO O-MMF-REDMPT-COUNT.                             CATMMF  
           IF GETRH-ACTION-COMPLETE                                     CATMMF  
              PERFORM VARYING WS-SUB FROM 1 BY 1                        CATMMF  
                        UNTIL WS-SUB > GETRH-CNT                        CATMMF  
                 MOVE GETRH-ASC-SEC-ADP-NBR (WS-SUB)                    CATMMF  
                                    TO O-MMF-REDMPT-SECURITY (WS-SUB)   CATMMF  
              END-PERFORM                                               CATMMF  
              MOVE GETRH-CNT        TO O-MMF-REDMPT-COUNT               CATMMF  
           END-IF.                                                      CATMMF  
           WRITE O-MMF-REDMPT-RECORD.                                   CATMMF  
           ADD 1 TO MMF-REC-CNT.                                        CATMMF  
       ABEND-JOB.                                                       CATMMF  
           CALL  ABEND    USING  ABEND-CODE.                            CATMMF  
                                                                        CATMMF  
