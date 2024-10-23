000001* PDX    - ACAT00DL C0331778 10/11/12 10:37:13 TBLAMUR            00001000
000100 ID DIVISION.                                                     00010000
000200 PROGRAM-ID. ACAT00DL.                                            00020000
000250 AUTHOR.  LARRY MUREY.                                            00020000
000300*REMARKS.                                                         00030000
      * ACAT LOOKUP OF ACTIVE DELIVERY FOR AOM.                                 
000500                                                                  00050000
000300 ENVIRONMENT DIVISION.                                            00030000
000400 DATA DIVISION.                                                   00040000
000500                                                                  00050000
000600 WORKING-STORAGE SECTION.                                         00060000
           COPY PDXIDCOB.                                                       
                                                                                
       01  TWA-SIZE                   PIC S9(4) COMP.                           
       01  WS-EIBCALEN                PIC S9(4) COMP.                           
       01  WS-WORK-AREA.                                                        
           05  TWA-CLIENT-NO-X.                                                 
               09 TWA-CLIENT-NO-9     PIC 9(04).                                
           05  W-DB2-SQLCODE          PIC ---9.                                 
                                                                                
       01  WS-COMMAREA.                                                         
           COPY ACAT00DL REPLACING ==:ACAT:== BY ==ACAT==.                      
                                                                                
           EJECT                                                        00520000
           EXEC SQL                                                     00530000
           INCLUDE SQLCA                                                00540000
           END-EXEC                                                     00550000
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                  00610000
           EXEC SQL                                                     00620000
               INCLUDE VTRNFR                                           00630000
           END-EXEC.                                                    00640000
      *DCLGEN FOR ACTIVE ACAT ASSET                                     00610000
           EXEC SQL                                                     00620000
               INCLUDE VASSET                                           00630000
           END-EXEC.                                                    00640000
      *--------------------------------------------------------*        00710000
      *   TFR CURSRA: FOR THE SPECIFIED CLIENT/BRANCH/ACCOUNT  *        00720000
      *--------------------------------------------------------*        00730000
           EXEC SQL                                                     00740000
              DECLARE TFRCSRA CURSOR FOR                                00750000
                  SELECT                                                00760000
                   ACAT_CONTROL_NBR                                     00810000
                  ,TRNFR_TYPE_CD                                        00810000
                   FROM VTRNFR                                          00920000
                  WHERE  CLIENT_NBR                                     00930000
                              = :DCLVTRNFR.CLIENT-NBR                   00940000
                     AND TRNFR_TYPE_CD IN ('PTR', 'PTD', 'PTF')         00970000
                     AND DSTBN_SIDE_CD                                  00990000
                              = 'D'                                     01000000
                     AND BRANCH_CD   = :ACAT-AA-BR                              
                     AND ACCT_CD     = :ACAT-AA-ACCT                            
                     AND STTS_CD     < '311'                                    
           END-EXEC.                                                    01170000
           EJECT                                                                
014700 LINKAGE SECTION.                                                 01470000
014800                                                                  01480000
014900 01  DFHCOMMAREA.                                                 01490000
           05  FILLER             PIC X(50).                                    
    ***COPY TWACOMMN.                                                           
           EJECT                                                                
       PROCEDURE DIVISION.                                              01540000
                                                                                
           IF EIBCALEN NOT > 14                                                 
              EXEC CICS RETURN END-EXEC.                                06880000
                                                                                
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA.                       
           MOVE EIBCALEN TO WS-EIBCALEN.                                        
                                                                                
025100***  EXEC CICS ASSIGN TWALENG (TWA-SIZE)                                  
025200***  END-EXEC.                                                            
025300***  IF TWA-SIZE = 0                                                      
025400***     MOVE 'TWA SIZE EQUAL 0' TO ACAT-AA-MESSAGE-AREA                   
      ***     MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
      ***     EXEC CICS RETURN END-EXEC                                 04830000
      ***  END-IF.                                                              
      ***                                                                       
      ***  EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
      ***  END-EXEC.                                                            
      ***  MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
      ***  MOVE TWA-CLIENT-NO-X TO CLIENT-NBR OF DCLVTRNFR.                     
                                                                                
           IF ACAT-AA-CLIENT-NBR NUMERIC                                        
           AND ACAT-AA-CLIENT-NBR GREATER '000'                                 
              MOVE  '0'                TO CLIENT-NBR OF DCLVTRNFR (1:1)         
              MOVE  ACAT-AA-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFR (2:3)         
           ELSE                                                                 
              SET ACAT-AA-ERROR TO TRUE                                         
              MOVE 'CLIENT NUMBER'    TO ACAT-AA-MESSAGE-AREA                   
              MOVE ACAT-AA-CLIENT-NBR TO ACAT-AA-MESSAGE-AREA(12:5)             
              MOVE WS-COMMAREA TO DFHCOMMAREA(15:3)                     04820000
              EXEC CICS RETURN END-EXEC                                 04830000
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                              00740000
                ACAT_CONTROL_NBR                                                
                  INTO                                                          
                :DCLVTRNFR.ACAT-CONTROL-NBR                                     
                  FROM VTRNFR                                                   
                 WHERE (CLIENT_NBR  = :DCLVTRNFR.CLIENT-NBR                     
                    AND TRNFR_TYPE_CD = 'FUL'                           07250000
                    AND DSTBN_SIDE_CD = 'D'                             07790000
                    AND BRANCH_CD   = :ACAT-AA-BR                               
                    AND ACCT_CD     = :ACAT-AA-ACCT                             
                    AND STTS_CD     < '311')                                    
              WITH UR                                                           
           END-EXEC                                                             
                                                                        04810000
           IF SQLCODE = 0                                               04930000
              SET ACAT-AA-SUCCESSFUL TO TRUE                                    
              SET ACAT-AA-FULL TO TRUE                                          
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO ACAT-AA-MESSAGE-AREA        
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
              EXEC CICS RETURN END-EXEC                                 04830000
           ELSE                                                                 
           IF SQLCODE = +100                                            06600000
              CONTINUE                                                          
           ELSE                                                                 
              SET ACAT-AA-ERROR TO TRUE                                         
              MOVE 'DB2 SQLCODE ' TO ACAT-AA-MESSAGE-AREA                       
              MOVE SQLCODE TO  W-DB2-SQLCODE                                    
              MOVE W-DB2-SQLCODE TO ACAT-AA-MESSAGE-AREA(12:5)                  
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
              EXEC CICS RETURN END-EXEC                                 04830000
           END-IF.                                                              
                                                                        04840000
       0050-OPEN-CURSORA.                                               04850000
      *--------------------------------------------------------------*  04860000
      *     SEARCH ENGINE WITH CLIENT/BRANCH/ACCOUNT                 *  04870000
      *--------------------------------------------------------------*  04880000
           IF ACAT-AA-ACCT-TYP = '1'                                            
              MOVE 'C' TO CSH-MGN-SHRT-CD OF DCLVASSET                          
           ELSE                                                                 
           IF ACAT-AA-ACCT-TYP = '2'                                            
              MOVE 'M' TO CSH-MGN-SHRT-CD OF DCLVASSET                          
           ELSE                                                                 
           IF ACAT-AA-ACCT-TYP = '5'                                            
              MOVE 'S' TO CSH-MGN-SHRT-CD OF DCLVASSET                          
           ELSE                                                                 
              MOVE '%' TO CSH-MGN-SHRT-CD OF DCLVASSET                          
           END-IF.                                                              
                                                                                
           EXEC SQL                                                     04900000
              OPEN TFRCSRA                                              04910000
           END-EXEC.                                                    04920000
           IF SQLCODE = 0                                               04930000
              CONTINUE                                                          
           ELSE                                                         04950000
              SET ACAT-AA-ERROR TO TRUE                                         
              MOVE 'DB2 SQLCODE ' TO ACAT-AA-MESSAGE-AREA                       
              MOVE SQLCODE TO  W-DB2-SQLCODE                                    
              MOVE W-DB2-SQLCODE TO ACAT-AA-MESSAGE-AREA(12:5)                  
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
              EXEC CICS RETURN END-EXEC                                 04830000
           END-IF.                                                              
                                                                        05900000
       0075-READ-NEXTA.                                                 05910000
           EXEC SQL                                                     05920000
              FETCH                                                     05930000
                  TFRCSRA                                               05940000
                   INTO                                                 05950000
                    :DCLVTRNFR.ACAT-CONTROL-NBR                         05960000
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                            05960000
           END-EXEC.                                                    06110000
                                                                                
           IF SQLCODE = 0                                               06120000
              PERFORM SELECT-VASSET-RTN                                 04940000
              IF SQLCODE = 0                                                    
                 SET ACAT-AA-SUCCESSFUL TO TRUE                                 
                 SET ACAT-AA-PARTIAL TO TRUE                                    
                 MOVE ACAT-CONTROL-NBR OF DCLVTRNFR                             
                                   TO ACAT-AA-MESSAGE-AREA                      
                 MOVE TRNFR-TYPE-CD OF DCLVTRNFR                        05960000
                                   TO ACAT-AA-MESSAGE-AREA(16:3)                
                 EXEC SQL                                               04900000
                    CLOSE TFRCSRA                                       04910000
                 END-EXEC                                               04920000
                 MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)       04820000
                 EXEC CICS RETURN END-EXEC                              04830000
              ELSE                                                              
                 MOVE 0 TO SQLCODE                                              
                 GO TO 0075-READ-NEXTA                                  05910000
           ELSE                                                         06200000
           IF SQLCODE = +100                                            06210000
              SET ACAT-AA-SUCCESSFUL TO TRUE                                    
              SET ACAT-AA-NOT-FOUND  TO TRUE                                    
              EXEC SQL                                                  04900000
                 CLOSE TFRCSRA                                          04910000
              END-EXEC                                                  04920000
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
              EXEC CICS RETURN END-EXEC                                 04830000
           ELSE                                                         06230000
              SET ACAT-AA-ERROR TO TRUE                                         
              MOVE 'DB2 SQLCODE ' TO ACAT-AA-MESSAGE-AREA                       
              MOVE SQLCODE TO  W-DB2-SQLCODE                                    
              MOVE W-DB2-SQLCODE TO ACAT-AA-MESSAGE-AREA(12:5)                  
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN)          04820000
              EXEC SQL                                                  04900000
                 CLOSE TFRCSRA                                          04910000
              END-EXEC                                                  04920000
              EXEC CICS RETURN END-EXEC                                 04830000
           END-IF.                                                      06270000
                                                                        06280000
       SELECT-VASSET-RTN.                                               04940000
           EXEC SQL SELECT                                              00740000
                ASSET_SEQ_NBR                                                   
                  INTO                                                          
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                  FROM VASSET                                                   
                 WHERE (CLIENT_NBR      = :DCLVTRNFR.CLIENT-NBR                 
                   AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR           
                   AND SECURITY_ADP_NBR                                         
                                     = :ACAT-AA-BRD-SECURITY-NBR                
                   AND CSH_MGN_SHRT_CD LIKE                                     
                                       :DCLVASSET.CSH-MGN-SHRT-CD)              
              WITH UR                                                           
           END-EXEC.                                                            
