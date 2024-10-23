000001* PDX    - CAT01LEH C0283336 07/09/09 07:37:59 TBLAMUR            00001000
000001* PDX    - CAT01LEH C0150647 09/30/08 18:05:50 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT01LEH.                                                   
      *REMARK.                                                                  
      *  CAT01LEH - LEHMAN CONVERSION ONE TIME REPORT CAT01RPT                  
      *  NEUBERGER BERMAN AT RIDGE CLEARING                                     
      *  EXTRACT CLIENT 10, BRANCH 537-541 (NEUBERGER BERMAN)                   
      *  DELIVERER, PENDING STATUS NOT EQUAL 600 AND 140                        
      *  GET ASSET THAT ARE TO BE DELIVERED.                                    
      *                                                                         
      *  9/24/08 - CLIENT WANT TO MAKE SURE THEY HAVE ENOUGH                    
      *            SECURITIES TO COVER THE DELIVERIES                           
      *            IN OMNIBUS ACCOUNT 097-50074                                 
      *                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT OUTFILE        ASSIGN         TO   UT-S-OUTFILE               
                                 FILE STATUS    IS   OUTFILE-STAT.              
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       FD  OUTFILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD.                                          
                                                                                
       01  OUTFILE-RECORD.                                                      
           05  OUT-CLIENT                PIC  X(03).                            
           05  OUT-BRANCH-CD             PIC  X(03).                            
           05  OUT-ACCT-CD               PIC  X(05).                            
           05  OUT-CSH-MGN-SHRT-CD       PIC  X(01).                            
           05  OUT-STTS-CD               PIC  X(03).                            
           05  OUT-SECURITY-ADP-NBR      PIC  X(07).                            
           05  OUT-PSTN-CD               PIC  X(01).                            
           05  OUT-ASSET-QTY             PIC  S9(12)V9(5).                      
           05  OUT-ACAT-CONTROL-NBR      PIC  X(14).                            
           05  OUT-ASSET-SEQ-NBR         PIC  9(04).                            
           05  OUT-ISIN-CNTRY-CD         PIC  X(02).                            
           05  OUT-ISIN-SEC-ISSUE-CD     PIC  X(09).                            
           05  OUT-ISIN-SEC-CDG-CD       PIC  X(01).                            
           05  OUT-ASSET-PRC-CTGY-CD     PIC  X(04).                            
           05  OUT-STTLM-LCTN-CD         PIC  X(02).                            
           05  OUT-STTLM-RSN-CD          PIC  X(04).                            
           05  OUT-ASSET-DESC-TXT        PIC  X(140).                           
                                                                                
                                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
           COPY PDXIDCOB.                                                       
                                                                                
       01  FILLER                      PIC X(08) VALUE 'CAT01LEH'.              
       01  WS-COUNT                    PIC  9(7)        VALUE 0.                
       01  WS-STREAM-ID                PIC X(01)  VALUE SPACES.                 
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
      /                                                                         
       01  WS-CAT01LEH-WORK-AREA.                                               
           03  OUTFILE-STAT              PIC  X(02) VALUE '00'.                 
               88 OUTFILE-OKAY                      VALUE '00'.                 
           03  FILLER                  PIC X(1)    VALUE ' '.                   
               88  END-OF-TRANSFER     VALUE 'Y'.                               
           03  END-OF-ASSET-SW         PIC X(1)    VALUE ' '.                   
               88  END-OF-ASSET        VALUE 'Y'.                               
           03  END-OF-ACTIAST-SW       PIC X(1)    VALUE ' '.                   
               88  END-OF-ACTIAST      VALUE 'Y'.                               
           03  WS-FIRST-TIME-SW        PIC X(1)    VALUE 'Y'.                   
               88  FIRST-TIME          VALUE 'Y'.                               
           03  SV-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.            
           03  WS-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.            
           03  WS-ACAT-CNTL-NBR        PIC X(14)   VALUE LOW-VALUES.            
       01  DB2-WORK-AREA.                                                       
           03  W-SQLERRD-3                   PIC 9(9).                          
           03  VASSET-SW                     PIC X     VALUE SPACE.             
               88  VASSET-FETCHED                      VALUE 'Y'.               
           03  ACTIAST-SW                    PIC X     VALUE SPACE.             
               88  ACTIAST-FETCHED                      VALUE 'Y'.              
       01  DB2-ABEND-WORK-AREA.                                                 
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.           
           03  WS-DB2-MESSAGE-AREA.                                             
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.        
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES         
                   INDEXED BY WS-ERROR-INDEX.                                   
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.         
      *                                                                         
      /                                                                         
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
      /                                                                         
           EXEC SQL                                                             
              INCLUDE ACTIAST                                                   
           END-EXEC.                                                            
      /                                                                         
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
      /                                                                         
           EXEC SQL                                                             
              INCLUDE VASSET                                                    
           END-EXEC.                                                            
      /                                                                         
           COPY RECDATZC.                                                       
      /                                                                         
           COPY LKDTSRCH.                                                       
      /                                                                         
           COPY BPDATESC.                                                       
      /                                                                         
       LINKAGE SECTION.                                                         
           SKIP1                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH            PIC S9(4)    COMP.                        
           05  PARM-STREAM-ID         PIC X(01).                                
                                                                                
      *****************************************************************         
       PROCEDURE DIVISION  USING PARM-AREA.                                     
      *****************************************************************         
           DISPLAY 'CAT01LEH - LEHMAN CONVERSION ONE TIME JOB'.                 
           DISPLAY '           EXTRACT PENDING DELIVERY ASSETS'.                
                                                                                
           DISPLAY ' '.                                                         
           COPY  MSGCOBO.                                                       
                                                                                
           OPEN OUTPUT OUTFILE.                                                 
           IF PARM-LENGTH GREATER ZEROS                                         
              MOVE PARM-STREAM-ID TO WS-STREAM-ID                               
           END-IF.                                                              
                                                                                
           DISPLAY 'PARM STREAM         ' WS-STREAM-ID                          
                                                                                
           PERFORM GET-TIF THRU GET-TIF-EXIT.                                   
                                                                                
           CLOSE OUTFILE.                                                       
           DISPLAY ' '                                                          
           DISPLAY 'WS-COUNT = ' WS-COUNT                                       
           GOBACK.                                                              
      /                                                                         
       GET-TIF.                                                                 
      *** SELECT ACTIVE TIF                                                     
      ***                                                                       
      *--- DECLARE                                                              
           EXEC SQL                                                             
                DECLARE TIF_CSR CURSOR WITH HOLD FOR                            
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,TRNFR_TYPE_CD                                               
                   ,STTS_CD                                                     
                   ,DSTBN_SIDE_CD                                               
                FROM VTRNFR                                                     
                WHERE                                                           
                    CLIENT_NBR = '0010'                                         
                    AND (NOT BRANCH_CD < '537')                                 
                    AND (NOT BRANCH_CD > '541')                                 
                    AND (STTS_CD IN ('100', '110'))                             
                    AND DSTBN_SIDE_CD = 'D'                                     
                ORDER BY CLIENT_NBR, BRANCH_CD, ACCT_CD                         
           END-EXEC.                                                            
********************AND (NOT STTS_CD = '600')                                   
********************AND (NOT STTS_CD = '140')                                   
      *                                                                         
           EXEC SQL                                                             
                DECLARE VASSET_CSR CURSOR WITH HOLD FOR                         
                SELECT                                                          
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,ASSET_QTY                                                  
                    ,ASSET_PCT                                                  
                    ,ASSET_AMT                                                  
                    ,PSTN_CD                                                    
                    ,CSH_MGN_SHRT_CD                                            
                    ,SECURITY_ADP_NBR                                           
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,ASSET_PRC_CTGY_CD                                          
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_RSN_CD                                               
                    ,ASSET_DESC_TXT                                             
                FROM VASSET                                                     
                WHERE                                                           
                     CLIENT_NBR = :WS-CLIENT-NBR                                
                 AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                       
                ORDER BY ASSET_SEQ_NBR                                          
           END-EXEC.                                                            
      *                                                                         
           EXEC SQL                                                             
                DECLARE ACTIAST_CSR CURSOR WITH HOLD FOR                        
                SELECT                                                          
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,ASSET_QTY                                                  
                    ,ASSET_PCT                                                  
                    ,ASSET_AMT                                                  
                    ,PSTN_CD                                                    
                    ,CSH_MGN_SHRT_CD                                            
                    ,SECURITY_ADP_NBR                                           
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,ASSET_PRC_CTGY_CD                                          
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_RSN_CD                                               
                    ,ASSET_DESC_TXT                                             
                FROM ACTIAST                                                    
                WHERE                                                           
                     CLIENT_NBR = :WS-CLIENT-NBR                                
                 AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                       
                ORDER BY ASSET_SEQ_NBR                                          
           END-EXEC.                                                            
      *----------------------->                                                 
           EXEC SQL                                                             
                OPEN TIF_CSR                                                    
           END-EXEC.                                                            
      *                                                                         
           PERFORM UNTIL END-OF-TRANSFER                                        
              EXEC SQL                                                          
                   FETCH TIF_CSR                                                
                   INTO                                                         
                      :DCLVTRNFR.CLIENT-NBR                                     
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                               
                     ,:DCLVTRNFR.BRANCH-CD                                      
                     ,:DCLVTRNFR.ACCT-CD                                        
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                                  
                     ,:DCLVTRNFR.STTS-CD                                        
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                                  
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                         MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR          
                         MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                  
                              WS-ACAT-CNTL-NBR                                  
                           PERFORM PROCESS-DB2-TABLES  THRU                     
                                     PROCESS-DB2-TABLES-EXIT                    
                  WHEN  +100                                                    
                    SET END-OF-TRANSFER TO TRUE                                 
                  WHEN OTHER                                                    
                    DISPLAY 'TIF_CSR FETCH ERROR'                               
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
                CLOSE TIF_CSR                                                   
           END-EXEC.                                                            
                                                                                
       GET-TIF-EXIT.                                                            
           EXIT.                                                                
      /                                                                         
       PROCESS-DB2-TABLES.                                                      
           PERFORM FETCH-ASSET THRU FETCH-ASSET-EXIT.                           
           PERFORM FETCH-ACTIAST THRU FETCH-ACTIAST-EXIT.                       
                                                                                
       PROCESS-DB2-TABLES-EXIT.                                                 
           EXIT.                                                                
      /                                                                         
       FETCH-ASSET.                                                             
           MOVE ' '     TO  END-OF-ASSET-SW.                                    
                                                                                
           EXEC SQL                                                             
                OPEN VASSET_CSR                                                 
           END-EXEC.                                                            
      *                                                                         
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'ASSET OPEN ERROR ' SQLCODE                               
                                                                                
           ELSE                                                                 
            PERFORM UNTIL END-OF-ASSET                                          
              EXEC SQL                                                          
                   FETCH VASSET_CSR                                             
                   INTO                                                         
                   :DCLVASSET.CLIENT-NBR                                        
                  ,:DCLVASSET.ACAT-CONTROL-NBR                                  
                  ,:DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ASSET-PCT                                         
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.ISIN-CNTRY-CD                                     
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                                   
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                                 
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.STTLM-RSN-CD                                      
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                         SET VASSET-FETCHED TO TRUE                             
                         IF SECURITY-ADP-NBR  OF DCLVASSET > ' '                
                            PERFORM WRITE-VASSET THRU                           
                                    WRITE-VASSET-EXIT                           
                         END-IF                                                 
                  WHEN  +100                                                    
                    SET END-OF-ASSET TO TRUE                                    
                  WHEN OTHER                                                    
                    DISPLAY 'VASSET_CSR FETCH ERROR'                            
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
            END-PERFORM.                                                        
           EXEC SQL                                                             
                 CLOSE VASSET_CSR                                               
           END-EXEC.                                                            
                                                                                
       FETCH-ASSET-EXIT.                                                        
           EXIT.                                                                
      /                                                                         
       WRITE-VASSET.                                                            
           MOVE CLIENT-NBR OF DCLVTRNFR (2:3) TO OUT-CLIENT                     
           MOVE BRANCH-CD        OF DCLVTRNFR TO OUT-BRANCH-CD                  
           MOVE ACCT-CD          OF DCLVTRNFR TO OUT-ACCT-CD                    
           MOVE CSH-MGN-SHRT-CD  OF DCLVASSET TO OUT-CSH-MGN-SHRT-CD            
           MOVE STTS-CD          OF DCLVTRNFR TO OUT-STTS-CD                    
           MOVE SECURITY-ADP-NBR OF DCLVASSET TO OUT-SECURITY-ADP-NBR           
           MOVE PSTN-CD          OF DCLVASSET TO OUT-PSTN-CD                    
           MOVE ASSET-QTY        OF DCLVASSET TO OUT-ASSET-QTY                  
           MOVE ACAT-CONTROL-NBR  OF DCLVASSET TO OUT-ACAT-CONTROL-NBR          
           MOVE ASSET-SEQ-NBR     OF DCLVASSET TO OUT-ASSET-SEQ-NBR             
           MOVE ISIN-CNTRY-CD     OF DCLVASSET TO OUT-ISIN-CNTRY-CD             
           MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET TO OUT-ISIN-SEC-ISSUE-CD         
           MOVE ISIN-SEC-CDG-CD   OF DCLVASSET TO OUT-ISIN-SEC-CDG-CD           
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO OUT-ASSET-PRC-CTGY-CD         
           MOVE STTLM-LCTN-CD     OF DCLVASSET TO OUT-STTLM-LCTN-CD             
           MOVE STTLM-RSN-CD      OF DCLVASSET TO OUT-STTLM-RSN-CD              
           MOVE ASSET-DESC-TXT    OF DCLVASSET TO OUT-ASSET-DESC-TXT            
           IF OUT-PSTN-CD = 'S'                                                 
              COMPUTE OUT-ASSET-QTY = OUT-ASSET-QTY * -1                        
           END-IF                                                               
           DISPLAY 'VASSET '                                                    
                          ' ' OUT-CLIENT                                        
                          ' ' OUT-BRANCH-CD                                     
                          ' ' OUT-ACCT-CD                                       
                          ' ' OUT-CSH-MGN-SHRT-CD                               
                          ' ' OUT-STTS-CD                                       
                          ' ' OUT-SECURITY-ADP-NBR                              
                          ' ' OUT-PSTN-CD                                       
                          ' ' OUT-ASSET-QTY                                     
                          ' ' OUT-ASSET-DESC-TXT(1:30)                          
            ADD 1 TO WS-COUNT                                                   
            WRITE OUTFILE-RECORD.                                               
                                                                                
       WRITE-VASSET-EXIT.                                                       
           EXIT.                                                                
      /                                                                         
       FETCH-ACTIAST.                                                           
           MOVE ' '     TO  END-OF-ACTIAST-SW.                                  
                                                                                
           EXEC SQL                                                             
                OPEN ACTIAST_CSR                                                
           END-EXEC.                                                            
      *                                                                         
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'ACTIAST OPEN ERROR ' SQLCODE                             
                                                                                
           ELSE                                                                 
            PERFORM UNTIL END-OF-ACTIAST                                        
              EXEC SQL                                                          
                   FETCH ACTIAST_CSR                                            
                   INTO                                                         
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.ASSET-AMT                                        
                  ,:DCLACTIAST.PSTN-CD                                          
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                         SET ACTIAST-FETCHED TO TRUE                            
                         IF SECURITY-ADP-NBR  OF DCLACTIAST > ' '               
                            PERFORM WRITE-ACTIAST THRU                          
                                    WRITE-ACTIAST-EXIT                          
                         END-IF                                                 
                  WHEN  +100                                                    
                    SET END-OF-ACTIAST TO TRUE                                  
                  WHEN OTHER                                                    
                    DISPLAY 'ACTIVASSET_CSR FETCH ERROR'                        
                    PERFORM SQL-ERROR-ROUTINE                                   
              END-EVALUATE                                                      
            END-PERFORM.                                                        
           EXEC SQL                                                             
                 CLOSE ACTIAST_CSR                                              
           END-EXEC.                                                            
                                                                                
       FETCH-ACTIAST-EXIT.                                                      
           EXIT.                                                                
      /                                                                         
       WRITE-ACTIAST.                                                           
           MOVE CLIENT-NBR OF DCLVTRNFR (2:3) TO OUT-CLIENT                     
           MOVE BRANCH-CD        OF DCLVTRNFR  TO OUT-BRANCH-CD                 
           MOVE ACCT-CD          OF DCLVTRNFR  TO OUT-ACCT-CD                   
           MOVE CSH-MGN-SHRT-CD  OF DCLACTIAST TO OUT-CSH-MGN-SHRT-CD           
           MOVE STTS-CD          OF DCLVTRNFR  TO OUT-STTS-CD                   
           MOVE SECURITY-ADP-NBR OF DCLACTIAST TO OUT-SECURITY-ADP-NBR          
           MOVE PSTN-CD          OF DCLACTIAST TO OUT-PSTN-CD                   
           MOVE ASSET-QTY        OF DCLACTIAST TO OUT-ASSET-QTY                 
           MOVE ACAT-CONTROL-NBR OF DCLACTIAST TO OUT-ACAT-CONTROL-NBR          
           MOVE ASSET-SEQ-NBR    OF DCLACTIAST TO OUT-ASSET-SEQ-NBR             
           MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO OUT-ISIN-CNTRY-CD            
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO OUT-ISIN-SEC-ISSUE-CD        
           MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO OUT-ISIN-SEC-CDG-CD          
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST TO OUT-ASSET-PRC-CTGY-CD        
           MOVE STTLM-LCTN-CD     OF DCLACTIAST TO OUT-STTLM-LCTN-CD            
           MOVE STTLM-RSN-CD      OF DCLACTIAST TO OUT-STTLM-RSN-CD             
           MOVE ASSET-DESC-TXT    OF DCLACTIAST TO OUT-ASSET-DESC-TXT           
           IF OUT-PSTN-CD = 'S'                                                 
              COMPUTE OUT-ASSET-QTY = OUT-ASSET-QTY * -1                        
           END-IF                                                               
           DISPLAY 'ACTIAST'                                                    
                          ' ' OUT-CLIENT                                        
                          ' ' OUT-BRANCH-CD                                     
                          ' ' OUT-ACCT-CD                                       
                          ' ' OUT-CSH-MGN-SHRT-CD                               
                          ' ' OUT-STTS-CD                                       
                          ' ' OUT-SECURITY-ADP-NBR                              
                          ' ' OUT-PSTN-CD                                       
                          ' ' OUT-ASSET-QTY                                     
                          ' ' OUT-ASSET-DESC-TXT(1:30)                          
            ADD 1 TO WS-COUNT                                                   
            WRITE OUTFILE-RECORD.                                               
                                                                                
       WRITE-ACTIAST-EXIT.                                                      
           EXIT.                                                                
                                                                                
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
           DISPLAY ' *** CAT01LEH ABENDED ****'                                 
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                          
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.                     
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC                                         
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       CALL-ABEND.                                                              
           CALL ABEND USING ABEND-CODE.                                         
      ******************************************************************        
