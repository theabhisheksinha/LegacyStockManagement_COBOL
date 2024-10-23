000001* PDX    - CAT917OP C0288347 02/04/10 14:32:28 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT917OP.                                                   
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT917OP - UPDATES OPTION TABLES ACTIOPN VOPTN TO COVERT      *         
      *          STRIKE PRICE FROM FRACTIONAL TO DECIMAL.             *         
      *                                                               *         
      * READ ACAT DATABASE ROWS, MATCH TO MSD AND REPLACE STRIKE      *         
      * PRICE AS NEEDED.  ALSO REPLACE EXPTN-DT ON VOPTN.             *         
      * ONE TIME USE PROGRAM TO RUN ON FEB 6TH.                       *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - DB2 TABLES                                           *         
      *        - MSD                                                  *         
      * OUTPUT -                                                      *         
      *        - PRGAM DISPLAYS                                       *         
      *        - ACAT DATABASE                                        *         
      *                                                               *         
      *                                                               *         
      *****************************************************************         
      * 12/31/09 LRM   NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT917OP'.          
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  WK-MS-OPT-PRICE-NEW     PIC  9(5)V9(3) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
               10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
               10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
           05  WK-DB2-INIT-TABLE-SW    PIC X VALUE 'Y'.                         
           05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
           05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
               10  WK-MS-EXP-CC-NEW    PIC X(2).                                
               10  WK-MS-EXP-YY-NEW    PIC X(2).                                
               10  WK-MS-EXP-MM-NEW    PIC X(2).                                
               10  WK-MS-EXP-DD-NEW    PIC X(2).                                
           05  W-DATE.                                                          
               07  W-DATE-YEAR.                                                 
                   09  W-DATE-CC         PIC X(2) VALUE ' '.                    
                   09  W-DATE-YY         PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-MM             PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-DD             PIC X(2) VALUE ' '.                    
       01  W-STATS-AREA.                                                        
           05  W-CKDIGIT-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-FND-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-READ-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-READ-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-UPD-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-NOT-UPD-CNT       PIC  9(009) COMP-3 VALUE 0.            
      /                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
                                                                                
                                                                                
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIOPN'.            
           EXEC SQL INCLUDE ACTIOPN      END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VOPTN'.              
           EXEC SQL INCLUDE VOPTN        END-EXEC.                              
                                                                                
      ******************************************************************        
      * ASSET    ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VASSET'.             
           EXEC SQL INCLUDE VASSET       END-EXEC.                              
                                                                                
      ******************************************************************        
      * DECLARE CURSOR FOR INITIAL OPTIONS TABLE                       *        
      * TO DELETE INIT ASSETS FOR A GIVEN CONTROL NUMBER ONE AT A TIME *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR'.              
           EXEC SQL                                                             
                DECLARE ACTIOPN_CURSOR CURSOR WITH HOLD FOR                     
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,TRNFR_TYPE_CD                                               
                   ,ACAT_CONTROL_NBR                                            
                   ,ASSET_SEQ_NBR                                               
                   ,STPRC_INTEGER_AMT                                           
                   ,STPRC_FRCTN_AMT                                             
                   ,SECURITY_ADP_NBR                                            
                FROM    ACTIOPN                                                 
                                                                                
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE OPTIONS  TABLE                       *        
      * TO DELETE INIT ASSETS FOR A GIVEN CONTROL NUMBER ONE AT A TIME *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR'.              
           EXEC SQL                                                             
                DECLARE VOPTN_CURSOR CURSOR WITH HOLD FOR                       
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,ASSET_SEQ_NBR                                               
                   ,STPRC_INTEGER_AMT                                           
                   ,STPRC_FRCTN_AMT                                             
                   ,EXPTN_DT                                                    
                FROM    VOPTN                                                   
                                                                                
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SQLERRD-3               PIC   9(9).                            
           05  W-OPN-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
LRM002     03  CKDIGIT                   PIC X(8)  VALUE 'CKDIGIT '.            
LRM002     03  BNWNTWIO                  PIC X(8)  VALUE 'BNWNTWIO'.            
      ***<=== COBOL LE                                                          
                                                                                
       PROCEDURE DIVISION.                                                      
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT917OP - REPLACE FRACTIONAL STRIKE PRICE W/ DECI'..       
           DISPLAY '         UPDATE INIT OPTION, OPTION'.                       
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           EXEC SQL OPEN ACTIOPN_CURSOR END-EXEC                                
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
                                W-OPN-SQLCODE                                   
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY  ' ACTIOPN CURSOR OPENED '                               
           ELSE                                                                 
               DISPLAY  ' ACTIOPN CURSOR OPEN ERROR '                           
                        ' SQLCODE = ' W-DB2-SQLCODE                             
           END-IF.                                                              
                                                                                
           PERFORM UNTIL W-OPN-SQLCODE NOT = +0                                 
              EXEC SQL                                                          
                   FETCH ACTIOPN_CURSOR                                         
               INTO                                                             
                   :DCLACTIOPN.CLIENT-NBR                                       
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIOPN.STTLM-LCTN-CD                                    
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIOPN.DLVR-NBR                                         
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
                  ,:DCLACTIOPN.RCV-NBR                                          
                  ,:DCLACTIOPN.ACCT-RCV-NBR                                     
                  ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                  ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-OPN-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       ADD 1 TO W-ACTIOPN-READ-CNT                              
                       PERFORM 2000-PROCESS-ACTIOPN THRU 2000-EXIT              
                  WHEN +100                                                     
                       DISPLAY ' ACTIOPN CURSOR FETCH NOT FOUND '               
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                  WHEN OTHER                                                    
                       DISPLAY ' ACTIOPN CURSOR FETCH ERROR '                   
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
                CLOSE ACTIOPN_CURSOR                                            
           END-EXEC.                                                            
                                                                                
           EXEC SQL OPEN VOPTN_CURSOR END-EXEC                                  
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
                                W-OPN-SQLCODE                                   
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY  ' VOPTN CURSOR OPENED '                                 
           ELSE                                                                 
               DISPLAY  ' VOPTN CURSOR OPEN ERROR '                             
                        ' SQLCODE = ' W-DB2-SQLCODE                             
           END-IF.                                                              
                                                                                
           MOVE 'N' TO WK-DB2-INIT-TABLE-SW.                                    
           PERFORM UNTIL W-OPN-SQLCODE NOT = +0                                 
              EXEC SQL                                                          
                   FETCH VOPTN_CURSOR                                           
               INTO                                                             
                   :DCLVOPTN.CLIENT-NBR                                         
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                                   
                  ,:DCLVOPTN.ASSET-SEQ-NBR                                      
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                                  
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                                    
                  ,:DCLVOPTN.EXPTN-DT                                           
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-OPN-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       ADD 1 TO W-VOPTN-READ-CNT                                
                       PERFORM 3000-PROCESS-VOPTN THRU 3000-EXIT                
                  WHEN +100                                                     
                       DISPLAY ' VOPTN CURSOR FETCH NOT FOUND '                 
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                  WHEN OTHER                                                    
                       DISPLAY ' VOPTN CURSOR FETCH ERROR '                     
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
                CLOSE VOPTN_CURSOR                                              
           END-EXEC.                                                            
                                                                                
           PERFORM 8900-DISPLAY-CNT    THRU 8900-EXIT.                          
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT917OP: W-CURRENT-TIMESTAMP = '                       
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT917OP: W-CURRENT-TIMESTAMP NOT SET'                  
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ MSD AND UPDATE OPTION STRIKE PRICE ON ACTIOPN IF NEEDED.          
      ******************************************************************        
       2000-PROCESS-ACTIOPN SECTION.                                            
                                                                                
           PERFORM 5400-GETMSDC THRU 5400-EXIT                                  
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               ADD 1 TO W-MSD-FND-CNT                                           
           ELSE                                                                 
               DISPLAY '#BYPASS SEC=' SECURITY-ADP-NBR OF DCLACTIOPN            
                       ' GETMSD-RETURN-CODE='  GETMSD-RETURN-CODE               
               GO TO 2000-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW                    
           IF MS-EXP-OPT-STRIKE-PRC = ZEROS                                     
              DISPLAY 'STRIKE PRICE ZERO ON '                                   
                 SECURITY-ADP-NBR OF DCLACTIOPN                                 
                 ' WE HAD ON ACTIOPN '                                          
                        STPRC-INTEGER-AMT OF DCLACTIOPN                         
                    ' ' STPRC-FRCTN-AMT OF DCLACTIOPN                           
           END-IF.                                                              
                                                                                
LRM********IF WK-MS-OPT-PRC-NEW NOT =  STPRC-INTEGER-AMT OF DCLACTIOPN          
           IF WK-MS-OPT-FRAC-NEW NOT = STPRC-FRCTN-AMT   OF DCLACTIOPN          
              DISPLAY 'UPDATING ACTIOPN ' CLIENT-NBR OF DCLACTIOPN              
                                      ' ' SECURITY-ADP-NBR OF DCLACTIOPN        
               ' FROM ' STPRC-INTEGER-AMT OF DCLACTIOPN                         
                    ' ' STPRC-FRCTN-AMT OF DCLACTIOPN                           
                 ' TO ' WK-MS-OPT-PRC-NEW                                       
                    ' ' WK-MS-OPT-FRAC-NEW                                      
LRM***********MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN        
              MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT OF DCLACTIOPN          
              EXEC SQL                                                          
                UPDATE ACTIOPN                                                  
                   SET                                                          
                     STPRC_FRCTN_AMT   = :DCLACTIOPN.STPRC-FRCTN-AMT            
              WHERE  CLIENT_NBR        = :DCLACTIOPN.CLIENT-NBR                 
                AND  ISIN_CNTRY_CD     = :DCLACTIOPN.ISIN-CNTRY-CD              
                AND  ISIN_SEC_ISSUE_CD = :DCLACTIOPN.ISIN-SEC-ISSUE-CD          
                AND  ISIN_SEC_CDG_CD   = :DCLACTIOPN.ISIN-SEC-CDG-CD            
                AND  STTLM_LCTN_CD     = :DCLACTIOPN.STTLM-LCTN-CD              
                AND  CSH_MGN_SHRT_CD   = :DCLACTIOPN.CSH-MGN-SHRT-CD            
                AND  DLVR_NBR          = :DCLACTIOPN.DLVR-NBR                   
                AND  ACCT_DLVR_NBR     = :DCLACTIOPN.ACCT-DLVR-NBR              
                AND  RCV_NBR           = :DCLACTIOPN.RCV-NBR                    
                AND  ACCT_RCV_NBR      = :DCLACTIOPN.ACCT-RCV-NBR               
                AND  TRNFR_TYPE_CD     = :DCLACTIOPN.TRNFR-TYPE-CD              
                AND  ACAT_CONTROL_NBR  = :DCLACTIOPN.ACAT-CONTROL-NBR           
              END-EXEC.                                                         
                                                                                
LRM******************STPRC_INTEGER_AMT = :DCLACTIOPN.STPRC-INTEGER-AMT          
              IF  SQLCODE  =  +0                                                
                  ADD 1 TO W-ACTIOPN-UPD-CNT                                    
                  PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                        
              ELSE                                                              
                  ADD 1 TO W-ACTIOPN-NOT-UPD-CNT                                
              END-IF.                                                           
                                                                                
       2000-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
      ******************************************************************        
      *  READ MSD AND UPDATE OPTION STRIKE PRICE ON VOPTN IF NEEDED.            
      ******************************************************************        
       3000-PROCESS-VOPTN SECTION.                                              
                                                                                
           EXEC SQL                                                             
             SELECT                                                             
                 SECURITY_ADP_NBR                                               
             INTO                                                               
                    :DCLVASSET.SECURITY-ADP-NBR                                 
             FROM    VASSET                                                     
             WHERE  CLIENT_NBR        = :DCLVOPTN.CLIENT-NBR                    
               AND  ACAT_CONTROL_NBR  = :DCLVOPTN.ACAT-CONTROL-NBR              
               AND  ASSET_SEQ_NBR     = :DCLVOPTN.ASSET-SEQ-NBR                 
           END-EXEC.                                                            
           IF  SQLCODE NOT  =  +0                                               
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              DISPLAY 'STRANGE READ OF VASSET '                                 
                               ' SQLCODE = ' W-DB2-SQLCODE                      
              MOVE ZEROS TO SQLCODE                                             
              GO TO 3000-EXIT.                                                  
                                                                                
           IF SECURITY-ADP-NBR OF DCLVASSET = SPACES                            
              DISPLAY 'MISSING SECURITY NUMBER ON VASSET / SKIP '               
              MOVE ZEROS TO SQLCODE                                             
              GO TO 3000-EXIT.                                                  
                                                                                
           PERFORM 5400-GETMSDC THRU 5400-EXIT                                  
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               ADD 1 TO W-MSD-FND-CNT                                           
           ELSE                                                                 
               DISPLAY '#BYPASS SEC=' SECURITY-ADP-NBR OF DCLVASSET             
                       ' GETMSD-RETURN-CODE='  GETMSD-RETURN-CODE               
               GO TO 3000-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-OPTION-EXP-DATE    TO WK-MS-EXP-DATE                         
           MOVE WK-MS-EXP-DATE(1:4) TO W-DATE-YEAR                              
           MOVE WK-MS-EXP-DATE(5:2) TO W-DATE-MM                                
           MOVE WK-MS-EXP-DATE(7:2) TO W-DATE-DD                                
                                                                                
           MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW                    
           IF MS-EXP-OPT-STRIKE-PRC = ZEROS                                     
              DISPLAY 'STRIKE PRICE ZEROS ON '                                  
                   SECURITY-ADP-NBR OF DCLVASSET                                
                   ' WE HAD ON VOPTN '                                          
                        STPRC-INTEGER-AMT OF DCLVOPTN                           
                    ' ' STPRC-FRCTN-AMT OF DCLVOPTN                             
           END-IF.                                                              
                                                                                
LRM********IF WK-MS-OPT-PRC-NEW NOT =  STPRC-INTEGER-AMT OF DCLVOPTN            
********   IF WK-MS-OPT-FRAC-NEW NOT = STPRC-FRCTN-AMT   OF DCLVOPTN            
              DISPLAY 'UPDATING VOPTN ' CLIENT-NBR OF DCLVASSET                 
                                    ' ' ACAT-CONTROL-NBR OF DCLVASSET           
                                    ' ' SECURITY-ADP-NBR OF DCLVASSET           
               ' FROM ' STPRC-INTEGER-AMT OF DCLVOPTN                           
                    ' ' STPRC-FRCTN-AMT OF DCLVOPTN                             
                    ' ' EXPTN-DT OF DCLVOPTN                                    
                 ' TO ' WK-MS-OPT-PRC-NEW                                       
                    ' ' WK-MS-OPT-FRAC-NEW                                      
                    ' ' W-DATE                                                  
LRM***********MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLVOPTN          
              IF MS-EXP-OPT-STRIKE-PRC NOT = ZEROS                              
                 MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT OF DCLVOPTN         
              END-IF                                                            
              MOVE W-DATE             TO EXPTN-DT OF DCLVOPTN                   
              EXEC SQL                                                          
                UPDATE VOPTN                                                    
                   SET                                                          
                     STPRC_FRCTN_AMT   = :DCLVOPTN.STPRC-FRCTN-AMT              
                    ,EXPTN_DT          = :DCLVOPTN.EXPTN-DT                     
              WHERE  CLIENT_NBR        = :DCLVOPTN.CLIENT-NBR                   
                AND  ACAT_CONTROL_NBR  = :DCLVOPTN.ACAT-CONTROL-NBR             
                AND  ASSET_SEQ_NBR     = :DCLVOPTN.ASSET-SEQ-NBR                
              END-EXEC.                                                         
LRM**************    STPRC_INTEGER_AMT = :DCLVOPTN.STPRC-INTEGER-AMT            
                                                                                
              IF  SQLCODE  =  +0                                                
                  ADD 1 TO W-VOPTN-UPD-CNT                                      
                  PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                        
              ELSE                                                              
                  ADD 1 TO W-VOPTN-NOT-UPD-CNT                                  
              END-IF.                                                           
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       5400-GETMSDC.                                                            
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
           MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           IF WK-DB2-INIT-TABLE-SW = 'Y'                                        
              MOVE CLIENT-NBR OF DCLACTIOPN TO W-CURRENT-CLIENT                 
              MOVE SECURITY-ADP-NBR OF DCLACTIOPN TO GETMSD-SEARCH-KEY          
           ELSE                                                                 
              MOVE CLIENT-NBR OF DCLVOPTN TO W-CURRENT-CLIENT                   
              MOVE SECURITY-ADP-NBR OF DCLVASSET TO GETMSD-SEARCH-KEY           
           END-IF.                                                              
           MOVE '0'                      TO GETMSD-WI-CODE                      
           MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
                                                                                
                                                                                
       5400-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT917OP: '                                             
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR         USING SQLCA W-DB2-MESSAGE-AREA                  
                                            W-DB2-MESSAGE-LEN.                  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
                                                                                
           DISPLAY 'CAT917OP: U3999 - ABENDING ON BAD DB2 STATUS'               
           DISPLAY 'CAT917OP: PROGRAM ENDED ABNORMALLY'                         
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8700-SQL-ROLLBACK'                                          
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY                                                          
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY                                                          
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8700-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT   SECTION.                                              
           DISPLAY ' '                                                          
           DISPLAY 'CAT917OP: W-MSD-FND-CNT      = ' W-MSD-FND-CNT              
           DISPLAY 'CAT917OP: ACTIOPN-READ-CNT   = ' W-ACTIOPN-READ-CNT         
           DISPLAY 'CAT917OP: ACTIOPN-UPD-CNT    = ' W-ACTIOPN-UPD-CNT          
                          ' ACTIOPN-NOT-UPD-CNT = '                             
                                                  W-ACTIOPN-NOT-UPD-CNT         
           DISPLAY 'CAT917OP: VOPTN-READ-CNT   = ' W-VOPTN-READ-CNT             
           DISPLAY 'CAT917OP: VOPTN-UPD-CNT    = ' W-VOPTN-UPD-CNT              
                          ' VOPTN-NOT-UPD-CNT = '                               
                                                  W-VOPTN-NOT-UPD-CNT           
           .                                                                    
       8900-EXIT. EXIT.                                                         
