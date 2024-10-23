000001* PDX    - ACAT1FDB C0214488 12/08/04 11:53:53 TBLAMUR            00001000
000001* PDX    - ACAT1FDB C0120352 01/24/99 17:27:53 TBTARYB            00001000
000001* PDX    - ACAT1FDB C0119770 12/28/98 11:34:40 TBTARYB            00001000
000001* PDX    - ACAT1FDB C0118708 12/24/98 12:53:57 TBTARYB            00001000
000001* PDX    - ACAT1FDB C0113942 11/11/98 13:53:19 TBTARYB            00001000
000001* PDX    - ACAT1FDB C0117820 11/06/98 11:04:56 TBTARYB            00001000
000001* PDX    - ACAT1FDB C0113942 10/30/98 13:19:39 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT1FDB.                                                 
                                                                                
      *****************************************************************         
      * DB2 I/O PGM: FUND/SERV 'RECEIVER REGISTRATION ADD 1' SCREEN   *         
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
       77  WS-CLIENT-NBR                   PIC X(04).                           
       77  WS-ACAT-CONTROL-NBR             PIC X(14).                           
       77  WS-ASSET-SEQ-NBR                PIC S9(04) COMP   VALUE ZERO.        
       77  WS-NA-LINE-TXT                  PIC X(35).                           
       77  WS-NA-LINE-NBR                  PIC S9(4)  COMP   VALUE ZERO.        
       77  WS-NRA-TAX-PCT                  PIC SV9(2) COMP-3 VALUE ZERO.        
       77  WS-PYBL-QTY                     PIC S9(04) COMP   VALUE ZERO.        
       77  WS-TERM-ID                      PIC X(04).                           
       77  WS-STTS                         PIC X(01).                           
       77  S1                              PIC 9(02)         VALUE 0.           
       77  STOP-FLAG                       PIC X(01).                           
           88  STOP-NOT-OK                                   VALUE '1'.         
           88  STOP-OK                                       VALUE '2'.         
       77  WS-CSH-MGN-SHRT-CD              PIC X(01)  VALUE SPACES.             
                                                                                
       01  FILLER                          PIC X(22)         VALUE              
           'ROA-LOI-AMT CONVERSION'.                                            
                                                                                
       01  FILLER.                                                              
                                                                                
           05  WS-RL-AMT-AREA.                                                  
               10  WS-RL-AMT-INT           PIC  9(14).                          
               10  WS-RL-AMT-FRAC          PIC  9(02).                          
           05  WS-RL-AMT REDEFINES                                              
               WS-RL-AMT-AREA              PIC  9(14)V99.                       
           05  WS-RL-AMT-PCKD              PIC S9(14)V99  COMP-3.               
                                                                                
           05  WS-ROA-LOI-AMT.                                                  
               10  WS-ROA-LOI-AMT-INT      PIC  X(14).                          
               10  FILLER                  PIC  X(01)   VALUE '.'.              
               10  WS-ROA-LOI-AMT-FRAC     PIC  X(02).                          
                                                                                
       01  FILLER                          PIC X(21)   VALUE                    
           'ROA-LOI-DT CONVERSION'.                                             
                                                                                
       01  FILLER.                                                              
           05  WS-LOI-DT-10                PIC  X(10).                          
           05  FILLER                                                           
               REDEFINES WS-LOI-DT-10.                                          
               10  WS-LOI-10-CCYY          PIC  X(04).                          
               10  WS-LOI-10-SEP1          PIC  X(01).                          
               10  WS-LOI-10-MM            PIC  X(02).                          
               10  WS-LOI-10-SEP2          PIC  X(01).                          
               10  WS-LOI-10-DD            PIC  X(02).                          
           05  WS-LOI-DT-8.                                                     
               10  WS-LOI-8-CCYY           PIC  X(04).                          
               10  WS-LOI-8-MM             PIC  X(02).                          
               10  WS-LOI-8-DD             PIC  X(02).                          
           05  WS-LOI-DT REDEFINES                                              
               WS-LOI-DT-8                 PIC  X(08).                          
                                                                                
       01  WS-EDIT-MOD.                                                         
           05  REQUEST-TYPE                PIC  X(01)  VALUE 'G'.               
           05  NO-OF-ACCT-NUMBERS  COMP-3  PIC S9(02)  VALUE +1.                
           05  IN-BRCH-ACCT-TC.                                                 
               10  IN-BRCH-ACCT.                                                
                   15  IN-BRCH             PIC  X(03).                          
                   15  IN-ACCT             PIC  X(05).                          
               10  IN-TC.                                                       
                   15  IN-T                PIC  X(01).                          
                   15  IN-C                PIC  X(01).                          
           05  OUT-BRCH-ACCT-TC.                                                
               10  OUT-BRCH-ACCT           PIC  X(08).                          
               10  OUT-TC                  PIC  X(02).                          
           05  EDIT-RETURN-CODE            PIC  X(01).                          
                                                                                
       01  WS-ERR-DATA.                                                         
           05  WS-REQUEST-TYPE             PIC X(01).                           
               88  WS-WRITE-ERROR-TO-LOG                VALUE 'Y'.              
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
                                                                                
           EJECT                                                                
           COPY ACAT1FIO.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDRGST                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDNA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDPYBL                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              DECLARE NA_CRSR CURSOR FOR                                        
              SELECT  CUST_NA_LINE_TXT,                                         
                      NA_LINE_NBR                                               
              FROM    VFNDNA                                                    
              WHERE   CLIENT_NBR       = :WS-CLIENT-NBR       AND               
                      ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR AND               
                      ASSET_SEQ_NBR    = :WS-ASSET-SEQ-NBR                      
              ORDER BY NA_LINE_NBR                                              
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA                      PIC  X(2000).                       
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           MOVE DFHCOMMAREA                 TO  ACAT1FIO-COMMAREA.              
                                                                                
           SET ACAT1FIO-DB2-RETURN-OK       TO  TRUE.                           
           MOVE +0                          TO   SQLCODE.                       
                                                                                
           IF ACAT1FIO-READ-DATABASE                                            
              PERFORM SELECT-FROM-VFNDRGST                                      
              IF ACAT1FIO-DB2-RETURN-OK                                         
                 PERFORM FETCH-FROM-VFNDNA                                      
                 PERFORM SELECT-FROM-VFNDPYBL                                   
              END-IF                                                            
           ELSE                                                                 
              PERFORM UPDATE-VFNDRGST                                           
              IF ACAT1FIO-DB2-RETURN-OK                                         
                 PERFORM UPDATE-VFNDNA                                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE ACAT1FIO-COMMAREA           TO  DFHCOMMAREA.                    
                                                                                
           EXEC CICS  RETURN  END-EXEC.                                         
                                                                                
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-VFNDRGST.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT DLVR_NBR,                                                  
                     BRKR_EXCTG_NBR,                                            
                     FUND_BK_CD,                                                
                     BRCH_NBR,                                                  
                     ISIN_SEC_ISSUE_CD,                                         
                     ACCT_RR_CD,                                                
                     ACCT_RR_NM,                                                
                     NTWRK_CNTL_CD,                                             
                     DVDND_CD,                                                  
                     STCG_CD,                                                   
                     LTCG_CD,                                                   
                     NAV_ACCT_IND,                                              
                     ROA_LOI_CD,                                                
                     ROA_LOI_AMT,                                               
                     LOI_DT,                                                    
                     SOC_CD,                                                    
                     SL_ST_CD,                                                  
                     FNBR,                                                      
                     SS_TIN_NBR,                                                
                     SS_TIN_CD,                                                 
                     WTHLD_CD,                                                  
                     NRA_TAX_PCT,                                               
                     PYBL_INFO_CD,                                              
                     PYBL_QTY,                                                  
                     CHCK_WRTNG_IND,                                            
                     CUST_NM,                                                   
                     ZIP5_CD,                                                   
                     ZIP4_CD,                                                   
                     ACCT_RLTD_NBR,                                             
                     ACCT_RLTD_CD,                                              
                     NM_END_LN_QTY,                                             
                     NSCC_PEND_CD                                               
              INTO  :ACAT1FIO-DLVR-NBR,                                         
                    :ACAT1FIO-BRKR-EXCTG-NBR,                                   
                    :ACAT1FIO-FUND-BK-CD,                                       
                    :ACAT1FIO-BRCH-NBR,                                         
                    :ACAT1FIO-ISIN-SEC-ISSUE-CD,                                
                    :ACAT1FIO-ACCT-RR-CD,                                       
                    :ACAT1FIO-ACCT-RR-NM,                                       
                    :ACAT1FIO-NTWRK-CNTL-CD,                                    
                    :ACAT1FIO-DVDND-CD,                                         
                    :ACAT1FIO-STCG-CD,                                          
                    :ACAT1FIO-LTCG-CD,                                          
                    :ACAT1FIO-NAV-ACCT-IND,                                     
                    :ACAT1FIO-ROA-LOI-CD,                                       
                    :WS-RL-AMT-PCKD,                                            
                    :WS-LOI-DT-10,                                              
                    :ACAT1FIO-SOC-CD,                                           
                    :ACAT1FIO-SL-ST-CD,                                         
                    :ACAT1FIO-FNBR,                                             
                    :ACAT1FIO-SS-TIN-NBR,                                       
                    :ACAT1FIO-SS-TIN-CD,                                        
                    :ACAT1FIO-WTHLD-CD,                                         
                    :WS-NRA-TAX-PCT,                                            
                    :ACAT1FIO-PYBL-INFO-CD,                                     
                    :WS-PYBL-QTY,                                               
                    :ACAT1FIO-CHCK-WRTNG-IND,                                   
                    :ACAT1FIO-CUST-NM,                                          
                    :ACAT1FIO-ZIP5-CD,                                          
                    :ACAT1FIO-ZIP4-CD,                                          
                    :ACAT1FIO-ACCT-RLTD-NBR,                                    
                    :ACAT1FIO-ACCT-RLTD-CD,                                     
                    :ACAT1FIO-NM-END-LN-QTY,                                    
                    :ACAT1FIO-NSCC-PEND-CD                                      
              FROM  VFNDRGST                                                    
              WHERE CLIENT_NBR       = :ACAT1FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT1FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT1FIO-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           ELSE                                                                 
              MOVE WS-NRA-TAX-PCT           TO  ACAT1FIO-NRA-TAX-PCT-1          
              MOVE WS-RL-AMT-PCKD           TO  WS-RL-AMT                       
              MOVE WS-RL-AMT-INT            TO  WS-ROA-LOI-AMT-INT              
              MOVE WS-RL-AMT-FRAC           TO  WS-ROA-LOI-AMT-FRAC             
              MOVE WS-ROA-LOI-AMT           TO  ACAT1FIO-ROA-LOI-AMT            
              MOVE WS-LOI-10-CCYY           TO  WS-LOI-8-CCYY                   
              MOVE WS-LOI-10-MM             TO  WS-LOI-8-MM                     
              MOVE WS-LOI-10-DD             TO  WS-LOI-8-DD                     
              MOVE WS-LOI-DT                TO  ACAT1FIO-LOI-DT                 
              MOVE WS-PYBL-QTY              TO  ACAT1FIO-PYBL-QTY               
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              SELECT CSH_MGN_SHRT_CD                                            
              INTO  :WS-CSH-MGN-SHRT-CD                                         
              FROM   VASSET                                                     
              WHERE CLIENT_NBR       = :ACAT1FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT1FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT1FIO-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              EVALUATE WS-CSH-MGN-SHRT-CD                                       
                 WHEN 'C'                                                       
                    MOVE '1'                TO  IN-T                            
                 WHEN 'M'                                                       
                    MOVE '2'                TO  IN-T                            
                 WHEN 'S'                                                       
                    MOVE '5'                TO  IN-T                            
                 WHEN OTHER                                                     
                    MOVE '1'                TO  IN-T                            
              END-EVALUATE                                                      
              MOVE ACAT1FIO-BRANCH          TO  IN-BRCH                         
              MOVE ACAT1FIO-ACCOUNT         TO  IN-ACCT                         
              MOVE 'X'                      TO  IN-C                            
              EXEC CICS LINK PROGRAM('EDITMOD')                                 
                             COMMAREA(WS-EDIT-MOD)                              
              END-EXEC                                                          
              MOVE OUT-TC                   TO  ACAT1FIO-TC                     
           END-IF.                                                              
                                                                                
                                                                                
                                                                                
       EJECT                                                                    
      *******************                                                       
       FETCH-FROM-VFNDNA.                                                       
      *******************                                                       
                                                                                
           MOVE ACAT1FIO-CLIENT-NBR         TO  WS-CLIENT-NBR.                  
           MOVE ACAT1FIO-ACAT-CONTROL-NBR   TO  WS-ACAT-CONTROL-NBR.            
           MOVE ACAT1FIO-ASSET-SEQ-NBR      TO  WS-ASSET-SEQ-NBR.               
           MOVE ZERO                        TO  S1.                             
                                                                                
           EXEC SQL                                                             
              OPEN NA_CRSR                                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           ELSE                                                                 
              PERFORM UNTIL SQLCODE NOT = +0                                    
                 EXEC SQL                                                       
                    FETCH NA_CRSR                                               
                    INTO :WS-NA-LINE-TXT,                                       
                         :WS-NA-LINE-NBR                                        
                 END-EXEC                                                       
                 IF SQLCODE = +0                                                
                    ADD 1                   TO  S1                              
                    MOVE WS-NA-LINE-TXT     TO  ACAT1FIO-NA-LINE (S1)           
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +100                                                    
              IF S1 = 0                                                         
                 MOVE ZERO                  TO  ACAT1FIO-NA-LINES-NBR           
                 MOVE SPACES                TO  ACAT1FIO-NA-TABLE               
              ELSE                                                              
                 MOVE S1                    TO  ACAT1FIO-NA-LINES-NBR           
              END-IF                                                            
              MOVE +0                       TO  SQLCODE                         
              EXEC SQL CLOSE NA_CRSR  END-EXEC                                  
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-VFNDPYBL.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT   MAX(PYBL_NBR)                                            
                 INTO :WS-PYBL-QTY                                              
                 FROM  VFNDPYBL                                                 
                 WHERE CLIENT_NBR       = :WS-CLIENT-NBR       AND              
                       ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR AND              
                       ASSET_SEQ_NBR    = :WS-ASSET-SEQ-NBR                     
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE 0                        TO  ACAT1FIO-PYBL-QTY               
           ELSE                                                                 
              MOVE WS-PYBL-QTY              TO  ACAT1FIO-PYBL-QTY               
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDRGST.                                                         
      *****************                                                         
                                                                                
           MOVE ACAT1FIO-NRA-TAX-PCT-1      TO  WS-NRA-TAX-PCT                  
      *    MOVE ACAT1FIO-ROA-LOI-AMT        TO  WS-ROA-LOI-AMT                  
      *    INSPECT WS-ROA-LOI-AMT                                               
      *       REPLACING LEADING SPACES BY ZEROES                                
      *    MOVE WS-ROA-LOI-AMT-INT-1        TO  WS-ROA-LOI-AMT-INT              
      *    MOVE WS-ROA-LOI-AMT-FRAC-1       TO  WS-ROA-LOI-AMT-FRAC             
      *    MOVE WS-ROA-LOI-AMT-UNPCKD       TO  WS-ROA-LOI-AMT-PCKD             
           IF ACAT1FIO-ROA-LOI-AMT = '00000000000000.00'                        
              MOVE ZERO                     TO  WS-RL-AMT-PCKD                  
           ELSE                                                                 
              MOVE ACAT1FIO-INT-COUNT       TO  S1                              
              MOVE ACAT1FIO-ROA-LOI-AMT (1:(S1 - 1))                            
                                            TO  WS-RL-AMT-INT                   
              MOVE ACAT1FIO-ROA-LOI-AMT ((S1 + 1):2)                            
                                            TO  WS-RL-AMT-FRAC                  
              MOVE WS-RL-AMT                TO  WS-RL-AMT-PCKD                  
           END-IF.                                                              
           MOVE ACAT1FIO-PYBL-QTY           TO  WS-PYBL-QTY                     
           MOVE ACAT1FIO-LOI-DT             TO  WS-LOI-DT                       
           MOVE WS-LOI-8-CCYY               TO  WS-LOI-10-CCYY                  
           MOVE WS-LOI-8-MM                 TO  WS-LOI-10-MM                    
           MOVE WS-LOI-8-DD                 TO  WS-LOI-10-DD                    
           MOVE '-'                         TO  WS-LOI-10-SEP1                  
                                                WS-LOI-10-SEP2                  
                                                                                
           EXEC SQL                                                             
             UPDATE VFNDRGST                                                    
                SET ACAT_CONTROL_NBR  = :ACAT1FIO-ACAT-CONTROL-NBR,             
                    DLVR_NBR          = :ACAT1FIO-DLVR-NBR,                     
                    BRKR_EXCTG_NBR    = :ACAT1FIO-BRKR-EXCTG-NBR,               
                    FUND_BK_CD        = :ACAT1FIO-FUND-BK-CD,                   
                    BRCH_NBR          = :ACAT1FIO-BRCH-NBR,                     
                    ISIN_SEC_ISSUE_CD = :ACAT1FIO-ISIN-SEC-ISSUE-CD,            
                    ACCT_RR_CD        = :ACAT1FIO-ACCT-RR-CD,                   
                    ACCT_RR_NM        = :ACAT1FIO-ACCT-RR-NM,                   
                    NTWRK_CNTL_CD     = :ACAT1FIO-NTWRK-CNTL-CD,                
                    DVDND_CD          = :ACAT1FIO-DVDND-CD,                     
                    STCG_CD           = :ACAT1FIO-STCG-CD,                      
                    LTCG_CD           = :ACAT1FIO-LTCG-CD,                      
                    NAV_ACCT_IND      = :ACAT1FIO-NAV-ACCT-IND,                 
                    ROA_LOI_CD        = :ACAT1FIO-ROA-LOI-CD,                   
      *             ROA_LOI_AMT       = :WS-ROA-LOI-AMT-PCKD,                   
                    ROA_LOI_AMT       = :WS-RL-AMT-PCKD,                        
                    LOI_DT            = :WS-LOI-DT-10,                          
                    SOC_CD            = :ACAT1FIO-SOC-CD,                       
                    SL_ST_CD          = :ACAT1FIO-SL-ST-CD,                     
                    SS_TIN_NBR        = :ACAT1FIO-SS-TIN-NBR,                   
                    SS_TIN_CD         = :ACAT1FIO-SS-TIN-CD,                    
                    WTHLD_CD          = :ACAT1FIO-WTHLD-CD,                     
                    NRA_TAX_PCT       = :WS-NRA-TAX-PCT,                        
                    FNBR              = :ACAT1FIO-FNBR,                         
                    PYBL_INFO_CD      = :ACAT1FIO-PYBL-INFO-CD,                 
                    PYBL_QTY          = :WS-PYBL-QTY,                           
                    CHCK_WRTNG_IND    = :ACAT1FIO-CHCK-WRTNG-IND,               
                    CUST_NM           = :ACAT1FIO-CUST-NM,                      
                    ZIP5_CD           = :ACAT1FIO-ZIP5-CD,                      
                    ZIP4_CD           = :ACAT1FIO-ZIP4-CD,                      
                    ACCT_RLTD_NBR     = :ACAT1FIO-ACCT-RLTD-NBR,                
                    ACCT_RLTD_CD      = :ACAT1FIO-ACCT-RLTD-CD,                 
                    NM_END_LN_QTY     = :ACAT1FIO-NM-END-LN-QTY,                
                    NSCC_PEND_CD      = :ACAT1FIO-NSCC-PEND-CD,                 
                    UPDT_TMSTP        = CURRENT TIMESTAMP                       
                 WHERE CLIENT_NBR       = :ACAT1FIO-CLIENT-NBR  AND             
                       ACAT_CONTROL_NBR = :ACAT1FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT1FIO-ASSET-SEQ-NBR               
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       UPDATE-VFNDNA.                                                           
      ***************                                                           
                                                                                
           MOVE 1                            TO  S1.                            
           MOVE EIBTRMID                     TO  WS-TERM-ID.                    
           MOVE '2'                          TO  WS-STTS.                       
           SET STOP-NOT-OK                   TO  TRUE.                          
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL S1 > ACAT1FIO-NA-LINES-NBR OR  STOP-OK                      
              MOVE ACAT1FIO-NA-LINE (S1)    TO  WS-NA-LINE-TXT                  
              MOVE S1                       TO  WS-NA-LINE-NBR                  
              EXEC SQL                                                          
                 UPDATE VFNDNA                                                  
                    SET CUST_NA_LINE_TXT = :WS-NA-LINE-TXT,                     
                        UPDT_TMSTP       =  CURRENT TIMESTAMP                   
                 WHERE CLIENT_NBR       = :ACAT1FIO-CLIENT-NBR       AND        
                       ACAT_CONTROL_NBR = :ACAT1FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT1FIO-ASSET-SEQ-NBR    AND        
                       NA_LINE_NBR      = :WS-NA-LINE-NBR                       
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    CONTINUE                                                    
                 WHEN 100                                                       
                    EXEC SQL                                                    
                        INSERT INTO VFNDNA                                      
                           (CLIENT_NBR,                                         
                            ACAT_CONTROL_NBR,                                   
                            ASSET_SEQ_NBR,                                      
                            NA_LINE_NBR,                                        
                            CUST_NA_LINE_TXT,                                   
                            PRGM_NM,                                            
                            CICS_TERM_ID_CD,                                    
                            CRT_TMSTP,                                          
                            UPDT_TMSTP,                                         
                            CUST_NA_STTS_CD)                                    
                        VALUES                                                  
                           (:ACAT1FIO-CLIENT-NBR,                               
                            :ACAT1FIO-ACAT-CONTROL-NBR,                         
                            :ACAT1FIO-ASSET-SEQ-NBR,                            
                            :WS-NA-LINE-NBR,                                    
                            :WS-NA-LINE-TXT,                                    
                            'ACAT1FDB',                                         
                            :WS-TERM-ID,                                        
                             CURRENT TIMESTAMP,                                 
                             CURRENT TIMESTAMP,                                 
                            :WS-STTS)                                           
                    END-EXEC                                                    
                    IF SQLCODE NOT = +0                                         
                       PERFORM DB2-ERROR-ROUTINE                                
                       SET STOP-OK          TO  TRUE                            
                    END-IF                                                      
                 WHEN OTHER                                                     
                    PERFORM DB2-ERROR-ROUTINE                                   
                    SET STOP-OK             TO  TRUE                            
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           MOVE ACAT1FIO-NA-LINES-NBR       TO  WS-NA-LINE-NBR.                 
           SET STOP-NOT-OK                  TO  TRUE.                           
                                                                                
           IF ACAT1FIO-DELETE                                                   
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > ACAT1FIO-NA-LINES-DELETE  OR                        
                 STOP-OK OR S1 > 6                                              
                 ADD 1                      TO  WS-NA-LINE-NBR                  
                 EXEC SQL DELETE                                                
                    FROM VFNDNA                                                 
                    WHERE CLIENT_NBR    = :ACAT1FIO-CLIENT-NBR       AND        
                       ACAT_CONTROL_NBR = :ACAT1FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT1FIO-ASSET-SEQ-NBR    AND        
                       NA_LINE_NBR      = :WS-NA-LINE-NBR                       
                 END-EXEC                                                       
                 IF SQLCODE NOT = +0                                            
                    PERFORM DB2-ERROR-ROUTINE                                   
                    SET STOP-OK             TO  TRUE                            
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           SET ACAT1FIO-DB2-BAD-RETURN      TO  TRUE.                           
           MOVE SQLCODE                     TO ACAT1FIO-DB2-RETURN-CODE.        
                                                                                
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
       HANG-CICS.                                                               
           GOBACK.                                                              
