000001* PDX    - CAT614   C0248821 05/15/07 13:57:25 TBLAMUR            00001000
LRM001* SSR 52182 RECOMPILE ONLY DUE TO NEW FIELDS ON WIRES PREFIX.             
000001* PDX    - CAT614   C0240170 12/08/06 16:12:37 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT614.                                                     
      *****************************************************************         
      * CAT614 - RBC DAIN AUTO WIRES. POPULATE ASSET FIELDS           *         
      *                                                               *         
      * TAKE WIRES RECORDS FROM CAT610 AND FILL IN THE ASSET PART.    *         
      * FOR EACH ASSET, WRITE OUT ONE RECORD.                         *         
      * IF NO ASSET, WRITE OUT INPUT RECORD AS IS.                    *         
      * LOOK UP CONTRA BROKER NAME FOR ALL RECORDS.                   *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - CAT610 WIRES FILE              - GDG                 *         
      *        - ACAT DB2 ACTIVE ASSET TABLE    - DB2                 *         
      *        - ACAT DB2 PARTICIPANT PROFILE   - DB2                 *         
      * OUTPUT -                                                      *         
      *        - CAT614 WIRES FILE              - GDG                 *         
      *****************************************************************         
      * SIDE TFR STS SCON     MSG-SUBJECT                             *         
      *  D   FUL 100 WACAT016 OUTGOING ACAT NOTIFICATION              *         
      *          110                                                  *         
      *  D   PTD 200 WACAT017 OUTGOING PARTIAL TRANSFER DELIVERY (PTD)*         
      *  R   PTD 200 WACAT018 INCOMING PARTIAL TRANSFER DELIVERY (PTD)*         
      *  R   PTR 500 WACAT019 INCOMING PARTIAL TRANSFER FROM US (PTR) *         
      *  R   FUL     WACAT020 INCOMING ACAT SETTLEMENT NOTIFICATION   *         
      *                       STTLM-DT = NEXT-PROC-DATE               *         
      *  R   FUL     WACAT021 INCOMING ACAT STLMT & NON-TRANSFERABLE  *         
      *                       STTLM-DT = PROC-DATE-EDITED             *         
      *  R   FUL     WACAT022 INCOMING ACAT WITH A FOREIGN CURRENCY   *         
      *                       STTLM-DT = NEXT-PROC-DATE               *         
      *  R   FRV 200 WACAT023 OUTGOING ACAT FAIL REVERSAL             *         
      *  D   FRV 200 WACAT024 INCOMING ACAT FAIL REVERSAL             *         
      *  R   RCL 100 WACAT025 OUTGOING ACAT RECLAIM                   *         
      *          110          STTLM-DT = NEXT-PROC-DATE               *         
      *  D   RCL 100 WACAT026 INCOMING ACAT RECLAIM                   *         
      *          110                                                  *         
      *  R   RCR 200 WACAT027 INCOMING ACAT RESIDUAL CREDIT           *         
      *  D   FUL 140 WACAT028 OUTGOING ACATS REJECTION                *         
      *  D   PTR 500 WACAT029 INCOMING ACAT PARTIAL TRANSFER (PTR)    *         
      *****************************************************************         
      * 12/11/06 DJ  SSR#46059 NEW PROGRAM                            *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
           SELECT OUTFILE          ASSIGN       TO OUTFILE                      
                                   FILE STATUS  IS OUTFILE-STAT.                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  INFILE-REC                PIC X(700).                                
                                                                                
       FD  OUTFILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  OUTFILE-REC               PIC X(700).                                
                                                                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT614'.            
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  OUTFILE-STAT              PIC  X(002).                           
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.            
               88 OUTFILE-END-OF-FILE    VALUE '10'.                            
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                             
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'OTPUTCNT'.          
           05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'PRTCPCNT'.          
           05  W-VPRTCPPF-CNT            PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ASSETCNT'.          
           05  W-VASSET-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'FETCHCNT'.          
           05  W-FETCH-CNT               PIC  9(011) COMP-3 VALUE 0.            
           05  W-CLIENT-NBR            PIC X(04)   VALUE LOW-VALUES.            
           05  W-ACAT-CNTL-NBR         PIC X(14)   VALUE LOW-VALUES.            
           05  VASSET-SW               PIC X(01)   VALUE ' '.                   
               88  VASSET-FETCHED                  VALUE 'Y'.                   
           05  END-OF-ASSET-SW         PIC X(01)   VALUE ' '.                   
               88  END-OF-ASSET                    VALUE 'Y'.                   
      /                                                                         
      ******************************************************************        
      * AUTO WIRES - CONCATENATED COPYBOOKS                            *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'ESWWIRES'.          
      * AUTO WIRES - COMMON DATA ELEMENTS                                       
           COPY ESWWIRES.                                                       
      * AUTO WIRES - ACATS DATA ELEMENTS (MUST FOLLOW ESWWIRES)                 
           COPY CATWIRE REPLACING ==:WIRE:== BY ==WIRE==.                       
      /                                                                         
      * AUTO WIRES - OUTPUT FILE HEADER IN P2 FORMAT                   *        
       01  W-OUTHDR-REC                PIC X(700).                              
                                                                                
      * AUTO WIRES - OUTPUT FILE TRAILER IN P2 FORMAT                  *        
       01  W-OUTTRL-REC                PIC X(700).                              
      /                                                                         
      ******************************************************************        
      * P2 HEADER/TRAILER                                              *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'CP2WS   '.          
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 120.              
           COPY CP2WS.                                                          
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  FILLER                        PIC  X(008) VALUE 'STUBCPY '.          
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'SQLCA   '.          
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  DSNTIAR                       PIC  X(08) VALUE 'DSNTIAR '.           
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
       01  W-DB2-SQLCODE                 PIC ---9.                              
      /                                                                         
      ******************************************************************        
      * ACAT ASSET DB2 TABLE                                           *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'VASSET  '.          
           EXEC SQL INCLUDE VASSET       END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * ACAT PARTICIPANT PROFILE DB2 TABLE                             *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'VPRTCPPF'.          
           EXEC SQL INCLUDE VPRTCPPF     END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * VASSET CURSOR - BASED ON CLIENT, CONTROL NUMBER                *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'CURSOR  '.          
                                                                                
           EXEC SQL                                                             
                DECLARE VASSET_CURSOR CURSOR WITH HOLD FOR                      
                SELECT                                                          
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,PSTN_CD                                                    
                    ,ASSET_AMT                                                  
                    ,ASSET_QTY                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,ASSET_DESC_TXT                                             
                FROM VASSET                                                     
                WHERE                                                           
                     CLIENT_NBR       = :W-CLIENT-NBR                           
                 AND ACAT_CONTROL_NBR = :W-ACAT-CNTL-NBR                        
                ORDER BY ASSET_SEQ_NBR                                          
           END-EXEC.                                                            
                                                                        CAT710W 
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT614 - AUTO WIRE POPULATE ASSET FIELDS'.                  
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 2000-MAIN           THRU 2000-EXIT                           
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
                                                                                
           DISPLAY 'CAT614: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
                   ' (1=BYPASS DATE CHECK)'                                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT614: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT614: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT614: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT614: ERROR OPENING INFILE'                           
               DISPLAY 'CAT614: OPEN STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT614: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT OUTFILE.                                                 
           DISPLAY 'CAT614: OUTFILE  OPENED FOR OUTPUT. STATUS = '              
                                               OUTFILE-STAT.                    
                                                                                
           IF  OUTFILE-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT614: ERROR OPENING OUTFILE'                          
               DISPLAY 'CAT614: OPEN STATUS = ' OUTFILE-STAT                    
                            '.  INPUT-CNT = ' W-OUTFILE-CNT                     
               DISPLAY 'CAT614: U3002 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            OUTFILE.                            
           MOVE CP2-RETURN-RECORD        TO W-OUTHDR-REC                        
           DISPLAY 'CAT614: OUT-HDR = '     W-OUTHDR-REC(1:090)                 
           MOVE W-OUTHDR-REC             TO OUTFILE-REC                         
           WRITE OUTFILE-REC.                                                   
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2000-MAIN.                                                               
                                                                                
           PERFORM 2100-PROCESS-INPUT THRU 2100-EXIT                            
                   UNTIL END-OF-INFILE.                                         
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2100-PROCESS-INPUT.                                                      
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  NOT END-OF-INFILE                                                
                                                                                
      ***----GET CONTRA BROKER NAME FOR EACH RECORD                             
               PERFORM 3500-GET-CONTRA-NAME THRU 3500-EXIT                      
                                                                                
               EVALUATE ESWWIRE-MSG-SCON                                        
                   WHEN 'WACAT016'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT017'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT018'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT019'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT020'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT021'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT022'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT023'                                              
                        PERFORM 4200-GET-ALL-ASSETS                             
                   WHEN 'WACAT024'                                              
                        PERFORM 4200-GET-ALL-ASSETS                             
                   WHEN 'WACAT025'                                              
                        PERFORM 4200-GET-ALL-ASSETS                             
                   WHEN 'WACAT026'                                              
                        PERFORM 4200-GET-ALL-ASSETS                             
                   WHEN 'WACAT027'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT028'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN 'WACAT029'                                              
                        PERFORM 4000-PASS-THROUGH                               
                   WHEN OTHER                                                   
                        PERFORM 4000-PASS-THROUGH                               
               END-EVALUATE                                                     
           END-IF.                                                              
                                                                                
       2100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF  END-OF-INFILE                                                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT614: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               MOVE INFILE-REC TO ESWWIRE-MSG                                   
               MOVE '0'                   TO W-CLIENT-NBR(1:1)                  
               MOVE ESWWIRE-MSG-CLIENT    TO W-CLIENT-NBR(2:3)                  
               MOVE WIRE-ACAT-CONTROL-NBR TO W-ACAT-CNTL-NBR                    
           ELSE                                                                 
               DISPLAY 'CAT614: ERROR READING INFILE'                           
               DISPLAY 'CAT614: READ STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT614: U3008 - ABENDING ON BAD FILE STATUS'            
               MOVE +3008 TO ABEND-CODE                                         
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                        
           END-IF.                                                              
                                                                                
           IF  INFILE-REC(1:5) = 'DATE='                                        
               DISPLAY 'CAT614: INP-HDR = ' INFILE-REC(1:090)                   
               GO TO 3000-READ-INPUT                                            
           ELSE                                                                 
               IF INFILE-REC(1:8) = 'REC-CNT='                                  
                  DISPLAY 'CAT614: INP-TRL = ' INFILE-REC(1:090)                
                  GO TO 3000-READ-INPUT                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3500-GET-CONTRA-NAME.                                                    
                                                                                
           EXEC SQL SELECT                                                      
                    PRTCP_NM INTO :PRTCP-NM                                     
               FROM VPRTCPPF                                                    
              WHERE PRTCP_NBR = :WIRE-ACAT-CONTRA-BRK-NBR                       
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-VPRTCPPF-CNT                                              
           IF SQLCODE = +0                                                      
               MOVE PRTCP-NM  TO WIRE-ACAT-CONTRA-FIRM                          
           END-IF.                                                              
                                                                                
       3500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-PASS-THROUGH.                                                       
           DISPLAY '4000-PASS-THROUGH  '                                        
                ' ' ESWWIRE-MSG-SCON                                            
                ' ' ESWWIRE-MSG-CLIENT                                          
                ' ' WIRE-ACAT-CONTROL-NBR                                       
                ' ' WIRE-ACAT-TRNFR-TYPE                                        
                ' ' WIRE-ACAT-STATUS-CD.                                        
                                                                                
      *    MOVE INPUT RECORD TO OUTPUT-RECORD AS IS                             
           PERFORM 7000-WRITE-OUTFILE THRU 7000-EXIT.                           
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4200-GET-ALL-ASSETS.                                                     
           DISPLAY '4200-GET-ALL-ASSETS '                                       
                ' ' ESWWIRE-MSG-SCON                                            
                ' ' ESWWIRE-MSG-CLIENT                                          
                ' ' WIRE-ACAT-CONTROL-NBR                                       
                ' ' WIRE-ACAT-TRNFR-TYPE                                        
                ' ' WIRE-ACAT-STATUS-CD.                                        
                                                                                
      *    PERFORM LOOP - READ DATASET - WRITE ASSET                            
           PERFORM 6000-FETCH-ASSET-AND-WRITE THRU 6000-EXIT.                   
           IF W-FETCH-CNT = 0                                                   
      *-      MOVE INPUT RECORD TO OUTPUT-RECORD AS IS                          
              PERFORM 7000-WRITE-OUTFILE THRU 7000-EXIT                         
           END-IF.                                                              
                                                                                
       4200-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       6000-FETCH-ASSET-AND-WRITE.                                              
           MOVE ' '     TO  END-OF-ASSET-SW.                                    
           MOVE 0       TO  W-FETCH-CNT                                         
                                                                                
           EXEC SQL                                                             
                OPEN VASSET_CURSOR                                              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'ASSET OPEN ERROR ' SQLCODE                               
                                                                                
           ELSE                                                                 
            PERFORM UNTIL END-OF-ASSET                                          
              EXEC SQL                                                          
                   FETCH VASSET_CURSOR                                          
                   INTO                                                         
                   :DCLVASSET.CLIENT-NBR                                        
                  ,:DCLVASSET.ACAT-CONTROL-NBR                                  
                  ,:DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                  DISPLAY 'FETCHED :' W-CLIENT-NBR ' '  W-ACAT-CNTL-NBR         
                         ' ' ASSET-SEQ-NBR OF DCLVASSET                         
                         ' ' ASSET-DESC-TXT OF DCLVASSET (1:60)                 
                         SET VASSET-FETCHED TO TRUE                             
                         ADD 1 TO W-FETCH-CNT                                   
                         ADD 1 TO W-VASSET-CNT                                  
                         PERFORM 6100-MOVE-ASSET-FIELDS THRU 6100-EXIT          
                         PERFORM 7000-WRITE-OUTFILE THRU 7000-EXIT              
                  WHEN  +100                                                    
                  DISPLAY 'ENDFETCH:' W-CLIENT-NBR ' ' W-ACAT-CNTL-NBR          
                              ' CNT=' W-FETCH-CNT                               
                         SET END-OF-ASSET TO TRUE                               
                  WHEN OTHER                                                    
                    DISPLAY 'VASSET_CURSOR FETCH ERROR'                         
                    PERFORM  8100-SQL-ERROR THRU 8100-EXIT                      
              END-EVALUATE                                                      
            END-PERFORM.                                                        
           EXEC SQL                                                             
                 CLOSE VASSET_CURSOR                                            
           END-EXEC.                                                            
                                                                                
       6000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       6100-MOVE-ASSET-FIELDS.                                                  
                                                                                
           MOVE ' '                      TO WIRE-ACAT-SETTL-DATE                
           MOVE CSH-MGN-SHRT-CD          OF DCLVASSET                           
                                         TO WIRE-ACAT-CASH-MGN-IND              
           IF  STTLM-LCTN-CD OF DCLVASSET = '40'                                
               MOVE 'C'                  TO WIRE-ACAT-QTY-CASH-IND              
           ELSE                                                                 
               MOVE 'E'                  TO WIRE-ACAT-QTY-CASH-IND              
           END-IF                                                               
           MOVE PSTN-CD                  OF DCLVASSET                           
                                         TO WIRE-ACAT-LONG-SHT-IND              
           MOVE ASSET-AMT                OF DCLVASSET                           
                                         TO WIRE-ACAT-AMOUNT                    
           MOVE ASSET-QTY                OF DCLVASSET                           
                                         TO WIRE-ACAT-QUANTITY                  
           MOVE ISIN-SEC-ISSUE-CD        OF DCLVASSET                           
                                         TO WIRE-ACAT-NSCC-SEC-ID               
           MOVE SECURITY-ADP-NBR         OF DCLVASSET                           
                                         TO WIRE-ACAT-ADP-SEC-NBR               
           IF  TRNFR-TYPE-CD OF DCLVASSET = 'FRV'                               
               MOVE 'Y'                  TO WIRE-ACAT-FRV-REASON-IND            
               EVALUATE TRNFR-TYPE-RSN-CD OF DCLVASSET                          
                   WHEN '40' MOVE 'POSITION WAS LIQUIDATED'                     
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '41' MOVE 'POSITION IN REORGANIZATION'                  
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '42' MOVE 'POSITION MATURED OR EXPIRED'                 
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '43' MOVE 'NO BROKER/DEALER AGREEMENT'                  
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '44' MOVE 'FRACTIONAL SHARE QUANTITY'                   
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '45' MOVE 'NON-DELIVERABLE DENOMINATIONS'               
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '46' MOVE 'POSITION IS NON-DELIVERABLE'                 
                                         TO WIRE-ACAT-FRV-REASON                
                   WHEN '47' MOVE 'MISCELLANEOUS'                               
                                         TO WIRE-ACAT-FRV-REASON                
               END-EVALUATE                                                     
           ELSE                                                                 
               MOVE ' '                  TO WIRE-ACAT-FRV-REASON-IND            
                                            WIRE-ACAT-FRV-REASON                
           END-IF                                                               
           IF  TRNFR-TYPE-CD OF DCLVASSET = 'RCL'                               
               MOVE 'Y'                  TO WIRE-ACAT-RCL-REASON-IND            
               EVALUATE TRNFR-TYPE-RSN-CD OF DCLVASSET                          
                   WHEN '60' MOVE 'CLIENT RESCINDED'                            
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '61' MOVE 'DUPLICATE DELIVERY'                          
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '62' MOVE                                               
                        'DELIVERED ASSET THAT DID NOT BELONG TO CLIENT'         
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '63' MOVE 'OVER DELIVERY'                               
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '64' MOVE 'FEES WERE NOT WITHHELD'                      
                                         TO WIRE-ACAT-RCL-REASON                
                   WHEN '65' MOVE 'MISCELLANEOUS'                               
                                         TO WIRE-ACAT-RCL-REASON                
               END-EVALUATE                                                     
           ELSE                                                                 
               MOVE ' '                  TO WIRE-ACAT-RCL-REASON-IND            
                                            WIRE-ACAT-RCL-REASON                
           END-IF                                                               
           MOVE ASSET-DESC-TXT           OF DCLVASSET                           
                                         TO WIRE-ACAT-SEC-DESC-1.               
                                                                                
       6100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7000-WRITE-OUTFILE.                                                      
           WRITE OUTFILE-REC FROM ESWWIRE-MSG.                                  
           ADD 1 TO W-OUTFILE-CNT.                                              
       7000-EXIT. EXIT.                                                         
      /                                                                         
       8000-ABEND-ROUTINE.                                                      
           DISPLAY 'CAT614: PROGRAM IS ABENDING'.                               
           CALL ABEND USING ABEND-CODE.                                         
       8000-EXIT.                                                               
           EXIT.                                                                
                                                                                
       8100-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8100-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           DISPLAY 'CAT614: U3999 - ABENDING ON BAD DB2 STATUS'                 
           DISPLAY ' ACAT-CLIENT IS : ' W-CLIENT-NBR.                           
           DISPLAY ' ACAT-CONTROL-NBR = ' W-ACAT-CNTL-NBR.                      
           DISPLAY ' DCLVASSET : ' DCLVASSET.                                   
           DISPLAY 'CAT614: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
           DISPLAY ' '.                                                         
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-OUTFILE-CNT            TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            OUTFILE.                            
           MOVE CP2-RETURN-RECORD        TO W-OUTTRL-REC                        
           DISPLAY 'CAT614: OUT-TRL = '     W-OUTTRL-REC(1:090)                 
           MOVE W-OUTTRL-REC             TO OUTFILE-REC                         
           WRITE OUTFILE-REC.                                                   
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
           DISPLAY 'CAT614: INFILE  CLOSED. STATUS = '                          
                                            INFILE-STAT.                        
           CLOSE OUTFILE                                                        
           DISPLAY 'CAT614: OUTFILE CLOSED. STATUS = '                          
                                            OUTFILE-STAT.                       
           DISPLAY 'CAT614: INFILE  INPUT  COUNT = '                            
                                           W-INFILE-CNT                         
                   ' (INCLUDE HEADER AND TRAILER)'                              
           DISPLAY 'CAT614: W-VPRTCPPF-CNT       = ' W-VPRTCPPF-CNT             
           DISPLAY 'CAT614: W-VASSET-CNT         = ' W-VASSET-CNT               
           DISPLAY 'CAT614: OUTFILE OUTPUT COUNT = '                            
                                           W-OUTFILE-CNT                        
                   ' (EXCLUDE HEADER AND TRAILER)'                              
           DISPLAY ' '.                                                         
           DISPLAY 'CAT614: PROGRAM ENDED SUCCESSFULLY'.                        
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
