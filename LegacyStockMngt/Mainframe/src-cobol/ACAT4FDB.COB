000001* PDX    - ACAT4FDB C0214488 12/08/04 12:45:08 TBLAMUR            00001000
000001* PDX    - ACAT4FDB C0119770 12/28/98 11:37:25 TBTARYB            00001000
000001* PDX    - ACAT4FDB C0118708 12/21/98 15:51:26 TBTARYB            00001000
000001* PDX    - ACAT4FDB C0113942 11/11/98 13:55:14 TBTARYB            00001000
000001* PDX    - ACAT4FDB C0117820 11/06/98 16:32:28 TBTARYB            00001000
000001* PDX    - ACAT4FDB C0113942 10/30/98 13:25:23 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT4FDB.                                                 
                                                                                
      *****************************************************************         
      * DB2 I/O PGM: FUND/SERV "PAYABLES" SCREEN                      *         
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
                                                                                
       77  WS-PYBL-CNTR                        PIC  9(01)   VALUE ZERO.         
       77  S1                                  PIC  9(01)   VALUE ZERO.         
       77  S2                                  PIC  9(01)   VALUE ZERO.         
       77  STOP-FLAG                           PIC  X(01).                      
           88  STOP-ON                                      VALUE '1'.          
           88  STOP-OFF                                     VALUE '2'.          
       77  STOP-SW                             PIC  X(01).                      
           88  STOP-OK                                      VALUE '1'.          
           88  STOP-NOT-OK                                  VALUE '2'.          
       77  WS-TERM-ID                          PIC  X(01).                      
       77  WS-PGM-NAME                         PIC  X(08).                      
       77  OLD-PYBL-NBR                        PIC S9(04)  COMP VALUE 0.        
       77  NEW-PYBL-NBR                        PIC S9(04)  COMP VALUE 0.        
       77  WS-DELETE-CNTR                      PIC  9(01)  VALUE 0.             
       77  WS-DELETE-LIT                       PIC  X(20)  VALUE                
           '--------------------'.                                              
                                                                                
       01  FILLER.                                                              
           05  WS-CLIENT-NBR                   PIC  X(04).                      
           05  WS-ACAT-CONTROL-NBR             PIC  X(14).                      
           05  WS-ASSET-SEQ-NBR                PIC S9(04)  COMP VALUE 0.        
           05  WS-PYBL-NBR                     PIC S9(04)  COMP VALUE 0.        
           05  WS-NA-LINE-NBR                  PIC S9(04)  COMP VALUE 0.        
           05  WS-NA-LINE-TXT                  PIC  X(35).                      
                                                                                
       01  WS-PYBL-AREA.                                                        
           05  FILLER                          PIC  X(01).                      
           05  WS-ACCT-NBR                     PIC  X(20).                      
           05  WS-ZIP5-CD                      PIC  X(05).                      
           05  WS-ACCT-PYBL-CD                 PIC  X(01).                      
           05  WS-ADDRS-DVDND-IND              PIC  X(01).                      
           05  WS-ADDRS-SYSWL-IND              PIC  X(01).                      
           05  WS-ADDRS-ATMDF-IND              PIC  X(01).                      
           05  WS-CRSS-FND-RNVST-IND           PIC  X(01).                      
           05  WS-ALTNT-PYBL-IND               PIC  X(01).                      
           05  WS-PYBL-SEC-ISSUE-CD            PIC  X(09).                      
           05  WS-PYBL-ALTNT-CD                PIC  X(01).                      
           05  WS-PYBL-ALTNT-RSN-TXT           PIC  X(20).                      
           05  WS-PYBL-NA-LINE-CNTR            PIC  9(01).                      
           05  WS-NA-LINE OCCURS 6 TIMES       PIC  X(35).                      
                                                                                
       01  WS-ERR-DATA.                                                         
           05  WS-REQUEST-TYPE             PIC X(01).                           
               88  WS-WRITE-ERROR-TO-LOG                VALUE 'Y'.              
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
                                                                                
           EJECT                                                                
           COPY ACAT4FIO.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDRGST                                                  
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE VFNDPYBL                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDPYNA                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              DECLARE PYBL_CRSR CURSOR FOR                                      
                 SELECT PYBL_NBR,                                               
                        ACCT_NBR,                                               
                        ZIP5_CD,                                                
                        ACCT_PYBL_CD,                                           
                        ADDRS_DVDND_IND,                                        
                        ADDRS_SYSWL_IND,                                        
                        ADDRS_ATMDF_IND,                                        
                        CRSS_FND_RNVST_IND,                                     
                        ALTNT_PYBL_IND,                                         
                        ISIN_SEC_ISSUE_CD,                                      
                        PYBL_ALTNT_CD,                                          
                        PYBL_ALTNT_RSN_TXT                                      
                 FROM  VFNDPYBL                                                 
                 WHERE CLIENT_NBR       = :WS-CLIENT-NBR       AND              
                       ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR AND              
                       ASSET_SEQ_NBR    = :WS-ASSET-SEQ-NBR                     
                 ORDER BY PYBL_NBR                                              
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              DECLARE NA_CRSR CURSOR FOR                                        
              SELECT  PYBL_NA_LINE_TXT,                                         
                      NA_LINE_NBR                                               
              FROM    VFNDPYNA                                                  
              WHERE   CLIENT_NBR       = :WS-CLIENT-NBR       AND               
                      ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR AND               
                      ASSET_SEQ_NBR    = :WS-ASSET-SEQ-NBR    AND               
                      PYBL_NBR         = :WS-PYBL-NBR                           
              ORDER BY NA_LINE_NBR                                              
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA                      PIC X(2000).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           MOVE DFHCOMMAREA                 TO  ACAT4FIO-COMMAREA.              
                                                                                
           SET ACAT4FIO-DB2-RETURN-OK       TO  TRUE.                           
           MOVE +0                          TO  SQLCODE.                        
                                                                                
           IF ACAT4FIO-READ-DATABASE                                            
              PERFORM FETCH-FROM-VFNDPYBL                                       
           ELSE                                                                 
              PERFORM UPDATE-VFNDRGST                                           
              EVALUATE TRUE                                                     
                 WHEN ACAT4FIO-ADD-PAYABLE                                      
                    PERFORM ADD-PAYABLE                                         
                    SET ACAT4FIO-ACTION-NONE TO TRUE                            
                 WHEN ACAT4FIO-DELETE-PAYABLE                                   
                    PERFORM RECALCULATE-PYBL-NBR                                
                       THRU RECALCULATE-PYBL-NBR-EXIT                           
                    SET ACAT4FIO-ACTION-NONE TO  TRUE                           
                 WHEN OTHER                                                     
                    COMPUTE WS-PYBL-NBR = ACAT4FIO-PAGE-NBR * 2 - 1             
                    PERFORM UPDATE-VFNDPYBL                                     
                    ADD 1                   TO  WS-PYBL-NBR                     
                    IF WS-PYBL-NBR <= ACAT4FIO-PYBL-QTY                         
                       PERFORM UPDATE-VFNDPYBL                                  
                    END-IF                                                      
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           MOVE ACAT4FIO-COMMAREA           TO  DFHCOMMAREA.                    
           EXEC CICS  RETURN  END-EXEC.                                         
                                                                                
                                                                                
           EJECT                                                                
      **********************                                                    
       FETCH-FROM-VFNDPYBL.                                                     
      **********************                                                    
                                                                                
           MOVE 0                           TO  WS-PYBL-NBR.                    
           MOVE ACAT4FIO-CLIENT-NBR         TO  WS-CLIENT-NBR.                  
           MOVE ACAT4FIO-ACAT-CONTROL-NBR   TO  WS-ACAT-CONTROL-NBR.            
           MOVE ACAT4FIO-ASSET-SEQ-NBR      TO  WS-ASSET-SEQ-NBR.               
                                                                                
           EXEC SQL  OPEN PYBL_CRSR  END-EXEC.                                  
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              INITIALIZE WS-PYBL-AREA                                           
              EXEC SQL                                                          
                 FETCH PYBL_CRSR                                                
                 INTO  :WS-PYBL-NBR,                                            
                       :WS-ACCT-NBR,                                            
                       :WS-ZIP5-CD,                                             
                       :WS-ACCT-PYBL-CD,                                        
                       :WS-ADDRS-DVDND-IND,                                     
                       :WS-ADDRS-SYSWL-IND,                                     
                       :WS-ADDRS-ATMDF-IND,                                     
                       :WS-CRSS-FND-RNVST-IND,                                  
                       :WS-ALTNT-PYBL-IND,                                      
                       :WS-PYBL-SEC-ISSUE-CD,                                   
                       :WS-PYBL-ALTNT-CD,                                       
                       :WS-PYBL-ALTNT-RSN-TXT                                   
              END-EXEC                                                          
              IF SQLCODE = +0                                                   
                 MOVE WS-PYBL-AREA          TO  ACAT4FIO-PYBL-BODY              
                                                (WS-PYBL-NBR)                   
                 PERFORM FETCH-FROM-VFNDPYNA                                    
                 IF SQLCODE = +100                                              
                    MOVE +0                 TO  SQLCODE                         
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE = +100                                                    
              MOVE WS-PYBL-NBR              TO  ACAT4FIO-PYBL-QTY               
              MOVE +0                       TO  SQLCODE                         
              EXEC SQL CLOSE PYBL_CRSR  END-EXEC                                
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
       EJECT                                                                    
      *********************                                                     
       FETCH-FROM-VFNDPYNA.                                                     
      *********************                                                     
                                                                                
           EXEC SQL  OPEN NA_CRSR  END-EXEC.                                    
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           MOVE 0                          TO  WS-NA-LINE-NBR.                  
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              INITIALIZE WS-NA-LINE-TXT                                         
              EXEC SQL                                                          
                 FETCH NA_CRSR                                                  
                 INTO :WS-NA-LINE-TXT,                                          
                      :NA-LINE-NBR                                              
              END-EXEC                                                          
              IF SQLCODE = +0                                                   
                 MOVE WS-NA-LINE-TXT        TO  ACAT4FIO-PYBL-NA-LINE           
                                           (WS-PYBL-NBR, WS-NA-LINE-NBR)        
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF SQLCODE = +100                                                    
      *       IF WS-NA-LINE-NBR > 0                                             
      *          MOVE WS-NA-LINE-NBR       TO ACAT4FIO-PYBL-NA-LINE-CNTR        
      *                                   (WS-PYBL-NBR)                         
      *       ELSE                                                              
                 MOVE ZERO                 TO ACAT4FIO-PYBL-NA-LINE-CNTR        
                                          (WS-PYBL-NBR)                         
      *       END-IF                                                            
              MOVE +0                      TO  SQLCODE                          
              EXEC SQL CLOSE NA_CRSR  END-EXEC                                  
              IF SQLCODE NOT = +0                                               
                 SET ACAT4FIO-DB2-BAD-RETURN TO TRUE                            
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
           ELSE                                                                 
              SET ACAT4FIO-DB2-BAD-RETURN   TO  TRUE                            
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDRGST.                                                         
      *****************                                                         
                                                                                
           EXEC SQL  UPDATE VFNDRGST                                            
              SET NSCC_PEND_CD = :ACAT4FIO-NSCC-PEND-CD                         
              WHERE CLIENT_NBR       = :ACAT4FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDPYBL.                                                         
      *****************                                                         
                                                                                
           MOVE ACAT4FIO-PYBL-BODY (WS-PYBL-NBR) TO WS-PYBL-AREA.               
                                                                                
           EXEC SQL  UPDATE VFNDPYBL                                            
              SET ACCT_NBR            = :WS-ACCT-NBR,                           
                  ZIP5_CD             = :WS-ZIP5-CD,                            
                  ACCT_PYBL_CD        = :WS-ACCT-PYBL-CD,                       
                  ADDRS_DVDND_IND     = :WS-ADDRS-DVDND-IND,                    
                  ADDRS_SYSWL_IND     = :WS-ADDRS-SYSWL-IND,                    
                  ADDRS_ATMDF_IND     = :WS-ADDRS-ATMDF-IND,                    
                  CRSS_FND_RNVST_IND  = :WS-CRSS-FND-RNVST-IND,                 
                  ALTNT_PYBL_IND      = :WS-ALTNT-PYBL-IND,                     
                  ISIN_SEC_ISSUE_CD   = :WS-PYBL-SEC-ISSUE-CD,                  
                  PYBL_ALTNT_CD       = :WS-PYBL-ALTNT-CD,                      
                  PYBL_ALTNT_RSN_TXT  = :WS-PYBL-ALTNT-RSN-TXT                  
              WHERE CLIENT_NBR       = :ACAT4FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR     AND          
                    PYBL_NBR         = :WS-PYBL-NBR                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              PERFORM PROCESS-UPDATE-VFNDPYNA                                   
           ELSE                                                                 
              SET ACAT4FIO-DB2-BAD-RETURN TO  TRUE                              
              SET STOP-ON                 TO  TRUE                              
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *************************                                                 
       PROCESS-UPDATE-VFNDPYNA.                                                 
      *************************                                                 
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
                                                                                
           EVALUATE ACAT4FIO-ACTION (WS-PYBL-NBR)                               
              WHEN 'N'                                                          
                 PERFORM UPDATE-VFNDPYNA                                        
              WHEN 'A'                                                          
                 MOVE ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR)                  
                                             TO  WS-NA-LINE-NBR                 
                 PERFORM VARYING S1 FROM 1 BY 1                                 
                    UNTIL S1 > ACAT4FIO-NA-CNTR (WS-PYBL-NBR) OR                
                    STOP-OK                                                     
                    ADD 1                   TO  WS-NA-LINE-NBR                  
                    MOVE ACAT4FIO-PYBL-NA-LINE                                  
                    (WS-PYBL-NBR, WS-NA-LINE-NBR)                               
                                            TO  WS-NA-LINE-TXT                  
                    PERFORM INSERT-VFNDPYNA                                     
                    IF SQLCODE NOT = +0                                         
                       PERFORM DB2-ERROR-ROUTINE                                
                       SET STOP-OK          TO  TRUE                            
                    END-IF                                                      
                 END-PERFORM                                                    
                 PERFORM UPDATE-VFNDPYNA                                        
                 COMPUTE ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR) =             
                         ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR) +             
                         ACAT4FIO-NA-CNTR (WS-PYBL-NBR)                         
              WHEN 'D'                                                          
                 COMPUTE ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR) =             
                         ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR) -             
                         ACAT4FIO-NA-CNTR (WS-PYBL-NBR)                         
                 MOVE ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR)                  
                                             TO  WS-NA-LINE-NBR                 
                 PERFORM VARYING S1 FROM 1 BY 1                                 
                    UNTIL S1 > ACAT4FIO-NA-CNTR (WS-PYBL-NBR) OR                
                    STOP-OK                                                     
                    ADD 1                   TO  WS-NA-LINE-NBR                  
                    PERFORM DELETE-VFNDPYNA                                     
                    IF SQLCODE NOT = +0                                         
                       PERFORM DB2-ERROR-ROUTINE                                
                       SET STOP-OK          TO  TRUE                            
                    END-IF                                                      
                 END-PERFORM                                                    
                 PERFORM UPDATE-VFNDPYNA                                        
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDPYNA.                                                         
      *****************                                                         
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL S1 > ACAT4FIO-PYBL-NA-LINE-CNTR (WS-PYBL-NBR) OR            
              STOP-OK                                                           
              MOVE ACAT4FIO-PYBL-NA-LINE (WS-PYBL-NBR, S1)                      
                                            TO  WS-NA-LINE-TXT                  
              MOVE S1                       TO  WS-NA-LINE-NBR                  
              MOVE EIBTRMID                 TO  WS-TERM-ID                      
              EXEC SQL UPDATE VFNDPYNA                                          
                 SET PYBL_NA_LINE_TXT   = :WS-NA-LINE-TXT,                      
                     CICS_TERM_ID_CD    = :WS-TERM-ID,                          
                     UPDT_TMSTP         =  CURRENT TIMESTAMP                    
                 WHERE CLIENT_NBR       = :ACAT4FIO-CLIENT-NBR       AND        
                       ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR    AND        
                       PYBL_NBR         = :WS-PYBL-NBR               AND        
                       NA_LINE_NBR      = :WS-NA-LINE-NBR                       
              END-EXEC                                                          
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
                 SET STOP-OK                TO  TRUE                            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *****************                                                         
       INSERT-VFNDPYNA.                                                         
      *****************                                                         
                                                                                
           EXEC SQL                                                             
              INSERT INTO VFNDPYNA                                              
                 ( CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,PYBL_NBR                                                     
                  ,NA_LINE_NBR                                                  
                  ,PYBL_NA_LINE_TXT                                             
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,PYBL_NA_LN_STTS_CD                                           
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM)                                                     
              VALUES                                                            
                 ( :ACAT4FIO-CLIENT-NBR                                         
                  ,:ACAT4FIO-ACAT-CONTROL-NBR                                   
                  ,:ACAT4FIO-ASSET-SEQ-NBR                                      
                  ,:WS-PYBL-NBR                                                 
                  ,:WS-NA-LINE-NBR                                              
                  ,:WS-NA-LINE-TXT                                              
                  ,CURRENT TIMESTAMP                                            
                  ,CURRENT TIMESTAMP                                            
                  ,'1'                                                          
                  ,:WS-TERM-ID                                                  
                  ,'ACAT4FDB')                                                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              SET STOP-OK                   TO  TRUE                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       DELETE-VFNDPYNA.                                                         
      *****************                                                         
           EXEC SQL DELETE                                                      
              FROM VFNDPYNA                                                     
                 WHERE CLIENT_NBR    = :ACAT4FIO-CLIENT-NBR       AND           
                       ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR    AND        
                       PYBL_NBR         = :WS-PYBL-NBR               AND        
                       NA_LINE_NBR      = :WS-NA-LINE-NBR                       
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       ADD-PAYABLE.                                                             
      *************                                                             
                                                                                
           INITIALIZE DCLVFNDPYBL.                                              
           MOVE ACAT4FIO-PYBL-QTY           TO  WS-PYBL-NBR.                    
           MOVE ACAT4FIO-PYBL-BODY (WS-PYBL-NBR) TO WS-PYBL-AREA.               
           MOVE EIBTRMID                    TO  WS-TERM-ID.                     
           MOVE 'ACAT4FDB'                  TO  WS-PGM-NAME.                    
                                                                                
           EXEC SQL                                                             
              INSERT INTO VFNDPYBL                                              
                 ( CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,PYBL_NBR                                                     
                  ,ACCT_NBR                                                     
                  ,ACCT_NBR_STTS_CD                                             
                  ,ZIP5_CD                                                      
                  ,ZIP5_STTS_CD                                                 
                  ,ZIP4_CD                                                      
                  ,ZIP4_STTS_CD                                                 
                  ,ADDRS_DVDND_IND                                              
                  ,ADDRS_SYSWL_IND                                              
                  ,ADDRS_ATMDF_IND                                              
                  ,CRSS_FND_RNVST_IND                                           
                  ,ALTNT_PYBL_IND                                               
                  ,ADDRS_OPTN_STTS_CD                                           
                  ,ACCT_PYBL_CD                                                 
                  ,ACCT_PYBL_STTS_CD                                            
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CDG_CD                                              
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,PYBL_ALTNT_CD                                                
                  ,PYBL_ALTNT_STTS_CD                                           
                  ,PYBL_ALTNT_RSN_TXT                                           
                  ,PYBL_ALT_RS_STS_CD                                           
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,SECURITY_ADP_NBR                                             
                  ,NA_END_LINE_IND                                              
                  ,NA_END_IND_STTS_CD)                                          
              VALUES                                                            
                 ( :ACAT4FIO-CLIENT-NBR                                         
                  ,:ACAT4FIO-ACAT-CONTROL-NBR                                   
                  ,:ACAT4FIO-ASSET-SEQ-NBR                                      
                  ,:WS-PYBL-NBR                                                 
                  ,:WS-ACCT-NBR                                                 
                  ,:DCLVFNDPYBL.ACCT-NBR-STTS-CD                                
                  ,:WS-ZIP5-CD                                                  
                  ,:DCLVFNDPYBL.ZIP5-STTS-CD                                    
                  ,:DCLVFNDPYBL.ZIP4-CD                                         
                  ,:DCLVFNDPYBL.ZIP4-STTS-CD                                    
                  ,:WS-ADDRS-DVDND-IND                                          
                  ,:WS-ADDRS-SYSWL-IND                                          
                  ,:WS-ADDRS-ATMDF-IND                                          
                  ,:WS-CRSS-FND-RNVST-IND                                       
                  ,:WS-ALTNT-PYBL-IND                                           
                  ,:DCLVFNDPYBL.ADDRS-OPTN-STTS-CD                              
                  ,:WS-ACCT-PYBL-CD                                             
                  ,:DCLVFNDPYBL.ACCT-PYBL-STTS-CD                               
                  ,:DCLVFNDPYBL.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDPYBL.ISIN-CNTRY-STTS-CD                              
                  ,:WS-PYBL-SEC-ISSUE-CD                                        
                  ,:DCLVFNDPYBL.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVFNDPYBL.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDPYBL.ISIN-SEC-CD-STS-CD                              
                  ,:WS-PYBL-ALTNT-CD                                            
                  ,:DCLVFNDPYBL.PYBL-ALTNT-STTS-CD                              
                  ,:WS-PYBL-ALTNT-RSN-TXT                                       
                  ,:DCLVFNDPYBL.PYBL-ALT-RS-STS-CD                              
                  ,CURRENT TIMESTAMP                                            
                  ,CURRENT TIMESTAMP                                            
                  ,:WS-TERM-ID                                                  
                  ,:WS-PGM-NAME                                                 
                  ,:DCLVFNDPYBL.SECURITY-ADP-NBR                                
                  ,:DCLVFNDPYBL.NA-END-LINE-IND                                 
                  ,:DCLVFNDPYBL.NA-END-IND-STTS-CD )                            
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL S1 > ACAT4FIO-NA-CNTR (WS-PYBL-NBR) OR                      
              STOP-OK                                                           
              MOVE ACAT4FIO-PYBL-NA-LINE (WS-PYBL-NBR, S1)                      
                                            TO  WS-NA-LINE-TXT                  
              MOVE S1                       TO  WS-NA-LINE-NBR                  
              PERFORM INSERT-VFNDPYNA                                           
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
                 SET STOP-OK                TO  TRUE                            
              END-IF                                                            
           END-PERFORM.                                                         
           MOVE ACAT4FIO-NA-CNTR (WS-PYBL-NBR)                                  
                                           TO ACAT4FIO-PYBL-NA-LINE-CNTR        
                                             (WS-PYBL-NBR).                     
                                                                                
           EJECT                                                                
      **********************                                                    
       RECALCULATE-PYBL-NBR.                                                    
      **********************                                                    
                                                                                
           MOVE EIBTRMID                   TO  WS-TERM-ID.                      
           MOVE 0                          TO  WS-DELETE-CNTR.                  
                                                                                
           COMPUTE WS-PYBL-NBR = ACAT4FIO-PAGE-NBR * 2 - 1.                     
                                                                                
           IF ACAT4FIO-ACCT-NBR (WS-PYBL-NBR) = WS-DELETE-LIT                   
              PERFORM DELETE-PAYABLE                                            
              ADD 1                         TO  WS-DELETE-CNTR                  
              IF WS-DELETE-CNTR >= ACAT4FIO-PYBL-QTY                            
                 MOVE ZERO                  TO  ACAT4FIO-PYBL-QTY               
                 INITIALIZE ACAT4FIO-PYABLES                                    
                 GO TO RECALCULATE-PYBL-NBR-EXIT                                
              END-IF                                                            
              IF WS-PYBL-NBR = ACAT4FIO-PYBL-QTY                                
                 SUBTRACT 1               FROM  ACAT4FIO-PYBL-QTY               
                 GO TO RECALCULATE-PYBL-NBR-EXIT                                
              END-IF                                                            
           END-IF.                                                              
                                                                                
           ADD 1                            TO  WS-PYBL-NBR.                    
                                                                                
           IF ACAT4FIO-ACCT-NBR (WS-PYBL-NBR) = WS-DELETE-LIT                   
              PERFORM DELETE-PAYABLE                                            
              ADD 1                         TO  WS-DELETE-CNTR                  
              IF WS-DELETE-CNTR = ACAT4FIO-PYBL-QTY                             
                 MOVE ZERO                  TO  ACAT4FIO-PYBL-QTY               
                 INITIALIZE ACAT4FIO-PYABLES                                    
                 GO TO RECALCULATE-PYBL-NBR-EXIT                                
              END-IF                                                            
              IF WS-PYBL-NBR = ACAT4FIO-PYBL-QTY                                
                 SUBTRACT WS-DELETE-CNTR  FROM  ACAT4FIO-PYBL-QTY               
                 GO TO RECALCULATE-PYBL-NBR-EXIT                                
              END-IF                                                            
                 ADD 1                      TO  WS-PYBL-NBR                     
           END-IF.                                                              
                                                                                
           PERFORM VARYING S1 FROM WS-PYBL-NBR BY 1                             
              UNTIL S1 > ACAT4FIO-PYBL-QTY                                      
              COMPUTE NEW-PYBL-NBR = S1 - WS-DELETE-CNTR                        
              MOVE ACAT4FIO-PYBL-BODY (S1)  TO  WS-PYBL-AREA                    
                                                ACAT4FIO-PYBL-BODY              
                                               (NEW-PYBL-NBR)                   
              MOVE S1                       TO  WS-PYBL-NBR                     
              EXEC SQL UPDATE VFNDPYBL                                          
                 SET PYBL_NBR        = :NEW-PYBL-NBR,                           
                     UPDT_TMSTP      =  CURRENT TIMESTAMP,                      
                     CICS_TERM_ID_CD = :WS-TERM-ID,                             
                     PRGM_NM         =  'ACAT4FDB'                              
                 WHERE CLIENT_NBR    = :ACAT4FIO-CLIENT-NBR          AND        
                       ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR    AND        
                       PYBL_NBR         = :WS-PYBL-NBR                          
              END-EXEC                                                          
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > WS-PYBL-NA-LINE-CNTR                                
                 MOVE S2                    TO  WS-NA-LINE-NBR                  
                 EXEC SQL UPDATE VFNDPYNA                                       
                    SET PYBL_NBR        = :NEW-PYBL-NBR,                        
                        UPDT_TMSTP      =  CURRENT TIMESTAMP,                   
                        CICS_TERM_ID_CD = :WS-TERM-ID,                          
                        PRGM_NM         =  'ACAT4FDB'                           
                    WHERE CLIENT_NBR =    :ACAT4FIO-CLIENT-NBR AND              
                       ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR    AND        
                       PYBL_NBR         = :WS-PYBL-NBR               AND        
                       NA_LINE_NBR      = :WS-NA-LINE-NBR                       
                 END-EXEC                                                       
                 IF SQLCODE NOT = +0                                            
                    PERFORM DB2-ERROR-ROUTINE                                   
                 END-IF                                                         
              END-PERFORM                                                       
           END-PERFORM.                                                         
                                                                                
           SUBTRACT WS-DELETE-CNTR    FROM  ACAT4FIO-PYBL-QTY.                  
                                                                                
      ***************************                                               
       RECALCULATE-PYBL-NBR-EXIT.                                               
      ***************************                                               
                                                                                
           EXIT.                                                                
                                                                                
           EJECT                                                                
      ****************                                                          
       DELETE-PAYABLE.                                                          
      ****************                                                          
                                                                                
           EXEC SQL DELETE                                                      
              FROM VFNDPYBL                                                     
              WHERE CLIENT_NBR       = :ACAT4FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT4FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT4FIO-ASSET-SEQ-NBR     AND          
                    PYBL_NBR         = :WS-PYBL-NBR                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           SET ACAT4FIO-DB2-BAD-RETURN      TO  TRUE.                           
           MOVE SQLCODE                     TO ACAT4FIO-DB2-RETURN-CODE.        
                                                                                
           MOVE SPACE                       TO  WS-ERR-DATA.                    
           SET WS-WRITE-ERROR-TO-LOG        TO  TRUE.                           
           MOVE EIBTRNID                    TO  CALLING-TRAN-ID.                
           MOVE 'ACAT4FDB'                  TO  CALLING-PROGRAM-ID.             
           MOVE SQLCA                       TO  SQLCA-AREA.                     
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
