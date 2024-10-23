000001* PDX    - ACAT5FDB C0272581 11/11/08 13:24:24 TBLAMUR            00001000
LRM006* SSR 61164 ALLOW ACTIMF MAINT FOR PTF                                    
000001* PDX    - ACAT5FDB C0272581 11/11/08 13:20:46 TBLAMUR            00001000
000001* PDX    - ACAT5FDB C0216396 06/10/05 14:43:14 TBLAMUR            00001000
LRM005* SSR 0039561 PHASE-II ALLOW LINK FROM J SCREEN.                          
000001* PDX    - ACAT5FDB C0215192 01/19/05 11:01:48 TBLAMUR            00001000
LRM004* SSR 0040042 USE NEW INITIAL TABLES / PHASE II.                          
000001* PDX    - ACAT5FDB C0214488 12/08/04 12:56:18 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT5FDB C0128918 07/27/99 14:34:28 TBTIKUO            00001000
000001* PDX    - ACAT5FDB C0120924 01/28/99 17:08:02 TBTARYB            00001000
000001* PDX    - ACAT5FDB C0113942 10/16/98 14:13:31 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT5FDB.                                                 
                                                                                
      *****************************************************************         
      * DB2 I/O PGM: MUTUAL FUND: DELIVERER REGISTRATION SCREEN       *         
      *****************************************************************         
TCK001* PDX0128918 ---                                                          
TCK001*   ADD LOGIC TO RETRIEVE ACTIVE ASSET WHEN BROWSE MODE                   
      *****************************************************************         
                                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
       COPY PDXIDCOB.                                                           
      *                                                                         
                                                                                
       77  WS-PRCS-DT                      PIC  X(10).                          
       77  WS-PRGM-NM                      PIC  X(08).                          
       77  WS-CICS-TERM-ID                 PIC  X(04).                          
                                                                                
       01  WS-ERR-DATA.                                                         
           05  WS-REQUEST-TYPE             PIC  X(01).                          
               88  WS-WRITE-ERROR-TO-LOG                VALUE 'Y'.              
           05  CALLING-TRAN-ID             PIC  X(04).                          
           05  CALLING-PROGRAM-ID          PIC  X(08).                          
           05  SQLCA-AREA                  PIC  X(136).                         
      /                                                                         
           COPY ACAT5FIO.                                                       
      /                                                                         
           EXEC SQL                                                             
              INCLUDE ACTIMF                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE ACTIAST                                                   
           END-EXEC.                                                            
      /                                                                         
TCK001     EXEC SQL                                                             
TCK001        INCLUDE VMF                                                       
TCK001     END-EXEC.                                                            
      /                                                                         
TCK001     EXEC SQL                                                             
TCK001        INCLUDE VASSET                                                    
TCK001     END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
      /                                                                         
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
TCK001 01  DFHCOMMAREA                      PIC  X(244).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           MOVE DFHCOMMAREA                 TO  ACAT5FIO-COMMAREA.              
                                                                                
           SET ACAT5FIO-DB2-RETURN-OK       TO  TRUE.                           
           MOVE +0                          TO  SQLCODE.                        
                                                                                
TCK001     IF (ACAT5FIO-READ-DATABASE   AND                                     
TCK001        ACAT5FIO-UPDATE-ALLOWED)                                          
LRM005     OR ACAT5FIO-READ-INIT-DB                                             
              PERFORM SELECT-FROM-ACTIAST                                       
              IF ACAT5FIO-ACTIAST-FOUND-SW = 'Y'                                
                 PERFORM SELECT-FROM-ACTIMF                                     
              END-IF                                                            
           ELSE                                                                 
LRM004     IF ACAT5FIO-UPDATE-ALLOWED                                           
              PERFORM UPDATE-ACTIMF                                             
           END-IF.                                                              
                                                                                
TCK001     IF ACAT5FIO-READ-DATABASE   AND                                      
TCK001        ACAT5FIO-BROWSE-ONLY                                              
TCK001        PERFORM SELECT-FROM-VASSET                                        
TCK001        IF ACAT5FIO-VASSET-FOUND-SW = 'Y'                                 
TCK001           PERFORM SELECT-FROM-VMF                                        
TCK001        END-IF                                                            
TCK001     END-IF.                                                              
                                                                                
           MOVE ACAT5FIO-COMMAREA           TO  DFHCOMMAREA.                    
                                                                                
           EXEC CICS  RETURN  END-EXEC.                                         
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-ACTIAST.                                                     
      **********************                                                    
                                                                                
                                                                                
           EXEC SQL                                                             
              SELECT NSCC_PEND_CD                                               
              INTO  :ACAT5FIO-NSCC-PEND-CD                                      
              FROM   ACTIAST                                                    
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    DLVR_NBR          = :ACAT5FIO-DLVR-NBR          AND         
                    RCV_NBR           = :ACAT5FIO-RCV-NBR           AND         
                    ACCT_DLVR_NBR     = :ACAT5FIO-ACCT-DLVR-NBR     AND         
                    ACCT_RCV_NBR      = :ACAT5FIO-ACCT-RCV-NBR      AND         
                    ISIN_CNTRY_CD     = :ACAT5FIO-ISIN-CNTRY-CD     AND         
                    ISIN_SEC_ISSUE_CD = :ACAT5FIO-ISIN-SEC-ISSUE-CD AND         
                    ISIN_SEC_CDG_CD   = :ACAT5FIO-ISIN-SEC-CDG-CD   AND         
                    STTLM_LCTN_CD     = :ACAT5FIO-STTLM-LCTN-CD     AND         
LRM004              ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
LRM004              ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +100                                                    
              MOVE 'N'                TO  ACAT5FIO-ACTIAST-FOUND-SW             
           ELSE                                                                 
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
TCK001        ELSE                                                              
TCK001           MOVE 'Y' TO  ACAT5FIO-ACTIAST-FOUND-SW                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-VASSET.                                                      
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT NSCC_PEND_CD                                               
              INTO  :ACAT5FIO-NSCC-PEND-CD                                      
              FROM   VASSET                                                     
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
                    ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +100                                                    
              MOVE 'N'                TO  ACAT5FIO-VASSET-FOUND-SW              
           ELSE                                                                 
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
TCK001        ELSE                                                              
TCK001           MOVE 'Y' TO  ACAT5FIO-VASSET-FOUND-SW                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
TCK001**********************                                                    
TCK001 SELECT-FROM-VMF.                                                         
TCK001**********************                                                    
                                                                                
TCK001     EXEC SQL                                                             
              SELECT FNBR                                                       
                    ,BK_PHSCL_SHR_CD                                            
                    ,NTWRK_CNTL_CD                                              
                    ,ACCT_TYPE_CD                                               
                    ,DVDND_CD                                                   
                    ,DVDND_PAYEE_CD                                             
                    ,BRKR_EXCTG_NBR                                             
                    ,MF_FULL_PRTL_CD                                            
                    ,LTCG_CD                                                    
                    ,STCG_CD                                                    
              INTO  :ACAT5FIO-FNBR                                              
                   ,:ACAT5FIO-BK-PHSCL-SHR-CD                                   
                   ,:ACAT5FIO-NTWRK-CNTL-CD                                     
                   ,:ACAT5FIO-ACCT-TYPE-CD                                      
                   ,:ACAT5FIO-DVDND-CD                                          
                   ,:ACAT5FIO-DVDND-PAYEE-CD                                    
                   ,:ACAT5FIO-BRKR-EXCTG-NBR                                    
                   ,:ACAT5FIO-MF-FULL-PRTL-CD                                   
                   ,:ACAT5FIO-LTCG-CD                                           
                   ,:ACAT5FIO-STCG-CD                                           
              FROM   VMF                                                        
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
                    ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
TCK001     EJECT                                                                
      **********************                                                    
       SELECT-FROM-ACTIMF.                                                      
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT FNBR                                                       
                    ,BK_PHSCL_SHR_CD                                            
                    ,NTWRK_CNTL_CD                                              
                    ,ACCT_TYPE_CD                                               
                    ,DVDND_CD                                                   
                    ,DVDND_PAYEE_CD                                             
                    ,BRKR_EXCTG_NBR                                             
                    ,MF_FULL_PRTL_CD                                            
                    ,LTCG_CD                                                    
                    ,STCG_CD                                                    
              INTO  :ACAT5FIO-FNBR                                              
                   ,:ACAT5FIO-BK-PHSCL-SHR-CD                                   
                   ,:ACAT5FIO-NTWRK-CNTL-CD                                     
                   ,:ACAT5FIO-ACCT-TYPE-CD                                      
                   ,:ACAT5FIO-DVDND-CD                                          
                   ,:ACAT5FIO-DVDND-PAYEE-CD                                    
                   ,:ACAT5FIO-BRKR-EXCTG-NBR                                    
                   ,:ACAT5FIO-MF-FULL-PRTL-CD                                   
                   ,:ACAT5FIO-LTCG-CD                                           
                   ,:ACAT5FIO-STCG-CD                                           
              FROM  ACTIMF                                                      
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    DLVR_NBR          = :ACAT5FIO-DLVR-NBR          AND         
                    RCV_NBR           = :ACAT5FIO-RCV-NBR           AND         
                    ACCT_DLVR_NBR     = :ACAT5FIO-ACCT-DLVR-NBR     AND         
                    ACCT_RCV_NBR      = :ACAT5FIO-ACCT-RCV-NBR      AND         
                    ISIN_CNTRY_CD     = :ACAT5FIO-ISIN-CNTRY-CD     AND         
                    ISIN_SEC_ISSUE_CD = :ACAT5FIO-ISIN-SEC-ISSUE-CD AND         
                    ISIN_SEC_CDG_CD   = :ACAT5FIO-ISIN-SEC-CDG-CD   AND         
                    STTLM_LCTN_CD     = :ACAT5FIO-STTLM-LCTN-CD     AND         
LRM004              ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
LRM004              ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       UPDATE-ACTIMF.                                                           
      ****************                                                          
                                                                                
           MOVE EIBTRMID                    TO  WS-CICS-TERM-ID.                
           MOVE 'ACAT5FDB'                  TO  WS-PRGM-NM.                     
LRM005     IF ACAT5FIO-TRNFR-TYPE-CD NOT = 'PTD' AND 'PTR' AND 'PTF'            
LRM006        MOVE 'FUL' TO ACAT5FIO-TRNFR-TYPE-CD                              
LRM005     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIMF                                                      
                SET FNBR              = :ACAT5FIO-FNBR                          
                   ,BK_PHSCL_SHR_CD   = :ACAT5FIO-BK-PHSCL-SHR-CD               
                   ,NTWRK_CNTL_CD     = :ACAT5FIO-NTWRK-CNTL-CD                 
                   ,ACCT_TYPE_CD      = :ACAT5FIO-ACCT-TYPE-CD                  
                   ,DVDND_CD          = :ACAT5FIO-DVDND-CD                      
                   ,DVDND_PAYEE_CD    = :ACAT5FIO-DVDND-PAYEE-CD                
                   ,BRKR_EXCTG_NBR    = :ACAT5FIO-BRKR-EXCTG-NBR                
                   ,MF_FULL_PRTL_CD   = :ACAT5FIO-MF-FULL-PRTL-CD               
                   ,LTCG_CD           = :ACAT5FIO-LTCG-CD                       
                   ,STCG_CD           = :ACAT5FIO-STCG-CD                       
                   ,CICS_TERM_ID_CD   = :WS-CICS-TERM-ID                        
                   ,PRGM_NM           = :WS-PRGM-NM                             
                   ,UPDT_TMSTP        =  CURRENT TIMESTAMP                      
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    DLVR_NBR          = :ACAT5FIO-DLVR-NBR          AND         
                    RCV_NBR           = :ACAT5FIO-RCV-NBR           AND         
                    ACCT_DLVR_NBR     = :ACAT5FIO-ACCT-DLVR-NBR     AND         
                    ACCT_RCV_NBR      = :ACAT5FIO-ACCT-RCV-NBR      AND         
                    ISIN_CNTRY_CD     = :ACAT5FIO-ISIN-CNTRY-CD   AND           
                    ISIN_SEC_ISSUE_CD = :ACAT5FIO-ISIN-SEC-ISSUE-CD AND         
                    ISIN_SEC_CDG_CD   = :ACAT5FIO-ISIN-SEC-CDG-CD   AND         
                    STTLM_LCTN_CD     = :ACAT5FIO-STTLM-LCTN-CD     AND         
LRM004              ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
LRM004              ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR     AND         
LRM005              TRNFR_TYPE_CD     = :ACAT5FIO-TRNFR-TYPE-CD                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +100                                                    
              PERFORM INSERT-ACTIMF                                             
           ELSE                                                                 
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-ACTIAST.                                                          
      *****************                                                         
                                                                                
           EXEC SQL                                                             
              UPDATE ACTIAST                                                    
                 SET NSCC_PEND_CD = ' '                                         
              WHERE CLIENT_NBR        = :ACAT5FIO-CLIENT-NBR        AND         
                    DLVR_NBR          = :ACAT5FIO-DLVR-NBR          AND         
                    RCV_NBR           = :ACAT5FIO-RCV-NBR           AND         
                    ACCT_DLVR_NBR     = :ACAT5FIO-ACCT-DLVR-NBR     AND         
                    ACCT_RCV_NBR      = :ACAT5FIO-ACCT-RCV-NBR      AND         
                    ISIN_CNTRY_CD     = :ACAT5FIO-ISIN-CNTRY-CD     AND         
                    ISIN_SEC_ISSUE_CD = :ACAT5FIO-ISIN-SEC-ISSUE-CD AND         
                    ISIN_SEC_CDG_CD   = :ACAT5FIO-ISIN-SEC-CDG-CD   AND         
                    STTLM_LCTN_CD     = :ACAT5FIO-STTLM-LCTN-CD     AND         
LRM004              ACAT_CONTROL_NBR  = :ACAT5FIO-ACAT-CONTROL-NBR  AND         
LRM004              ASSET_SEQ_NBR     = :ACAT5FIO-ASSET-SEQ-NBR     AND         
LRM004              TRNFR_TYPE_CD     = 'FUL'                                   
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       INSERT-ACTIMF.                                                           
      ****************                                                          
                                                                                
           INITIALIZE DCLACTIMF.                                                
           MOVE '0001-01-01'                TO  WS-PRCS-DT.                     
LRM006     IF ACAT5FIO-TRNFR-TYPE-CD NOT = 'PTD' AND 'PTR' AND 'PTF'            
LRM005        MOVE 'FUL' TO ACAT5FIO-TRNFR-TYPE-CD                              
LRM005     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              INSERT INTO ACTIMF                                                
                 ( CLIENT_NBR                                                   
LRM004            ,ACAT_CONTROL_NBR                                             
LRM004            ,ASSET_SEQ_NBR                                                
LRM004            ,TRNFR_TYPE_CD                                                
                  ,DLVR_NBR                                                     
                  ,RCV_NBR                                                      
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,BK_PHSCL_SHR_CD                                              
                  ,BK_PHSC_SHR_STS_CD                                           
                  ,NTWRK_CNTL_CD                                                
                  ,NTWRK_CNTL_STTS_CD                                           
                  ,ACCT_TYPE_CD                                                 
                  ,ACCT_TYPE_STTS_CD                                            
                  ,DVDND_CD                                                     
                  ,DVDND_STTS_CD                                                
                  ,DVDND_PAYEE_CD                                               
                  ,DVDND_PYE_STTS_CD                                            
                  ,LTCG_CD                                                      
                  ,BRKR_EXCTG_NBR                                               
                  ,BRKR_EXCTG_STTS_CD                                           
                  ,STCG_CD                                                      
                  ,MF_FULL_PRTL_CD                                              
                  ,MF_FUL_PRTL_STS_CD                                           
                  ,RGSTN_CD                                                     
                  ,FNBR                                                         
                  ,FND_ACT_NBR_STS_CD                                           
                  ,DSTBN_SIDE_CD                                                
                  ,PRCS_DT                                                      
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,SECURITY_ADP_NBR                                             
LRM004            ,FCST_ACCT_RCVR_NBR)                                          
             VALUES                                                             
                ( :ACAT5FIO-CLIENT-NBR                                          
LRM004           ,:ACAT5FIO-ACAT-CONTROL-NBR                                    
LRM004           ,:ACAT5FIO-ASSET-SEQ-NBR                                       
LRM005           ,:ACAT5FIO-TRNFR-TYPE-CD                                       
                 ,:ACAT5FIO-DLVR-NBR                                            
                 ,:ACAT5FIO-RCV-NBR                                             
                 ,:ACAT5FIO-ACCT-DLVR-NBR                                       
                 ,:ACAT5FIO-ACCT-RCV-NBR                                        
                 ,:ACAT5FIO-ISIN-CNTRY-CD                                       
                 ,:ACAT5FIO-ISIN-SEC-ISSUE-CD                                   
                 ,:ACAT5FIO-ISIN-SEC-CDG-CD                                     
                 ,:ACAT5FIO-STTLM-LCTN-CD                                       
                 ,:ACAT5FIO-CSH-MGN-SHRT-CD                                     
                 ,:ACAT5FIO-BK-PHSCL-SHR-CD                                     
                 ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                 
                 ,:ACAT5FIO-NTWRK-CNTL-CD                                       
                 ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                 
                 ,:ACAT5FIO-ACCT-TYPE-CD                                        
                 ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                  
                 ,:ACAT5FIO-DVDND-CD                                            
                 ,:DCLACTIMF.DVDND-STTS-CD                                      
                 ,:ACAT5FIO-DVDND-PAYEE-CD                                      
                 ,:DCLACTIMF.DVDND-PYE-STTS-CD                                  
                 ,:ACAT5FIO-LTCG-CD                                             
                 ,:ACAT5FIO-BRKR-EXCTG-NBR                                      
                 ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                 
                 ,:ACAT5FIO-STCG-CD                                             
                 ,:ACAT5FIO-MF-FULL-PRTL-CD                                     
                 ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                 
                 ,:DCLACTIMF.RGSTN-CD                                           
                 ,:ACAT5FIO-FNBR                                                
                 ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                 
                 ,:DCLACTIMF.DSTBN-SIDE-CD                                      
                 ,:WS-PRCS-DT                                                   
                 , CURRENT TIMESTAMP                                            
                 , CURRENT TIMESTAMP                                            
                 ,:WS-CICS-TERM-ID                                              
                 ,:WS-PRGM-NM                                                   
                 ,:ACAT5FIO-SECURITY-ADP-NBR                                    
LRM004           ,:DCLACTIMF.FCST-ACCT-RCVR-NBR)                                
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           SET ACAT5FIO-DB2-BAD-RETURN      TO  TRUE.                           
           MOVE SQLCODE                     TO ACAT5FIO-DB2-RETURN-CODE.        
                                                                                
           MOVE SPACE                       TO  WS-ERR-DATA.                    
           SET WS-WRITE-ERROR-TO-LOG        TO  TRUE.                           
           MOVE EIBTRNID                    TO  CALLING-TRAN-ID.                
           MOVE 'ACAT1FDB'                  TO  CALLING-PROGRAM-ID.             
           MOVE SQLCA                       TO  SQLCA-AREA.                     
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
     ************                                                               
       HANG-CICS.                                                               
     ************                                                               
                                                                                
           GOBACK.                                                              
