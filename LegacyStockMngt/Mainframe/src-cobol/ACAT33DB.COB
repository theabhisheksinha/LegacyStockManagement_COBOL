000001* PDX    - ACAT33DB C0231507 06/23/06 08:13:51 TBLAMUR            00001000
LRM010* SSR# 40661 RETAIN USER ID OF INITIATOR.                                 
000001* PDX    - ACAT33DB C0222929 07/28/05 14:33:25 TBLAMUR            00001000
LRM009* SSR 0043302 ALLOW MFC FOR RCR, FULL WITH SAME KEYS SAME CYCLE           
000001* PDX    - ACAT33DB C0216396 06/15/05 16:01:17 TBLAMUR            00001000
000001* PDX    - ACAT33DB C0218683 03/18/05 16:29:20 TBLAMUR            00001000
LRM006* SSR 0039561 QUALIFY ASSET MAINT VIA TYPE=MFC.                           
LRM007* SSR DUPLICATE MFC ON SAME CYCLE.                                        
000001* PDX    - ACAT33DB C0215192 01/18/05 15:27:53 TBLAMUR            00001000
LRM005* SSR 0040042 USE NEW INITIAL TABLES / PHASE II.                          
000001* PDX    - ACAT33DB C0214774 12/15/04 09:34:22 TBLAMUR            00001000
LRM003* SSR 0039844 DO NOT COPY OCC NUMBER FROM HSTY TO TIF                     
000001* PDX    - ACAT33DB C0210492 11/03/04 08:57:12 TBLAMUR            00001000
LRM002* SSR 0034535 CAGE TAG NUMBER FROM ORIGINAL FAIL                          
LRM002* ADD COUNTER TO TRANS-RFRN-ID, AND POPULATE ON INIT ASSETS.              
000001* PDX    - ACAT33DB C0204074 04/16/04 15:50:50 TBLAMUR            00001000
LRM001* SSR 0037453 POPULATE CENTS IN ASSET VALUE, DEFUALT ZERO WHEN            
LRM001* CONTRA IS A BANK, ALLOW ZERO IN VALUE FIELD REGARDLESS.                 
LRM001* IGNORE TRANSFER TYPE REASON CODE FROM ORIGINAL ASSET.                   
000001* PDX    - ACAT33DB C0197017 11/05/03 16:28:18 TBEDTAK            00001000
ET0001* USE PRCS_DT FIELD OF VINIMF AS A NEW RE-REGISTRATION DATE FIELD 00001000
000001* PDX    - ACAT33DB C0182233 02/14/03 12:00:16 TBLAMUR            00001000
000001* PDX    - ACAT33DB C0157168 09/05/01 13:51:49 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACAT33DB.                                         00020000
       AUTHOR.        LARRY MUREY.                                      00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS       * 00070000
      *   FOR INITIATING MUTUAL FUND CLEANUPS.  MFC.                  * 00070000
      *   THIS PROGRAM WAS MODELLED FROM ACAT11DB.                    * 00070000
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       COPY PDXIDCOB.                                                   00120002
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACAT33DB WORKING STORAGE BEGINS HERE'.                00480000
       77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00140002
       77  WS-CALC-PRICE                  PIC S9(9)V9(7) COMP-3.                
       77  WS-CALC-POSN-QTY               PIC S9(12)V9(5) COMP-3.       MRGIML03
       77  WS-CALC-POSN-AMT               PIC S9(15)V9(2) COMP-3.       MRGIML03
       77  WS-ASSET-W-FUND-NBR            PIC S9(4) COMP.               MRGIML03
       77  WS-ASSET-TOTAL-COUNT           PIC S9(4) COMP.               MRGIML03
                                                                        00490000
           SKIP3                                                        00540000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACAT33DB DETECTED ABEND'.                                         
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.              
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-MRGN-POSN-QTY-TYPE1   PIC S9(12)V9(5) COMP-3 VALUE +0.        
           05  WS-MRGN-POSN-QTY-TYPE2   PIC S9(12)V9(5) COMP-3 VALUE +0.        
           05  WS-MRGN-POSN-QTY-TYPE5   PIC S9(12)V9(5) COMP-3 VALUE +0.        
           05  WS-MRGN-POSN-MV-TYPE1    PIC S9(15)V99   COMP-3 VALUE +0.        
           05  WS-MRGN-POSN-MV-TYPE2    PIC S9(15)V99   COMP-3 VALUE +0.        
           05  WS-MRGN-POSN-MV-TYPE5    PIC S9(15)V99   COMP-3 VALUE +0.        
00314      05  UNPK-TYPE.                                               MRGIPS05
00315          10  FILLER                 PIC 9 VALUE ZERO.             MRGIPS05
00316          10  WK-PS-TYPE             PIC X VALUE ZERO.             MRGIPS05
           05  B1-CARD-OPTION             PIC X.                                
           05  REAL-CODE                  PIC 99 VALUE 0.               MRGIPS05
           05  WS-TIMESTAMP                PIC X(26).                           
           05  WS-BRANCH                   PIC X(3)  VALUE SPACES.              
           05  WS-EIBCALEN                 PIC S9(8) COMP.                      
           05  WS-MFC-RECORDS-INSERTED     PIC S9(9) COMP VALUE +0.             
           05  ERR-MSG.                                                         
               09  ERR-EIBDS               PIC X(8)  VALUE SPACES.              
               09  ERR-MSG2                PIC X(70) VALUE SPACES.              
LRM007     05  WS-NEXT-CNTL-NBR            PIC 9(3)  VALUE  001.                
LRM007     05  WS-TRANS-RFRN-ID-CD         PIC X(20).                           
LRM007     05  SUB                         PIC S9(3) COMP-3.                    
LRM007     05  SUB2                        PIC S9(3) COMP-3.                    
LRM007     05  WS-CONTROL-NBR              PIC X(14) VALUE SPACES.              
LRM008     05  WS-DUPE-DLVR-NBR            PIC X(04).                   09190000
LRM008     05  WS-DUPE-ACCT-DLVR-NBR       PIC X(20).                   09190000
LRM008     05  WS-DUPE-RCV-NBR             PIC X(04).                   09190000
LRM008     05  WS-DUPE-ACCT-RCV-NBR        PIC X(20).                   09190000
LRM008     05  WS-DUPE-ACAT-CONTROL-NBR    PIC X(14).                   09190000
LRM008     05  WS-IGNORE-ASSET-SW          PIC X(01)  VALUE 'N'.                
LRM008         88  ASSET-NOT-ON-OTHER-MFC             VALUE 'N'.                
LRM008         88  ASSET-ON-OTHER-MFC                 VALUE 'Y'.                
LRM009     05  WS-ASSOC-CNTL-FND-SW        PIC X(01)  VALUE 'N'.                
LRM009         88  ASTD-NOT-MATCHED                   VALUE 'N'.                
LRM009         88  ASTD-MATCHED                       VALUE 'Y'.                
       01  WS-MFC-ORIG-RQST-AMT-MSG        PIC X(19) VALUE SPACES.              
       01  FILLER REDEFINES WS-MFC-ORIG-RQST-AMT-MSG.                           
           05  WS-MFC-ORIG-RQST-AMT        PIC $$$,$$$,$$$,$$$.99-.             
       01  FILLER REDEFINES WS-MFC-ORIG-RQST-AMT-MSG.                           
           05  WS-MFC-ORIG-RQST-QTY-LIT    PIC X(01).                           
           05  WS-MFC-ORIG-RQST-QTY        PIC ZZZZZZZZZZZ.99999-.              
       01  FILLER REDEFINES WS-MFC-ORIG-RQST-AMT-MSG.                           
           05  WS-MFC-ORIG-RQST-PCT        PIC ZZZ.99999.                       
           05  WS-MFC-ORIG-RQST-PCT-LIT    PIC X(01).                           
                                                                                
00342      EJECT                                                        MRGIPS05
       01  WS-COMMAREA.                                                         
           COPY ACAT33IO.                                               01510000
                                                                                
           EJECT                                                                
       COPY ACATSRCH.                                                   01360002
           EJECT                                                                
           EXEC SQL                                                             
           INCLUDE SQLCA                                                        
           END-EXEC                                                             
      *DCLGEN FOR INITIAL ACAT TRANSFER                                         
014700     EXEC SQL                                                     01400000
               INCLUDE ACTITRF                                          01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR INITIAL ACAT ASSET                                            
014700     EXEC SQL                                                     01400000
               INCLUDE ACTIAST                                          01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR INITIAL ACAT MUTUAL FUND AREA                                 
           EXEC SQL                                                     01400000
               INCLUDE ACTIMF                                           01410000
           END-EXEC.                                                    01420000
      *                                                                 01430000
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                          
           EXEC SQL                                                     01400000
               INCLUDE VTRNFR                                           01410000
           END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR ACTIVE ACAT ASSET                                             
           EXEC SQL                                                     01400000
               INCLUDE VASSET                                           01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR ACTIVE MUTUAL FUND SEG                                        
           EXEC SQL                                                     01400000
               INCLUDE VMF                                              01410000
           END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR TRANSFER HISTORY                                              
           EXEC SQL                                                     01400000
               INCLUDE VTRNHSTY                                         01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR HISTORY ASSET                                                 
           EXEC SQL                                                     01400000
               INCLUDE VASTHSTY                                         01410000
           END-EXEC.                                                    01420000
LRM001*DCLGEN FOR ACAT_PRTCP_PROFILE TABLE                                      
LRM001     EXEC SQL                                                             
LRM001         INCLUDE VPRTCPPF                                                 
LRM001     END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRA: FOR THE SPECIFIED CLIENT/BRANCH/ACCOUNT  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRA CURSOR FOR                                        
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
LRM008            ,RCV_NBR                                              09180000
LRM008            ,ACCT_RCV_NBR                                         09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
LRM008            ,STTLM_ASCTD_DT                                               
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ((ACCT_DLVR_NBR                                09180000
                              > :ACAT33IO-DLVR-ACCT                     09190000
                       OR (ACCT_DLVR_NBR                                09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                       AND RCV_NBR                                      09180000
                              > :ACAT33IO-RCV-NBR)                      09190000
                       OR (ACCT_DLVR_NBR                                09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                       AND RCV_NBR                                      09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                       AND ACCT_RCV_NBR                                 09180000
                              > :ACAT33IO-RCV-ACCT)                     09190000
                       OR (ACCT_DLVR_NBR                                09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                       AND RCV_NBR                                      09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                       AND ACCT_RCV_NBR                                 09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                       AND  ACAT_CONTROL_NBR                            09180000
                              > :ACAT33IO-CONTROL-NBR))))               09190000
                  ORDER BY                                                      
                    ACCT_DLVR_NBR                                       09180000
                   ,RCV_NBR                                             09180000
                   ,ACCT_RCV_NBR                                        09180000
LRM008             ,ACAT_CONTROL_NBR                                            
           END-EXEC.                                                            
           EJECT                                                                
      *---------------------------------------------------------*               
      *   TFR CURSR1: FOR PREV SPECIFIED CLIENT/BRANCH/ACCOUNT  *               
      *---------------------------------------------------------*               
           EXEC SQL                                                             
              DECLARE TFRCSR1 CURSOR FOR                                        
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
LRM008            ,RCV_NBR                                              09180000
LRM008            ,ACCT_RCV_NBR                                         09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
LRM008            ,STTLM_ASCTD_DT                                               
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ((DLVR_NBR                                     09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              < :ACAT33IO-DLVR-ACCT)                    09190000
                     OR   (DLVR_NBR                                     09180000
                              < :ACAT33IO-DLVR-NBR)                     09190000
LRM008               OR   (DLVR_NBR                                     09180000
LRM008                        = :ACAT33IO-DLVR-NBR                      09190000
LRM008               AND ACCT_DLVR_NBR                                  09180000
LRM008                        = :ACAT33IO-DLVR-ACCT                     09190000
LRM008               AND  ACAT_CONTROL_NBR                              09180000
LRM008                        < :ACAT33IO-CONTROL-NBR))                 09190000
                  ORDER BY                                                      
                    ACCT_DLVR_NBR   DESC                                09180000
LRM008             ,RCV_NBR         DESC                                09180000
LRM008             ,ACCT_RCV_NBR    DESC                                09180000
LRM008             ,ACAT_CONTROL_NBR DESC                                       
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRB: FOR THE SPECIFIED CLIENT/BRANCH          *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRB CURSOR FOR                                       
                  SELECT                                                        
                   ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND SUBSTR(ACCT_RCV_NBR,1,3)                       09180000
                              = :WS-BRANCH                                      
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                  ORDER BY                                                      
                    ACCT_RCV_NBR                                                
                   ,DLVR_NBR                                            09180000
                   ,ACCT_DLVR_NBR                                       09180000
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRC: FOR THE SPECIFIED CLIENT                 *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRC CURSOR FOR                                       
                  SELECT                                                        
                   ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                  ORDER BY                                                      
                    ACCT_RCV_NBR                                                
                   ,DLVR_NBR                                            09180000
                   ,ACCT_DLVR_NBR                                       09180000
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRS: FOR THE NEXT ASSET.                      *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRS CURSOR FOR                                       
                  SELECT                                                        
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,STTLM_RSN_CD                                         09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
LRM002            ,CAGE_TAG_NBR                                                 
                   FROM ACTIAST                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM008               AND  ACAT_CONTROL_NBR                              09180000
LRM008                        = :ACAT33IO-CONTROL-NBR                   09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
LRM006               AND TRNFR_TYPE_CD                                          
LRM006                        =  'MFC'                                          
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
                     AND (ISIN_SEC_ISSUE_CD >                           09180000
                           :ACAT33IO-CURRENT-SECR                               
                     OR (ISIN_SEC_ISSUE_CD =                            09180000
                           :ACAT33IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   =                            09180000
                            :ACAT33IO-CURRENT-SLOC                              
                       AND CSH_MGN_SHRT_CD   >                          09180000
                            :ACAT33IO-CURRENT-TYPE)                             
                     OR (ISIN_SEC_ISSUE_CD =                            09180000
                           :ACAT33IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   >                            09180000
                            :ACAT33IO-CURRENT-SLOC))                            
                  ORDER BY                                                      
                    ISIN_CNTRY_CD                                       09180000
SEC                ,ISIN_SEC_ISSUE_CD                                   09180000
                   ,ISIN_SEC_CDG_CD                                     09180000
SLOC               ,STTLM_LCTN_CD                                       09180000
TYPE               ,CSH_MGN_SHRT_CD                                     09180000
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRSA: FOR THE NEXT ACTIVE ASSET.              *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRSA CURSOR FOR                                      
                  SELECT                                                        
                    ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
                   FROM VASSET                                          09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR                           
                     AND ASSET_SEQ_NBR                                          
                              > :ACAT33IO-ASSET-SEQ-NBR                         
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
                  ORDER BY                                                      
                     ASSET_SEQ_NBR                                              
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR VASSET_CRSR: FOR ALL ACTIVE ASSETS                                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE VASSET_CRSRX CURSOR FOR                                   
                  SELECT                                                        
                    ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
LRM002             ,CAGE_TAG_NBR                                                
                   FROM VASSET                                          09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR                           
                  ORDER BY                                                      
                     ASSET_SEQ_NBR                                              
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR VASTHSTY_CRSR: FOR MF HISTORY ASSETS                              
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE VASTHSTY_CRSRX CURSOR FOR                                 
                  SELECT                                                        
                    ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
LRM002             ,CAGE_TAG_NBR                                                
                   FROM VASTHSTY                                        09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :WS-CONTROL-NBR                                 
                     AND ASSET_SEQ_NBR                                          
                              > :ACAT33IO-ASSET-SEQ-NBR                         
                     AND ASSET_PRC_CTGY_CD IN ('MFNM', 'MFMM')                  
                  ORDER BY                                                      
                     ASSET_SEQ_NBR                                              
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR VASTHSTY_CRS_PREV: FOR MF HISTORY ASSETS                          
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE VASTHSTY_CSR_PREV CURSOR FOR                              
                  SELECT                                                        
                    ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
LRM002             ,CAGE_TAG_NBR                                                
                   FROM VASTHSTY                                        09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR                           
                     AND ASSET_SEQ_NBR                                          
                              < :ACAT33IO-ASSET-SEQ-NBR                         
                     AND ASSET_PRC_CTGY_CD IN ('MFNM', 'MFMM')                  
                  ORDER BY                                                      
                     ASSET_SEQ_NBR DESC                                         
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSR4: FOR THE PREV ASSET.                      *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR4 CURSOR FOR                                       
                  SELECT                                                        
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,STTLM_RSN_CD                                         09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
LRM002            ,CAGE_TAG_NBR                                                 
                   FROM ACTIAST                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM008               AND  ACAT_CONTROL_NBR                              09180000
LRM008                        = :ACAT33IO-CONTROL-NBR                   09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
LRM006               AND TRNFR_TYPE_CD                                          
LRM006                        =  'MFC'                                          
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
                     AND (ISIN_SEC_ISSUE_CD <                           09180000
                           :ACAT33IO-CURRENT-SECR                               
                     OR (ISIN_SEC_ISSUE_CD =                            09180000
                           :ACAT33IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   =                            09180000
                            :ACAT33IO-CURRENT-SLOC                              
                       AND CSH_MGN_SHRT_CD   <                          09180000
                            :ACAT33IO-CURRENT-TYPE)                             
                     OR (ISIN_SEC_ISSUE_CD =                            09180000
                           :ACAT33IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   <                            09180000
                            :ACAT33IO-CURRENT-SLOC))                            
                  ORDER BY                                                      
                    ISIN_CNTRY_CD      DESC                             09180000
SEC                ,ISIN_SEC_ISSUE_CD  DESC                             09180000
                   ,ISIN_SEC_CDG_CD    DESC                             09180000
SLOC               ,STTLM_LCTN_CD      DESC                             09180000
TYPE               ,CSH_MGN_SHRT_CD    DESC                             09180000
           END-EXEC.                                                            
LRM007*--------------------------------------------------------------*          
LRM007*   TFR CURSRS: FOR INITIAL ASSET FOR ALL ROWS                            
LRM007*--------------------------------------------------------------*          
LRM007     EXEC SQL                                                             
LRM007        DECLARE  CRSR_ACTIAST CURSOR WITH HOLD FOR                        
LRM007            SELECT                                                        
LRM007             ISIN_CNTRY_CD                                        09180000
LRM007            ,ISIN_SEC_ISSUE_CD                                    09180000
LRM007            ,ISIN_SEC_CDG_CD                                      09180000
LRM007            ,STTLM_LCTN_CD                                        09180000
LRM007            ,CSH_MGN_SHRT_CD                                      09180000
LRM007             FROM ACTIAST                                         09170000
LRM007            WHERE  CLIENT_NBR                                     09180000
LRM007                        = :ACAT33IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT33IO-CONTROL-NBR                   09180000
LRM007               AND RCV_NBR                                        09180000
LRM007                        = :ACAT33IO-RCV-NBR                       09190000
LRM007               AND ACCT_RCV_NBR                                   09180000
LRM007                        = :ACAT33IO-RCV-ACCT                      09190000
LRM007               AND DLVR_NBR                                       09180000
LRM007                        = :ACAT33IO-DLVR-NBR                      09190000
LRM007               AND ACCT_DLVR_NBR                                  09180000
LRM007                        = :ACAT33IO-DLVR-ACCT                     09190000
LRM007               AND TRNFR_TYPE_CD                                          
LRM007                        =  'MFC'                                          
LRM007     END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSR4A: FOR THE PREV ACTIVE ASSET.              *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR4A CURSOR FOR                                      
                  SELECT                                                        
                    ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
LRM002             ,CAGE_TAG_NBR                                                
                   FROM VASSET                                          09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR                           
                     AND ASSET_SEQ_NBR                                          
                              < :ACAT33IO-ASSET-SEQ-NBR                         
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
                  ORDER BY                                                      
                     ASSET_SEQ_NBR DESC                                         
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRAA: FOR THE SPECIFIED MFC ON ACTIVE.        *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRAA CURSOR FOR                                       
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,STTS_CD                                                      
                  ,RCV_OCC_BRKR_NBR                                             
                  ,STTLM_DT                                                     
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND NOT STTS_CD = '140'                                    
                     AND NOT STTS_CD = '600')                                   
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRAR: FOR THE NEXT MFC ON ACTIVE DB.          *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRAR CURSOR FOR                                       
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,ACCT_RJCT_RSBM_IND                                           
                  ,STTS_CD                                                      
                  ,RCV_OCC_BRKR_NBR                                             
                  ,STTLM_DT                                                     
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ACAT_CONTROL_NBR                               09180000
                              > :ACAT33IO-CONTROL-NBR                   09190000
                     AND NOT STTS_CD = '140'                                    
                     AND NOT STTS_CD = '600')                                   
                  ORDER BY                                                      
                   ACAT_CONTROL_NBR                                             
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRAR: FOR THE PREV MFC ON ACTIVE DB.          *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRAP CURSOR FOR                                       
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
LRM007            ,ACAT_CNTL_ASTD_NBR                                           
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,RR_CD                                                        
                  ,ACCT_RJCT_RSBM_IND                                           
                  ,STTS_CD                                                      
                  ,RCV_OCC_BRKR_NBR                                             
                  ,STTLM_DT                                                     
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC'                                   09190000
                     AND DSTBN_SIDE_CD = 'D'                                    
                     AND ACAT_CONTROL_NBR                               09180000
                              < :ACAT33IO-CONTROL-NBR                   09190000
                     AND NOT STTS_CD = '140'                                    
                     AND NOT STTS_CD = '600')                                   
                  ORDER BY                                                      
                   ACAT_CONTROL_NBR DESC                                        
           END-EXEC.                                                            
LRM007*--------------------------------------------------------                 
LRM007*  INITIAL TRANSFER CURSOR                              *                 
LRM007*  USED TO FIND GREATEST CNTL NUMBER FOR THE GIVEN KEYS *                 
LRM007*--------------------------------------------------------                 
LRM007     EXEC SQL                                                             
LRM007        DECLARE ACTITRF_LAST_CNTL CURSOR FOR                              
LRM007           SELECT                                                         
LRM007             ACAT_CONTROL_NBR                                             
LRM007           FROM ACTITRF                                                   
LRM007            WHERE (CLIENT_NBR                                             
LRM007                        = :ACAT33IO-CLIENT-NBR                            
LRM007               AND DLVR_NBR                                               
LRM007                        = :ACAT33IO-DLVR-NBR                              
LRM007               AND ACCT_DLVR_NBR                                          
LRM007                        = :ACAT33IO-DLVR-ACCT                             
LRM007               AND RCV_NBR                                                
LRM007                        = :ACAT33IO-RCV-NBR                               
LRM007               AND ACCT_RCV_NBR                                           
LRM007                        = :ACAT33IO-RCV-ACCT                              
LRM007               AND TRNFR_TYPE_CD                                          
LRM007                        = 'MFC')                                          
LRM007           ORDER BY  ACAT_CONTROL_NBR DESC                                
LRM007      END-EXEC.                                                           
                                                                                
LRM008*--------------------------------------------------------------*          
LRM008*  INITIAL TRANSFER CURSOR                              *                 
LRM008*  USED TO FIND ALL OTHER MFC TRANSFERS FOR THIS ORIGINAL TIF             
LRM008*--------------------------------------------------------------*          
LRM008     EXEC SQL                                                             
LRM008        DECLARE ACTITRF_DUPE CURSOR FOR                                   
LRM008           SELECT                                                         
LRM008             DLVR_NBR                                             09150000
LRM008            ,ACCT_DLVR_NBR                                        09180000
LRM008            ,RCV_NBR                                              09180000
LRM008            ,ACCT_RCV_NBR                                         09180000
LRM008            ,ACAT_CONTROL_NBR                                     09180000
LRM008           FROM ACTITRF                                                   
LRM008            WHERE (CLIENT_NBR                                             
LRM008                        = :ACAT33IO-CLIENT-NBR                            
LRM008               AND ACAT_CNTL_ASTD_NBR                                     
LRM008                        = :WS-CONTROL-NBR                                 
LRM008               AND NOT ACAT_CONTROL_NBR                                   
LRM008                       = :ACAT33IO-CONTROL-NBR                            
LRM008               AND TRNFR_TYPE_CD                                          
LRM008                        = 'MFC')                                          
LRM008           FOR READ ONLY WITH UR                                          
LRM008      END-EXEC.                                                           
           EJECT                                                                
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA.                                                 01490000
           05  FILLER             PIC X(2000).                                  
00427      EJECT                                                        MRGIPS05
                                                                                
      **********************************************************        01590000
      *****   P R O C E D U R E   D I V I S I O N           *****       01600000
      **********************************************************        01610000
       PROCEDURE DIVISION.                                              01620000
      *--------------------------------------------------------------*          
      * SAVE COMMAREA LENGTH SO THAT PRIOR TO RETURN, WILL PREVENT   *          
      * ALTERING STORAGE BEYOND THAT WHICH WAS SENT.                 *          
      *--------------------------------------------------------------*          
           MOVE EIBCALEN TO WS-EIBCALEN.                                        
           IF EIBCALEN > ZERO                                                   
              MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA                     
           ELSE                                                                 
              EXEC CICS RETURN END-EXEC                                 06220000
           END-IF.                                                              
                                                                                
           IF ACAT33IO-IT-READ                                                  
               PERFORM 0100-GET-ACTITRF                                 09130000
LRM009     ELSE                                                                 
LRM009     IF ACAT33IO-IT-REREAD                                                
LRM009         PERFORM 0110-GET-ACTITRF-REREAD                          09130000
           ELSE                                                                 
           IF ACAT33IO-IT-READ-ASSET                                            
               PERFORM 0180-GET-ACTIAST                                 09130000
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTA                                            
               PERFORM 0050-OPEN-CURSORA                                09130000
               PERFORM 0075-READ-NEXTA                                  09130000
               PERFORM 0080-CLOSE-TFRCSRA                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-PREV1                                            
               PERFORM 0050-OPEN-CURSOR1                                09130000
               PERFORM 0075-READ-PREV1                                  09130000
               PERFORM 0080-CLOSE-TFRCSR1                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTB                                            
               PERFORM 0050-OPEN-CURSORB                                09130000
               PERFORM 0075-READ-NEXTB                                  09130000
               PERFORM 0080-CLOSE-TFRCSRB                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTC                                            
               PERFORM 0050-OPEN-CURSORC                                09130000
               PERFORM 0075-READ-NEXTC                                  09130000
               PERFORM 0080-CLOSE-TFRCSRC                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTS                                            
               PERFORM 0050-OPEN-CURSORS                                09130000
               PERFORM 0075-READ-NEXTS                                  09130000
               PERFORM 0080-CLOSE-TFRCSRS                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-PREV4                                            
               PERFORM 0050-OPEN-CURSOR4                                09130000
               PERFORM 0075-READ-PREV4                                  09130000
               PERFORM 0080-CLOSE-TFRCSR4                                       
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTSA                                           
               PERFORM 0050-OPEN-CURSORSA                               09130000
               PERFORM 0075-READ-NEXTSA                                 09130000
               PERFORM 0077-MOVE-ASSET-TO-IOAREA                                
               PERFORM 0080-CLOSE-TFRCSRSA                                      
           ELSE                                                                 
           IF ACAT33IO-IT-READ-NEXTHA                                           
LRM007         MOVE ACAT33IO-CONTROL-NBR TO WS-CONTROL-NBR                      
               PERFORM 0050-OPEN-VASTHSTY-CRSRX                         09130000
               PERFORM 0075-READ-NEXTX                                  09130000
               PERFORM 0077-MOVE-ASTHSTY-TO-IOAREA                              
               PERFORM 0080-CLOSE-VASTHSTY-CRSRX                                
           ELSE                                                                 
           IF ACAT33IO-IT-READ-PREVHA                                           
               PERFORM 0050-OPEN-VASTHSTY-CRS-PREV                      09130000
               PERFORM 0075-READ-PREV-ASTHSTY                           09130000
               PERFORM 0077-MOVE-ASTHSTY-TO-IOAREA                              
               PERFORM 0080-CLOSE-VASTHSTY-CSR-PREV                             
           ELSE                                                                 
           IF ACAT33IO-IT-READ-PREV4A                                           
               PERFORM 0050-OPEN-CURSOR4A                               09130000
               PERFORM 0075-READ-PREV4A                                 09130000
               PERFORM 0077-MOVE-ASSET-TO-IOAREA                                
               PERFORM 0080-CLOSE-TFRCSR4A                                      
           ELSE                                                                 
           IF ACAT33IO-IT-GET-HISTORY                                           
               PERFORM 0150-READ-HSTY-ACAT-DIRECT                               
           ELSE                                                                 
           IF ACAT33IO-IT-GET-ACTIVE                                            
               PERFORM 0152-READ-ACTIVE-ACAT-DIRECT                             
           ELSE                                                                 
           IF ACAT33IO-GET-NEXT-MFC                                             
               PERFORM 0050-OPEN-CURSORAR                               09130000
               PERFORM 0125-READ-NEXT-MFC                                       
           ELSE                                                                 
           IF ACAT33IO-GET-PREV-MFC                                             
               PERFORM 0050-OPEN-CURSORAP                               09130000
               PERFORM 0127-READ-PREV-MFC                                       
           ELSE                                                                 
           IF ACAT33IO-COUNT-ASSETS-W-FNBR                                      
               PERFORM 0240-COUNT-ASSETS-W-FUND-NBR                             
           ELSE                                                                 
              EXEC SQL                                                          
                  SET :WS-TIMESTAMP = CURRENT TIMESTAMP                         
              END-EXEC                                                          
              IF ACAT33IO-IT-ISRT                                               
                  PERFORM 0200-ISRT-ACTITRF                                09130
              ELSE                                                              
              IF ACAT33IO-IT-ISRT-ASSET                                         
                  PERFORM 0220-ISRT-ACTIAST                                09130
              ELSE                                                              
              IF ACAT33IO-IT-UPD                                                
                 PERFORM 0300-UPDATE-ACTITRF THRU 0300-EXIT                     
              ELSE                                                              
              IF ACAT33IO-IT-UPD-ASSET                                          
                 PERFORM 0370-UPDATE-ACTIAST                                    
              ELSE                                                              
              IF ACAT33IO-IT-DEL                                                
                 PERFORM 0400-DELETE-ACTITRF                                    
              ELSE                                                              
              IF ACAT33IO-IT-DEL-ASSET                                          
                 PERFORM 0420-DELETE-ACTIAST                                    
              ELSE                                                              
              IF ACAT33IO-COPY-HISTORY-TO-MFC                                   
                 PERFORM 0500-COPY-HSTY-TO-MFC-RTN                              
           END-IF.                                                              
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
       0050-OPEN-CURSORA.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT/BRANCH/ACCOUNT                 *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRA                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSOR1.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH PREV CLIENT/BRANCH/ACCOUNT            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSR1                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSR1 OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORB.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT/BRANCH ONLY                    *          
      *--------------------------------------------------------------*          
           MOVE ACAT33IO-RCV-ACCT(1 : 3) TO WS-BRANCH.                  09190000
           EXEC SQL                                                             
              OPEN TFRCSRB                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRB OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORC.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT ONLY.                          *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRC                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRC OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORS.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR NEXT ASSET.                            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRS                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRS OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSORSA.                                              09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR NEXT ASSET ON ACTIVE TABLE.            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRSA                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRSA OPEN ERROR **'                                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSOR4.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR PREV ASSET.                            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSR4                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSR4 OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSOR4A.                                              09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR PREV ACTIVE ASSET.                     *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSR4A                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSR4 OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSORAA.                                              09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR MFC ON ACTIVE FILE.                    *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRAA                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSORAR.                                              09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR NEXT MFC ON ACTIVE FILE.               *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRAR                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSORAP.                                              09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR PREV MFC ON ACTIVE FILE.               *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRAP                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRAP OPEN ERROR **'                                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-VASSET-CRSRX.                                          09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR ALL ACTIVE ASSETS.                     *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN VASSET_CRSRX                                                 
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** VASSET_CRSRX OPEN ERROR **'                              
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
                                                                                
       0050-OPEN-VASTHSTY-CRSRX.                                        09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR MF HISTORY ASSETS.                     *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN VASTHSTY_CRSRX                                               
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** VASTHSTY_CRSRX OPEN ERROR **'                            
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
        0050-OPEN-VASTHSTY-CRS-PREV.                                    09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR PREV MF HISTORY ASSETS.                *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN VASTHSTY_CSR_PREV                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       EJECT                                                                    
                                                                                
       0075-READ-NEXTA.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRA                                                       
                   INTO                                                 09160000
                    :ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
LRM008             ,:ACAT33IO-RCV-NBR                                   09190000
LRM008             ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
LRM008             ,:ACAT33IO-STTLM-DT                                  09170000
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-DLVR-ACCT(1 : 3) TO SRCH-INP-BRANCH                 
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTA                                  09130000
              END-IF                                                            
              SET ACAT33IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV1.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR1                                                       
                   INTO                                                 09160000
                    :ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
LRM008             ,:ACAT33IO-RCV-NBR                                   09190000
LRM008             ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
LRM008             ,:ACAT33IO-STTLM-DT                                  09170000
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-DLVR-ACCT(1 : 3) TO SRCH-INP-BRANCH                 
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-PREV1                                  09130000
              END-IF                                                            
              SET ACAT33IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSR1 FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-NEXTB.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRB                                                       
                   INTO                                                 09160000
                    :ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-DLVR-ACCT(1 : 3) TO SRCH-INP-BRANCH                 
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTB                                  09130000
              END-IF                                                            
              SET ACAT33IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3.                                                                   
       0075-READ-NEXTC.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRC                                                       
                   INTO                                                 09160000
                    :ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-DLVR-ACCT(1 : 3) TO SRCH-INP-BRANCH                 
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTC                                  09130000
              END-IF                                                            
              SET ACAT33IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3.                                                                   
       0075-READ-NEXTS.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRS                                                       
                   INTO                                                 09160000
                   :ACAT33IO-ISIN-CNTRY-CD                                      
                  ,:ACAT33IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT33IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT33IO-STTLM-LCTN-CD                                      
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:ACAT33IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT33IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT33IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT33IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT33IO-PSTN-CD                                            
                  ,:ACAT33IO-DESC-TXT                                           
                  ,:ACAT33IO-ASSET-AMT                                          
                  ,:ACAT33IO-ASSET-QTY                                          
                  ,:ACAT33IO-ASSET-PCT                                          
                  ,:ACAT33IO-ASSET-CMNT-TXT                                     
                  ,:ACAT33IO-ADP-NBR                                            
LRM002            ,:ACAT33IO-CAGE-TAG                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
              PERFORM 0075-READ-ACTIMF                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRS FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0075-READ-ACTIMF.                                                        
           EXEC SQL SELECT                                              09140000
                     FCST_ACCT_RCVR_NBR                                         
ET0001              ,PRCS_DT                                                    
                 INTO                                                           
                    :ACAT33IO-FUND-ACCOUNT-NBR                                  
ET0001             ,:ACAT33IO-RE-REGIST-DATE                                    
                 FROM ACTIMF                                                    
              WHERE                                                             
                 (CLIENT_NBR    =                                               
                   :ACAT33IO-CLIENT-NBR   AND                                   
LRM007            ACAT_CONTROL_NBR =                                            
LRM007             :ACAT33IO-CONTROL-NBR  AND                                   
                  DLVR_NBR      =                                               
                   :ACAT33IO-DLVR-NBR          AND                              
                  ACCT_DLVR_NBR =                                               
                   :ACAT33IO-DLVR-ACCT         AND                              
                  RCV_NBR       =                                               
                   :ACAT33IO-RCV-NBR           AND                              
                  ACCT_RCV_NBR  =                                               
                   :ACAT33IO-RCV-ACCT          AND                              
                  ISIN_CNTRY_CD  =                                              
                   :ACAT33IO-ISIN-CNTRY-CD     AND                              
                  ISIN_SEC_ISSUE_CD =                                           
                   :ACAT33IO-ISIN-SEC-ISSUE-CD AND                              
                  ISIN_SEC_CDG_CD   =                                           
                   :ACAT33IO-ISIN-SEC-CDG-CD   AND                              
                  STTLM_LCTN_CD     =                                           
                   :ACAT33IO-STTLM-LCTN-CD     AND                              
                  CSH_MGN_SHRT_CD   =                                           
                   :ACAT33IO-CSH-MGN-SHRT-CD                                    
                 )                                                      09150000
           END-EXEC.                                                            
           EVALUATE SQLCODE                                             09220000
                WHEN +0                                                 09260000
                     CONTINUE                                                   
                WHEN +100                                               09260000
                     MOVE SPACES TO ACAT33IO-FUND-ACCOUNT-NBR                   
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
           END-EVALUATE.                                                09300000
       SKIP3                                                                    
       0075-READ-NEXTSA.                                                09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRSA                                                      
                   INTO                                                 09160000
                  :DCLVASSET.ASSET-SEQ-NBR                                      
                 ,:DCLVASSET.CONTROL-NBR-STS-CD                                 
                 ,:DCLVASSET.DLVR-NBR-STTS-CD                                   
                 ,:DCLVASSET.RCV-NBR-STTS-CD                                    
                 ,:DCLVASSET.SBMTG-PRTCP-NBR                                    
                 ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                 
                 ,:DCLVASSET.SYS-ACT-CD                                         
                 ,:DCLVASSET.SYS-RJCT-RSN-CD                                    
                 ,:DCLVASSET.TRANS-TYPE-CD                                      
                 ,:DCLVASSET.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVASSET.PHSCL-SEQ-NBR                                      
                 ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVASSET.LGCL-SEQ-NBR                                       
                 ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVASSET.ASSET-PRC-CTGY-CD                                  
                 ,:DCLVASSET.AST-PRC-CTG-STS-CD                                 
                 ,:DCLVASSET.STTLM-LCTN-CD                                      
                 ,:DCLVASSET.STTLM-LCTN-STTS-CD                                 
                 ,:DCLVASSET.STTLM-RSN-CD                                       
                 ,:DCLVASSET.STTLM-RSN-STTS-CD                                  
                 ,:DCLVASSET.ISIN-CNTRY-CD                                      
                 ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                  
                 ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-CDG-CD                                    
                 ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                 
                 ,:DCLVASSET.ASSET-DESC-TXT                                     
                 ,:DCLVASSET.ASSET-DESC-STTS-CD                                 
                 ,:DCLVASSET.ASSET-RQST-QTY-CD                                  
                 ,:DCLVASSET.ASSET-RQST-STS-CD                                  
                 ,:DCLVASSET.AST-RQST-TRANS-CD                                  
                 ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                 
                 ,:DCLVASSET.ASSET-QTY                                          
                 ,:DCLVASSET.ASSET-QTY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-PCT                                          
                 ,:DCLVASSET.ASSET-PCT-STTS-CD                                  
                 ,:DCLVASSET.PSTN-CD                                            
                 ,:DCLVASSET.PSTN-CD-STTS-CD                                    
                 ,:DCLVASSET.ISO-CRNCY-CD                                       
                 ,:DCLVASSET.ISO-CRNCY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-AMT                                          
                 ,:DCLVASSET.ASSET-AMT-STTS-CD                                  
                 ,:DCLVASSET.BEARER-BOND-CD                                     
                 ,:DCLVASSET.BEARER-BND-STTS-CD                                 
                 ,:DCLVASSET.CSH-MGN-SHRT-CD                                    
                 ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                 
                 ,:DCLVASSET.WHI-CD                                             
                 ,:DCLVASSET.WHI-STTS-CD                                        
                 ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                  
                 ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                 
                 ,:DCLVASSET.MBS-SERIAL-NBR                                     
                 ,:DCLVASSET.MBS-SERIAL-STTS-CD                                 
                 ,:DCLVASSET.ASSET-CMNT-TXT                                     
                 ,:DCLVASSET.ASSET-CMNT-STTS-CD                                 
                 ,:DCLVASSET.NSCC-ACK-IND                                       
                 ,:DCLVASSET.NSCC-PEND-CD                                       
                 ,:DCLVASSET.FAIL-SENT-CAGE-IND                                 
                 ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                 
                 ,:DCLVASSET.NSCC-NON-ADP-IND                                   
                 ,:DCLVASSET.TRANS-RFRN-ID-CD                                   
                 ,:DCLVASSET.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVASSET.OPTN-CTGY-CD                                       
                 ,:DCLVASSET.OPTN-CTGY-STTS-CD                                  
                 ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVASSET.RCRD-STTS-CD                                       
                 ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                 
                 ,:DCLVASSET.CRT-TMSTP                                          
                 ,:DCLVASSET.UPDT-TMSTP                                         
                 ,:DCLVASSET.CICS-TERM-ID-CD                                    
                 ,:DCLVASSET.PRGM-NM                                            
                 ,:DCLVASSET.SECURITY-ADP-NBR                                   
                 ,:DCLVASSET.RCL-SENT-NSCC-IND                                  
                 ,:DCLVASSET.FRV-SENT-NSCC-IND                                  
                 ,:DCLVASSET.TRNFR-TYPE-CD                                      
LRM002           ,:DCLVASSET.CAGE-TAG-NBR                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
              PERFORM 0075-READ-VMF                                             
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRSA FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0075-READ-VMF.                                                           
           EXEC SQL SELECT                                              09140000
                     FCST_ACCT_RCVR_NBR                                         
ET0001              ,PRCS_DT                                                    
                 INTO                                                           
                    :ACAT33IO-FUND-ACCOUNT-NBR                                  
ET0001             ,:ACAT33IO-RE-REGIST-DATE                                    
                 FROM VMF                                                       
              WHERE                                                             
                 (CLIENT_NBR    =                                               
                   :ACAT33IO-CLIENT-NBR   AND                                   
                  ACAT_CONTROL_NBR                                              
                       = :ACAT33IO-CONTROL-NBR AND                              
                  ASSET_SEQ_NBR =                                               
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                 )                                                      09150000
           END-EXEC.                                                            
            EVALUATE SQLCODE                                            09220000
                WHEN +0                                                 09260000
                     CONTINUE                                                   
                WHEN +100                                               09260000
                     MOVE SPACES TO ACAT33IO-FUND-ACCOUNT-NBR                   
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
            END-EVALUATE.                                               09300000
       SKIP3                                                                    
       0075-READ-NEXTXA.                                                09130000
           EXEC SQL                                                             
              FETCH                                                             
                  VASSET_CRSRX                                                  
                   INTO                                                 09160000
                  :DCLVASSET.ASSET-SEQ-NBR                                      
                 ,:DCLVASSET.CONTROL-NBR-STS-CD                                 
                 ,:DCLVASSET.DLVR-NBR-STTS-CD                                   
                 ,:DCLVASSET.RCV-NBR-STTS-CD                                    
                 ,:DCLVASSET.SBMTG-PRTCP-NBR                                    
                 ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                 
                 ,:DCLVASSET.SYS-ACT-CD                                         
                 ,:DCLVASSET.SYS-RJCT-RSN-CD                                    
                 ,:DCLVASSET.TRANS-TYPE-CD                                      
                 ,:DCLVASSET.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVASSET.PHSCL-SEQ-NBR                                      
                 ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVASSET.LGCL-SEQ-NBR                                       
                 ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVASSET.ASSET-PRC-CTGY-CD                                  
                 ,:DCLVASSET.AST-PRC-CTG-STS-CD                                 
                 ,:DCLVASSET.STTLM-LCTN-CD                                      
                 ,:DCLVASSET.STTLM-LCTN-STTS-CD                                 
                 ,:DCLVASSET.STTLM-RSN-CD                                       
                 ,:DCLVASSET.STTLM-RSN-STTS-CD                                  
                 ,:DCLVASSET.ISIN-CNTRY-CD                                      
                 ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                  
                 ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-CDG-CD                                    
                 ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                 
                 ,:DCLVASSET.ASSET-DESC-TXT                                     
                 ,:DCLVASSET.ASSET-DESC-STTS-CD                                 
                 ,:DCLVASSET.ASSET-RQST-QTY-CD                                  
                 ,:DCLVASSET.ASSET-RQST-STS-CD                                  
                 ,:DCLVASSET.AST-RQST-TRANS-CD                                  
                 ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                 
                 ,:DCLVASSET.ASSET-QTY                                          
                 ,:DCLVASSET.ASSET-QTY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-PCT                                          
                 ,:DCLVASSET.ASSET-PCT-STTS-CD                                  
                 ,:DCLVASSET.PSTN-CD                                            
                 ,:DCLVASSET.PSTN-CD-STTS-CD                                    
                 ,:DCLVASSET.ISO-CRNCY-CD                                       
                 ,:DCLVASSET.ISO-CRNCY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-AMT                                          
                 ,:DCLVASSET.ASSET-AMT-STTS-CD                                  
                 ,:DCLVASSET.BEARER-BOND-CD                                     
                 ,:DCLVASSET.BEARER-BND-STTS-CD                                 
                 ,:DCLVASSET.CSH-MGN-SHRT-CD                                    
                 ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                 
                 ,:DCLVASSET.WHI-CD                                             
                 ,:DCLVASSET.WHI-STTS-CD                                        
                 ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                  
                 ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                 
                 ,:DCLVASSET.MBS-SERIAL-NBR                                     
                 ,:DCLVASSET.MBS-SERIAL-STTS-CD                                 
                 ,:DCLVASSET.ASSET-CMNT-TXT                                     
                 ,:DCLVASSET.ASSET-CMNT-STTS-CD                                 
                 ,:DCLVASSET.NSCC-ACK-IND                                       
                 ,:DCLVASSET.NSCC-PEND-CD                                       
                 ,:DCLVASSET.FAIL-SENT-CAGE-IND                                 
                 ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                 
                 ,:DCLVASSET.NSCC-NON-ADP-IND                                   
                 ,:DCLVASSET.TRANS-RFRN-ID-CD                                   
                 ,:DCLVASSET.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVASSET.OPTN-CTGY-CD                                       
                 ,:DCLVASSET.OPTN-CTGY-STTS-CD                                  
                 ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVASSET.RCRD-STTS-CD                                       
                 ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                 
                 ,:DCLVASSET.CRT-TMSTP                                          
                 ,:DCLVASSET.UPDT-TMSTP                                         
                 ,:DCLVASSET.CICS-TERM-ID-CD                                    
                 ,:DCLVASSET.PRGM-NM                                            
                 ,:DCLVASSET.SECURITY-ADP-NBR                                   
                 ,:DCLVASSET.RCL-SENT-NSCC-IND                                  
                 ,:DCLVASSET.FRV-SENT-NSCC-IND                                  
                 ,:DCLVASSET.TRNFR-TYPE-CD                                      
LRM002           ,:DCLVASSET.CAGE-TAG-NBR                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
ET0001        PERFORM 0075-READ-VMF                                             
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRSA FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       SKIP3                                                                    
       0075-READ-NEXTX.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  VASTHSTY_CRSRX                                                
                   INTO                                                 09160000
                  :DCLVASTHSTY.ASSET-SEQ-NBR                                    
                 ,:DCLVASTHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVASTHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVASTHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVASTHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVASTHSTY.AST-SEQ-NBR-STS-CD                               
                 ,:DCLVASTHSTY.SYS-ACT-CD                                       
                 ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVASTHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVASTHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVASTHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVASTHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVASTHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                                
                 ,:DCLVASTHSTY.AST-PRC-CTG-STS-CD                               
                 ,:DCLVASTHSTY.STTLM-LCTN-CD                                    
                 ,:DCLVASTHSTY.STTLM-LCTN-STTS-CD                               
                 ,:DCLVASTHSTY.STTLM-RSN-CD                                     
                 ,:DCLVASTHSTY.STTLM-RSN-STTS-CD                                
                 ,:DCLVASTHSTY.ISIN-CNTRY-CD                                    
                 ,:DCLVASTHSTY.ISIN-CNTRY-STTS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                
                 ,:DCLVASTHSTY.ISIN-SEC-IS-STS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                  
                 ,:DCLVASTHSTY.ISIN-SEC-CD-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-DESC-TXT                                   
                 ,:DCLVASTHSTY.ASSET-DESC-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                                
                 ,:DCLVASTHSTY.ASSET-RQST-STS-CD                                
                 ,:DCLVASTHSTY.AST-RQST-TRANS-CD                                
                 ,:DCLVASTHSTY.AST-RQ-TRAN-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-QTY                                        
                 ,:DCLVASTHSTY.ASSET-QTY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-PCT                                        
                 ,:DCLVASTHSTY.ASSET-PCT-STTS-CD                                
                 ,:DCLVASTHSTY.PSTN-CD                                          
                 ,:DCLVASTHSTY.PSTN-CD-STTS-CD                                  
                 ,:DCLVASTHSTY.ISO-CRNCY-CD                                     
                 ,:DCLVASTHSTY.ISO-CRNCY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-AMT                                        
                 ,:DCLVASTHSTY.ASSET-AMT-STTS-CD                                
                 ,:DCLVASTHSTY.BEARER-BOND-CD                                   
                 ,:DCLVASTHSTY.BEARER-BND-STTS-CD                               
                 ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                  
                 ,:DCLVASTHSTY.CSH-MRG-SHT-STS-CD                               
                 ,:DCLVASTHSTY.WHI-CD                                           
                 ,:DCLVASTHSTY.WHI-STTS-CD                                      
                 ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                                
                 ,:DCLVASTHSTY.TRN-TYP-RSN-STS-CD                               
                 ,:DCLVASTHSTY.MBS-SERIAL-NBR                                   
                 ,:DCLVASTHSTY.MBS-SERIAL-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-CMNT-TXT                                   
                 ,:DCLVASTHSTY.ASSET-CMNT-STTS-CD                               
                 ,:DCLVASTHSTY.NSCC-ACK-IND                                     
                 ,:DCLVASTHSTY.NSCC-PEND-CD                                     
                 ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                               
                 ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                               
                 ,:DCLVASTHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVASTHSTY.OPTN-CTGY-CD                                     
                 ,:DCLVASTHSTY.OPTN-CTGY-STTS-CD                                
                 ,:DCLVASTHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVASTHSTY.RCRD-STTS-CD                                     
                 ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                               
                 ,:DCLVASTHSTY.CRT-TMSTP                                        
                 ,:DCLVASTHSTY.UPDT-TMSTP                                       
                 ,:DCLVASTHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVASTHSTY.PRGM-NM                                          
                 ,:DCLVASTHSTY.SECURITY-ADP-NBR                                 
                 ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.TRNFR-TYPE-CD                                    
LRM002           ,:DCLVASTHSTY.CAGE-TAG-NBR                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
LRM001        IF ACAT33IO-VALUE-FREE = 'Y'                                      
LRM001           MOVE ZEROS TO ASSET-AMT OF DCLVASTHSTY                         
LRM001        END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRSA FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV-ASTHSTY.                                          09130000
           EXEC SQL                                                             
              FETCH                                                             
                  VASTHSTY_CSR_PREV                                             
                   INTO                                                 09160000
                  :DCLVASTHSTY.ASSET-SEQ-NBR                                    
                 ,:DCLVASTHSTY.CONTROL-NBR-STS-CD                               
                 ,:DCLVASTHSTY.DLVR-NBR-STTS-CD                                 
                 ,:DCLVASTHSTY.RCV-NBR-STTS-CD                                  
                 ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                  
                 ,:DCLVASTHSTY.SBMT-PRT-NR-STS-CD                               
                 ,:DCLVASTHSTY.AST-SEQ-NBR-STS-CD                               
                 ,:DCLVASTHSTY.SYS-ACT-CD                                       
                 ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                  
                 ,:DCLVASTHSTY.TRANS-TYPE-CD                                    
                 ,:DCLVASTHSTY.TRANS-TYPE-STTS-CD                               
                 ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                    
                 ,:DCLVASTHSTY.PHSCL-SEQ-STTS-CD                                
                 ,:DCLVASTHSTY.LGCL-SEQ-NBR                                     
                 ,:DCLVASTHSTY.LGCL-SEQ-NR-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                                
                 ,:DCLVASTHSTY.AST-PRC-CTG-STS-CD                               
                 ,:DCLVASTHSTY.STTLM-LCTN-CD                                    
                 ,:DCLVASTHSTY.STTLM-LCTN-STTS-CD                               
                 ,:DCLVASTHSTY.STTLM-RSN-CD                                     
                 ,:DCLVASTHSTY.STTLM-RSN-STTS-CD                                
                 ,:DCLVASTHSTY.ISIN-CNTRY-CD                                    
                 ,:DCLVASTHSTY.ISIN-CNTRY-STTS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                
                 ,:DCLVASTHSTY.ISIN-SEC-IS-STS-CD                               
                 ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                  
                 ,:DCLVASTHSTY.ISIN-SEC-CD-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-DESC-TXT                                   
                 ,:DCLVASTHSTY.ASSET-DESC-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                                
                 ,:DCLVASTHSTY.ASSET-RQST-STS-CD                                
                 ,:DCLVASTHSTY.AST-RQST-TRANS-CD                                
                 ,:DCLVASTHSTY.AST-RQ-TRAN-STS-CD                               
                 ,:DCLVASTHSTY.ASSET-QTY                                        
                 ,:DCLVASTHSTY.ASSET-QTY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-PCT                                        
                 ,:DCLVASTHSTY.ASSET-PCT-STTS-CD                                
                 ,:DCLVASTHSTY.PSTN-CD                                          
                 ,:DCLVASTHSTY.PSTN-CD-STTS-CD                                  
                 ,:DCLVASTHSTY.ISO-CRNCY-CD                                     
                 ,:DCLVASTHSTY.ISO-CRNCY-STTS-CD                                
                 ,:DCLVASTHSTY.ASSET-AMT                                        
                 ,:DCLVASTHSTY.ASSET-AMT-STTS-CD                                
                 ,:DCLVASTHSTY.BEARER-BOND-CD                                   
                 ,:DCLVASTHSTY.BEARER-BND-STTS-CD                               
                 ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                  
                 ,:DCLVASTHSTY.CSH-MRG-SHT-STS-CD                               
                 ,:DCLVASTHSTY.WHI-CD                                           
                 ,:DCLVASTHSTY.WHI-STTS-CD                                      
                 ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                                
                 ,:DCLVASTHSTY.TRN-TYP-RSN-STS-CD                               
                 ,:DCLVASTHSTY.MBS-SERIAL-NBR                                   
                 ,:DCLVASTHSTY.MBS-SERIAL-STTS-CD                               
                 ,:DCLVASTHSTY.ASSET-CMNT-TXT                                   
                 ,:DCLVASTHSTY.ASSET-CMNT-STTS-CD                               
                 ,:DCLVASTHSTY.NSCC-ACK-IND                                     
                 ,:DCLVASTHSTY.NSCC-PEND-CD                                     
                 ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                               
                 ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                               
                 ,:DCLVASTHSTY.NSCC-NON-ADP-IND                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                                 
                 ,:DCLVASTHSTY.TRANS-RFRN-STTS-CD                               
                 ,:DCLVASTHSTY.OPTN-CTGY-CD                                     
                 ,:DCLVASTHSTY.OPTN-CTGY-STTS-CD                                
                 ,:DCLVASTHSTY.RCRD-LNGTH-STTS-CD                               
                 ,:DCLVASTHSTY.RCRD-STTS-CD                                     
                 ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                               
                 ,:DCLVASTHSTY.CRT-TMSTP                                        
                 ,:DCLVASTHSTY.UPDT-TMSTP                                       
                 ,:DCLVASTHSTY.CICS-TERM-ID-CD                                  
                 ,:DCLVASTHSTY.PRGM-NM                                          
                 ,:DCLVASTHSTY.SECURITY-ADP-NBR                                 
                 ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                                
                 ,:DCLVASTHSTY.TRNFR-TYPE-CD                                    
LRM002           ,:DCLVASTHSTY.CAGE-TAG-NBR                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
LRM001        IF ACAT33IO-VALUE-FREE = 'Y'                                      
LRM001           MOVE ZEROS TO ASSET-AMT OF DCLVASTHSTY                         
LRM001        END-IF                                                            
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRSA FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV4.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR4                                                       
                   INTO                                                 09160000
                   :ACAT33IO-ISIN-CNTRY-CD                                      
                  ,:ACAT33IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT33IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT33IO-STTLM-LCTN-CD                                      
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:ACAT33IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT33IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT33IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT33IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT33IO-PSTN-CD                                            
                  ,:ACAT33IO-DESC-TXT                                           
                  ,:ACAT33IO-ASSET-AMT                                          
                  ,:ACAT33IO-ASSET-QTY                                          
                  ,:ACAT33IO-ASSET-PCT                                          
                  ,:ACAT33IO-ASSET-CMNT-TXT                                     
                  ,:ACAT33IO-ADP-NBR                                            
LRM002            ,:ACAT33IO-CAGE-TAG                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
              PERFORM 0075-READ-ACTIMF                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSR4 FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV4A.                                                09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR4A                                                      
                   INTO                                                 09160000
                  :DCLVASSET.ASSET-SEQ-NBR                                      
                 ,:DCLVASSET.CONTROL-NBR-STS-CD                                 
                 ,:DCLVASSET.DLVR-NBR-STTS-CD                                   
                 ,:DCLVASSET.RCV-NBR-STTS-CD                                    
                 ,:DCLVASSET.SBMTG-PRTCP-NBR                                    
                 ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                 
                 ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                 
                 ,:DCLVASSET.SYS-ACT-CD                                         
                 ,:DCLVASSET.SYS-RJCT-RSN-CD                                    
                 ,:DCLVASSET.TRANS-TYPE-CD                                      
                 ,:DCLVASSET.TRANS-TYPE-STTS-CD                                 
                 ,:DCLVASSET.PHSCL-SEQ-NBR                                      
                 ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                  
                 ,:DCLVASSET.LGCL-SEQ-NBR                                       
                 ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                 
                 ,:DCLVASSET.ASSET-PRC-CTGY-CD                                  
                 ,:DCLVASSET.AST-PRC-CTG-STS-CD                                 
                 ,:DCLVASSET.STTLM-LCTN-CD                                      
                 ,:DCLVASSET.STTLM-LCTN-STTS-CD                                 
                 ,:DCLVASSET.STTLM-RSN-CD                                       
                 ,:DCLVASSET.STTLM-RSN-STTS-CD                                  
                 ,:DCLVASSET.ISIN-CNTRY-CD                                      
                 ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                  
                 ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                 
                 ,:DCLVASSET.ISIN-SEC-CDG-CD                                    
                 ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                 
                 ,:DCLVASSET.ASSET-DESC-TXT                                     
                 ,:DCLVASSET.ASSET-DESC-STTS-CD                                 
                 ,:DCLVASSET.ASSET-RQST-QTY-CD                                  
                 ,:DCLVASSET.ASSET-RQST-STS-CD                                  
                 ,:DCLVASSET.AST-RQST-TRANS-CD                                  
                 ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                 
                 ,:DCLVASSET.ASSET-QTY                                          
                 ,:DCLVASSET.ASSET-QTY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-PCT                                          
                 ,:DCLVASSET.ASSET-PCT-STTS-CD                                  
                 ,:DCLVASSET.PSTN-CD                                            
                 ,:DCLVASSET.PSTN-CD-STTS-CD                                    
                 ,:DCLVASSET.ISO-CRNCY-CD                                       
                 ,:DCLVASSET.ISO-CRNCY-STTS-CD                                  
                 ,:DCLVASSET.ASSET-AMT                                          
                 ,:DCLVASSET.ASSET-AMT-STTS-CD                                  
                 ,:DCLVASSET.BEARER-BOND-CD                                     
                 ,:DCLVASSET.BEARER-BND-STTS-CD                                 
                 ,:DCLVASSET.CSH-MGN-SHRT-CD                                    
                 ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                 
                 ,:DCLVASSET.WHI-CD                                             
                 ,:DCLVASSET.WHI-STTS-CD                                        
                 ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                  
                 ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                 
                 ,:DCLVASSET.MBS-SERIAL-NBR                                     
                 ,:DCLVASSET.MBS-SERIAL-STTS-CD                                 
                 ,:DCLVASSET.ASSET-CMNT-TXT                                     
                 ,:DCLVASSET.ASSET-CMNT-STTS-CD                                 
                 ,:DCLVASSET.NSCC-ACK-IND                                       
                 ,:DCLVASSET.NSCC-PEND-CD                                       
                 ,:DCLVASSET.FAIL-SENT-CAGE-IND                                 
                 ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                 
                 ,:DCLVASSET.NSCC-NON-ADP-IND                                   
                 ,:DCLVASSET.TRANS-RFRN-ID-CD                                   
                 ,:DCLVASSET.TRANS-RFRN-STTS-CD                                 
                 ,:DCLVASSET.OPTN-CTGY-CD                                       
                 ,:DCLVASSET.OPTN-CTGY-STTS-CD                                  
                 ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                 
                 ,:DCLVASSET.RCRD-STTS-CD                                       
                 ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                 
                 ,:DCLVASSET.CRT-TMSTP                                          
                 ,:DCLVASSET.UPDT-TMSTP                                         
                 ,:DCLVASSET.CICS-TERM-ID-CD                                    
                 ,:DCLVASSET.PRGM-NM                                            
                 ,:DCLVASSET.SECURITY-ADP-NBR                                   
                 ,:DCLVASSET.RCL-SENT-NSCC-IND                                  
                 ,:DCLVASSET.FRV-SENT-NSCC-IND                                  
                 ,:DCLVASSET.TRNFR-TYPE-CD                                      
LRM004           ,:DCLVASSET.CAGE-TAG-NBR                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT33IO-ASSET-FOUND TO TRUE                                  
              PERFORM 0075-READ-VMF                                             
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-ASSET-NOT-FOUND TO TRUE                              
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSR4A FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0077-MOVE-ASSET-TO-IOAREA.                                               
           MOVE ASSET-SEQ-NBR      OF DCLVASSET TO                              
                  ACAT33IO-ASSET-SEQ-NBR                                        
           MOVE ASSET-PRC-CTGY-CD  OF DCLVASSET TO                              
                  ACAT33IO-ASSET-PRC-CTGY-CD                                    
           MOVE STTLM-LCTN-CD      OF DCLVASSET TO                              
                  ACAT33IO-STTLM-LCTN-CD                                        
           MOVE ISIN-CNTRY-CD      OF DCLVASSET TO                              
                  ACAT33IO-ISIN-CNTRY-CD                                        
           MOVE ISIN-SEC-ISSUE-CD  OF DCLVASSET TO                              
                  ACAT33IO-ISIN-SEC-ISSUE-CD                                    
           MOVE ISIN-SEC-CDG-CD    OF DCLVASSET TO                              
                  ACAT33IO-ISIN-SEC-CDG-CD                                      
           MOVE ASSET-DESC-TXT     OF DCLVASSET TO                              
                  ACAT33IO-DESC-TXT                                             
           MOVE ASSET-RQST-QTY-CD  OF DCLVASSET TO                              
                  ACAT33IO-ASSET-RQST-QTY-CD                                    
           MOVE AST-RQST-TRANS-CD  OF DCLVASSET TO                              
                  ACAT33IO-AST-RQST-TRANS-CD                                    
           MOVE ASSET-QTY          OF DCLVASSET TO                              
                  ACAT33IO-ASSET-QTY                                            
           MOVE ASSET-PCT          OF DCLVASSET TO                              
                  ACAT33IO-ASSET-PCT                                            
           MOVE PSTN-CD            OF DCLVASSET TO                              
                  ACAT33IO-PSTN-CD                                              
           MOVE ASSET-AMT          OF DCLVASSET TO                              
                  ACAT33IO-ASSET-AMT                                            
           MOVE CSH-MGN-SHRT-CD    OF DCLVASSET TO                              
                  ACAT33IO-CSH-MGN-SHRT-CD                                      
           MOVE ASSET-CMNT-TXT     OF DCLVASSET TO                              
                  ACAT33IO-ASSET-CMNT-TXT                                       
           MOVE SECURITY-ADP-NBR   OF DCLVASSET TO                              
                  ACAT33IO-ADP-NBR.                                             
LRM002     MOVE CAGE-TAG-NBR       OF DCLVASSET TO                              
LRM002            ACAT33IO-CAGE-TAG.                                            
                                                                                
       0077-MOVE-ASTHSTY-TO-IOAREA.                                             
           MOVE ASSET-SEQ-NBR      OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-SEQ-NBR                                        
           MOVE ASSET-PRC-CTGY-CD  OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-PRC-CTGY-CD                                    
           MOVE STTLM-LCTN-CD      OF DCLVASTHSTY TO                            
                  ACAT33IO-STTLM-LCTN-CD                                        
           MOVE ISIN-CNTRY-CD      OF DCLVASTHSTY TO                            
                  ACAT33IO-ISIN-CNTRY-CD                                        
           MOVE ISIN-SEC-ISSUE-CD  OF DCLVASTHSTY TO                            
                  ACAT33IO-ISIN-SEC-ISSUE-CD                                    
           MOVE ISIN-SEC-CDG-CD    OF DCLVASTHSTY TO                            
                  ACAT33IO-ISIN-SEC-CDG-CD                                      
           MOVE ASSET-DESC-TXT     OF DCLVASTHSTY TO                            
                  ACAT33IO-DESC-TXT                                             
           MOVE ASSET-RQST-QTY-CD  OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-RQST-QTY-CD                                    
           MOVE AST-RQST-TRANS-CD  OF DCLVASTHSTY TO                            
                  ACAT33IO-AST-RQST-TRANS-CD                                    
           MOVE ASSET-QTY          OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-QTY                                            
           MOVE ASSET-PCT          OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-PCT                                            
           MOVE PSTN-CD            OF DCLVASTHSTY TO                            
                  ACAT33IO-PSTN-CD                                              
           MOVE ASSET-AMT          OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-AMT                                            
           MOVE CSH-MGN-SHRT-CD    OF DCLVASTHSTY TO                            
                  ACAT33IO-CSH-MGN-SHRT-CD                                      
           MOVE ASSET-CMNT-TXT     OF DCLVASTHSTY TO                            
                  ACAT33IO-ASSET-CMNT-TXT                                       
           MOVE SECURITY-ADP-NBR   OF DCLVASTHSTY TO                            
                  ACAT33IO-ADP-NBR.                                             
LRM002     MOVE CAGE-TAG-NBR       OF DCLVASTHSTY TO                            
LRM002            ACAT33IO-CAGE-TAG.                                            
                                                                                
       0075-SIGNON-SECR-CHECK-RTN.                                              
           IF ACAT33IO-SUPER-SIGN-ON                                            
              SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                           
           ELSE                                                                 
              SET SECURITY-LOOKUP TO TRUE                                       
              EXEC CICS LINK PROGRAM (WS-ACATSRCH)                      02890002
                  COMMAREA(ACAT-SRCH-COMM-AREA)                         02900002
                  LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                 02910002
              END-EXEC                                                  02920002
           END-IF.                                                              
       SKIP3                                                                    
       0080-CLOSE-TFRCSRA.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRA                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRAP.                                                     
           EXEC SQL                                                             
              CLOSE TFRCSRAP                                                    
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRAR.                                                     
           EXEC SQL                                                             
              CLOSE TFRCSRAR                                                    
           END-EXEC.                                                            
       0080-CLOSE-TFRCSR1.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSR1                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRB.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRB                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRC.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRC                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRS.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRS                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRSA.                                                     
           EXEC SQL                                                             
              CLOSE TFRCSRSA                                                    
           END-EXEC.                                                            
       0080-CLOSE-TFRCSR4.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSR4                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSR4A.                                                     
           EXEC SQL                                                             
              CLOSE TFRCSR4A                                                    
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRAA.                                                     
           EXEC SQL                                                             
              CLOSE TFRCSRAA                                                    
           END-EXEC.                                                            
       0080-CLOSE-VASSET-CRSRX.                                                 
           EXEC SQL                                                             
              CLOSE VASSET_CRSRX                                                
           END-EXEC.                                                            
       0080-CLOSE-VASTHSTY-CRSRX.                                               
           EXEC SQL                                                             
              CLOSE VASTHSTY_CRSRX                                              
           END-EXEC.                                                            
       0080-CLOSE-VASTHSTY-CSR-PREV.                                            
           EXEC SQL                                                             
              CLOSE VASTHSTY_CSR_PREV                                           
           END-EXEC.                                                            
       EJECT                                                                    
       0100-GET-ACTITRF.                                                09130000
           EXEC SQL SELECT                                              09140000
                   RCV_ACCT_TYPE_CD                                             
LRM007            ,ACAT_CONTROL_NBR                                             
                  ,ACAT_CNTL_ASTD_NBR                                           
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                  ,STTLM_ASCTD_DT                                               
                 INTO                                                   09160000
                   :ACAT33IO-RCV-ACCT-TYPE-CD                                   
                  ,:ACAT33IO-CONTROL-NBR                                        
LRM007            ,:ACAT33IO-CNTL-ASTD-NBR                                      
                  ,:ACAT33IO-TRNFR-TYPE-CD                                      
                  ,:ACAT33IO-RCV-CUST-NM                                        
                  ,:ACAT33IO-RCV-SS-PRIM-NBR                                    
                  ,:ACAT33IO-RCV-SS-SCNDY-NBR                                   
                  ,:ACAT33IO-CMNT-TXT                                           
                  ,:ACAT33IO-NSCC-PEND-CD                                       
                  ,:ACAT33IO-NSCC-ACK-IND                                       
                  ,:ACAT33IO-STTS-CD                                            
                  ,:ACAT33IO-RR-CD                                              
                  ,:ACAT33IO-UPDT-TMSTP                                         
                  ,:ACAT33IO-STTLM-DT                                   09170000
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT33IO-CONTROL-NBR                           
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC')                                  09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
LRM009          WHEN -811                                               09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
093800          WHEN +100                                               09260000
*********            SET ACAT33IO-NOT-FOUND TO TRUE                             
                     PERFORM 0120-READ-ACTIVE-ACAT                              
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
094300*                                                                 09310000
094400 0100-EXIT.                                                       09320000
094500     EXIT.                                                        09330000
                                                                                
LRM009 EJECT                                                                    
LRM009 0110-GET-ACTITRF-REREAD.                                         09130000
LRM009     EXEC SQL SELECT                                              09140000
LRM009             RCV_ACCT_TYPE_CD                                             
LRM009            ,ACAT_CONTROL_NBR                                             
LRM009            ,ACAT_CNTL_ASTD_NBR                                           
LRM009            ,TRNFR_TYPE_CD                                                
LRM009            ,RCV_CUST_NM                                                  
LRM009            ,RCV_SS_PRIM_NBR                                      09150000
LRM009            ,RCV_SS_SCNDY_NBR                                             
LRM009            ,CMNT_TXT                                                     
LRM009            ,NSCC_PEND_CD                                                 
LRM009            ,NSCC_ACK_IND                                                 
LRM009            ,STTS_CD                                                      
LRM009            ,RR_CD                                                        
LRM009            ,UPDT_TMSTP                                                   
LRM009            ,STTLM_ASCTD_DT                                               
LRM009           INTO                                                   09160000
LRM009             :ACAT33IO-RCV-ACCT-TYPE-CD                                   
LRM009            ,:ACAT33IO-CONTROL-NBR                                        
LRM009            ,:ACAT33IO-CNTL-ASTD-NBR                                      
LRM009            ,:ACAT33IO-TRNFR-TYPE-CD                                      
LRM009            ,:ACAT33IO-RCV-CUST-NM                                        
LRM009            ,:ACAT33IO-RCV-SS-PRIM-NBR                                    
LRM009            ,:ACAT33IO-RCV-SS-SCNDY-NBR                                   
LRM009            ,:ACAT33IO-CMNT-TXT                                           
LRM009            ,:ACAT33IO-NSCC-PEND-CD                                       
LRM009            ,:ACAT33IO-NSCC-ACK-IND                                       
LRM009            ,:ACAT33IO-STTS-CD                                            
LRM009            ,:ACAT33IO-RR-CD                                              
LRM009            ,:ACAT33IO-UPDT-TMSTP                                         
LRM009            ,:ACAT33IO-STTLM-DT                                   09170000
LRM009           FROM ACTITRF                                           09170000
LRM009            WHERE (CLIENT_NBR                                     09180000
LRM009                        = :ACAT33IO-CLIENT-NBR                    09190000
LRM009               AND ACAT_CNTL_ASTD_NBR                                     
LRM009                        = :ACAT33IO-CNTL-ASTD-NBR                         
LRM009               AND DLVR_NBR                                       09180000
LRM009                        = :ACAT33IO-DLVR-NBR                      09190000
LRM009               AND ACCT_DLVR_NBR                                  09180000
LRM009                        = :ACAT33IO-DLVR-ACCT                     09190000
LRM009               AND RCV_NBR                                        09180000
LRM009                        = :ACAT33IO-RCV-NBR                       09190000
LRM009               AND ACCT_RCV_NBR                                   09180000
LRM009                        = :ACAT33IO-RCV-ACCT                      09190000
LRM009               AND TRNFR_TYPE_CD                                  09180000
LRM009                        = 'MFC')                                  09190000
LRM009      END-EXEC.                                                   09200000
LRM009*                                                                 09210000
LRM009      EVALUATE SQLCODE                                            09220000
LRM009          WHEN +0                                                 09260000
LRM009          WHEN -811                                               09260000
LRM009               SET ACAT33IO-FOUND TO TRUE                                 
LRM009          WHEN +100                                               09260000
*********            SET ACAT33IO-NOT-FOUND TO TRUE                             
LRM009               PERFORM 0120-READ-ACTIVE-ACAT                              
LRM009          WHEN OTHER                                              09280000
LRM009               PERFORM 9000-WRITE-TO-CICS-LOG                             
LRM009               PERFORM 9500-RETURN-DB2-ERROR                              
LRM009      END-EVALUATE.                                               09300000
LRM009                                                                          
LRM009*                                                                 09310000
LRM009 0110-EXIT.                                                       09320000
LRM009     EXIT.                                                        09330000
                                                                                
           EJECT                                                                
       0120-READ-ACTIVE-ACAT.                                                   
LRM****** NOT SURE IF THERE CAN BE MULTIPLE HITS ON ACTIVE TABLE BELOW          
LRM****** FOR GIVEN MFC, RCV, RCV-ACCT, DLVR, DLVR-ACCT FIELDS.                 
            EXEC SQL SELECT                                             09140000
                   ACAT_CONTROL_NBR                                     09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,RCV_OCC_BRKR_NBR                                             
                   INTO                                                 09160000
                    :ACAT33IO-CONTROL-NBR                                       
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC')                                  09190000
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-ACTIVE-FOUND TO TRUE                          
093800          WHEN +100                                               09260000
                     SET ACAT33IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
       0125-READ-NEXT-MFC.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRAR                                                      
                   INTO                                                 09160000
                    :ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-ACCT-RJCT-RSBM-IND                        09170000
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-STTLM-DT                                  09170000
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                GO TO 0125-READ-NEXT-MFC                                        
              END-IF                                                            
              PERFORM 0080-CLOSE-TFRCSRAR                                       
              SET ACAT33IO-ACTIVE-FOUND TO TRUE                                 
              MOVE 'Y' TO ACAT33IO-ACTIVE-DB                                    
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRAR FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0127-READ-PREV-MFC.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRAP                                                      
                   INTO                                                 09160000
                    :ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-ACCT-RJCT-RSBM-IND                        09170000
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-STTLM-DT                                  09170000
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT33IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT33IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                GO TO 0127-READ-PREV-MFC                                        
              END-IF                                                            
              PERFORM 0080-CLOSE-TFRCSRAP                                       
              SET ACAT33IO-ACTIVE-FOUND TO TRUE                                 
              MOVE 'Y' TO ACAT33IO-ACTIVE-DB                                    
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT33IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRAP FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
           EJECT                                                                
       0150-READ-HSTY-ACAT-DIRECT.                                              
            EXEC SQL SELECT                                             09140000
                   RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,TRNFR_TYPE_CD                                        09180000
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,RCV_OCC_BRKR_NBR                                             
                  ,ACCT_RJCT_RSBM_IND                                           
                  ,STTLM_DT                                                     
                   INTO                                                 09160000
                    :ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-ACCT-RJCT-RSBM-IND                        09170000
                   ,:ACAT33IO-STTLM-DT                                  09170000
                   FROM VTRNHSTY                                        09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR)                          
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
                     MOVE 'H' TO ACAT33IO-NSCC-PEND-CD                          
LRM007               MOVE SPACES TO ACAT33IO-CNTL-ASTD-NBR                      
                     PERFORM 0156-CHECK-FOR-DUPE-MFC-RTN                        
                        THRU 0156-EXIT                                          
LRM001               PERFORM 0154-SET-ASSET-FREE-IND                            
                     MOVE ZEROS TO ACAT33IO-ASSET-SEQ-NBR                       
LRM007               MOVE ACAT33IO-CONTROL-NBR TO WS-CONTROL-NBR                
                     PERFORM 0050-OPEN-VASTHSTY-CRSRX                   09130000
ASSET                PERFORM 0075-READ-NEXTX                            09130000
                     PERFORM 0077-MOVE-ASTHSTY-TO-IOAREA                        
                     PERFORM 0080-CLOSE-VASTHSTY-CRSRX                          
                     SET ACAT33IO-HISTORY-FOUND TO TRUE                         
                     MOVE 'H' TO ACAT33IO-ACTIVE-DB                             
093800          WHEN +100                                               09260000
                     PERFORM 0160-READ-INITIAL-MFC-DIRECT                       
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300                                                                  09310000
           EJECT                                                                
       0152-READ-ACTIVE-ACAT-DIRECT.                                            
            EXEC SQL SELECT                                             09140000
                   RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,TRNFR_TYPE_CD                                        09180000
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,RCV_OCC_BRKR_NBR                                             
                  ,ACCT_RJCT_RSBM_IND                                           
                  ,STTLM_DT                                                     
                   INTO                                                 09160000
                    :ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-ACCT-RJCT-RSBM-IND                        09170000
                   ,:ACAT33IO-STTLM-DT                                  09170000
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR)                          
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
                     MOVE 'H' TO ACAT33IO-NSCC-PEND-CD                          
LRM001               PERFORM 0154-SET-ASSET-FREE-IND                            
                     MOVE ZEROS TO ACAT33IO-ASSET-SEQ-NBR                       
                     PERFORM 0050-OPEN-VASSET-CRSRX                     09130000
                     PERFORM 0075-READ-NEXTXA                           09130000
                     PERFORM 0077-MOVE-ASSET-TO-IOAREA                          
                     PERFORM 0080-CLOSE-VASSET-CRSRX                            
                     MOVE 'Y' TO ACAT33IO-ACTIVE-DB                             
                WHEN +100                                               09260000
                     PERFORM 0160-READ-INITIAL-MFC-DIRECT                       
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300                                                                  09310000
LRM001 0154-SET-ASSET-FREE-IND.                                                 
           EXEC SQL SELECT                                              09140000
                   PRTCP_TYPE_CD                                                
                 INTO                                                   09160000
                   :DCLVPRTCPPF.PRTCP-TYPE-CD                           09180000
                 FROM VPRTCPPF                                          09170000
                  WHERE PRTCP_NBR = :ACAT33IO-RCV-NBR                   09180000
           END-EXEC.                                                    09200000
           IF SQLCODE = 0                                                       
           AND PRTCP-TYPE-CD OF DCLVPRTCPPF = '1'                       09180000
              MOVE 'Y' TO ACAT33IO-VALUE-FREE                                   
           ELSE                                                                 
              MOVE 'N' TO ACAT33IO-VALUE-FREE                                   
           END-IF.                                                              
       0156-CHECK-FOR-DUPE-MFC-RTN.                                             
    ****** FIRST SEE IF MFC EXISTS ON ACTIVE FILE WITH THESE KEYS:              
           PERFORM 0050-OPEN-CURSORAA.                                  09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRAA                                                      
                   INTO                                                 09160000
                    :ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-CONTROL-NBR                                       
LRM007             ,:ACAT33IO-CNTL-ASTD-NBR                                     
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:ACAT33IO-NSCC-ACK-IND                                      
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-STTLM-DT                                  09170000
           END-EXEC.                                                            
           IF SQLCODE = 0 OR -811                                               
              SET ACAT33IO-MFC-ACTIVE-FOUND TO TRUE                             
              MOVE 'Y' TO ACAT33IO-ACTIVE-DB                                    
              GO TO 0156-EXIT                                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              CONTINUE                                                          
           ELSE                                                                 
    ******    MOVE '** ACAT33DB - TFRCSRAA FETCH ERR  **     '                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
           PERFORM 0080-CLOSE-TFRCSRAA.                                         
                                                                                
    ****** NOW SEE IF MFC EXISTS ON INITIAL FILE WITH THESE KEYS:               
           EXEC SQL SELECT                                              09140000
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                     09180000
                 INTO                                                   09160000
                   :DCLVTRNFR.CLIENT-NBR                                09180000
                  ,:WS-CONTROL-NBR                                              
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = '              '                                
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC')                                  09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                WHEN -811                                               09260000
                     SET ACAT33IO-MFC-INITIAL-FOUND TO TRUE                     
                WHEN +100                                               09260000
                     CONTINUE                                                   
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
            END-EVALUATE.                                               09300000
                                                                                
       0156-EXIT. EXIT.                                                         
                                                                                
       0160-READ-INITIAL-MFC-DIRECT.                                            
            EXEC SQL SELECT                                             09140000
                   RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,TRNFR_TYPE_CD                                        09180000
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,RCV_OCC_BRKR_NBR                                             
                  ,UPDT_TMSTP                                                   
                   INTO                                                 09160000
                    :ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT33IO-TRNFR-TYPE-CD                                     
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT33IO-CMNT-TXT                                          
                   ,:ACAT33IO-STTS-CD                                           
                   ,:ACAT33IO-RR-CD                                             
                   ,:ACAT33IO-RCV-OCC-BRKR-NBR                                  
                   ,:ACAT33IO-UPDT-TMSTP                                        
                   FROM ACTITRF                                         09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = :ACAT33IO-TRNFR-TYPE-CD                         
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT33IO-CONTROL-NBR)                          
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
                     MOVE 'MFC' TO ACAT33IO-TRNFR-TYPE-CD                       
                     MOVE 'H' TO ACAT33IO-NSCC-PEND-CD                          
               PERFORM 0050-OPEN-CURSORS                                09130000
               PERFORM 0075-READ-NEXTS                                  09130000
               PERFORM 0080-CLOSE-TFRCSRS                                       
                     SET ACAT33IO-ACTIVE-FOUND TO TRUE                          
093800          WHEN +100                                               09260000
                     SET ACAT33IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300                                                                  09310000
           EJECT                                                                
       0180-GET-ACTIAST.                                                09130000
      *----------------------------------------------------------------*        
      * DIRECT READ ON ASSET WITH FULL KEY.                                     
      *----------------------------------------------------------------*        
           EXEC SQL SELECT                                              09140000
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,STTLM_RSN_CD                                         09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
LRM002            ,CAGE_TAG_NBR                                                 
                 INTO                                                   09160000
                   :ACAT33IO-ISIN-CNTRY-CD                                      
                  ,:ACAT33IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT33IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT33IO-STTLM-LCTN-CD                                      
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:ACAT33IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT33IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT33IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT33IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT33IO-PSTN-CD                                            
                  ,:ACAT33IO-DESC-TXT                                           
                  ,:ACAT33IO-ASSET-AMT                                          
                  ,:ACAT33IO-ASSET-QTY                                          
                  ,:ACAT33IO-ASSET-PCT                                          
                  ,:ACAT33IO-ASSET-CMNT-TXT                                     
                  ,:ACAT33IO-ADP-NBR                                            
LRM002            ,:ACAT33IO-CAGE-TAG                                           
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                                       
LRM007                        = :ACAT33IO-CONTROL-NBR                           
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
LRM006               AND TRNFR_TYPE_CD                                          
LRM006                        = 'MFC'                                           
                     AND ISIN_CNTRY_CD                                  09180000
                              = 'US'                                    09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = :ACAT33IO-ISIN-SEC-ISSUE-CD                     
                     AND STTLM_LCTN_CD                                  09180000
                              = :ACAT33IO-STTLM-LCTN-CD                         
                     AND CSH_MGN_SHRT_CD                                09180000
                              = :ACAT33IO-CSH-MGN-SHRT-CD)                      
            END-EXEC.                                                   09200000
                                                                                
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
093800          WHEN +100                                               09260000
                     SET ACAT33IO-NOT-FOUND TO TRUE                             
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
           EJECT                                                                
       0200-ISRT-ACTITRF.                                               09130000
           INITIALIZE DCLACTITRF.                                               
LRM007     IF ACAT33IO-DUPE-FOUND = 'Y'                                         
LRM007        PERFORM 0205-FIND-NEXT-DUMMY-CNTL-RTN                             
LRM007           THRU 0205-EXIT                                                 
LRM007     ELSE                                                                 
LRM007        MOVE SPACES TO ACAT33IO-CONTROL-NBR                               
LRM007     END-IF.                                                              
LRM007     MOVE ACAT33IO-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTITRF.         
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF                       
                                  CRT-TMSTP OF DCLACTITRF                       
                                  ACAT33IO-UPDT-TMSTP.                          
           MOVE WS-TIMESTAMP(1 : 10) TO PRCS-DT OF DCLACTITRF.                  
           MOVE '0001-01-01' TO  STTLM-ASCTD-DT OF DCLACTITRF.                  
           MOVE ZEROS TO PHSCL-SEQ-NBR OF DCLACTITRF                            
                         LGCL-SEQ-NBR  OF DCLACTITRF.                           
           MOVE 'D' TO DSTBN-SIDE-CD OF DCLACTITRF.                             
           MOVE 'A' TO TRANS-TYPE-CD OF DCLACTITRF.                             
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.                      
           MOVE ACAT33IO-CNTL-ASTD-NBR TO                                       
                              ACAT-CNTL-ASTD-NBR OF DCLACTITRF.                 
           MOVE ACAT33IO-STTLM-DT TO                                            
                              STTLM-ASCTD-DT OF DCLACTITRF.                     
LRM007     MOVE ACAT33IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTITRF            
LRM007                             WS-TRANS-RFRN-ID-CD                          
LRM007     IF ACAT33IO-CONTROL-NBR (1 : 2) = 'XX'                               
LRM007        PERFORM 0202-FORMAT-TRANS-RFRN-RTN                                
LRM007        MOVE WS-TRANS-RFRN-ID-CD                                          
LRM007                  TO TRANS-RFRN-ID-CD OF DCLACTITRF                       
LRM007     END-IF.                                                              
                                                                                
           EXEC SQL                                                     09140000
               INSERT INTO ACTITRF                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,TRNFR_TYPE_CD                                        09180000
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
LRM010            ,CICS_SGNON_ID                                                
LRM010            ,CICS_NET_NM                                                  
LRM010            ,TPSCRT_USR_ID                                                
LRM010            ,TPSCRT_USR_NM                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT33IO-CLIENT-NBR                                09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,'MFC'                                                       
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:ACAT33IO-DLVR-NBR                                          
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                                
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTITRF.TRANS-TYPE-CD                                   
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:ACAT33IO-RCV-CUST-NM                                       
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:ACAT33IO-RCV-SS-PRIM-NBR                                   
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:ACAT33IO-RCV-SS-SCNDY-NBR                                  
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:ACAT33IO-RCV-ACCT-TYPE-CD                                  
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
LRM003             ,'     '                                                     
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:DCLACTITRF.RCV-CRSPN-NBR                                   
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:ACAT33IO-CMNT-TXT                                          
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
LRM002             ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:ACAT33IO-NSCC-PEND-CD                                      
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,:DCLACTITRF.UPDT-TMSTP                                      
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,'ACAT33DB'                                                  
                   ,:ACAT33IO-RR-CD                                             
LRM010             ,:ACAT33IO-SNON-ID                                           
LRM010             ,:ACAT33IO-NETNAME                                           
LRM010             ,:ACAT33IO-USER-ID                                           
LRM010             ,:ACAT33IO-USER-NAME                                         
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
           IF SQLCODE = -803                                                    
           AND ACAT33IO-COPY-HISTORY-TO-MFC                                     
LRM009        PERFORM 0210-CHECK-ASTD-CNTL-RTN                                  
LRM009        IF ASTD-NOT-MATCHED                                               
LRM009        AND ACAT33IO-DUPE-FOUND NOT = 'Y'                                 
LRM009           MOVE 'Y' TO ACAT33IO-DUPE-FOUND                                
LRM009           GO TO 0200-ISRT-ACTITRF                                09130000
LRM009        END-IF                                                            
LRM009        MOVE -803    TO ACAT33IO-SQLCODE                                  
           ELSE                                                                 
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
           IF ACAT33IO-DESC-TXT(1 : 5) > SPACES                                 
              PERFORM 0220-ISRT-ACTIAST.                                   09130
                                                                                
LRM007 0202-FORMAT-TRANS-RFRN-RTN.                                              
LRM007     PERFORM VARYING SUB FROM 20 BY -1                                    
LRM007         UNTIL SUB < 1  OR WS-TRANS-RFRN-ID-CD (SUB : 1) > ' '            
LRM007     END-PERFORM.                                                         
LRM007     IF SUB > 16                                                          
LRM007        MOVE 16 TO SUB2                                                   
LRM007     ELSE                                                                 
LRM007        ADD 1 TO SUB GIVING SUB2                                          
LRM007     END-IF.                                                              
LRM007     MOVE ACAT33IO-CONTROL-NBR (1 : 5) TO                                 
LRM007             WS-TRANS-RFRN-ID-CD (SUB2 : 5).                              
LRM007 0205-FIND-NEXT-DUMMY-CNTL-RTN.                                           
LRM007     MOVE 'XX' TO ACAT33IO-CONTROL-NBR                                    
LRM007*** READ THE INIT TABLE FOR THE GREATEST ARTIFICIAL CNTL NBR              
LRM007*** FOR THIS SET OF KEYS... NONE FOUND USE XX0000                         
LRM007*** - NEED  SYNTAX FOR FIRST ONE                                          
   ******        FIRST 1 ROW ONLY                                               
           EXEC SQL OPEN                                                        
              ACTITRF_LAST_CNTL                                                 
           END-EXEC.                                                            
           IF SQLCODE = +0                                                      
              EXEC SQL FETCH                                                    
                 ACTITRF_LAST_CNTL                                              
                 INTO                                                           
                   :DCLACTITRF.ACAT-CONTROL-NBR                                 
               END-EXEC                                                         
            END-IF.                                                             
      *                                                                         
            EVALUATE SQLCODE                                                    
                WHEN +0                                                         
                     IF ACAT-CONTROL-NBR OF DCLACTITRF (1 : 2) = 'XX'           
                     AND ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3) NUMERIC         
                       MOVE ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3)              
                                 TO WS-NEXT-CNTL-NBR                            
                       ADD 1 TO WS-NEXT-CNTL-NBR                                
                       MOVE WS-NEXT-CNTL-NBR TO                                 
                               ACAT33IO-CONTROL-NBR(3 : 3)                      
                     ELSE                                                       
                        MOVE 'XX'  TO ACAT33IO-CONTROL-NBR                      
                        MOVE '001' TO ACAT33IO-CONTROL-NBR(3 : 3)               
                     END-IF                                                     
                WHEN +100                                                       
                     MOVE 'XX'  TO ACAT33IO-CONTROL-NBR                         
                     MOVE '001' TO ACAT33IO-CONTROL-NBR(3 : 3)                  
                WHEN OTHER                                                      
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
            END-EVALUATE.                                                       
      *                                                                         
LRM007 0205-EXIT. EXIT.                                                         
           EJECT                                                                
LRM009 0210-CHECK-ASTD-CNTL-RTN.                                                
LRM009     SET ASTD-NOT-MATCHED TO TRUE.                                        
LRM009     EXEC SQL SELECT                                                      
LRM009           ACAT_CNTL_ASTD_NBR                                             
LRM009           INTO                                                           
LRM009            :DCLACTITRF.ACAT-CNTL-ASTD-NBR                                
LRM009           FROM ACTITRF                                                   
LRM009            WHERE (CLIENT_NBR                                             
LRM009                        = :ACAT33IO-CLIENT-NBR                            
LRM009               AND ACAT_CNTL_ASTD_NBR                                     
LRM009                        = :ACAT33IO-CNTL-ASTD-NBR)                        
LRM009     END-EXEC.                                                            
LRM009     IF SQLCODE = 0 OR -811                                               
LRM009        SET ASTD-MATCHED TO TRUE                                          
LRM009     END-IF.                                                              
           EJECT                                                                
       0220-ISRT-ACTIAST.                                                  09130
           INITIALIZE DCLACTIAST.                                               
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST                       
                                  CRT-TMSTP OF DCLACTIAST.                      
           MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIAST                            
                         PHSCL-SEQ-NBR OF DCLACTIAST                            
                          LGCL-SEQ-NBR OF DCLACTIAST.                           
           MOVE 'A' TO TRANS-TYPE-CD OF DCLACTIAST.                             
           MOVE '00' TO OPTN-CTGY-CD OF DCLACTIAST.                             
           MOVE 'XSET' TO STTLM-RSN-CD OF DCLACTIAST.                           
LRM007     MOVE ACAT33IO-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTIAST.         
           MOVE ACAT33IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTIAST            
LRM007                             WS-TRANS-RFRN-ID-CD                          
LRM007     IF ACAT33IO-CONTROL-NBR (1 : 2) = 'XX'                               
LRM007        PERFORM 0202-FORMAT-TRANS-RFRN-RTN                                
LRM007        MOVE WS-TRANS-RFRN-ID-CD                                          
LRM007                  TO TRANS-RFRN-ID-CD OF DCLACTIAST                       
LRM007     END-IF.                                                              
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIAST.                      
           IF ACAT33IO-FUND-ACCOUNT-NBR NOT > SPACES                            
              MOVE 'H' TO NSCC-PEND-CD OF DCLACTIAST                            
           ELSE                                                                 
              MOVE ACAT33IO-NSCC-PEND-CD TO NSCC-PEND-CD OF DCLACTIAST          
           END-IF.                                                              
           EXEC SQL                                                     09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,CSH_MRG_SHT_STS_CD                                           
                  ,STTLM_LCTN_STTS_CD                                           
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,SBMTG_PRTCP_NBR                                              
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,ACAT_CONTROL_NBR                                             
                  ,CONTROL_NBR_STS_CD                                           
                  ,ASSET_SEQ_NBR                                                
                  ,AST_SEQ_NBR_STS_CD                                           
                  ,TRANS_TYPE_CD                                                
                  ,TRANS_TYPE_STTS_CD                                           
                  ,PHSCL_SEQ_NBR                                                
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NBR                                                 
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,ASSET_PRC_CTGY_CD                                            
                  ,AST_PRC_CTG_STS_CD                                           
                  ,STTLM_RSN_CD                                                 
                  ,STTLM_RSN_STTS_CD                                            
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_DESC_STTS_CD                                           
                  ,ASSET_RQST_QTY_CD                                            
                  ,ASSET_RQST_STS_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,AST_RQ_TRAN_STS_CD                                           
                  ,ASSET_QTY                                                    
                  ,ASSET_QTY_STTS_CD                                            
                  ,ASSET_PCT                                                    
                  ,ASSET_PCT_STTS_CD                                            
                  ,PSTN_CD                                                      
                  ,PSTN_CD_STTS_CD                                              
                  ,ISO_CRNCY_CD                                                 
                  ,ISO_CRNCY_STTS_CD                                            
                  ,ASSET_AMT                                                    
                  ,ASSET_AMT_STTS_CD                                            
                  ,BEARER_BOND_CD                                               
                  ,BEARER_BND_STTS_CD                                           
                  ,WHI_CD                                                       
                  ,WHI_STTS_CD                                                  
                  ,TRNFR_TYPE_RSN_CD                                            
                  ,TRN_TYP_RSN_STS_CD                                           
                  ,MBS_SERIAL_NBR                                               
                  ,MBS_SERIAL_STTS_CD                                           
                  ,ASSET_CMNT_TXT                                               
                  ,ASSET_CMNT_STTS_CD                                           
                  ,NSCC_WTHLD_CD                                                
                  ,TRANS_RFRN_ID_CD                                             
                  ,TRANS_RFRN_STTS_CD                                           
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,OPTN_CTGY_CD                                                 
                  ,OPTN_CTGY_STTS_CD                                            
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,RCRD_STTS_CD                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,UPDT_TMSTP                                                   
                  ,CRT_TMSTP                                                    
                  ,SECURITY_ADP_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
LRM002            ,CAGE_TAG_NBR                                                 
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT33IO-CLIENT-NBR                                09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-ISIN-CNTRY-CD                                     
                   ,:ACAT33IO-ISIN-SEC-ISSUE-CD                                 
                   ,:ACAT33IO-ISIN-SEC-CDG-CD                                   
                   ,:ACAT33IO-STTLM-LCTN-CD                                     
                   ,:ACAT33IO-CSH-MGN-SHRT-CD                                   
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,:DCLACTIAST.TRANS-TYPE-CD                                   
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:ACAT33IO-ASSET-PRC-CTGY-CD                                 
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:ACAT33IO-DESC-TXT                                          
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:ACAT33IO-ASSET-RQST-QTY-CD                                 
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:ACAT33IO-AST-RQST-TRANS-CD                                 
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:ACAT33IO-ASSET-QTY                                         
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:ACAT33IO-ASSET-PCT                                         
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:ACAT33IO-PSTN-CD                                           
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT33IO-ASSET-AMT                                         
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:ACAT33IO-BEARER-BOND-CD                                    
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:DCLACTIAST.WHI-CD                                          
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT33IO-ASSET-CMNT-TXT                                    
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM002             ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:DCLACTIAST.NSCC-PEND-CD                                    
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT33DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:ACAT33IO-ADP-NBR                                           
                   ,'MFC'                                                       
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
LRM002             ,:ACAT33IO-CAGE-TAG                                          
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
                     PERFORM 0230-INSERT-FUND-INFO                              
LRM002********       PERFORM 0270-UPDATE-VASTHSTY-TAG-NBR                       
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
       0230-INSERT-FUND-INFO.                                                   
                                                                                
           INITIALIZE DCLACTIMF.                                                
LRM005     MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIMF                             
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIMF                        
                                  CRT-TMSTP OF DCLACTIMF.                       
           MOVE WS-TIMESTAMP(1 : 10) TO PRCS-DT OF DCLACTIMF.                   
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIMF.                       
LRM007     MOVE ACAT33IO-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTIMF.          
           EXEC SQL                                                     09140000
               INSERT INTO ACTIMF                                       09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,RCV_NBR                                              09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,FCST_ACCT_RCVR_NBR                                           
LRM005            ,ACAT_CONTROL_NBR                                             
LRM005            ,ASSET_SEQ_NBR                                                
LRM005            ,TRNFR_TYPE_CD                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT33IO-CLIENT-NBR                                09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:ACAT33IO-ISIN-CNTRY-CD                                     
                   ,:ACAT33IO-ISIN-SEC-ISSUE-CD                                 
                   ,:ACAT33IO-ISIN-SEC-CDG-CD                                   
                   ,:ACAT33IO-STTLM-LCTN-CD                                     
                   ,:ACAT33IO-CSH-MGN-SHRT-CD                                   
                   ,:DCLACTIMF.BK-PHSCL-SHR-CD                                  
                   ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                               
                   ,:DCLACTIMF.NTWRK-CNTL-CD                                    
                   ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                               
                   ,:DCLACTIMF.ACCT-TYPE-CD                                     
                   ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                
                   ,:DCLACTIMF.DVDND-CD                                         
                   ,:DCLACTIMF.DVDND-STTS-CD                                    
                   ,:DCLACTIMF.DVDND-PAYEE-CD                                   
                   ,:DCLACTIMF.DVDND-PYE-STTS-CD                                
                   ,:DCLACTIMF.LTCG-CD                                          
                   ,:DCLACTIMF.BRKR-EXCTG-NBR                                   
                   ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                               
                   ,:DCLACTIMF.STCG-CD                                          
                   ,:DCLACTIMF.MF-FULL-PRTL-CD                                  
                   ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                               
                   ,:DCLACTIMF.RGSTN-CD                                         
                   ,:DCLACTIMF.FNBR                                             
                   ,:DCLACTIMF.FND-ACT-NBR-STS-CD                               
                   ,:DCLACTIMF.DSTBN-SIDE-CD                                    
ET0001             ,:ACAT33IO-RE-REGIST-DATE                                    
                   ,:DCLACTIMF.CRT-TMSTP                                        
                   ,:DCLACTIMF.UPDT-TMSTP                                       
                   ,:DCLACTIMF.CICS-TERM-ID-CD                                  
                   ,'ACAT33DB'                                                  
                   ,:ACAT33IO-ADP-NBR                                           
                   ,:ACAT33IO-FUND-ACCOUNT-NBR                                  
LRM005             ,:DCLACTIMF.ACAT-CONTROL-NBR                                 
LRM005             ,:DCLACTIMF.ASSET-SEQ-NBR                                    
LRM005             ,:ACAT33IO-TRNFR-TYPE-CD                                     
                 )                                                      09150000
           END-EXEC.                                                    09200000
           EVALUATE SQLCODE                                             09220000
                WHEN +0                                                 09230000
                     CONTINUE                                                   
                WHEN -803                                               09230000
                     PERFORM 0235-UPDATE-ACTIMF                                 
                WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
           END-EVALUATE.                                                09300000
       0235-UPDATE-ACTIMF.                                                      
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIMF                        
                                  CRT-TMSTP OF DCLACTIMF.                       
           MOVE WS-TIMESTAMP(1 : 10) TO PRCS-DT OF DCLACTIMF.                   
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIMF.                       
           EXEC SQL                                                     09140000
              UPDATE ACTIMF                                             09170000
                 SET PRCS_DT =                                                  
ET0001                :ACAT33IO-RE-REGIST-DATE                                  
                    ,CRT_TMSTP =                                                
                      :DCLACTIMF.CRT-TMSTP                                      
                    ,UPDT_TMSTP =                                               
                      :DCLACTIMF.UPDT-TMSTP                                     
                    ,CICS_TERM_ID_CD =                                          
                      :DCLACTIMF.CICS-TERM-ID-CD                                
                    ,PRGM_NM =                                                  
                      'ACAT33DB'                                                
                    ,SECURITY_ADP_NBR =                                         
                      :ACAT33IO-ADP-NBR                                         
                    ,FCST_ACCT_RCVR_NBR =                                       
                      :ACAT33IO-FUND-ACCOUNT-NBR                                
              WHERE                                                             
                 (CLIENT_NBR    =                                               
                   :ACAT33IO-CLIENT-NBR   AND                                   
                  DLVR_NBR      =                                               
                   :ACAT33IO-DLVR-NBR          AND                              
                  ACCT_DLVR_NBR =                                               
                   :ACAT33IO-DLVR-ACCT         AND                              
                  RCV_NBR       =                                               
                   :ACAT33IO-RCV-NBR           AND                              
                  ACCT_RCV_NBR  =                                               
                   :ACAT33IO-RCV-ACCT          AND                              
                  ISIN_CNTRY_CD  =                                              
                   :ACAT33IO-ISIN-CNTRY-CD     AND                              
                  ISIN_SEC_ISSUE_CD =                                           
                   :ACAT33IO-ISIN-SEC-ISSUE-CD AND                              
                  ISIN_SEC_CDG_CD   =                                           
                   :ACAT33IO-ISIN-SEC-CDG-CD   AND                              
                  STTLM_LCTN_CD     =                                           
                   :ACAT33IO-STTLM-LCTN-CD     AND                              
                  CSH_MGN_SHRT_CD   =                                           
                   :ACAT33IO-CSH-MGN-SHRT-CD   AND                              
LRM005            ACAT_CONTROL_NBR  =                                           
LRM005             :DCLACTIMF.ACAT-CONTROL-NBR AND                              
LRM005            ASSET_SEQ_NBR     =                                           
LRM005             :DCLACTIMF.ASSET-SEQ-NBR    AND                              
LRM005            TRNFR_TYPE_CD     =                                           
LRM005             :ACAT33IO-TRNFR-TYPE-CD                                      
                 )                                                      09150000
           END-EXEC.                                                    09200000
           EVALUATE SQLCODE                                             09220000
                WHEN +0                                                 09230000
                     CONTINUE                                                   
                WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
           END-EVALUATE.                                                09300000
           SKIP3                                                                
       0240-COUNT-ASSETS-W-FUND-NBR.                                            
           EXEC SQL                                                             
                 SELECT COUNT(*)                                                
                   INTO :WS-ASSET-W-FUND-NBR                                    
                   FROM ACTIMF                                                  
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                          
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
                   FCST_ACCT_RCVR_NBR  > '                   '                  
                 )                                                      09150000
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE WS-ASSET-W-FUND-NBR TO ACAT33IO-ASSET-W-FUND-NBR            
           ELSE                                                                 
               MOVE +0                  TO ACAT33IO-ASSET-W-FUND-NBR            
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
                 SELECT COUNT(*)                                                
                   INTO :WS-ASSET-TOTAL-COUNT                                   
                   FROM ACTIAST                                                 
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                          
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
LRM006             TRNFR_TYPE_CD =                                              
LRM006              'MFC'                                                       
                 )                                                      09150000
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE WS-ASSET-TOTAL-COUNT TO ACAT33IO-ASSET-TOTAL-COUNT          
           ELSE                                                                 
               MOVE +0                   TO ACAT33IO-ASSET-TOTAL-COUNT          
           END-IF.                                                              
           EJECT                                                                
                                                                                
LRM002 0270-UPDATE-VASTHSTY-TAG-NBR.                                            
           EXEC SQL                                                     09140000
             UPDATE VASTHSTY                                            09170000
              SET                                                               
                  ENTERED_TAG_NBR   =                                           
                    :ACAT33IO-CAGE-TAG                                          
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
                   ACAT_CONTROL_NBR   =                                         
                    :ACAT33IO-CONTROL-NBR  AND                                  
                   ASSET_SEQ_NBR  =                                             
                    :ACAT33IO-ASSET-SEQ-NBR                                     
                 )                                                      09150000
           END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
                WHEN +0                                                 09230000
                     CONTINUE                                           09240000
                WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       0300-UPDATE-ACTITRF.                                                     
           PERFORM 0310-CHECK-TMSTP-AND-NSCC-RTN.                               
           IF ACAT33IO-UPDT-TMSTP-NG                                            
           OR ACAT33IO-NSCC-PEND-NG                                             
           OR ACAT33IO-NOT-FOUND                                                
              GO TO 0300-EXIT.                                                  
                                                                                
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF                       
                                 ACAT33IO-UPDT-TMSTP.                           
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.                      
   ******* PRIMARY KEY CHANGE / INSERT AND DELETE...                            
           IF ACAT33IO-ORIG-RCV-NBR  NOT = ACAT33IO-RCV-NBR             09190000
           OR ACAT33IO-ORIG-RCV-ACCT NOT = ACAT33IO-RCV-ACCT            09190000
               PERFORM 0350-KEY-CHANGE-RTN                                      
           ELSE                                                                 
           EXEC SQL                                                     09140000
               UPDATE ACTITRF                                           09170000
                 SET                                                            
                   RCV_SS_PRIM_NBR   =                                          
                    :ACAT33IO-RCV-SS-PRIM-NBR                                   
                  ,RCV_SS_SCNDY_NBR  =                                          
                    :ACAT33IO-RCV-SS-SCNDY-NBR                                  
                  ,RCV_ACCT_TYPE_CD  =                                          
                    :ACAT33IO-RCV-ACCT-TYPE-CD                                  
                  ,RCV_CUST_NM       =                                          
                    :ACAT33IO-RCV-CUST-NM                                       
                  ,TRNFR_TYPE_CD     =                                          
                    :ACAT33IO-TRNFR-TYPE-CD                                     
                  ,CMNT_TXT          =                                          
                    :ACAT33IO-CMNT-TXT                                          
                  ,NSCC_PEND_CD      =                                          
                    :ACAT33IO-NSCC-PEND-CD                                      
                  ,UPDT_TMSTP        =                                          
                    :DCLACTITRF.UPDT-TMSTP                                      
                  ,CICS_TERM_ID_CD   =                                          
                    :DCLACTITRF.CICS-TERM-ID-CD                                 
                  ,PRGM_NM           =                                          
                    'ACAT33DB'                                                  
                  ,RR_CD             =                                          
                    :ACAT33IO-RR-CD                                             
LRM007            ,STTLM_ASCTD_DT    =                                          
LRM007             :ACAT33IO-STTLM-DT                                   09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                          
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
                    'MFC'                                                       
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  SET ACAT33IO-GOOD-RESP TO TRUE                        09240000
               WHEN OTHER                                               09280000
                  SET ACAT33IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
                                                                                
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.                       
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLVTRNFR.                       
       0300-EXIT. EXIT.                                                         
                                                                                
       0310-CHECK-TMSTP-AND-NSCC-RTN.                                           
      *---------------------------------------------------------------          
      *  READ THE EXISTING TIF TO OBTAIN NSCC-PEND-IND AND UPDATE               
      *  TIMESTAMP TO SEE IF SOMEONE ELSE CAUSED AN UPDATE WHILE THIS           
      *  USER WAS LOOKING AT THIS RECORD ON THIER SCREEN.                       
      *---------------------------------------------------------------          
           EXEC SQL SELECT                                              09140000
                   NSCC_PEND_CD                                                 
                  ,UPDT_TMSTP                                                   
                 INTO                                                   09160000
                   :DCLACTITRF.NSCC-PEND-CD                                     
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT33IO-CLIENT-NBR                    09190000
LRM008               AND ACAT_CONTROL_NBR                                       
LRM008                        = :ACAT33IO-CONTROL-NBR                           
                     AND DLVR_NBR                                       09180000
                              = :ACAT33IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT33IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT33IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT33IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'MFC')                                  09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT33IO-FOUND TO TRUE                                 
                     IF NSCC-PEND-CD OF DCLACTITRF = 'Y'                        
                        SET ACAT33IO-NSCC-PEND-NG TO TRUE                       
                     ELSE                                                       
                     IF UPDT-TMSTP OF DCLACTITRF NOT =                          
                                 ACAT33IO-UPDT-TMSTP                            
                        SET ACAT33IO-UPDT-TMSTP-NG TO TRUE                      
                     END-IF END-IF                                              
093800          WHEN +100                                               09260000
                     SET ACAT33IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
                                                                                
                                                                                
       0350-KEY-CHANGE-RTN.                                                     
NG ******* MUST INSERT NEW HEADER AND COPY ACROSS ASSETS IF ALLOWED...          
NG ******* THIS NEEDS REASEARCH.                                                
           PERFORM 0200-ISRT-ACTITRF.                                   09130000
                                                                                
           IF SQLCODE NOT = 0                                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
           PERFORM 0400-DELETE-ACTITRF.                                         
                                                                                
       0370-UPDATE-ACTIAST.                                                     
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST.                      
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIAST.                      
           IF  ACAT33IO-CURRENT-SECR = ACAT33IO-ISIN-SEC-ISSUE-CD               
           AND ACAT33IO-CURRENT-SLOC = ACAT33IO-STTLM-LCTN-CD                   
           AND ACAT33IO-CURRENT-TYPE = ACAT33IO-CSH-MGN-SHRT-CD                 
              EXEC SQL                                                  09140000
                UPDATE ACTIAST                                          09170000
                  SET                                                           
                   ASSET_PRC_CTGY_CD  =                                         
                   :ACAT33IO-ASSET-PRC-CTGY-CD                                  
                  ,ASSET_RQST_QTY_CD  =                                         
                   :ACAT33IO-ASSET-RQST-QTY-CD                                  
                  ,AST_RQST_TRANS_CD  =                                         
                   :ACAT33IO-AST-RQST-TRANS-CD                                  
                  ,PSTN_CD            =                                         
                   :ACAT33IO-PSTN-CD                                            
                  ,ASSET_DESC_TXT     =                                         
                   :ACAT33IO-DESC-TXT                                           
                  ,ASSET_AMT          =                                         
                   :ACAT33IO-ASSET-AMT                                          
                  ,ASSET_QTY          =                                         
                   :ACAT33IO-ASSET-QTY                                          
                  ,ASSET_PCT          =                                         
                   :ACAT33IO-ASSET-PCT                                          
                  ,ASSET_CMNT_TXT     =                                         
                   :ACAT33IO-ASSET-CMNT-TXT                                     
                  ,SECURITY_ADP_NBR   =                                         
                   :ACAT33IO-ADP-NBR                                            
                  ,CICS_TERM_ID_CD   =                                          
                    :DCLACTIAST.CICS-TERM-ID-CD                                 
                  ,UPDT_TMSTP        =                                          
                    :WS-TIMESTAMP                                               
LRM002            ,CAGE_TAG_NBR      =                                          
LRM002              :ACAT33IO-CAGE-TAG                                          
               WHERE                                                            
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR =                                           
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR          AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT         AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT          AND                     09190000
LRM006             TRNFR_TYPE_CD =                                              
LRM006              'MFC'                       AND                             
                   ISIN_CNTRY_CD  =                                     09180000
                    :ACAT33IO-ISIN-CNTRY-CD     AND                             
                   ISIN_SEC_ISSUE_CD =                                  09180000
                    :ACAT33IO-ISIN-SEC-ISSUE-CD AND                             
                   ISIN_SEC_CDG_CD   =                                  09180000
                    :ACAT33IO-ISIN-SEC-CDG-CD   AND                             
                   STTLM_LCTN_CD     =                                  09180000
                    :ACAT33IO-STTLM-LCTN-CD     AND                             
                   CSH_MGN_SHRT_CD   =                                  09180000
                    :ACAT33IO-CSH-MGN-SHRT-CD                                   
                 )                                                      09150000
093200         END-EXEC                                                 09200000
                                                                                
093400        EVALUATE SQLCODE                                          09220000
093500             WHEN +0                                              09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
                     PERFORM 0230-INSERT-FUND-INFO                              
LRM007               PERFORM 0380-FINAL-ASSET-UPDATE-RTN                        
LRM002***********    PERFORM 0270-UPDATE-VASTHSTY-TAG-NBR                       
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           ELSE                                                                 
              PERFORM 0420-DELETE-ACTIAST                                       
              PERFORM 0220-ISRT-ACTIAST                                    09130
           END-IF.                                                              
                                                                                
           EJECT                                                                
LRM007 0380-FINAL-ASSET-UPDATE-RTN.                                             
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF                       
                                 ACAT33IO-UPDT-TMSTP.                           
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.                      
LRM007** DELETE ALL ASSETS NOT HAVING FUND ACCOUNT NBR, WHEN USER SUBS          
LRM007     IF ACAT33IO-NSCC-PEND-CD = ' '                                       
LRM007        PERFORM 0385-DELETE-EXTRA-ASSETS-RTN                              
LRM007     END-IF.                                                              
                                                                                
******** REPLACE NSCC_PEND_CD ON ALL ASSETS ON THIS TIF.                        
           EXEC SQL                                                     09140000
               UPDATE ACTIAST                                           09170000
                 SET                                                            
                   NSCC_PEND_CD      =                                          
                    :ACAT33IO-NSCC-PEND-CD                                      
                  ,UPDT_TMSTP        =                                          
                    :DCLACTITRF.UPDT-TMSTP                                      
                  ,CICS_TERM_ID_CD   =                                          
                    :DCLACTITRF.CICS-TERM-ID-CD                                 
                  ,PRGM_NM           =                                          
                    'ACAT33DB'                                                  
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM009             ACAT_CONTROL_NBR  =                                  09180000
LRM009              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
                    'MFC'                                                       
                 )                                                      09150000
           END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  SET ACAT33IO-GOOD-RESP TO TRUE                        09240000
               WHEN +100                                                09230000
                  SET ACAT33IO-GOOD-RESP TO TRUE                        09240000
               WHEN OTHER                                               09280000
                  SET ACAT33IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
LRM007 0385-DELETE-EXTRA-ASSETS-RTN.                                            
LRM007** DELETE ALL ASSETS NOT HAVING FUND ACCOUNT NBR, WHEN USER SUBS          
LRM007     EXEC SQL                                                             
LRM007        OPEN CRSR_ACTIAST                                                 
LRM007     END-EXEC.                                                            
LRM007     IF SQLCODE = 0                                                       
LRM007        CONTINUE                                                  09240000
LRM007     ELSE                                                                 
LRM007        PERFORM 9000-WRITE-TO-CICS-LOG                                    
LRM007        PERFORM 9500-RETURN-DB2-ERROR                                     
LRM007     END-IF.                                                              
LRM007     PERFORM UNTIL SQLCODE NOT = 0                                        
LRM007        EXEC SQL                                                          
LRM007          FETCH                                                           
LRM007            CRSR_ACTIAST                                                  
LRM007             INTO                                                 09160000
LRM007              :DCLACTIAST.ISIN-CNTRY-CD                           09190000
LRM007             ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       09190000
LRM007             ,:DCLACTIAST.ISIN-SEC-CDG-CD                         09190000
LRM007             ,:DCLACTIAST.STTLM-LCTN-CD                           09190000
LRM007             ,:DCLACTIAST.CSH-MGN-SHRT-CD                         09190000
LRM007        END-EXEC                                                          
LRM007        IF SQLCODE = 0                                                    
LRM007           PERFORM 0390-CHECK-FUND-ACCT-NBR                               
LRM007        END-IF                                                            
LRM007        EVALUATE SQLCODE                                          09220000
LRM007           WHEN +0                                                09230000
LRM007              CONTINUE                                            09240000
LRM007           WHEN +100                                              09230000
LRM007              CONTINUE                                            09240000
LRM007           WHEN OTHER                                             09280000
LRM007              SET ACAT33IO-DB2-ERROR TO TRUE                              
LRM007              PERFORM 9000-WRITE-TO-CICS-LOG                              
LRM007              PERFORM 9500-RETURN-DB2-ERROR                               
LRM007        END-EVALUATE                                              09300000
LRM007     END-PERFORM.                                                         
LRM007     EXEC SQL                                                             
LRM007        CLOSE CRSR_ACTIAST                                                
LRM007     END-EXEC.                                                            
LRM007                                                                          
LRM007 0390-CHECK-FUND-ACCT-NBR.                                                
LRM007     EXEC SQL SELECT                                              09140000
LRM007           FCST_ACCT_RCVR_NBR                                             
LRM007     INTO                                                                 
LRM007        :DCLACTIMF.FCST-ACCT-RCVR-NBR                                     
LRM007     FROM ACTIMF                                                          
LRM007     WHERE                                                                
LRM007        (CLIENT_NBR    =                                                  
LRM007          :ACAT33IO-CLIENT-NBR   AND                                      
LRM008         ACAT_CONTROL_NBR =                                               
LRM008          :ACAT33IO-CONTROL-NBR  AND                                      
LRM007         DLVR_NBR      =                                                  
LRM007          :ACAT33IO-DLVR-NBR          AND                                 
LRM007         ACCT_DLVR_NBR =                                                  
LRM007          :ACAT33IO-DLVR-ACCT         AND                                 
LRM007         RCV_NBR       =                                                  
LRM007          :ACAT33IO-RCV-NBR           AND                                 
LRM007         ACCT_RCV_NBR  =                                                  
LRM007          :ACAT33IO-RCV-ACCT          AND                                 
LRM007         ISIN_CNTRY_CD  =                                                 
LRM007          :DCLACTIAST.ISIN-CNTRY-CD    AND                                
LRM007         ISIN_SEC_ISSUE_CD =                                              
LRM007          :DCLACTIAST.ISIN-SEC-ISSUE-CD AND                               
LRM007         ISIN_SEC_CDG_CD   =                                              
LRM007          :DCLACTIAST.ISIN-SEC-CDG-CD AND                                 
LRM007         STTLM_LCTN_CD     =                                              
LRM007          :DCLACTIAST.STTLM-LCTN-CD   AND                                 
LRM007         CSH_MGN_SHRT_CD   =                                              
LRM007          :DCLACTIAST.CSH-MGN-SHRT-CD                                     
LRM007         )                                                                
LRM007     END-EXEC.                                                            
LRM007                                                                          
LRM007     IF (SQLCODE = 0                                                      
LRM007        AND FCST-ACCT-RCVR-NBR OF DCLACTIMF NOT > SPACES)                 
LRM007     OR  SQLCODE = +100                                                   
LRM007        EXEC SQL                                                          
LRM007           DELETE FROM ACTIAST                                            
LRM007        WHERE                                                             
LRM007         (CLIENT_NBR    =                                                 
LRM007           :ACAT33IO-CLIENT-NBR   AND                                     
LRM007          ACAT_CONTROL_NBR  =                                             
LRM007           :ACAT33IO-CONTROL-NBR  AND                                     
LRM007          DLVR_NBR      =                                                 
LRM007           :ACAT33IO-DLVR-NBR     AND                                     
LRM007          ACCT_DLVR_NBR =                                                 
LRM007           :ACAT33IO-DLVR-ACCT    AND                                     
LRM007          RCV_NBR       =                                                 
LRM007           :ACAT33IO-RCV-NBR      AND                                     
LRM007          ACCT_RCV_NBR  =                                                 
LRM007           :ACAT33IO-RCV-ACCT     AND                                     
LRM007          TRNFR_TYPE_CD =                                                 
LRM007           'MFC'                  AND                                     
LRM007          ISIN_CNTRY_CD  =                                                
LRM007           :DCLACTIAST.ISIN-CNTRY-CD    AND                               
LRM007          ISIN_SEC_ISSUE_CD =                                             
LRM007           :DCLACTIAST.ISIN-SEC-ISSUE-CD AND                              
LRM007          ISIN_SEC_CDG_CD   =                                             
LRM007           :DCLACTIAST.ISIN-SEC-CDG-CD AND                                
LRM007          STTLM_LCTN_CD     =                                             
LRM007           :DCLACTIAST.STTLM-LCTN-CD   AND                                
LRM007          CSH_MGN_SHRT_CD   =                                             
LRM007           :DCLACTIAST.CSH-MGN-SHRT-CD                                    
LRM007          )                                                               
LRM007        END-EXEC                                                          
LRM007     END-IF.                                                              
LRM007     MOVE 0 TO SQLCODE.                                                   
           SKIP3                                                                
       0400-DELETE-ACTITRF.                                                     
           EXEC SQL                                                     09140000
               DELETE FROM ACTITRF                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                  09180000
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
                    'MFC'                                                       
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
      *--------------------------------------------------------------*          
      * THERE IS NO FOREIGN KEY FROM INITIAL TRANSFER TO INIT ASSET.            
      * MUST ISSUE GENERIC DELETE TO WIPE THEM (IF ANY).                        
      *--------------------------------------------------------------*          
           PERFORM 0410-DELETE-ALL-ASSETS-IN-TIF.                               
           IF ACAT33IO-CONTROL-NBR > SPACES                                     
              PERFORM 0440-SET-MFC-NOT-SUBMITTED                                
           END-IF.                                                              
           EJECT                                                                
       0410-DELETE-ALL-ASSETS-IN-TIF.                                           
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                  09180000
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT     AND                          09190000
LRM006             TRNFR_TYPE_CD =                                              
LRM006              'MFC'                                                       
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
                WHEN +100                                               09230000
                     SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       0420-DELETE-ACTIAST.                                                     
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
LRM008             ACAT_CONTROL_NBR  =                                  09180000
LRM008              :ACAT33IO-CONTROL-NBR  AND                                  
                   DLVR_NBR      =                                      09150000
                    :ACAT33IO-DLVR-NBR          AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT33IO-DLVR-ACCT         AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT33IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT33IO-RCV-ACCT          AND                     09190000
LRM006             TRNFR_TYPE_CD =                                              
LRM006              'MFC'                       AND                             
                   ISIN_CNTRY_CD  =                                     09180000
                    :ACAT33IO-ISIN-CNTRY-CD     AND                             
                   ISIN_SEC_ISSUE_CD =                                  09180000
                    :ACAT33IO-CURRENT-SECR      AND                             
                   ISIN_SEC_CDG_CD   =                                  09180000
                    :ACAT33IO-ISIN-SEC-CDG-CD   AND                             
                   STTLM_LCTN_CD     =                                  09180000
                    :ACAT33IO-CURRENT-SLOC      AND                             
                   CSH_MGN_SHRT_CD   =                                  09180000
                    :ACAT33IO-CURRENT-TYPE                                      
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       0440-SET-MFC-NOT-SUBMITTED.                                              
           EXEC SQL                                                     09140000
               UPDATE VTRNFR                                            09170000
                 SET                                                            
                   ACCT_RJCT_RSBM_IND =                                         
                    ' '                                                         
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
                   ACAT_CONTROL_NBR  =                                  09180000
                    :ACAT33IO-CONTROL-NBR  AND                                  
                   TRNFR_TYPE_CD =                                      09180000
                    'MFC'                                                       
                  )                                                     09150000
           END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  CONTINUE                                              09240000
               WHEN +100                                                09230000
                  CONTINUE                                              09240000
               WHEN OTHER                                               09280000
                  SET ACAT33IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
           EJECT                                                                
       0500-COPY-HSTY-TO-MFC-RTN.                                               
           MOVE SPACES TO ACAT33IO-CMNT-TXT                                     
                          ACAT33IO-ASSET-CMNT1-TXT                              
                          ACAT33IO-ASSET-CMNT2-TXT                              
                          ACAT33IO-ASSET-CMNT5-TXT                              
                          ACAT33IO-ASSET-CMNTM-TXT.                             
           MOVE 'N' TO ACAT33IO-BEARER-BOND-CD.                                 
LRM008     MOVE 'H' TO ACAT33IO-NSCC-PEND-CD.                                   
LRM007     IF ACAT33IO-STTLM-DT NOT > SPACES                                    
LRM007        MOVE '0001-01-01' TO ACAT33IO-STTLM-DT                            
LRM007     END-IF.                                                              
           PERFORM 0200-ISRT-ACTITRF.                                   09130000
           PERFORM 0510-UPDATE-MFC-TIF.                                         
           MOVE ZEROS TO ACAT33IO-ASSET-SEQ-NBR.                                
LRM007     MOVE SPACES TO ACAT33IO-FUND-ACCOUNT-NBR                             
LRM007                    ACAT33IO-RE-REGIST-DATE                               
LRM007     MOVE ACAT33IO-CNTL-ASTD-NBR TO WS-CONTROL-NBR.                       
           PERFORM 0050-OPEN-VASTHSTY-CRSRX.                            09130000
           SET ACAT33IO-GOOD-RESP TO TRUE.                              09240000
           PERFORM UNTIL NOT ACAT33IO-GOOD-RESP                         09130000
              PERFORM 0075-READ-NEXTX                                   09130000
              IF ACAT33IO-ASSET-FOUND                                   09130000
LRM008           PERFORM CHECK-ASSET-ON-OTHER-MFC                               
LRM008           IF ASSET-NOT-ON-OTHER-MFC                                      
                    PERFORM 0077-MOVE-ASTHSTY-TO-IOAREA                         
                    PERFORM REPLACE-ASSET-QTY-RTN                               
                       THRU REPLACE-ASSET-QTY-EXIT                              
                    PERFORM 0520-ISRT-ASSET-FROM-HSTY                           
                    ADD 1 TO WS-MFC-RECORDS-INSERTED                            
LRM008           END-IF                                                         
LRM008           SET ACAT33IO-GOOD-RESP TO TRUE                                 
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0080-CLOSE-VASTHSTY-CRSRX.                                   
           IF WS-MFC-RECORDS-INSERTED > ZERO                                    
              SET ACAT33IO-FOUND TO TRUE                                        
LRM007        MOVE ACAT-CONTROL-NBR OF DCLACTITRF TO                            
LRM007                             ACAT33IO-CONTROL-NBR                         
           ELSE                                                                 
              SET ACAT33IO-NOT-FOUND TO TRUE.                                   
           MOVE WS-MFC-RECORDS-INSERTED TO ACAT33IO-MFC-ASSETS-CREATED.         
                                                                                
       0510-UPDATE-MFC-TIF.                                                     
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR                        
                                 ACAT33IO-UPDT-TMSTP.                           
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLVTRNFR.                       
           EXEC SQL                                                     09140000
               UPDATE VTRNFR                                            09170000
                 SET                                                            
                   ACCT_RJCT_RSBM_IND =                                         
                    'S'                                                         
                  ,UPDT_TMSTP        =                                          
                    :DCLVTRNFR.UPDT-TMSTP                                       
                  ,CICS_TERM_ID_CD   =                                          
                    :ACAT33IO-EIBTRMID                                          
                  ,PRGM_NM           =                                          
                    'ACAT33DB'                                                  
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT33IO-CLIENT-NBR   AND                          09190000
                   ACAT_CONTROL_NBR  =                                  09180000
                    :ACAT33IO-CONTROL-NBR  AND                                  
                   TRNFR_TYPE_CD =                                      09180000
                    'MFC'                                                       
                  )                                                     09150000
093200     END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  CONTINUE                                              09240000
               WHEN +100                                                09230000
                  CONTINUE                                              09240000
               WHEN OTHER                                               09280000
                  SET ACAT33IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
                                                                                
       0520-ISRT-ASSET-FROM-HSTY.                                               
      *---------------------------------------------------------------*         
      * THIS RTN WILL CREATE INITIAL ASSET FROM HISTORY TABLE; USED   *         
      * WHEN CREATING MFC FROM FULL. NOTE THE VASSET FIELDS ON BELOW  *         
      * ARE COPIED DIRECTLY.                                          *         
      *---------------------------------------------------------------*         
           INITIALIZE DCLACTIAST.                                               
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST                       
                                  CRT-TMSTP OF DCLACTIAST.                      
           MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIAST                            
                         PHSCL-SEQ-NBR OF DCLACTIAST                            
                          LGCL-SEQ-NBR OF DCLACTIAST.                           
LRM008     MOVE 'H' TO NSCC-PEND-CD  OF DCLACTIAST.                             
           MOVE 'A' TO TRANS-TYPE-CD OF DCLACTIAST.                             
           MOVE '00' TO OPTN-CTGY-CD OF DCLACTIAST.                             
           MOVE '50' TO STTLM-LCTN-CD OF DCLACTIAST.                            
           MOVE 'XSET' TO STTLM-RSN-CD OF DCLACTIAST.                           
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIAST.                      
LRM007     MOVE TRANS-RFRN-ID-CD   OF DCLACTITRF TO                             
LRM007          TRANS-RFRN-ID-CD   OF DCLACTIAST.                               
LRM007     MOVE ACAT-CONTROL-NBR   OF DCLACTITRF TO                             
LRM007          ACAT-CONTROL-NBR   OF DCLACTIAST.                               
LRM007***  MOVE ACAT33IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTIAST.           
                                                                                
           EXEC SQL                                                     09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,CSH_MRG_SHT_STS_CD                                           
                  ,STTLM_LCTN_STTS_CD                                           
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,SBMTG_PRTCP_NBR                                              
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,ACAT_CONTROL_NBR                                             
                  ,CONTROL_NBR_STS_CD                                           
                  ,ASSET_SEQ_NBR                                                
                  ,AST_SEQ_NBR_STS_CD                                           
                  ,TRANS_TYPE_CD                                                
                  ,TRANS_TYPE_STTS_CD                                           
                  ,PHSCL_SEQ_NBR                                                
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NBR                                                 
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,ASSET_PRC_CTGY_CD                                            
                  ,AST_PRC_CTG_STS_CD                                           
                  ,STTLM_RSN_CD                                                 
                  ,STTLM_RSN_STTS_CD                                            
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_DESC_STTS_CD                                           
                  ,ASSET_RQST_QTY_CD                                            
                  ,ASSET_RQST_STS_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,AST_RQ_TRAN_STS_CD                                           
                  ,ASSET_QTY                                                    
                  ,ASSET_QTY_STTS_CD                                            
                  ,ASSET_PCT                                                    
                  ,ASSET_PCT_STTS_CD                                            
                  ,PSTN_CD                                                      
                  ,PSTN_CD_STTS_CD                                              
                  ,ISO_CRNCY_CD                                                 
                  ,ISO_CRNCY_STTS_CD                                            
                  ,ASSET_AMT                                                    
                  ,ASSET_AMT_STTS_CD                                            
                  ,BEARER_BOND_CD                                               
                  ,BEARER_BND_STTS_CD                                           
                  ,WHI_CD                                                       
                  ,WHI_STTS_CD                                                  
                  ,TRNFR_TYPE_RSN_CD                                            
                  ,TRN_TYP_RSN_STS_CD                                           
                  ,MBS_SERIAL_NBR                                               
                  ,MBS_SERIAL_STTS_CD                                           
                  ,ASSET_CMNT_TXT                                               
                  ,ASSET_CMNT_STTS_CD                                           
                  ,NSCC_WTHLD_CD                                                
                  ,TRANS_RFRN_ID_CD                                             
                  ,TRANS_RFRN_STTS_CD                                           
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,OPTN_CTGY_CD                                                 
                  ,OPTN_CTGY_STTS_CD                                            
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,RCRD_STTS_CD                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,UPDT_TMSTP                                                   
                  ,CRT_TMSTP                                                    
                  ,SECURITY_ADP_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
LRM002            ,CAGE_TAG_NBR                                                 
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT33IO-CLIENT-NBR                                09190000
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:ACAT33IO-DLVR-ACCT                                 09190000
                   ,:ACAT33IO-RCV-NBR                                   09190000
                   ,:ACAT33IO-RCV-ACCT                                  09190000
                   ,:DCLVASTHSTY.ISIN-CNTRY-CD                                  
                   ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,:DCLACTIAST.STTLM-LCTN-CD                                   
                   ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                
                   ,:DCLVASTHSTY.CSH-MRG-SHT-STS-CD                             
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT33IO-DLVR-NBR                                  09190000
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,:DCLACTIAST.TRANS-TYPE-CD                                   
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                              
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:DCLVASTHSTY.ASSET-DESC-TXT                                 
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                              
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:DCLVASTHSTY.AST-RQST-TRANS-CD                              
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLVASTHSTY.ASSET-QTY                                      
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLVASTHSTY.ASSET-PCT                                      
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLVASTHSTY.PSTN-CD                                        
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:DCLVASTHSTY.ASSET-AMT                                      
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLVASTHSTY.BEARER-BOND-CD                                 
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:DCLVASTHSTY.WHI-CD                                         
                   ,:DCLACTIAST.WHI-STTS-CD                                     
LRM001             ,'  '                                                        
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLVASTHSTY.MBS-SERIAL-NBR                                 
                   ,:DCLVASTHSTY.MBS-SERIAL-STTS-CD                             
                   ,:DCLVASTHSTY.ASSET-CMNT-TXT                                 
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,' '                                                         
LRM002             ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:DCLACTIAST.NSCC-PEND-CD                                    
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT33DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLVASTHSTY.SECURITY-ADP-NBR                               
                   ,'MFC'                                                       
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
LRM002             ,:DCLVASTHSTY.CAGE-TAG-NBR                                   
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT33IO-GOOD-RESP TO TRUE                     09240000
LRM002**********     PERFORM 0270-UPDATE-VASTHSTY-TAG-NBR                       
094000          WHEN OTHER                                              09280000
                     SET ACAT33IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
       EJECT                                                            06080002
XXX    REPLACE-ASSET-QTY-RTN.                                                   
           MOVE ZEROS TO WS-CALC-POSN-QTY.                              MRGIML03
           IF ACAT33IO-CSH-MGN-SHRT-CD NOT > SPACES                             
              SET ACAT33IO-CASH-ASSET TO TRUE                                   
           END-IF.                                                              
                                                                                
           MOVE ACAT33IO-ASSET-CMNT-TXT TO ACAT33IO-ASSET-CMNTM-TXT.            
           MOVE SPACES TO ACAT33IO-ISIN-SEC-CDG-CD.                             
                                                                                
           MOVE SPACES TO WS-MFC-ORIG-RQST-AMT-MSG.                             
           IF ACAT33IO-RQST-ASSET-PCT                                           
              MOVE ASSET-PCT OF DCLVASSET TO WS-MFC-ORIG-RQST-PCT               
              MOVE '%' TO WS-MFC-ORIG-RQST-PCT-LIT                              
           ELSE                                                                 
           IF ACAT33IO-RQST-ASSET-AMT                                           
              MOVE ASSET-AMT OF DCLVASSET TO WS-MFC-ORIG-RQST-AMT               
           ELSE                                                                 
              MOVE 'Q' TO WS-MFC-ORIG-RQST-QTY-LIT                              
              MOVE ASSET-QTY OF DCLVASSET TO WS-MFC-ORIG-RQST-QTY               
           END-IF.                                                              
           MOVE WS-MFC-ORIG-RQST-AMT-MSG TO                                     
                          ACAT33IO-ASSET-CMNTM-TXT (101 : 19).                  
                                                                                
           IF ACAT33IO-ADP-NBR NOT > SPACES                             MRGIPS05
              IF ACAT33IO-ASSET-AMT NOT GREATER .99                             
                 MOVE ACAT33IO-ASSET-QTY TO ACAT33IO-ASSET-AMT                  
                 SET ACAT33IO-RQST-ASSET-QTY TO TRUE                            
              END-IF                                                            
              GO TO REPLACE-ASSET-QTY-EXIT                                      
           END-IF.                                                              
                                                                                
           IF ACAT33IO-RQST-ASSET-QTY                                           
              MOVE ACAT33IO-ASSET-QTY TO WS-CALC-POSN-QTY               MRGIML03
              IF ACAT33IO-CASH-ASSET                                            
                 IF WS-MRGN-POSN-QTY-TYPE1 = ACAT33IO-ASSET-QTY         MRGIML03
                    MOVE WS-MRGN-POSN-MV-TYPE1  TO ACAT33IO-ASSET-AMT   MRGIPS05
                 ELSE                                                           
                    COMPUTE WS-CALC-PRICE ROUNDED =                             
                       WS-MRGN-POSN-MV-TYPE1 / WS-MRGN-POSN-QTY-TYPE1   MRGIPS05
                          ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE             
                    END-COMPUTE                                                 
LRM001              IF ACAT33IO-VALUE-FREE = 'Y'                                
                       MOVE ZERO TO ACAT33IO-ASSET-AMT                          
LRM001              ELSE                                                        
                       COMPUTE ACAT33IO-ASSET-AMT =                             
                          ACAT33IO-ASSET-QTY * WS-CALC-PRICE                    
                       END-COMPUTE                                              
LRM001              END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
              IF ACAT33IO-MARGIN-ASSET                                          
                 IF WS-MRGN-POSN-QTY-TYPE2 = ACAT33IO-ASSET-QTY         MRGIML03
                    MOVE WS-MRGN-POSN-MV-TYPE2  TO ACAT33IO-ASSET-AMT   MRGIPS05
                 ELSE                                                           
                    COMPUTE WS-CALC-PRICE ROUNDED =                             
                       WS-MRGN-POSN-MV-TYPE2 / WS-MRGN-POSN-QTY-TYPE2   MRGIPS05
                          ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE             
                    END-COMPUTE                                                 
LRM001              IF ACAT33IO-VALUE-FREE = 'Y'                                
                       MOVE ZERO TO ACAT33IO-ASSET-AMT                          
LRM001              ELSE                                                        
                       COMPUTE ACAT33IO-ASSET-AMT =                             
                          ACAT33IO-ASSET-QTY * WS-CALC-PRICE                    
                       END-COMPUTE                                              
LRM001              END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
              IF ACAT33IO-SHORT-ASSET                                           
                 IF WS-MRGN-POSN-QTY-TYPE5 = ACAT33IO-ASSET-QTY         MRGIML03
                    MOVE WS-MRGN-POSN-MV-TYPE5  TO ACAT33IO-ASSET-AMT   MRGIPS05
                 ELSE                                                           
                    COMPUTE WS-CALC-PRICE ROUNDED =                             
                       WS-MRGN-POSN-MV-TYPE5 / WS-MRGN-POSN-QTY-TYPE5   MRGIPS05
                          ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE             
                    END-COMPUTE                                                 
                    COMPUTE ACAT33IO-ASSET-AMT =                                
                       ACAT33IO-ASSET-QTY * WS-CALC-PRICE                       
                    END-COMPUTE                                                 
                 END-IF                                                         
              END-IF END-IF END-IF                                              
           ELSE                                                                 
           IF ACAT33IO-RQST-ASSET-AMT                                           
              IF ACAT33IO-CASH-ASSET                                            
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                  WS-MRGN-POSN-MV-TYPE1 / WS-MRGN-POSN-QTY-TYPE1        MRGIPS05
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                   
                 END-COMPUTE                                                    
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      ACAT33IO-ASSET-AMT / WS-CALC-PRICE                MRGIML03
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-POSN-QTY                
                 END-COMPUTE                                                    
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
              ELSE                                                              
              IF ACAT33IO-MARGIN-ASSET                                          
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                  WS-MRGN-POSN-MV-TYPE2 / WS-MRGN-POSN-QTY-TYPE2        MRGIPS05
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                   
                 END-COMPUTE                                                    
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      ACAT33IO-ASSET-AMT / WS-CALC-PRICE                MRGIML03
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-POSN-QTY                
                 END-COMPUTE                                                    
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
              ELSE                                                              
              IF ACAT33IO-SHORT-ASSET                                           
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                  WS-MRGN-POSN-MV-TYPE5 / WS-MRGN-POSN-QTY-TYPE5        MRGIPS05
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                   
                 END-COMPUTE                                                    
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      ACAT33IO-ASSET-AMT / WS-CALC-PRICE                MRGIML03
                    ON SIZE ERROR MOVE 1.00  TO WS-CALC-POSN-QTY                
                 END-COMPUTE                                                    
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
              END-IF END-IF END-IF                                              
           ELSE                                                                 
           IF ACAT33IO-RQST-ASSET-PCT                                           
              IF ACAT33IO-CASH-ASSET                                            
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      WS-MRGN-POSN-QTY-TYPE1 *  ACAT33IO-ASSET-PCT      MRGIML03
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                     WS-MRGN-POSN-MV-TYPE1 / WS-MRGN-POSN-QTY-TYPE1     MRGIPS05
                       ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                
                 END-COMPUTE                                                    
                 COMPUTE ACAT33IO-ASSET-AMT =                                   
                      ACAT33IO-ASSET-QTY * WS-CALC-PRICE                        
                 END-COMPUTE                                                    
              ELSE                                                              
              IF ACAT33IO-MARGIN-ASSET                                          
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      WS-MRGN-POSN-QTY-TYPE2 *  ACAT33IO-ASSET-PCT      MRGIML03
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                     WS-MRGN-POSN-MV-TYPE2 / WS-MRGN-POSN-QTY-TYPE2     MRGIPS05
                       ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                
                 END-COMPUTE                                                    
                 COMPUTE ACAT33IO-ASSET-AMT =                                   
                      ACAT33IO-ASSET-QTY * WS-CALC-PRICE                        
                 END-COMPUTE                                                    
              ELSE                                                              
              IF ACAT33IO-SHORT-ASSET                                           
                 COMPUTE WS-CALC-POSN-QTY ROUNDED =                     MRGIML03
                      WS-MRGN-POSN-QTY-TYPE5 *  ACAT33IO-ASSET-PCT      MRGIML03
                 MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-QTY                    
                 COMPUTE WS-CALC-PRICE ROUNDED =                                
                     WS-MRGN-POSN-MV-TYPE5 / WS-MRGN-POSN-QTY-TYPE5     MRGIPS05
                       ON SIZE ERROR MOVE 1.00  TO WS-CALC-PRICE                
                 END-COMPUTE                                                    
                 COMPUTE ACAT33IO-ASSET-AMT =                                   
                      ACAT33IO-ASSET-QTY * WS-CALC-PRICE                        
                 END-COMPUTE                                                    
              END-IF END-IF END-IF                                              
           END-IF.                                                              
           IF ACAT33IO-ASSET-AMT LESS .01                                       
              MOVE ACAT33IO-ASSET-QTY TO WS-CALC-POSN-QTY                       
              MOVE WS-CALC-POSN-QTY TO ACAT33IO-ASSET-AMT                       
           END-IF.                                                              
TEST       IF ACAT33IO-ASSET-QTY > ZEROS                                MRGIML03
TEST       AND ACAT33IO-ASSET-AMT LESS .01                                      
TEST           MOVE 1.00 TO ACAT33IO-ASSET-AMT                                  
TEST       END-IF.                                                              
           SET ACAT33IO-RQST-ASSET-QTY TO TRUE.                                 
       REPLACE-ASSET-QTY-EXIT. EXIT.                                            
                                                                                
LRM008 CHECK-ASSET-ON-OTHER-MFC.                                                
LRM008     SET ASSET-NOT-ON-OTHER-MFC TO TRUE.                                  
LRM008     EXEC SQL                                                             
LRM008        OPEN ACTITRF_DUPE                                                 
LRM008     END-EXEC.                                                    09200000
LRM008     IF SQLCODE = +0 OR +100                                              
LRM008        CONTINUE                                                  09240000
LRM008     ELSE                                                                 
LRM008        PERFORM 9000-WRITE-TO-CICS-LOG                                    
LRM008        PERFORM 9500-RETURN-DB2-ERROR                                     
LRM008     END-IF.                                                              
LRM008     PERFORM UNTIL SQLCODE NOT = 0                                        
LRM008           OR ASSET-ON-OTHER-MFC                                          
LRM008        EXEC SQL                                                          
LRM008          FETCH                                                           
LRM008            ACTITRF_DUPE                                                  
LRM008             INTO                                                 09160000
LRM008              :WS-DUPE-DLVR-NBR                                   09190000
LRM008             ,:WS-DUPE-ACCT-DLVR-NBR                              09190000
LRM008             ,:WS-DUPE-RCV-NBR                                    09190000
LRM008             ,:WS-DUPE-ACCT-RCV-NBR                               09190000
LRM008             ,:WS-DUPE-ACAT-CONTROL-NBR                           09190000
LRM008        END-EXEC                                                          
LRM008        IF SQLCODE = +0                                                   
LRM008           EXEC SQL                                                       
LRM008              SELECT                                                      
LRM008                CLIENT_NBR                                                
LRM008              INTO                                                09160000
LRM008                :DCLACTIAST.CLIENT-NBR                                    
LRM008              FROM ACTIAST                                        09170000
LRM008            WHERE (CLIENT_NBR                                     09180000
LRM008                        = :ACAT33IO-CLIENT-NBR                    09190000
LRM008               AND ACAT_CONTROL_NBR                                       
LRM008                        = :WS-DUPE-ACAT-CONTROL-NBR                       
LRM008               AND DLVR_NBR                                       09180000
LRM008                        = :WS-DUPE-DLVR-NBR                       09190000
LRM008               AND ACCT_DLVR_NBR                                  09180000
LRM008                        = :WS-DUPE-ACCT-DLVR-NBR                  09190000
LRM008               AND RCV_NBR                                        09180000
LRM008                        = :WS-DUPE-RCV-NBR                        09190000
LRM008               AND ACCT_RCV_NBR                                   09180000
LRM008                        = :WS-DUPE-ACCT-RCV-NBR                   09190000
LRM008               AND TRNFR_TYPE_CD                                          
LRM008                        = 'MFC'                                           
LRM008               AND ISIN_CNTRY_CD                                  09180000
LRM008                        = 'US'                                    09190000
LRM008               AND ISIN_SEC_ISSUE_CD                              09180000
LRM008                        = :DCLVASTHSTY.ISIN-SEC-ISSUE-CD                  
LRM008               AND CSH_MGN_SHRT_CD                                09180000
LRM008                        = :DCLVASTHSTY.CSH-MGN-SHRT-CD)                   
LRM008           END-EXEC                                               09200000
LRM008                                                                          
LRM008           EVALUATE SQLCODE                                       09220000
LRM008              WHEN +0                                             09260000
LRM008                  SET ASSET-ON-OTHER-MFC TO TRUE                          
LRM008           END-EVALUATE                                           09300000
LRM008           MOVE +0 TO SQLCODE                                     09300000
LRM008        END-IF                                                            
LRM008     END-PERFORM.                                                         
LRM008     EXEC SQL                                                             
LRM008        CLOSE ACTITRF_DUPE                                                
LRM008     END-EXEC.                                                    09200000
           EJECT                                                                
       ABENDED.                                                                 
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                         
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                               
     ***   MOVE '9999' TO BHST-RETURN-CODE.                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                           
      *==============================                                           
                                                                                
       9000-WRITE-TO-CICS-LOG.                                                  
      *==============================                                           
     ***   MOVE SQLCODE TO BHST-SQLCODE.                                        
           IF SQLCODE = -803                                                    
               CONTINUE                                                         
           ELSE                                                                 
               MOVE SPACES             TO WS-ERRL-DATA                          
               SET WRITE-ERROR-TO-LOG  TO TRUE                                  
               MOVE EIBTRNID           TO CALLING-TRAN-ID                       
               MOVE 'ACAT33DB'         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE                   
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
       9500-RETURN-DB2-ERROR.                                                   
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                               
           SET ACAT33IO-DB2-ERROR TO TRUE                                       
           MOVE SQLCAID TO ACAT33IO-SQLCAID                                     
           MOVE SQLCODE TO ACAT33IO-SQLCODE                                     
           MOVE SQLERRM TO ACAT33IO-SQLERRM                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                   06220000
