000001* PDX    - ACAT3FDB C0228498 01/30/06 13:10:42 TBLAMUR            00001000
000001* PDX    - ACAT3FDB C0214488 12/08/04 11:55:14 TBLAMUR            00001000
000001* PDX    - ACAT3FDB C0119770 12/28/98 11:36:37 TBTARYB            00001000
000001* PDX    - ACAT3FDB C0118708 12/28/98 10:22:30 TBTARYB            00001000
000001* PDX    - ACAT3FDB C0113942 10/30/98 13:23:10 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT3FDB.                                                 
                                                                                
      *****************************************************************         
      * DB2 I/O PGM: FUND/SERV "PIP/SWP" SCREEN                       *         
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
                                                                                
       01  FILLER                           PIC  X(16)  VALUE                   
           'DATES CONVERSION'.                                                  
                                                                                
       01  FILLER.                                                              
           05  WS-SWP-PAC-EFFCT-DT-10       PIC  X(10).                         
           05  FILLER REDEFINES                                                 
               WS-SWP-PAC-EFFCT-DT-10.                                          
               10  WS-SWP-PAC-10-CCYY       PIC  X(04).                         
               10  WS-SWP-PAC-10-SEP1       PIC  X(01).                         
               10  WS-SWP-PAC-10-MM         PIC  X(02).                         
               10  WS-SWP-PAC-10-SEP2       PIC  X(01).                         
               10  WS-SWP-PAC-10-DD         PIC  X(02).                         
                                                                                
           05  WS-CHCK-FRST-DT-10           PIC  X(10).                         
           05  FILLER REDEFINES                                                 
               WS-CHCK-FRST-DT-10.                                              
               10  WS-CHCK-FRST-10-CCYY     PIC  X(04).                         
               10  WS-CHCK-FRST-10-SEP1     PIC  X(01).                         
               10  WS-CHCK-FRST-10-MM       PIC  X(02).                         
               10  WS-CHCK-FRST-10-SEP2     PIC  X(01).                         
               10  WS-CHCK-FRST-10-DD       PIC  X(02).                         
                                                                                
           05  WS-DT-8.                                                         
               10  WS-DT-8-CCYY             PIC  X(04).                         
               10  WS-DT-8-MM               PIC  X(02).                         
               10  WS-DT-8-DD               PIC  X(02).                         
           05  WS-DT REDEFINES                                                  
               WS-DT-8                      PIC  X(08).                         
                                                                                
       01  WS-ERR-DATA.                                                         
           05  WS-REQUEST-TYPE              PIC  X(01).                         
               88  WS-WRITE-ERROR-TO-LOG                VALUE 'Y'.              
           05  CALLING-TRAN-ID              PIC  X(04).                         
           05  CALLING-PROGRAM-ID           PIC  X(08).                         
           05  SQLCA-AREA                   PIC  X(136).                        
                                                                                
           EJECT                                                                
           COPY ACAT3FIO.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VFNDRGST                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
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
                                                                                
           MOVE DFHCOMMAREA                 TO  ACAT3FIO-COMMAREA.              
                                                                                
           SET ACAT3FIO-DB2-RETURN-OK       TO  TRUE.                           
           MOVE +0                          TO  SQLCODE.                        
                                                                                
           IF ACAT3FIO-READ-DATABASE                                            
              PERFORM SELECT-FROM-VFNDRGST                                      
           ELSE                                                                 
              PERFORM UPDATE-VFNDRGST                                           
           END-IF.                                                              
                                                                                
           MOVE ACAT3FIO-COMMAREA           TO  DFHCOMMAREA.                    
           EXEC CICS  RETURN  END-EXEC.                                         
                                                                                
                                                                                
           EJECT                                                                
      **********************                                                    
       SELECT-FROM-VFNDRGST.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              SELECT PYBL_INFO_CD,                                              
                     SWP_PAC_EFFCT_DT,                                          
                     PAC_IND,                                                   
                     SWP_IND,                                                   
                     RTRMT_TAX_CD,                                              
                     COST_BSS_CD,                                               
                     SHRHR_BNK_ACCT_NBR,                                        
                     SHRHR_BNK_TYPE_CD,                                         
                     ABA_ROUTING_NBR,                                           
                     DSBMT_OPTN_CD,                                             
                     DSBMT_AMT,                                                 
                     PYMNT_DT_CD,                                               
                     PYMNT_JAN_IND,                                             
                     PYMNT_FEB_IND,                                             
                     PYMNT_MAR_IND,                                             
                     PYMNT_APR_IND,                                             
                     PYMNT_MAY_IND,                                             
                     PYMNT_JUN_IND,                                             
                     PYMNT_JUL_IND,                                             
                     PYMNT_AUG_IND,                                             
                     PYMNT_SEP_IND,                                             
                     PYMNT_OCT_IND,                                             
                     PYMNT_NOV_IND,                                             
                     PYMNT_DEC_IND,                                             
                     CHCK_FRST_DT,                                              
                     NSCC_PEND_CD                                               
              INTO  :ACAT3FIO-PYBL-INFO-CD,                                     
                    :WS-SWP-PAC-EFFCT-DT-10,                                    
                    :ACAT3FIO-PAC-IND,                                          
                    :ACAT3FIO-SWP-IND,                                          
                    :ACAT3FIO-RTRMT-TAX-CD,                                     
                    :ACAT3FIO-COST-BSS-CD,                                      
                    :ACAT3FIO-SHRHR-BNK-ACCT-NBR,                               
                    :ACAT3FIO-SHRHR-BNK-TYPE-CD,                                
                    :ACAT3FIO-ABA-ROUTING-NBR,                                  
                    :ACAT3FIO-DSBMT-OPTN-CD,                                    
                    :ACAT3FIO-DSBMT-AMT,                                        
                    :ACAT3FIO-PYMNT-DT-CD,                                      
                    :ACAT3FIO-PYMNT-JAN-IND,                                    
                    :ACAT3FIO-PYMNT-FEB-IND,                                    
                    :ACAT3FIO-PYMNT-MAR-IND,                                    
                    :ACAT3FIO-PYMNT-APR-IND,                                    
                    :ACAT3FIO-PYMNT-MAY-IND,                                    
                    :ACAT3FIO-PYMNT-JUN-IND,                                    
                    :ACAT3FIO-PYMNT-JUL-IND,                                    
                    :ACAT3FIO-PYMNT-AUG-IND,                                    
                    :ACAT3FIO-PYMNT-SEP-IND,                                    
                    :ACAT3FIO-PYMNT-OCT-IND,                                    
                    :ACAT3FIO-PYMNT-NOV-IND,                                    
                    :ACAT3FIO-PYMNT-DEC-IND,                                    
                    :WS-CHCK-FRST-DT-10,                                        
                    :ACAT3FIO-NSCC-PEND-CD                                      
              FROM  VFNDRGST                                                    
              WHERE CLIENT_NBR       = :ACAT3FIO-CLIENT-NBR        AND          
                    ACAT_CONTROL_NBR = :ACAT3FIO-ACAT-CONTROL-NBR  AND          
                    ASSET_SEQ_NBR    = :ACAT3FIO-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           ELSE                                                                 
              MOVE WS-SWP-PAC-10-CCYY       TO  WS-DT-8-CCYY                    
              MOVE WS-SWP-PAC-10-MM         TO  WS-DT-8-MM                      
              MOVE WS-SWP-PAC-10-DD         TO  WS-DT-8-DD                      
              MOVE WS-DT                    TO ACAT3FIO-SWP-PAC-EFFCT-DT        
              MOVE WS-CHCK-FRST-10-CCYY     TO  WS-DT-8-CCYY                    
              MOVE WS-CHCK-FRST-10-MM       TO  WS-DT-8-MM                      
              MOVE WS-CHCK-FRST-10-DD       TO  WS-DT-8-DD                      
              MOVE WS-DT                    TO ACAT3FIO-CHCK-FRST-DT            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       UPDATE-VFNDRGST.                                                         
      *****************                                                         
                                                                                
           MOVE ACAT3FIO-SWP-PAC-EFFCT-DT   TO  WS-DT                           
           MOVE WS-DT-8-CCYY                TO  WS-SWP-PAC-10-CCYY              
           MOVE WS-DT-8-MM                  TO  WS-SWP-PAC-10-MM                
           MOVE WS-DT-8-DD                  TO  WS-SWP-PAC-10-DD                
           MOVE '-'                         TO  WS-SWP-PAC-10-SEP1              
                                                WS-SWP-PAC-10-SEP2              
           MOVE ACAT3FIO-CHCK-FRST-DT       TO  WS-DT                           
           MOVE WS-DT-8-CCYY                TO  WS-CHCK-FRST-10-CCYY            
           MOVE WS-DT-8-MM                  TO  WS-CHCK-FRST-10-MM              
           MOVE WS-DT-8-DD                  TO  WS-CHCK-FRST-10-DD              
           MOVE '-'                         TO  WS-CHCK-FRST-10-SEP1            
                                                WS-CHCK-FRST-10-SEP2            
                                                                                
           EXEC SQL                                                             
             UPDATE VFNDRGST                                                    
                SET SWP_PAC_EFFCT_DT    = :WS-SWP-PAC-EFFCT-DT-10,              
                    PAC_IND             = :ACAT3FIO-PAC-IND,                    
                    SWP_IND             = :ACAT3FIO-SWP-IND,                    
                    RTRMT_TAX_CD        = :ACAT3FIO-RTRMT-TAX-CD,               
                    COST_BSS_CD         = :ACAT3FIO-COST-BSS-CD,                
                    SHRHR_BNK_ACCT_NBR  = :ACAT3FIO-SHRHR-BNK-ACCT-NBR,         
                    SHRHR_BNK_TYPE_CD   = :ACAT3FIO-SHRHR-BNK-TYPE-CD,          
                    ABA_ROUTING_NBR     = :ACAT3FIO-ABA-ROUTING-NBR,            
                    DSBMT_OPTN_CD       = :ACAT3FIO-DSBMT-OPTN-CD,              
                    DSBMT_AMT           = :ACAT3FIO-DSBMT-AMT,                  
                    PYMNT_DT_CD         = :ACAT3FIO-PYMNT-DT-CD,                
                    PYMNT_JAN_IND       = :ACAT3FIO-PYMNT-JAN-IND,              
                    PYMNT_FEB_IND       = :ACAT3FIO-PYMNT-FEB-IND,              
                    PYMNT_MAR_IND       = :ACAT3FIO-PYMNT-MAR-IND,              
                    PYMNT_APR_IND       = :ACAT3FIO-PYMNT-APR-IND,              
                    PYMNT_MAY_IND       = :ACAT3FIO-PYMNT-MAY-IND,              
                    PYMNT_JUN_IND       = :ACAT3FIO-PYMNT-JUN-IND,              
                    PYMNT_JUL_IND       = :ACAT3FIO-PYMNT-JUL-IND,              
                    PYMNT_AUG_IND       = :ACAT3FIO-PYMNT-AUG-IND,              
                    PYMNT_SEP_IND       = :ACAT3FIO-PYMNT-SEP-IND,              
                    PYMNT_OCT_IND       = :ACAT3FIO-PYMNT-OCT-IND,              
                    PYMNT_NOV_IND       = :ACAT3FIO-PYMNT-NOV-IND,              
                    PYMNT_DEC_IND       = :ACAT3FIO-PYMNT-DEC-IND,              
                    CHCK_FRST_DT        = :WS-CHCK-FRST-DT-10,                  
                    NSCC_PEND_CD        = :ACAT3FIO-NSCC-PEND-CD                
                 WHERE CLIENT_NBR       = :ACAT3FIO-CLIENT-NBR  AND             
                       ACAT_CONTROL_NBR = :ACAT3FIO-ACAT-CONTROL-NBR AND        
                       ASSET_SEQ_NBR    = :ACAT3FIO-ASSET-SEQ-NBR               
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           SET ACAT3FIO-DB2-BAD-RETURN      TO  TRUE.                           
           MOVE SQLCODE                     TO ACAT3FIO-DB2-RETURN-CODE.        
           MOVE SPACE                       TO  WS-ERR-DATA.                    
           SET WS-WRITE-ERROR-TO-LOG        TO  TRUE.                           
           MOVE EIBTRNID                    TO  CALLING-TRAN-ID.                
           MOVE 'ACAT3FDB'                  TO  CALLING-PROGRAM-ID.             
           MOVE SQLCA                       TO  SQLCA-AREA.                     
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
       HANG-CICS.                                                               
           GOBACK.                                                              
