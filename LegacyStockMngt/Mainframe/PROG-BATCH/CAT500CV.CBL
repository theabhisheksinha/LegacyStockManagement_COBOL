000001* PDX    - CAT500CV C0262101 03/10/08 08:58:20 TBLAMUR            00001000
LRM001* SSR 54091 ADDL CHANGE TO CONVERT CLIENT 6 PTD,MFC,FRV,RCL AS            
LRM001* THE RECEIVER, AND PTR AS THE DELIVERER.                                 
000001* PDX    - CAT500CV C0253977 09/27/07 14:02:03 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00590000
       PROGRAM-ID.  CAT500CV.                                           00600000
       DATE-WRITTEN.  SEPT 2007.                                        00610000
                                                                        00620000
      ***************************************************************** 00630000
      *                         REMARKS                               * 00640000
      ***************************************************************** 00650000
      * SSR 54091 USE CONVERSION ACCT, HAVING THE ORIGINAL RECEIVER             
      * SIDE ACCOUNT OR AN RCR, OR THE ORIGINAL DELIVER ACCOUNT FOR             
      * FULL DELIVERY, WHEN POPULATED ON A REJECT FOR CLI=6.                    
      * SELECT ROWS FROM ACTITRF, INSERT NEW AND DELETE OLD.            00660000
      ***************************************************************** 00690000
                                                                        00780000
           EJECT                                                        00790000
      ***************************************************************** 00800000
       ENVIRONMENT DIVISION.                                            00810000
      ***************************************************************** 00820000
       INPUT-OUTPUT SECTION.                                            00830000
       FILE-CONTROL.                                                    00840000
           SELECT EXTRACT-FILE                  ASSIGN  TO  EXTR.               
                                                                        01060000
      ***************************************************************** 01070000
       DATA DIVISION.                                                   01080000
      ***************************************************************** 01090000
                                                                        01100000
       FILE SECTION.                                                    01110000
       FD  EXTRACT-FILE                                                         
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  EXTRACT-RECORD.                                                      
           05  RECORD-SEG-ID        PIC X(08).                                  
           05  RECORD-DETAIL        PIC X(742).                                 
           05  RECORD-CONV-ACCT     PIC X(20).                                  
                                                                        01120000
           EJECT                                                        01320000
      ******************************************************************01330000
       WORKING-STORAGE SECTION.                                         01340000
      ******************************************************************01350000
           COPY PDXIDCOB.                                               01360012
                                                                        01370000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       01410000
       77  WS-SAVE-ACCT                  PIC  X(20).                            
           COPY STUBCPY.                                                01790000
                                                                        03640000
       01  FILLER.                                                      03650000
           05  EOF-SW                    PIC  X(01)  VALUE 'N'.         03660000
               88  EOF                                   VALUE 'Y'.             
           05  SQL-ERROR-IND             PIC  X(01)  VALUE ' '.         03790000
               88  BAD-UPDATE                            VALUE 'U'.     03800000
               88  BAD-FETCH                             VALUE 'F'.     03810000
               88  BAD-OPEN                              VALUE 'O'.     03820000
               88  BAD-CLOSE                             VALUE 'L'.     03830000
               88  BAD-SELECT                            VALUE 'S'.     03840000
               88  BAD-COMMIT                            VALUE 'M'.     03850000
               88  BAD-ROLLBACK                          VALUE 'R'.     03860000
               88  BAD-B1-CALL                           VALUE 'B'.     03870000
               88  BAD-INSERT                            VALUE 'I'.     03880000
               88  BAD-DELETE                            VALUE 'D'.     03880000
           05  TROUBLE-DB2-OBJECT        PIC  X(15)      VALUE SPACES.  03890000
                                                                        04690000
           EJECT                                                        04920000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    05020000
       01  WS-DB2-MESSAGE-AREA.                                         05030000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    05040000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     05050000
               INDEXED BY WS-ERROR-INDEX.                               05060000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     05070000
       01  WS-SQLCODE                    PIC Z(8)9-.                    05080000
       01  WS-TI-SQLCODE                 PIC S9(9)  COMP-4.             05090000
       01  W-SQLERRD-3                   PIC S9(9).                     05120000
       01  W-SQL-COUNT                   PIC --------9.                 05130000
       01  WS-ABEND-CTR                  PIC S9(3)  COMP-3  VALUE ZERO. 05140000
       01  FILLER                        PIC X(15)  VALUE               05150000
           'DB2 COMMIT AREA'.                                           05160000
       01  DB2-COMMIT-AREA.                                             05170000
           05  WS-COMMIT-CTR             PIC S9(4)  COMP  VALUE ZERO.   05180000
           05  WS-COMMIT-TOT-CTR         PIC S9(4)  COMP  VALUE ZERO.   05190000
           05  WS-TI-KEYS.                                              05200000
               10  WS-TI-CLIENT          PIC X(04).                     05210000
               10  WS-TI-RCV-NBR         PIC X(04).                     05220000
               10  WS-TI-ACCT-RCV-NBR    PIC X(20).                     05230000
               10  WS-TI-DLVR-NBR        PIC X(04).                     05240000
               10  WS-TI-ACCT-DLVR-NBR   PIC X(20).                     05250000
               10  WS-TI-TRNFR-TYPE-CD   PIC X(03).                     05260000
      *DB2 COMMUNICATION AREA                                           07620000
           EJECT                                                        07630000
           EXEC SQL                                                     07640000
              INCLUDE SQLCA                                             07650000
           END-EXEC.                                                    07660000
                                                                        07670000
           EJECT                                                        07680000
           EXEC SQL                                                     07690000
              INCLUDE ACTITRF                                           07700000
           END-EXEC.                                                    07710000
                                                                        07720000
           EJECT                                                        10840000
      ***************************************************************** 10850000
       PROCEDURE DIVISION.                                              10860000
      ***************************************************************** 10870000
           DISPLAY 'CAT500CV - REPL CONVERSION ACCT ON RCR REJECT'.     10880000
                                                                        10920000
           COPY MSGCOBO.                                                10930000
                                                                        10960000
           OPEN INPUT EXTRACT-FILE.                                             
           PERFORM PROCESS-RTN THRU PROCESS-EXIT                        13870000
                UNTIL EOF.                                              10980000
           PERFORM ENDJOB-ROUTINE.                                      10990000
                                                                        11000000
           GOBACK.                                                      11010000
                                                                        11020000
           EJECT                                                        10840000
        PROCESS-RTN.                                                    14300000
      *** FIRST READ THE EXTRACTED CHAGE FILE FROM CAT500C                      
      *** RECEIVER ACCOUNT NUMBER (IF ANY).                                     
           READ EXTRACT-FILE                                            29800027
              AT END                                                    29800027
                SET EOF TO TRUE                                         29800027
                GO TO PROCESS-EXIT                                      29800027
           END-READ.                                                    29800027
                                                                                
           IF RECORD-SEG-ID = 'DATE'                                            
              GO TO PROCESS-RTN                                                 
           END-IF.                                                              
                                                                                
           MOVE RECORD-DETAIL  TO DCLACTITRF.                                   
LRM001*****IF TRNFR-TYPE-CD OF DCLACTITRF = 'FUL'                               
LRM001     IF DSTBN-SIDE-CD OF DCLACTITRF = 'D'                                 
              MOVE ACCT-DLVR-NBR OF DCLACTITRF TO WS-SAVE-ACCT                  
              MOVE RECORD-CONV-ACCT TO ACCT-DLVR-NBR OF DCLACTITRF              
           ELSE                                                                 
              MOVE ACCT-RCV-NBR OF DCLACTITRF TO WS-SAVE-ACCT                   
              MOVE RECORD-CONV-ACCT TO ACCT-RCV-NBR OF DCLACTITRF               
           END-IF.                                                              
           PERFORM INSERT-NEW-ACTITRF.                                  26260000
           IF SQLCODE = 0                                                       
LRM001********IF TRNFR-TYPE-CD OF DCLACTITRF = 'FUL'                            
LRM001        IF DSTBN-SIDE-CD OF DCLACTITRF = 'D'                              
                 DISPLAY ' INSERTED NEW ACTITRF ' ACAT-CONTROL-NBR      29560025
                          ACCT-DLVR-NBR OF DCLACTITRF                   29560025
                     ' CHANGED ' WS-SAVE-ACCT ' TO ' RECORD-CONV-ACCT           
                 PERFORM DELETE-OLD-ACTITRF-DLVR                        26260000
                 IF SQLCODE = 0                                                 
                    DISPLAY ' DELETED OLD ACTITRF DLVR'                 29560025
                 END-IF                                                         
              ELSE                                                              
                 DISPLAY ' INSERTED NEW ACTITRF ' ACAT-CONTROL-NBR      29560025
                          ACCT-RCV-NBR OF DCLACTITRF                    29560025
                     ' CHANGED ' WS-SAVE-ACCT ' TO ' RECORD-CONV-ACCT           
                 PERFORM DELETE-OLD-ACTITRF-RCVR                        26260000
                 IF SQLCODE = 0                                                 
                    DISPLAY ' DELETED OLD ACTITRF RCVR'                 29560025
           END-IF.                                                              
        PROCESS-EXIT. EXIT.                                             14300000
           EJECT                                                        17440000
      **********************                                            26250000
       INSERT-NEW-ACTITRF.                                              26260000
      **********************                                            26270000
                                                                        26280000
           EXEC SQL                                                     26290000
              INSERT INTO ACTITRF                                       26300000
                 ( CLIENT_NBR                                           26310000
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,RCV_NBR_STTS_CD                                            
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACCT_DLVR_STTS_CD                                          
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,ACAT_CONTROL_NBR                                           
                    ,CONTROL_NBR_STS_CD                                         
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,PRTCP_CONTRA_CD                                            
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,UPDT_TMSTP                                                 
                    ,CRT_TMSTP                                                  
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,RR_CD                                                      
                    ,CICS_SGNON_ID                                              
                    ,CICS_NET_NM                                                
                    ,TPSCRT_USR_ID                                              
                    ,TPSCRT_USR_NM                                              
                    ,GIFT_IND )                                                 
              VALUES (                                                  26710000
                    :DCLACTITRF.CLIENT-NBR                                      
                   ,:DCLACTITRF.DLVR-NBR                                        
                   ,:DCLACTITRF.ACCT-DLVR-NBR                                   
                   ,:DCLACTITRF.RCV-NBR                                         
                   ,:DCLACTITRF.ACCT-RCV-NBR                                    
                   ,:DCLACTITRF.TRNFR-TYPE-CD                                   
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                                
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTITRF.TRANS-TYPE-CD                                   
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTITRF.RCV-CUST-NM                                     
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
                   ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:DCLACTITRF.RCV-CRSPN-NBR                                   
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:DCLACTITRF.CMNT-TXT                                        
                   ,:DCLACTITRF.CMNT-STTS-CD                                    
                   ,:DCLACTITRF.PRCS-DT                                         
                   ,:DCLACTITRF.STTS-CD                                         
                   ,:DCLACTITRF.DSTBN-SIDE-CD                                   
                   ,:DCLACTITRF.SYS-ACT-CD                                      
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                              
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTITRF.LGCL-SEQ-NBR                                    
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
                   ,:DCLACTITRF.CYCLE-CD                                        
                   ,:DCLACTITRF.DAYS-STTS-QTY                                   
                   ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:DCLACTITRF.NSCC-PEND-CD                                    
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,:DCLACTITRF.UPDT-TMSTP                                      
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,:DCLACTITRF.PRGM-NM                                         
                   ,:DCLACTITRF.RR-CD                                           
                   ,:DCLACTITRF.CICS-SGNON-ID                                   
                   ,:DCLACTITRF.CICS-NET-NM                                     
                   ,:DCLACTITRF.TPSCRT-USR-ID                                   
                   ,:DCLACTITRF.TPSCRT-USR-NM                                   
                   ,:DCLACTITRF.GIFT-IND )                                      
           END-EXEC.                                                    27120000
                                                                        27130000
           IF SQLCODE = -803                                            27140000
              DISPLAY 'DUPE INSERT BYPASSED '                           27160000
                           ACAT-CONTROL-NBR OF DCLACTITRF               27170000
           ELSE                                                                 
           IF SQLCODE NOT = +0                                          27140000
              MOVE SQLCODE TO WS-SQLCODE                                27150000
              DISPLAY 'PROBLEM ON ACTITRF INSERT '                      27160000
              SET BAD-INSERT             TO  TRUE                       27270000
              MOVE 'ACTITRF INSERT'      TO  TROUBLE-DB2-OBJECT         27280000
              PERFORM SQL-ERROR-ROUTINE                                 27290000
           END-IF.                                                      27300000
                                                                        27310000
      *************************                                         26250000
       DELETE-OLD-ACTITRF-DLVR.                                         26260000
      *************************                                         26270000
                                                                        26280000
           EXEC SQL                                                             
                DELETE FROM ACTITRF                                             
                WHERE  CLIENT_NBR =       :DCLACTITRF.CLIENT-NBR                
                  AND  ACAT_CONTROL_NBR = :DCLACTITRF.ACAT-CONTROL-NBR          
                  AND  ACCT_DLVR_NBR    = :WS-SAVE-ACCT                         
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                          27140000
              MOVE SQLCODE TO WS-SQLCODE                                27150000
              DISPLAY 'PROBLEM ON ACTITRF DLVR DELETE '                 27160000
              SET BAD-DELETE             TO  TRUE                       27270000
              MOVE 'ACTITRF DELETE'      TO  TROUBLE-DB2-OBJECT         27280000
              PERFORM SQL-ERROR-ROUTINE                                 27290000
           END-IF.                                                      27300000
                                                                                
      *************************                                         26250000
       DELETE-OLD-ACTITRF-RCVR.                                         26260000
      *************************                                         26270000
                                                                        26280000
           EXEC SQL                                                             
                DELETE FROM ACTITRF                                             
                WHERE  CLIENT_NBR =       :DCLACTITRF.CLIENT-NBR                
                  AND  ACAT_CONTROL_NBR = :DCLACTITRF.ACAT-CONTROL-NBR          
                  AND  ACCT_RCV_NBR     = :WS-SAVE-ACCT                         
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                          27140000
              MOVE SQLCODE TO WS-SQLCODE                                27150000
              DISPLAY 'PROBLEM ON ACTITRF RCVR DELETE '                 27160000
              SET BAD-DELETE             TO  TRUE                       27270000
              MOVE 'ACTITRF DELETE'      TO  TROUBLE-DB2-OBJECT         27280000
              PERFORM SQL-ERROR-ROUTINE                                 27290000
           END-IF.                                                      27300000
           EJECT                                                        27620000
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN                    
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM                                                          
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '*** DB2 OBJECT IN TROUBLE IS ' TROUBLE-DB2-OBJECT           
           DISPLAY '*** PROGRAM IS ABENDING!'                                   
           DISPLAY '**** ABENDING SQLCODE = ' WS-SQLCODE                        
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC                                 31280000
           CALL ABEND      USING ABEND-CODE.                            31290000
                                                                                
           EJECT                                                        28080000
      ****************                                                  31310000
       ENDJOB-ROUTINE.                                                  31300000
      ****************                                                  31310000
                                                                        31320000
                                                                        31620000
           CLOSE EXTRACT-FILE.                                                  
           DISPLAY ' '                                                  31900000
           DISPLAY '*************************'                          31910000
           DISPLAY '* END OF CAT500CV PROGRAM *'                        31920000
           DISPLAY '*************************'                          31930000
           DISPLAY ' '                                                  31940000
           .                                                            31960000
