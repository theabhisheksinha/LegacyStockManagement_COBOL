000001* PDX    - CAT502CV C0291033 02/23/10 08:09:10 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT502CV.                                                   
      *****************************************************************         
      * CAT502CV - UPDATES OPTION SYMBOLS ON NSCC EXTRACT BASED ON    *         
      *   OPTION CONSOLIDATION.                                       *         
      *                                                               *         
      * READ NSCC EXTRACT FILE, LOOKUP ADP NUMBER ON BOP75 FILE       *         
      * FOR ASSET ADDS WITH SLOC=35.                                  *         
      * IF FOUND, USE THE "TO" ADP NUMBER TO LOOKUP NEW SYMBOL AND    *         
      * REPLACE IT.                                                             
      *                                                               *         
      * PROGRAM TO RUN INSIDE CAT5000* JOBS.                          *         
      * INPUT  -                                                      *         
      *        - NSCCIN (CYCLE EXTRACT FROM CAT501)                   *         
      *        - MSD                                                  *         
      *        - BB.ZZZ.BOP75.CORPGL                                  *         
      * OUTPUT -                                                      *         
      *        - PRGAM DISPLAYS                                       *         
      *        - NSCCIN FILE(+1)                                      *         
      *                                                               *         
      *****************************************************************         
      * 02/10/10 LRM   NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SELECT NSCC-FILE-IN                  ASSIGN  TO  NSCCIN.             
           SELECT NSCC-FILE-OUT                 ASSIGN  TO  NSCCOUT.            
           SELECT  BOP75-OPTCHNG        ASSIGN TO  OPTCHNG                      
                                  ORGANIZATION IS  INDEXED                      
                                  ACCESS MODE  IS  RANDOM                       
                                  RECORD KEY   IS  OPTCHNG-KEY                  
                                  FILE STATUS  IS  OPTCHNG-FILE-STATUS          
                                                   OPTCHNG-VSAM-CODE.           
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  NSCC-FILE-IN                                                         
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 2991 CHARACTERS                  
              DEPENDING ON WS-NSCC-REC-LEN-IN                                   
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  NSCC-HEADER-TRAILER                    PIC  X(080).                  
                                                                                
       01  NSCC-RECORD-IN                         PIC  X(2991).                 
                                                                                
       COPY NSCCDAT.                                                            
                                                                                
       FD  NSCC-FILE-OUT                                                        
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 2991 CHARACTERS                  
              DEPENDING ON WS-NSCC-REC-LEN-OUT                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  NSCC-HEADER-TRAILER-OUT                PIC  X(080).                  
                                                                                
       01  NSCC-RECORD-OUT                        PIC  X(2991).                 
                                                                                
       FD  BOP75-OPTCHNG.                                                       
       01  OPTCHNG-REC.                                                         
           05  OPTCHNG-KEY.                                                     
               10  OPTCHNG-CLIENT           PIC  X(03).                         
               10  OPTCHNG-ADP-SEC-NO       PIC  X(07).                         
               10  OPTCHNG-SUPPRESS-IND     PIC  X(01).                         
           05  OPTCHNG-DETAIL               PIC  X(108).                        
           05  OPTCHNG-FILLER               PIC  X(156).                        
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT502CV'.          
       01  WF-AREA.                                                             
           05  WK-ADP-NBR                PIC X(07).                             
       01  WS-NSCC-REC-LEN-IN          PIC 9(05) VALUE ZERO.                    
       01  WS-NSCC-REC-LEN-OUT         PIC 9(05) VALUE ZERO.                    
       01  WS-NSCC-EOF-SW              PIC X     VALUE 'N'.                     
           88  NSCC-EOF                          VALUE 'Y'.                     
       01  W-STATS-AREA.                                                        
           05  WS-MSD-FND-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  WS-NSCC-READ              PIC  9(009) COMP-3 VALUE 0.            
           05  WS-NSCC-UPDATED           PIC  9(009) COMP-3 VALUE 0.            
           05  WS-NSCC-WRITTEN           PIC  9(009) COMP-3 VALUE 0.            
      /                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
                                                                                
        01  WS-FILE-CONTROL.                                                    
            05  OPTCHNG-FILE-STATUS      PIC  X(02)  VALUE SPACES.              
                88  OPTCHNG-OK                       VALUE '00' '97'.           
                88  OPTCHNG-EOF                      VALUE '10'.                
                88  OPTCHNG-DUPLICATE-KEY            VALUE '22' '02'.           
                88  OPTCHNG-REC-NOT-FOUND            VALUE '23'.                
                88  OPTCHNG-ERROR                    VALUE                      
                    '04' THRU '09' '21' '24' THRU '29' '30' THRU '39'           
                    '40' THRU '49' '90' THRU '96' '96' '98' '99'.               
                88  OPTCHNG-INVALID-OPTION           VALUE '99'.                
                                                                                
            05  OPTCHNG-VSAM-CODE        COMP.                                  
                10  OPTCHNG-VC-RETURN    PIC  9(04).                            
                10  OPTCHNG-VC-FUNCTION  PIC  9(04).                            
                10  OPTCHNG-VC-FEEDBACK  PIC  9(04).                            
                                                                                
      ****** OPTCHNG-WORK I/O AREA **************************                   
       01  OPT-OPTION-TABLE-RECORD.                                             
                                                                                
           05  OPT-DATA-RECORD.                                                 
               10  OPT-KEY.                                                     
                   15  OPT-CLNT            PIC XXX.                             
                   15  OPT-OLD-ADP-SEC-NO PIC X(07).                            
                   15  OPT-SUPPRESS-IND    PIC X(01).                           
                       88 OPT-SUPPRESS     VALUE 'X'.                           
               10  OPT-DETAIL.                                                  
                   15  OPT-UNDERLYING-ADP-SEC PIC X(07).                        
                   15  OPT-CALL-PUT-IND    PIC X(01).                           
                       88 OPT-CALL         VALUE 'C'.                           
                       88 OPT-PUT          VALUE 'P'.                           
                   15  OPT-CHANGE-TYPE-IND PIC X(01).                           
                       88 OPT-TYPE-LEAP         VALUE ' '.                      
                       88 OPT-TYPE-NON-LEAP     VALUE 'N'.                      
                   15  OPT-SOURCE-IND      PIC X(01).                           
                       88 OPT-OCC-IND      VALUE 'B'.                           
                       88 OPT-CLIENT-IND   VALUE 'O'.                           
                   15  OPT-NEW-ADP-SEC-NO PIC X(07).                            
                   15  OPT-NEW-CUSIP       PIC X(12).                           
                   15  OPT-NEW-SYMBOL      PIC X(12).                           
                   15  OPT-STRIKE-PRICE    PIC 9(03)V9(03).                     
                   15  OPT-FACTOR          PIC 9(03)V9(04).                     
                   15  OPT-DESCRIPTION     PIC X(30).                           
                   15  OPT-EFFECT-DATE     PIC 9(08).                           
                   15  FILLER              REDEFINES                            
                       OPT-EFFECT-DATE.                                         
                       20  OPT-EFF-CC      PIC 9(02).                           
                       20  OPT-EFF-YY      PIC 9(02).                           
                       20  OPT-EFF-MM      PIC 9(02).                           
                       20  OPT-EFF-DD      PIC 9(02).                           
                   15  OPT-EXP-DATE        PIC 9(08).                           
                   15  FILLER              REDEFINES                            
                       OPT-EXP-DATE.                                            
                       20  OPT-EXP-CC      PIC 9(02).                           
                       20  OPT-EXP-YY      PIC 9(02).                           
                       20  OPT-EXP-MM      PIC 9(02).                           
                       20  OPT-EXP-DD      PIC 9(02).                           
                   15  OPT-ADDED-DATE      PIC 9(08).                           
                   15  FILLER              REDEFINES                            
                       OPT-ADDED-DATE.                                          
                       20  OPT-ADD-CC      PIC 9(02).                           
                       20  OPT-ADD-YY      PIC 9(02).                           
                       20  OPT-ADD-MM      PIC 9(02).                           
                       20  OPT-ADD-DD      PIC 9(02).                           
                                                                                
                   15  OPT-OLD-AREA.                                            
                       20  OPT-OLD-SYMBOL PIC X(12).                            
                       20  OPT-OLD-CUSIP   PIC X(12).                           
                   15  OPT-PROCESS         PIC 9(01).                           
                   15  OPT-FILLER1         PIC X(31).                           
                                                                                
                   15  OPT-NON-LEAP-AREA.                                       
                       20  OPT-USR-BATCH   PIC X(02).                           
                       20  OPT-USR-ENTRY   PIC X(03).                           
                       20  OPT-USR-DESC1   PIC X(30).                           
                       20  OPT-USR-DESC2   PIC X(30).                           
                                                                                
                   15  OPT-ADJUSTMENT-IND  PIC 9(01).                           
                   15  OPT-FILLER1         PIC X(34).                           
                                                                                
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
                                                                                
       PROCEDURE DIVISION.                                                      
      *                         ===========                                     
       0000-MAIN.                                                               
           DISPLAY 'CAT502CV - REPLACE OPTION SYMBOL ON NSCC CYCLE'     .       
           DISPLAY '     TRANSACTION FILE BASED ON BOP75'.                      
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 2000-PROCESS-NSCCIN THRU 2000-EXIT                           
               UNTIL NSCC-EOF.                                                  
                                                                                
           CLOSE NSCC-FILE-IN                                                   
           CLOSE NSCC-FILE-OUT                                                  
           CLOSE BOP75-OPTCHNG.                                                 
                                                                                
           IF OPTCHNG-FILE-STATUS = '00'                                        
              DISPLAY '*** CAT502CV - CLOSED OPTCHNG VSAM FILE... '             
           ELSE                                                                 
              DISPLAY '*** CAT502CV - CLOSE OPTCHNG VSAM FILE ERROR'            
              DISPLAY 'FILE STATUS = ' OPTCHNG-FILE-STATUS                      
              DISPLAY ' RET CODE   = ' OPTCHNG-VC-RETURN                        
           END-IF.                                                              
                                                                                
           PERFORM 8900-DISPLAY-CNT    THRU 8900-EXIT.                          
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
                                                                                
                                                                                
           OPEN  INPUT  NSCC-FILE-IN                                            
           OPEN  OUTPUT NSCC-FILE-OUT                                           
                                                                                
           OPEN  INPUT  BOP75-OPTCHNG                                           
                                                                                
           IF OPTCHNG-FILE-STATUS = '00' OR '97'                                
              DISPLAY '*** CAT502CV OPEN INPUT OPTCHNG VSAM FILE OK'            
           ELSE                                                                 
              DISPLAY '*** CAT502CV OPTCHNG VSAM FILE OPEN ERROR'               
              DISPLAY 'FILE STATUS = ' OPTCHNG-FILE-STATUS                      
              DISPLAY ' RET CODE   = ' OPTCHNG-VC-RETURN                        
              DISPLAY ' BYPASS ABEND / CONTINUE PROCESSING'                     
LRM********** MOVE 1004             TO ABEND-CODE                               
LRM********** CALL  ABEND        USING ABEND-CODE                               
           END-IF.                                                              
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ MSD AND UPDATE OPTION SYMBOL ON THE OUTPUT FILE AS NEEDED.        
      ******************************************************************        
       2000-PROCESS-NSCCIN.                                                     
                                                                                
           READ NSCC-FILE-IN                                                    
              AT END                                                            
                 SET NSCC-EOF TO TRUE                                           
                 GO TO 2000-EXIT                                                
           END-READ.                                                            
                                                                                
           ADD 1 TO WS-NSCC-READ.                                               
           IF NSCCAT-REC-TYPE NOT = 'AT'                                        
           OR NSCCAT-REQ-SET-LOCATION NOT = '35'                                
           OR NSCCAT-ASSET-DESC(121:8) NOT = 'ADP-SEC:'                         
           OR NSCCAT-ASSET-DESC(129:7) NOT > SPACES                             
              GO TO 2000-WRITE-NSCC-REC                                         
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-ASSET-DESC(129:7)  TO WK-ADP-NBR                         
           PERFORM 2500-READ-OPTCHNG-RTN.                                       
                                                                                
           IF OPTCHNG-FILE-STATUS = '00'                                        
              IF  OPT-NEW-ADP-SEC-NO  > SPACES                                  
                 PERFORM 5400-GETMSDC THRU 5400-EXIT                            
                 IF  GETMSD-RETURN-VALID                                        
                    ADD 1 TO WS-MSD-FND-CNT                                     
                 ELSE                                                           
                   DISPLAY '#BYPASS SEC=' WK-ADP-NBR                            
                       ' GETMSD-RETURN-CODE='  GETMSD-RETURN-CODE               
                      ' FROM NEW ADP SEC ' OPT-NEW-ADP-SEC-NO                   
                   GO TO 2000-WRITE-NSCC-REC                                    
                 END-IF                                                         
              ELSE                                                              
                 DISPLAY  'STRANGE CONDITION WHERE OPT NEW MISSING'             
                        ' IN OPT RECORD FOR ' WK-ADP-NBR                        
                        ' OPT-NEW-ADT=' OPT-NEW-ADP-SEC-NO                      
                 GO TO 2000-WRITE-NSCC-REC                                      
           ELSE                                                                 
           IF OPTCHNG-FILE-STATUS = '23'                                        
              DISPLAY '#BYPASS SEC=' WK-ADP-NBR                                 
                   ' OPTCHNG NOT FOUND'                                         
                 GO TO 2000-WRITE-NSCC-REC                                      
           ELSE                                                                 
              DISPLAY '#BYPASS SEC=' WK-ADP-NBR                                 
              ' BAD READ OPTCHNG FILE STTS = '  OPTCHNG-FILE-STATUS             
                 GO TO 2000-WRITE-NSCC-REC                                      
           END-IF.                                                              
                                                                                
           IF MSD-OCC-OPTN-SYM-ID = NSCCAT-OPTION-SYM                           
              DISPLAY 'NOTHING TO CHANGE / SYMBOL SAME'                         
                      ' FOR ' OPT-NEW-ADP-SEC-NO                                
                      ' STARTED WITH ' WK-ADP-NBR                               
              GO TO 2000-WRITE-NSCC-REC                                         
           END-IF.                                                              
                                                                                
           IF MSD-OCC-OPTN-SYM-ID NOT > SPACES                                  
              DISPLAY 'MSD OPTION SYMBOL MISSING '                              
                      ' FOR ' OPT-NEW-ADP-SEC-NO                                
                      ' STARTED WITH ' WK-ADP-NBR                               
              GO TO 2000-WRITE-NSCC-REC                                         
           END-IF.                                                              
                                                                                
           DISPLAY  '** OPTCHNG / MATCH SEC-NO = ' OPT-OLD-ADP-SEC-NO           
                                         ' NEW = ' OPT-NEW-ADP-SEC-NO           
                   ' CHG SYM FROM ' NSCCAT-OPTION-SYM                           
                                  ' TO ' MSD-OCC-OPTN-SYM-ID.                   
                                                                                
           MOVE MSD-OCC-OPTN-SYM-ID TO NSCCAT-OPTION-SYM.                       
           ADD 1 TO WS-NSCC-UPDATED.                                            
                                                                                
       2000-WRITE-NSCC-REC.                                                     
           MOVE WS-NSCC-REC-LEN-IN TO WS-NSCC-REC-LEN-OUT                       
           WRITE NSCC-RECORD-OUT FROM NSCC-RECORD-IN                            
           ADD 1 TO WS-NSCC-WRITTEN.                                            
       2000-EXIT. EXIT.                                                         
                                                                                
       2500-READ-OPTCHNG-RTN.                                                   
           MOVE '999'             TO OPTCHNG-CLIENT                             
           MOVE SPACES            TO OPTCHNG-SUPPRESS-IND                       
           MOVE WK-ADP-NBR        TO OPTCHNG-ADP-SEC-NO                         
                                                                                
           READ BOP75-OPTCHNG   INTO OPT-OPTION-TABLE-RECORD                    
                KEY IS OPTCHNG-KEY                                              
           END-READ.                                                            
                                                                                
      /                                                                         
       5400-GETMSDC.                                                            
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
           MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE OPT-NEW-ADP-SEC-NO       TO GETMSD-SEARCH-KEY                   
           MOVE '0'                      TO GETMSD-WI-CODE                      
           MOVE 96                       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
       5400-EXIT. EXIT.                                                         
                                                                                
       8900-DISPLAY-CNT.                                                        
           DISPLAY ' '                                                          
           DISPLAY 'CAT502CV: NSCC RECORDS READ    ' WS-NSCC-READ               
           DISPLAY 'CAT502CV: MSD FOUND            ' WS-MSD-FND-CNT             
           DISPLAY 'CAT502CV: NSCC RECORDS UPDATED ' WS-NSCC-UPDATED            
           DISPLAY 'CAT502CV: NSCC RECORDS WRITTEN ' WS-NSCC-WRITTEN.           
       8900-EXIT. EXIT.                                                         
