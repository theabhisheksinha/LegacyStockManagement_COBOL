000001* PDX    - CAT705   C0203711 01/07/05 14:17:07 TBLAMUR            00001000
      ***************************************************************** CAT710  
       IDENTIFICATION DIVISION.                                         CAT710  
      ***************************************************************** CAT710  
       PROGRAM-ID.  CAT705.                                             CAT710  
       AUTHOR.      L MUREY.                                            CAT710  
       DATE-WRITTEN.  MARCH 2004.                                       CAT710  
      ***************************************************************** CAT710  
      *                                                                 CAT710  
      * ACATS - AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM              CAT710  
      *         EOD POSITION EDIT FOR UBS / 235 CLEARING NO 0642        CAT710  
      * PRE-EDIT TO ASSURE ONLY 0642 DETAILS ARE PRESENT ON THE EOD     CAT710  
      * POSITION FILE RECEIVED INDIRECTLY FROM SIAC VIA WM (WEALTH MNGT)CAT710  
      * THE HEADER DATE IS VERIFIED AND THE HEADER RECORD DROPPED.      CAT710  
      ******************************************************************CAT710  
       ENVIRONMENT DIVISION.                                            CAT710  
       CONFIGURATION SECTION.                                           CAT710  
                                                                        CAT710  
       INPUT-OUTPUT SECTION.                                            CAT710  
       FILE-CONTROL.                                                    CAT710  
                                                                        CAT710  
           SELECT  NSCC-POSITION-FILE-IN ASSIGN  TO  IPOSN.             CAT710  
           SELECT  NSCC-POSITION-FILE    ASSIGN  TO  OPOSN.             CAT710  
                                                                                
      /                                                                 CAT710  
       DATA DIVISION.                                                   CAT710  
       FILE SECTION.                                                    CAT710  
       FD  NSCC-POSITION-FILE-IN                                        CAT710  
           RECORDING MODE IS V                                          CAT710  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT710  
              DEPENDING ON W-REC-LEN-IN                                 CAT710  
           BLOCK CONTAINS 0 RECORDS.                                    CAT710  
                                                                        CAT710  
       01  NSCCP-RECORD-IN                PIC X(4000).                  CAT710  
                                                                                
       01  NSCCP-FILE-HEADER.                                           CAT710  
           05  NSCCP-HDR-TYPE             PIC X(01).                    CAT710  
               88  NSCCP-FILE-HEADER                VALUE '1'.          CAT710  
           05  FILLER                     PIC X(05).                    CAT710  
           05  NSCCP-HDR-CCYYMMDD         PIC X(08).                    CAT710  
           05  FILLER                     PIC X(02).                    CAT710  
           05  NSCCP-HDR-FILE-ID          PIC X(21).                    CAT710  
               88  NSCCP-HDR-ID-VALID               VALUE               CAT710  
                                          '718MRO ACATS POSITION'.      CAT710  
           05  FILLER                     PIC X(26).                    CAT710  
           05  NSCCP-HDR-REC-CNT          PIC 9(10).                    CAT710  
                                                                                
       01  NSCCP-RECORD.                                                CAT710  
           05  NSCCP-REC-TYPE             PIC X(01).                    CAT710  
               88  NSCCP-HEADER                     VALUE 'H'.          CAT710  
               88  NSCCP-POSITION-MRO               VALUE 'P'.          CAT710  
               88  NSCCP-SETTLMNT-MRO               VALUE 'S'.          CAT710  
               88  NSCCP-TRAILER                    VALUE 'T'.          CAT710  
           05  NSCCP-REC-SUBTYPE          PIC X(01).                    CAT710  
               88  NSCCP-XFER                       VALUE 'T'.          CAT710  
               88  NSCCP-ASSET                      VALUE 'A'.          CAT710  
               88  NSCCP-FND-RGS                    VALUE 'F'.          CAT710  
           05  FILLER                     PIC X(3266).                  CAT710  
                                                                                
       FD  NSCC-POSITION-FILE                                           CAT710  
           RECORDING MODE IS V                                          CAT710  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT710  
              DEPENDING ON W-REC-LEN-IN                                 CAT710  
           BLOCK CONTAINS 0 RECORDS.                                    CAT710  
                                                                        CAT710  
       01  NSCCP-RECORD-OUT               PIC X(4000).                  CAT710  
                                                                        CAT710  
       01  NSCCP-RECORD-OTHER.                                          CAT710  
           05  NSCCP-REC-TYPE-OUT         PIC X(01).                    CAT710  
      /                                                                 CAT710  
       WORKING-STORAGE SECTION.                                         CAT710  
           COPY PDXIDCOB.                                               CAT710  
                                                                                
       01  CAT705-WORKING-AREA.                                                 
           05  W-REC-LEN-IN              PIC 9(005) VALUE 0.                    
           05  W-NSCCP-HDR-REC-CNT       PIC 9(10)  VALUE 0.            CAT710  
           05  W-INFILE-CNT              PIC 9(07)  VALUE 0.                    
           05  W-OUTFILE-CNT             PIC 9(07)  VALUE 0.                    
           05  WS-BROKER-NBR             PIC X(04)  VALUE SPACES.               
           05  WS-ADP-CLIENT             PIC X(04)  VALUE SPACES.               
           05  WS-CLNT-NO                PIC S9(3)  COMP-3 VALUE +0.            
           05  END-OF-ACATPOSN-SW        PIC X(01) VALUE 'N'.                   
               88  END-OF-ACATPOSN       VALUE 'Y'.                             
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
                                                                        CAT710  
      ******************************************************************CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'HDR-REC='.    CAT710  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:==  BY ==WS-HDR==.       CAT710  
      *----------------------------------------------------------------*CAT710  
       01  FILLER                        PIC X(08) VALUE 'POS-REC='.    CAT710  
       01  WS-POS-REC                    PIC X(475).                    CAT710  
       01  FILLER                        PIC X(08) VALUE 'TI-REC '.     CAT710  
           COPY NSCCP    REPLACING ==:NSCCP:==     BY ==W-NSCC==.       CAT710  
      *----------------------------------------------------------------*CAT710  
       01  FILLER                        PIC X(08) VALUE 'TRL-REC='.    CAT710  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:==  BY ==WS-TRL==.       CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'BHINFO=='.    CAT710  
           COPY BHINFO.                                                 CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'BHACAT=='.    CAT710  
           COPY BHACAT.                                                 CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'B1-AREA='.    CAT710  
       01  WS-B1-TABLE-AREA.                                            CAT710  
           05  WS-CLIENT-TABLE-ENTRY  OCCURS 500 TIMES                  CAT710  
               INDEXED BY SUB.                                          CAT710  
               07  WS-TBL-ADP-CLIENT-NBR     PIC 9(04).                 CAT710  
               07  WS-TBL-BROKER-NBR         PIC X(04).                 CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
                                                                                
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT710  
           COPY STUBCPY.                                                CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'END-O-WS'.    CAT710  
      /                                                                 CAT710  
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH              PIC  S9(4) COMP.                        
           05  L-BYP-DATECHK-SW         PIC  X(001).                            
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW         PIC  X(001).                            
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  PARM-BROKER-NBR          PIC  X(04).                             
      /                                                                 CAT710  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT710  
       0000-MAIN-ROUTINE.                                               CAT710  
           DISPLAY 'CAT705 - ACATS EOD POSITION EDIT'.                  CAT710  
           DISPLAY ' '.                                                 CAT710  
           COPY MSGCOBO.                                                CAT710  
           DISPLAY ' '.                                                 CAT710  
                                                                        CAT710  
           PERFORM 1000-OPEN-FILES THRU 1000-EXIT.                      CAT710  
           PERFORM 1500-LOAD-B1-RTN.                                    CAT710  
           PERFORM 2000-PROCESS-ACATPOSN THRU 2000-EXIT                 CAT710  
              UNTIL END-OF-ACATPOSN.                                    CAT710  
           PERFORM 9000-CLOSE-ACATPOSN THRU 9000-EXIT.                  CAT710  
           GOBACK.                                                      CAT710  
                                                                        CAT710  
       1000-OPEN-FILES.                                                 CAT710  
                                                                        CAT710  
           DISPLAY 'CAT705: L-BYP-DATECHK-SW = '                                
                             L-BYP-DATECHK-SW                                   
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT705: L-BYP-FILECHK-SW = '                                
                             L-BYP-FILECHK-SW                                   
           ' (1=BYPASS FILE CHECK)'                                             
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT705: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT705: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT705: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT705: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           MOVE 'CAT705'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT705:       BPD-PROC-DATE= ' BPD-PROC-DATE                
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT  NSCC-POSITION-FILE-IN.                           CAT710  
           OPEN OUTPUT NSCC-POSITION-FILE.                              CAT710  
                                                                        CAT710  
       1000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       1500-LOAD-B1-RTN.                                                CAT710  
           PERFORM VARYING WS-CLNT-NO FROM 1 BY 1                       CAT710  
                    UNTIL WS-CLNT-NO > 500                              CAT710  
                                                                        CAT710  
              MOVE SPACES TO WS-CLIENT-TABLE-ENTRY(WS-CLNT-NO)          CAT710  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO     CAT710  
                                              BH-ACAT-INFO              CAT710  
              MOVE  WS-CLNT-NO            TO  BH-BROKER-NUMBER-N        CAT710  
                                  WS-TBL-ADP-CLIENT-NBR(WS-CLNT-NO)     CAT710  
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE    CAT710  
              MOVE  '434500'              TO  BH-B2-INFO-ID             CAT710  
              CALL  GETB1V              USING BH-BROKER-HEADER-INFO     CAT710  
                                              BH-ACAT-INFO              CAT710  
                                                                        CAT710  
              IF BH-BROKER-ACTIVE                                       CAT710  
              AND BH-ACAT-ACTIVE                                        CAT710  
                 MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                   CAT710  
                                  TO WS-TBL-BROKER-NBR(WS-CLNT-NO)      CAT710  
                 DISPLAY 'B1-CLT=' WS-CLNT-NO                           CAT710  
              END-IF                                                    CAT710  
           END-PERFORM.                                                 CAT710  
      /                                                                 CAT710  
       2000-PROCESS-ACATPOSN.                                           CAT710  
                                                                        CAT710  
           PERFORM 3000-READ-ACATPOSN  THRU 3000-EXIT.                  CAT710  
                                                                        CAT710  
           IF  END-OF-ACATPOSN                                          CAT710  
               GO 2000-EXIT                                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF W-NSCC-DIST-PARTICIPANT NOT = WS-BROKER-NBR               CAT710  
              MOVE W-NSCC-DIST-PARTICIPANT TO WS-BROKER-NBR             CAT710  
                                                                        CAT710  
              SET SUB  TO  +1                                           CAT710  
              SEARCH WS-CLIENT-TABLE-ENTRY                              CAT710  
                 VARYING SUB                                            CAT710  
                AT END                                                  CAT710  
                   MOVE '0000'                      TO WS-ADP-CLIENT    CAT710  
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                     CAT710  
                          ' BAD BROKER NUMBER FROM NSCC -'              CAT710  
                          ' NOT FOUND IN B1 -'                          CAT710  
                          ' CLT=' WS-ADP-CLIENT                         CAT710  
               WHEN                                                     CAT710  
                   WS-BROKER-NBR = WS-TBL-BROKER-NBR (SUB)              CAT710  
                 AND                                                            
                   WS-BROKER-NBR = PARM-BROKER-NBR                              
                   MOVE WS-TBL-ADP-CLIENT-NBR (SUB) TO WS-ADP-CLIENT    CAT710  
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                     CAT710  
                          ' CLT=' WS-TBL-ADP-CLIENT-NBR(SUB)            CAT710  
              END-SEARCH                                                CAT710  
           END-IF.                                                      CAT710  
           IF  WS-ADP-CLIENT NOT = '0000'                               CAT710  
               PERFORM 4000-PROCESS-RTN  THRU 4000-EXIT                 CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       2000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       3000-READ-ACATPOSN.                                              CAT710  
                                                                        CAT710  
           READ NSCC-POSITION-FILE-IN                                   CAT710  
                AT END                                                  CAT710  
                   MOVE 'Y'   TO END-OF-ACATPOSN-SW                     CAT710  
                   DISPLAY 'CAT705: END OF NSCC POSTION FILE, '         CAT710  
                           'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT   CAT710  
                   ' EXPECTED ' W-NSCCP-HDR-REC-CNT                             
                   GO TO 3000-EXIT                                      CAT710  
           END-READ.                                                    CAT710  
                                                                        CAT710  
           ADD  1   TO W-INFILE-CNT.                                    CAT710  
                                                                        CAT710  
      **<< SKIP RECORD IF NSCCP-REC-TYPE = '1' (FILE HEADER REC)>>      CAT710  
           IF NSCCP-REC-TYPE = '1'                                      CAT710  
              DISPLAY ' '                                               CAT710  
              DISPLAY 'FILE HEADER:'                                    CAT710  
              DISPLAY  NSCCP-RECORD (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY ' '                                               CAT710  
              IF NOT NSCCP-HDR-ID-VALID                                 CAT710  
                 DISPLAY 'HEADER RECORD FILE IDENTIFIER WRONG'                  
                 DISPLAY 'FOUND    =' NSCCP-HDR-FILE-ID                 CAT710  
                 DISPLAY 'EXPECTED =718MRO ACATS POSITION'              CAT710  
                 IF L-BYP-FILECHK                                               
                    DISPLAY 'WRONG IDENTIFIER ALLOWED BASED ON PARM'            
                 ELSE                                                           
                    DISPLAY 'CAT705 ABENDS'                                     
                    MOVE +1000 TO ABEND-CODE                            CAT710  
                    PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT           CAT710  
                 END-IF                                                         
              END-IF                                                            
                                                                                
              IF NSCCP-HDR-CCYYMMDD = BPD-PROC-DATE                     CAT710  
                 DISPLAY 'HEADER DATE MATCHES ADP PROCESS DATE'                 
              ELSE                                                              
                 DISPLAY 'HEADER DATE DOES NOT MATCH PROCESS DATE '             
                   'IPOSN=' NSCCP-HDR-CCYYMMDD  ' ADP=' BPD-PROC-DATE           
                 IF L-BYP-DATECHK                                               
                    DISPLAY 'HEADER DATE MISMATCH ALLOWED BASED ON PARM'        
                 ELSE                                                           
                    DISPLAY 'CAT705 ABENDS'                                     
                    MOVE +2000 TO ABEND-CODE                            CAT710  
                    PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT           CAT710  
                 END-IF                                                         
              END-IF                                                            
                                                                                
              IF NSCCP-HDR-REC-CNT NUMERIC                              CAT710  
                 MOVE NSCCP-HDR-REC-CNT TO W-NSCCP-HDR-REC-CNT          CAT710  
              END-IF                                                            
                                                                                
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF NSCCP-HEADER                                              CAT710  
              MOVE ' '           TO  WS-HDR-RECORD                      CAT710  
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO              CAT710  
                   WS-HDR-RECORD    (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY ' '                                               CAT710  
              DISPLAY 'BRK-HDR:' WS-HDR-RECORD                          CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-POSITION-MRO                                        CAT710  
              IF (NSCCP-XFER OR NSCCP-ASSET)                            CAT710  
                 MOVE ' '          TO W-NSCC-RECORD                     CAT710  
                 MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO           CAT710  
                      W-NSCC-RECORD    (1 : W-REC-LEN-IN)               CAT710  
                 GO TO 3000-EXIT                                        CAT710  
              ELSE                                                      CAT710  
                 GO TO 3000-READ-ACATPOSN                               CAT710  
              END-IF                                                    CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-SETTLMNT-MRO                                        CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-TRAILER                                             CAT710  
              MOVE ' '           TO  WS-TRL-RECORD                      CAT710  
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO              CAT710  
                   WS-TRL-RECORD    (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY 'BRK-TRL:' WS-TRL-RECORD                          CAT710  
              DISPLAY 'CAT705: END OF BROKER. '                         CAT710  
                      'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT        CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY ' CAT705 - BAD RECORD TYPE'                       CAT710  
              DISPLAY '  NSCCP-REC-TYPE = '  NSCCP-REC-TYPE             CAT710  
              DISPLAY '  NSCCP-REC-SUBTYPE = '  NSCCP-REC-SUBTYPE       CAT710  
              DISPLAY '  NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT      CAT710  
              MOVE +3005 TO ABEND-CODE                                  CAT710  
              PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                 CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       3000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       4000-PROCESS-RTN.                                                CAT710  
           WRITE NSCCP-RECORD-OUT FROM NSCCP-RECORD-IN.                 CAT710  
           ADD 1 TO W-OUTFILE-CNT.                                              
                                                                        CAT710  
       4000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      *                                                                 CAT710  
       8000-ABEND-ROUTINE.                                                      
                                                                                
           DISPLAY '!!!! 8000-ABEND-ROUTINE '                                   
           DISPLAY '    CAT705: INPUT-CNT = ' W-INFILE-CNT                      
           DISPLAY ' CAT705 - BAD RECORD TYPE'                                  
           DISPLAY '  '  W-NSCC-COMMON-AREA                                     
                                                                                
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8000-EXIT.                                                               
           EXIT.                                                                
                                                                        CAT710  
       9000-CLOSE-ACATPOSN.                                             CAT710  
           CLOSE NSCC-POSITION-FILE-IN.                                 CAT710  
           CLOSE NSCC-POSITION-FILE.                                    CAT710  
                                                                        CAT710  
           DISPLAY 'INPUT RECORDS  ' W-INFILE-CNT                       CAT710  
           DISPLAY 'OUTPUT RECORDS ' W-OUTFILE-CNT.                     CAT710  
       9000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
