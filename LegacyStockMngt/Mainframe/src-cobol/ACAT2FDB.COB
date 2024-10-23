000001* PDX    - ACAT2FDB C0214488 12/08/04 11:54:36 TBLAMUR            00001000
000001* PDX    - ACAT2FDB C0119770 12/28/98 11:35:45 TBTARYB            00001000
000001* PDX    - ACAT2FDB C0118708 12/21/98 15:48:56 TBTARYB            00001000
000001* PDX    - ACAT2FDB C0113942 10/30/98 13:20:46 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT2FDB.                                                 
                                                                                
      *****************************************************************         
      * DB2 I/O PGM: FUND/SERV "RECEIVER REGISTRATION ADD 2" SCREEN   *         
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
                                                                                
       01  WS-ERR-DATA.                                                         
           05  WS-REQUEST-TYPE             PIC X(01).                           
               88  WS-WRITE-ERROR-TO-LOG                VALUE 'Y'.              
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
                                                                                
           EJECT                                                                
           COPY ACAT2FIO.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDRGST                                                  
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
                                                                                
           MOVE DFHCOMMAREA                 TO  ACAT2FIO-COMMAREA.              
                                                                                
           SET ACAT2FIO-DB2-RETURN-OK       TO  TRUE.                           
           MOVE +0                          TO  SQLCODE.                        
                                                                                
           IF ACAT2FIO-READ-DATABASE                                            
              PERFORM SELECT-FROM-VFNDRGST                                      
           ELSE                                                                 
              PERFORM UPDATE-VFNDRGST                                           
           END-IF.                                                              
                                                                                
           MOVE ACAT2FIO-COMMAREA           TO  DFHCOMMAREA.                    
           EXEC CICS  RETURN  END-EXEC.                                         
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-VFNDRGST.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT DLVR_NBR,                                                  
                     BRKR_EXCTG_NBR,                                            
                     BRCH_NBR,                                                  
                     ISIN_SEC_ISSUE_CD,                                         
                     PYBL_INFO_CD,                                              
                     MF_TRANS_TYPE_CD,                                          
                     CNTRY_ORGN_CD,                                             
                     FUND_ACCT_CD,                                              
                     BK_PHSCL_SHR_CD,                                           
                     DLRVY_CD,                                                  
                     ACH_IND,                                                   
                     PAC_IND,                                                   
                     SWP_IND,                                                   
                     MRGN_ACCT_IND,                                             
                     TRD_RLTD_IND,                                              
                     ABA_ROUTING_NBR,                                           
                     DSBMT_FRCTN_CSH_CD,                                        
                     DSBMT_ACCRL_CD,                                            
                     DSBMT_RSDL_CD,                                             
                     TPA_NBR,                                                   
                     MEMO_TXT,                                                  
                     NSCC_PEND_CD                                               
              INTO   :ACAT2FIO-DLVR-NBR,                                        
                     :ACAT2FIO-BRKR-EXCTG-NBR,                                  
                     :ACAT2FIO-BRCH-NBR,                                        
                     :ACAT2FIO-ISIN-SEC-ISSUE-CD,                               
                     :ACAT2FIO-PYBL-INFO-CD,                                    
                     :ACAT2FIO-MF-TRANS-TYPE-CD,                                
                     :ACAT2FIO-CNTRY-ORGN-CD,                                   
                     :ACAT2FIO-FUND-ACCT-CD,                                    
                     :ACAT2FIO-BK-PHSCL-SHR-CD,                                 
                     :ACAT2FIO-DLRVY-CD,                                        
                     :ACAT2FIO-ACH-IND,                                         
                     :ACAT2FIO-PAC-IND,                                         
                     :ACAT2FIO-SWP-IND,                                         
                     :ACAT2FIO-MRGN-ACCT-IND,                                   
                     :ACAT2FIO-TRD-RLTD-IND,                                    
                     :ACAT2FIO-ABA-ROUTING-NBR,                                 
                     :ACAT2FIO-DSBMT-FRCTN-CSH-CD,                              
                     :ACAT2FIO-DSBMT-ACCRL-CD,                                  
                     :ACAT2FIO-DSBMT-RSDL-CD,                                   
                     :ACAT2FIO-TPA-NBR,                                         
                     :ACAT2FIO-MEMO-TXT,                                        
                     :ACAT2FIO-NSCC-PEND-CD                                     
              FROM   VFNDRGST                                                   
              WHERE  CLIENT_NBR       = :ACAT2FIO-CLIENT-NBR       AND          
                     ACAT_CONTROL_NBR = :ACAT2FIO-ACAT-CONTROL-NBR AND          
                     ASSET_SEQ_NBR    = :ACAT2FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDRGST.                                                         
      *****************                                                         
                                                                                
           EXEC SQL                                                             
              UPDATE VFNDRGST                                                   
                 SET ACAT_CONTROL_NBR   = :ACAT2FIO-ACAT-CONTROL-NBR,           
                     DLVR_NBR           = :ACAT2FIO-DLVR-NBR,                   
                     BRKR_EXCTG_NBR     = :ACAT2FIO-BRKR-EXCTG-NBR,             
                     BRCH_NBR           = :ACAT2FIO-BRCH-NBR,                   
                     ISIN_SEC_ISSUE_CD  = :ACAT2FIO-ISIN-SEC-ISSUE-CD,          
                     MF_TRANS_TYPE_CD   = :ACAT2FIO-MF-TRANS-TYPE-CD,           
                     CNTRY_ORGN_CD      = :ACAT2FIO-CNTRY-ORGN-CD,              
                     FUND_ACCT_CD       = :ACAT2FIO-FUND-ACCT-CD,               
                     BK_PHSCL_SHR_CD    = :ACAT2FIO-BK-PHSCL-SHR-CD,            
                     DLRVY_CD           = :ACAT2FIO-DLRVY-CD,                   
                     ACH_IND            = :ACAT2FIO-ACH-IND,                    
                     PAC_IND            = :ACAT2FIO-PAC-IND,                    
                     SWP_IND            = :ACAT2FIO-SWP-IND,                    
                     MRGN_ACCT_IND      = :ACAT2FIO-MRGN-ACCT-IND,              
                     TRD_RLTD_IND       = :ACAT2FIO-TRD-RLTD-IND,               
                     ABA_ROUTING_NBR    = :ACAT2FIO-ABA-ROUTING-NBR,            
                     DSBMT_FRCTN_CSH_CD = :ACAT2FIO-DSBMT-FRCTN-CSH-CD,         
                     DSBMT_ACCRL_CD     = :ACAT2FIO-DSBMT-ACCRL-CD,             
                     DSBMT_RSDL_CD      = :ACAT2FIO-DSBMT-RSDL-CD,              
                     TPA_NBR            = :ACAT2FIO-TPA-NBR,                    
                     MEMO_TXT           = :ACAT2FIO-MEMO-TXT,                   
                     NSCC_PEND_CD       = :ACAT2FIO-NSCC-PEND-CD                
              WHERE  CLIENT_NBR       = :ACAT2FIO-CLIENT-NBR       AND          
                     ACAT_CONTROL_NBR = :ACAT2FIO-ACAT-CONTROL-NBR AND          
                     ASSET_SEQ_NBR    = :ACAT2FIO-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           SET ACAT2FIO-DB2-BAD-RETURN      TO  TRUE.                           
           MOVE SQLCODE                     TO ACAT2FIO-DB2-RETURN-CODE.        
                                                                                
           MOVE SPACE                       TO  WS-ERR-DATA.                    
           SET WS-WRITE-ERROR-TO-LOG        TO  TRUE.                           
           MOVE EIBTRNID                    TO  CALLING-TRAN-ID.                
           MOVE 'ACAT2FDB'                  TO  CALLING-PROGRAM-ID.             
           MOVE SQLCA                       TO  SQLCA-AREA.                     
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
       HANG-CICS.                                                               
           GOBACK.                                                              
