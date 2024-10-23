000001* PDX    - CAT788SP C0353123 03/24/14 14:03:33 TBLAMUR            00001000
LRM005* SSR 96502 CBRS004.13 RECOMPILE FOR COPYBOOK ACATTAXO CHANGE.            
000001* PDX    - CAT788SP C0325136 04/09/12 16:32:56 TBLAMUR            00001000
LRM004* SSR 83556 RECOMPILE FOR COPYBOOK ACATTAXO CHANGE.                       
000001* PDX    - CAT788SP C0322068 01/31/12 14:08:22 TBLAMUR            00001000
LRM003* SSR 83285 RECOMPILE FOR COPYBOOK ACATTAXO CHANGE.                       
000001* PDX    - CAT788SP C0316938 10/28/11 09:35:25 TBLAMUR            00001000
LRM002* SSR 78782 ALLOW CLIENT 10 TO BE EXTRACTED WITH A04S.                    
LRM002* SSR 78938 RECOMPILE DUE TO COPYBOOK CHANGES.                            
000001* PDX    - CAT788SP C0303505 11/30/10 12:21:08 TBLAMUR            00001000
LRM001* SSR 75062 HARD CODE CLIENT 80 OMINBUS ACCOUNTS (DATA FOUND              
LRM001* IN CLIENT 10) WHICH IS CBRS NBR A04S.                                   
000001* PDX    - CAT788SP C0303505 11/16/10 13:53:26 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT788  
       PROGRAM-ID.  CAT788SP.                                           CAT788  
      ******************************************************************CAT788  
      * CAT788SP - SPLIT NSCC COST BASIS MASTER FILE BY CBRS ACCOUNT   *CAT788  
      * BASED ON PROGRAM PARM.  COPY NSCC FILE HEADER AND ALL THE      *CAT788  
      * DETAIL RECORDS AND TRAILER WHICH FOLLOW, PRIOR TO THE NEXT     *CAT788  
      * CLIENT HEADER RECORD.                                                   
      *                                                                *CAT788  
      * INPUT  - NSCC ACATS COST BASIS TRANSACTION FILE   - GDG        *CAT788  
      * OUTPUT - COST BASIS TRANSACTION CLIENT SPEFIC FILE - GDG       *CAT788  
      *                                                                *CAT788  
      ******************************************************************CAT788  
      *                                                                 CAT788  
       ENVIRONMENT DIVISION.                                            CAT788  
       INPUT-OUTPUT SECTION.                                            CAT788  
       FILE-CONTROL.                                                    CAT788  
                                                                        CAT788  
           SELECT INFILE           ASSIGN       TO INFILE.              CAT788  
           SELECT OUTFILE          ASSIGN       TO OUTFILE.             CAT788  
      *                                                                 CAT788  
       DATA DIVISION.                                                   CAT788  
       FILE SECTION.                                                    CAT788  
       FD  INFILE                                                       CAT788  
           RECORDING MODE IS V                                          CAT788  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT788  
           DEPENDING ON W-REC-LEN-IN                                            
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
           COPY ACATTAXO REPLACING ==:TAXO:== BY ==NSCC==.              CAT788  
       01  LARGE-RECORD-IN              PIC X(4000).                    CAT788  
       01  NSCC-TRL-RECORD.                                                     
           05  FILLER                       PIC X(61).                  CAT788  
           05  NSCC-CLIENT-TRL-REC-COUNT    PIC 9(09).                  CAT788  
                                                                        CAT788  
       FD  OUTFILE                                                      CAT788  
           RECORDING MODE IS V                                          CAT788  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT788  
           DEPENDING ON W-REC-LEN-OUT                                           
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
       01  OUTFILE-REC-SHORT             PIC X(1).                      CAT788  
       01  LARGE-RECORD-OUT              PIC X(4000).                   CAT788  
      /                                                                 CAT788  
       WORKING-STORAGE SECTION.                                         CAT788  
           COPY PDXIDCOB.                                               CAT788  
                                                                        CAT788  
       01  WS-WORK-AREA.                                                CAT788  
           05  PGM-NAME                  PIC X(08) VALUE 'CAT788SP'.    CAT788  
           05  WS-STREAM                 PIC X(01).                     CAT788  
           05  WS-CLNT-NO                PIC 9(04) VALUE 0.             CAT788  
           05  W-REC-LEN-IN              PIC 9(05) VALUE 0.             CAT788  
           05  W-REC-LEN-OUT             PIC 9(05) VALUE 0.             CAT788  
           05  SUB                       PIC 9(04) VALUE 0.             CAT788  
           05  W-INFILE-CNT              PIC 9(07) VALUE 0.             CAT788  
           05  W-OUTFILE-CNT             PIC 9(07) VALUE 0.             CAT788  
           05  END-OF-INFILE-IND         PIC X(01).                     CAT788  
               88  END-OF-INFILE                   VALUE 'Y'.           CAT788  
           05  WS-CLT-IN-THIS-STREAM-SW  PIC X(01).                     CAT788  
LRM001     05  WS-WRITE-DETAIL-SW        PIC X(01).                     CAT788  
      *                                                                 CAT788  
           05  WS-PROC-DATE.                                            CAT788  
               07  WS-PROC-DATE-CC       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-YY       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-MM       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-DD       PIC  X(02).                    CAT788  
                                                                                
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT788  
           COPY BPDATESC.                                               CAT788  
           EJECT                                                        CAT788  
      /                                                                 CAT788  
       01  W-ABEND-AREA.                                                CAT788  
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT788  
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT788  
           COPY STUBCPY.                                                CAT788  
       EJECT                                                            CAT788  
      ******************************************************************CAT788  
       LINKAGE SECTION.                                                 CAT788  
      ******************************************************************CAT788  
                                                                        CAT788  
       01  PARM-AREA.                                                   CAT788  
           05  PARM-LENGTH              PIC  S9(4) COMP.                CAT788  
           05  PARM-CBRS-ACCT-NBR       PIC  X(04).                     CAT788  
           05  L-BYP-DATECHK-SW         PIC  X(001).                            
               88  L-BYP-DATECHK                     VALUE '1'.                 
LRM002     05  PARM-CLIENT-NBR          PIC X(03).                              
      /                                                                 CAT788  
      *                                                                 CAT788  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT788  
           COPY MSGCOBO.                                                CAT788  
           DISPLAY 'CAT788SP - EXTRACT COST BASIS TRANSACTION FILE BY ' CAT788  
                   'BROKER.'.                                           CAT788  
                                                                        CAT788  
           PERFORM 1000-INITIAL-RTN.                                    CAT788  
                                                                        CAT788  
           PERFORM 3000-MAIN-RTN                                        CAT788  
              THRU 3000-EX                                              CAT788  
                                                                                
           CLOSE INFILE                                                 CAT788  
                 OUTFILE                                                CAT788  
                                                                        CAT788  
           DISPLAY ' '.                                                 CAT788  
           DISPLAY 'CAT788SP: NSCC TRANS FL INPUT CNT = '               CAT788  
                    W-INFILE-CNT                                        CAT788  
                   ' (BZZZ.SIAC3607.NDMS / BQQQ.SIAQ4607.NDMS)'.        CAT788  
           DISPLAY 'CAT788SP: EXTRACT OUTPUT FILE CNT = '               CAT788  
                    W-OUTFILE-CNT                                       CAT788  
           DISPLAY ' '.                                                 CAT788  
           DISPLAY '** CAT788SP COMPLETED SUCCESSFULLY **'.             CAT788  
           GOBACK.                                                      CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       1000-INITIAL-RTN.                                                CAT788  
           DISPLAY ' '.                                                 CAT788  
                                                                        CAT788  
           IF PARM-LENGTH < +4                                          CAT788  
              DISPLAY '** CAT788SP ABENDED - JCL PARM MISSING **'       CAT788  
              MOVE +1005 TO ABEND-CODE                                  CAT788  
              PERFORM 9000-ABORT-RTN                                    CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           IF PARM-CBRS-ACCT-NBR NOT > SPACES                           CAT788  
              DISPLAY '** CAT788SP ABENDED - JCL PARM CBRS ACCT NBR **' CAT788  
              MOVE +1010 TO ABEND-CODE                                  CAT788  
              PERFORM 9000-ABORT-RTN                                    CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           DISPLAY 'CAT788SP PARM CBRS-ACCT NBR ' PARM-CBRS-ACCT-NBR    CAT788  
                                                                        CAT788  
           OPEN      INPUT  INFILE                                      CAT788  
                    OUTPUT  OUTFILE                                     CAT788  
                                                                        CAT788  
           MOVE 'CAT788SP'                TO BPDATES-CALLING-PGM.       CAT788  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT788  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT788  
           MOVE BPD-PROC-DATE             TO WS-PROC-DATE.              CAT788  
           DISPLAY 'CAT788SP: PROC DATE IS ' WS-PROC-DATE ' (CCYYMMDD)'. CAT788 
                                                                        CAT788  
           PERFORM 6000-READ-INFILE.                                    CAT788  
                                                                        CAT788  
           IF END-OF-INFILE                                             CAT788  
              CONTINUE                                                  CAT788  
           ELSE                                                         CAT788  
           IF NSCC-HDR-REC                                              CAT788  
              IF NSCC-TRANS-DATE = WS-PROC-DATE                         CAT788  
                 CONTINUE                                               CAT788  
              ELSE                                                      CAT788  
              IF L-BYP-DATECHK                                                  
                 DISPLAY 'CAT788SP: ** WARNING **'                      CAT788  
                 DISPLAY '        NSCC TRANS FL (INFILE) DETAILS'       CAT788  
                         ' WERE SKIPPED DUE TO HEADER DATE ERR AND PARM'CAT788  
                 DISPLAY '        NSCC FL HDR DATE = ' NSCC-TRANS-DATE  CAT788  
                         '   PROC DATE = ' WS-PROC-DATE                 CAT788  
                 SET  END-OF-INFILE   TO TRUE                           CAT788  
              ELSE                                                              
                 MOVE +1010     TO ABEND-CODE                           CAT788  
                 DISPLAY '** CAT788SP: ABENDED ON SIAC0264 HEADER DATE ' CAT788 
                 DISPLAY '        NSCC TRANS FL (INFILE) DETAILS'       CAT788  
                 DISPLAY '        NSCC FL HDR DATE = ' NSCC-TRANS-DATE  CAT788  
                            '   PROC DATE = ' WS-PROC-DATE              CAT788  
                 PERFORM 9000-ABORT-RTN                                 CAT788  
              END-IF END-IF                                             CAT788  
              MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                                
              MOVE LARGE-RECORD-IN(1: W-REC-LEN-IN) TO                  CAT788  
                               LARGE-RECORD-OUT(1: W-REC-LEN-IN)        CAT788  
              WRITE LARGE-RECORD-OUT                                    CAT788  
              ADD 1 TO W-OUTFILE-CNT                                    CAT788  
           END-IF.                                                      CAT788  
      *                                                                 CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       3000-MAIN-RTN.                                                   CAT788  
                                                                        CAT788  
      * FIRST SKIP TO THE BROKER HEADER FOR THIS CLIENT, IF ANY                 
           PERFORM                                                      CAT788  
              UNTIL END-OF-INFILE                                       CAT788  
                OR (NSCC-BROKER-HEADER                                          
                AND NSCC-BRKR-HDR-NBR = PARM-CBRS-ACCT-NBR)                     
                    PERFORM 6000-READ-INFILE                            CAT788  
           END-PERFORM.                                                         
                                                                                
      * WRITE THIS OUT IF FOUND, READ ANOTHER RECORD                            
           IF NOT END-OF-INFILE                                         CAT788  
              MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                                
              MOVE LARGE-RECORD-IN(1: W-REC-LEN-IN) TO                  CAT788  
                               LARGE-RECORD-OUT(1: W-REC-LEN-IN)        CAT788  
              WRITE LARGE-RECORD-OUT                                    CAT788  
              ADD 1 TO W-OUTFILE-CNT                                    CAT788  
              PERFORM 6000-READ-INFILE                                  CAT788  
           END-IF.                                                              
                                                                                
      * WRITE/READ THRU THE BROKER DETAILS, UNTIL ANOTHER BROKER                
      * HEADER OR EOF                                                           
           PERFORM                                                      CAT788  
              UNTIL END-OF-INFILE                                       CAT788  
                OR NSCC-BROKER-HEADER                                           
LRM001        MOVE 'Y' TO WS-WRITE-DETAIL-SW                                    
LRM001        IF PARM-CBRS-ACCT-NBR = 'A04S'                                    
LRM002        AND PARM-CLIENT-NBR = '080'                                       
LRM001           PERFORM 3100-LOOKUP-ACCOUNT-WANTED-RTN                         
LRM001        END-IF                                                            
LRM001        IF PARM-CBRS-ACCT-NBR = 'A04S'                                    
LRM001        AND NSCC-BROKER-TRAILER                                           
LRM001           ADD 1 W-OUTFILE-CNT GIVING NSCC-CLIENT-TRL-REC-COUNT           
LRM001           MOVE 'Y' TO WS-WRITE-DETAIL-SW                                 
LRM001        END-IF                                                            
LRM001        IF WS-WRITE-DETAIL-SW = 'Y'                                       
                 MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                             
                 MOVE LARGE-RECORD-IN(1: W-REC-LEN-IN) TO               CAT788  
                               LARGE-RECORD-OUT(1: W-REC-LEN-IN)        CAT788  
                 WRITE LARGE-RECORD-OUT                                 CAT788  
                 ADD 1 TO W-OUTFILE-CNT                                 CAT788  
LRM001        END-IF                                                            
              PERFORM 6000-READ-INFILE                                  CAT788  
           END-PERFORM.                                                         
                                                                        CAT788  
       3000-EX.           EXIT.                                         CAT788  
      *                                                                         
LRM001 3100-LOOKUP-ACCOUNT-WANTED-RTN.                                          
           IF NSCC-ASSET-OUTPUT                                                 
           AND NSCC-AO-RCV-NBR = '00000158'                                     
           AND (NSCC-AO-ACCT-RCV-NBR (1:8) = '26800020' OR '26800703')          
              CONTINUE                                                          
           ELSE                                                                 
           IF NSCC-ASSET-OUTPUT                                                 
           AND NSCC-AO-DLVR-NBR = '00000158'                                    
           AND (NSCC-AO-ACCT-DLVR-NBR (1:8) = '26800020' OR '26800703')         
              CONTINUE                                                          
           ELSE                                                                 
           IF NSCC-TAX-LOT-OUTPUT                                               
           AND NSCC-TO-RCV-NBR = '00000158'                                     
           AND (NSCC-TO-ACCT-RCV-NBR (1:8) = '26800020' OR '26800703')          
              CONTINUE                                                          
           ELSE                                                                 
           IF NSCC-TAX-LOT-OUTPUT                                               
           AND NSCC-TO-DLVR-NBR = '00000158'                                    
           AND (NSCC-TO-ACCT-DLVR-NBR (1:8) = '26800020' OR '26800703')         
              CONTINUE                                                          
           ELSE                                                                 
              MOVE 'N' TO WS-WRITE-DETAIL-SW                                    
           END-IF.                                                              
      /                                                                         
       6000-READ-INFILE.                                                CAT788  
           READ INFILE                                                  CAT788  
                AT END                                                  CAT788  
                   SET END-OF-INFILE TO TRUE                            CAT788  
                NOT AT END                                              CAT788  
                   ADD  1   TO W-INFILE-CNT                             CAT788  
           END-READ.                                                    CAT788  
      *                                                                 CAT788  
       9000-ABORT-RTN.                                                  CAT788  
           CALL ABEND USING ABEND-CODE.                                 CAT788  
      *#################################################################CAT788  
