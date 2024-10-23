000001* PDX    - ACAT23DB C0228006 11/21/05 16:02:52 TBLAMUR            00001000
000001* LRM003 SSR# 25386 ALSO DISPLAY MEMO ASSETS                              
000001* PDX    - ACAT23DB C0216396 03/22/05 07:45:32 TBLAMUR            00001000
000001* LRM002 SSR# 39561 PHASE II DISPLAY WITHHELD PTR ASSETS.                 
000001* PDX    - ACAT23DB C0215192 01/18/05 11:15:36 TBLAMUR            00001000
000001* LRM001 SSR# 40042 USE NEW INITIAL TABLES / PHASE II.                    
000001* PDX    - ACAT23DB C0121428 02/06/99 15:55:40 TBLAMUR            00001000
000001* PDX    - ACAT23DB C0120327 01/25/99 14:36:38 TBLAMUR            00001000
000001* PDX    - ACAT23DB C0109165 10/31/98 14:44:59 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACAT23DB.                                         00020000
       AUTHOR.        LARRY MUREY.                                      00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS       * 00070000
      *   FOR ASSETS WITHHELD INQUIRY.                                * 00070000
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       COPY PDXIDCOB.                                                   00120002
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACAT23DB WORKING STORAGE BEGINS HERE'.                00480000
       77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00140002
                                                                        00490000
           SKIP3                                                        00540000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACAT23DB DETECTED ABEND'.                                         
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.              
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-TIMESTAMP                PIC X(26).                           
           05  WS-BRANCH                   PIC X(3)  VALUE SPACES.              
           05  WS-EIBCALEN                 PIC S9(8) COMP.                      
LRM003     05  WS-ACCOUNT                  PIC X(05).                           
                                                                                
       01  WS-COMMAREA.                                                         
           COPY ACAT23IO.                                               01510000
                                                                                
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
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                          
           EXEC SQL                                                     01400000
               INCLUDE VTRNFR                                           01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR ACAT TRANSFER HISTORY                                         
           EXEC SQL                                                     01400000
               INCLUDE VTRNHSTY                                         01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR ACAT ASSET TRANSFER HISTORY                                   
           EXEC SQL                                                     01400000
               INCLUDE VASTHSTY                                         01410000
           END-EXEC.                                                    01420000
      *--------------------------------------------------------*                
      *   TFR CURSRA: READ FORWARD FOR SPECIFIED CLIENT        *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRA CURSOR FOR                                        
                  SELECT                                                        
                   A.DLVR_NBR                                           09180000
                  ,A.ACCT_DLVR_NBR                                      09180000
                  ,A.RCV_NBR                                            09180000
                  ,A.ACCT_RCV_NBR                                       09180000
                  ,A.TRNFR_TYPE_CD                                              
                  ,C.ACAT_CONTROL_NBR                                           
                  ,C.RCV_CUST_NM                                                
                  ,C.STTS_CD                                                    
                  ,C.RR_CD                                                      
                  ,C.STTLM_DT                                                   
SEC               ,A.ISIN_SEC_ISSUE_CD                                  09180000
                  ,A.ASSET_DESC_TXT                                             
                  ,A.ISIN_CNTRY_CD                                      09180000
                  ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC              ,A.STTLM_LCTN_CD                                      09180000
TYPE              ,A.CSH_MGN_SHRT_CD                                    09180000
                  ,C.DSTBN_SIDE_CD                                      09180000
                   FROM ACTIAST A, VTRNFR C                             09170000
                  WHERE (A.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND C.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
PF                   AND ((C.ACCT_DLVR_NBR >                            09180000
PF                              :ACAT23IO-KEY-DLVR-ACCT)                        
PF                    OR (C.ACCT_DLVR_NBR =                             09180000
PF                              :ACAT23IO-KEY-DLVR-ACCT                         
PF                     AND C.ACAT_CONTROL_NBR >                                 
PF                              :ACAT23IO-KEY-CONTROL-NBR)                      
PF                    OR (C.ACCT_DLVR_NBR =                             09180000
PF                              :ACAT23IO-KEY-DLVR-ACCT                         
PF                     AND C.ACAT_CONTROL_NBR =                                 
PF                              :ACAT23IO-KEY-CONTROL-NBR                       
PF                     AND A.ISIN_SEC_ISSUE_CD >                        09180000
PF                         :ACAT23IO-KEY-SECR)                                  
PF                    OR (C.ACCT_DLVR_NBR =                             09180000
PF                              :ACAT23IO-KEY-DLVR-ACCT                         
PF                     AND C.ACAT_CONTROL_NBR =                                 
PF                              :ACAT23IO-KEY-CONTROL-NBR                       
PF                     AND A.ISIN_SEC_ISSUE_CD =                        09180000
PF                         :ACAT23IO-KEY-SECR                                   
PF                     AND A.CSH_MGN_SHRT_CD   >                        09180000
PF                          :ACAT23IO-KEY-CSH-MGN-SHRT-CD))                     
                     AND A.RCV_NBR                                      09180000
                              = C.RCV_NBR                               09190000
                     AND A.DLVR_NBR                                     09180000
                              = C.DLVR_NBR                              09180000
                     AND A.ACCT_DLVR_NBR                                09180000
                              = C.ACCT_DLVR_NBR                         09180000
BRAC                 AND A.ACCT_RCV_NBR                                 09180000
                              = C.ACCT_RCV_NBR                          09180000
LRM002               AND A.TRNFR_TYPE_CD IN ('RCR', 'FUL', 'PTR')       09180000
                     AND (A.NSCC_WTHLD_CD                               09180000
                              = 'W'                                             
LRM003                OR (A.STTLM_LCTN_CD   =  '45'                     09180000
LRM003                AND NOT A.STTLM_RSN_CD  =  'SMA'))                09180000
SE                   AND C.ACCT_RCV_NBR LIKE :ACAT23IO-SE-RCV-NBR       09180000
SE                   AND C.ACCT_DLVR_NBR LIKE :ACAT23IO-SE-DLVR-ACCT            
SE                   AND C.RR_CD         LIKE :ACAT23IO-SE-RR                   
SE                   AND C.TRNFR_TYPE_CD LIKE :ACAT23IO-SE-TRNFR-TYPE           
SE                   AND C.STTS_CD       LIKE :ACAT23IO-SE-STATUS)              
                  ORDER BY                                                      
                    ACCT_DLVR_NBR                                       09180000
                   ,ACAT_CONTROL_NBR                                            
SEC                ,ISIN_SEC_ISSUE_CD                                   09180000
TYPE               ,CSH_MGN_SHRT_CD                                     09180000
           END-EXEC.                                                            
     ***          SELECT                                                        
     ***           A.DLVR_NBR                                           09180000
     ***          ,A.ACCT_DLVR_NBR                                      09180000
     ***          ,A.RCV_NBR                                            09180000
     ***          ,A.ACCT_RCV_NBR                                       09180000
     ***          ,A.TRNFR_TYPE_CD                                              
     ***          ,B.ACAT_CONTROL_NBR                                           
     ***          ,B.RCV_CUST_NM                                                
     ***          ,B.STTS_CD                                                    
     ***          ,B.RR_CD                                                      
     ***          ,B.STTLM_ASCTD_DT                                             
SEC  ***          ,A.ISIN_SEC_ISSUE_CD                                  09180000
     ***          ,A.ASSET_DESC_TXT                                             
     ***          ,A.ISIN_CNTRY_CD                                      09180000
     ***          ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC ***          ,A.STTLM_LCTN_CD                                      09180000
TYPE ***          ,A.CSH_MGN_SHRT_CD                                    09180000
     ***          ,B.DSTBN_SIDE_CD                                      09180000
     ***           FROM ACTIAST A, ACTITRF B                            09170000
     ***          WHERE (A.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND B.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND A.RCV_NBR                                      09180000
     ***                      = B.RCV_NBR                               09190000
     ***             AND A.DLVR_NBR                                     09180000
     ***                      = B.DLVR_NBR                              09180000
     ***             AND A.ACCT_DLVR_NBR                                09180000
     ***                      = B.ACCT_DLVR_NBR                         09180000
     ***             AND A.ACCT_RCV_NBR                                 09180000
     ***                      = B.ACCT_RCV_NBR                          09180000
     ***             AND (A.TRNFR_TYPE_CD                               09180000
     ***                      = 'RCR'                                   09190000
     ***               OR A.TRNFR_TYPE_CD                               09180000
     ***                      = 'FUL')                                  09190000
     ***             AND A.NSCC_WTHLD_CD                                09180000
     ***                      = 'W'                                             
SE   ***             AND A.ACCT_RCV_NBR LIKE :ACAT23IO-SE-RCV-NBR       09180000
SE   ***             AND A.ACCT_DLVR_NBR LIKE :ACAT23IO-SE-DLVR-ACCT            
SE   ***             AND B.RR_CD         LIKE :ACAT23IO-SE-RR                   
SE   ***             AND B.TRNFR_TYPE_CD LIKE :ACAT23IO-SE-TRNFR-TYPE           
SE   ***             AND B.STTS_CD       LIKE :ACAT23IO-SE-STATUS               
     ***                                                                        
     ***             AND (A.ISIN_SEC_ISSUE_CD >                         09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   =                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC                              
     ***               AND A.CSH_MGN_SHRT_CD   >                        09180000
     ***                    :ACAT23IO-CURRENT-TYPE)                             
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   >                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC)))                           
     ***        UNION                                                           
      *--------------------------------------------------------*                
      *   TFR CURSRB: READ BACKWARD FOR SPECIFIED CLIENT       *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRB CURSOR FOR                                        
                  SELECT                                                        
                   A.DLVR_NBR                                           09180000
                  ,A.ACCT_DLVR_NBR                                      09180000
                  ,A.RCV_NBR                                            09180000
                  ,A.ACCT_RCV_NBR                                       09180000
                  ,A.TRNFR_TYPE_CD                                              
                  ,C.ACAT_CONTROL_NBR                                           
                  ,C.RCV_CUST_NM                                                
                  ,C.STTS_CD                                                    
LRM003            ,C.RR_CD                                                      
                  ,C.STTLM_DT                                                   
SEC               ,A.ISIN_SEC_ISSUE_CD                                  09180000
                  ,A.ASSET_DESC_TXT                                             
                  ,A.ISIN_CNTRY_CD                                      09180000
                  ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC              ,A.STTLM_LCTN_CD                                      09180000
TYPE              ,A.CSH_MGN_SHRT_CD                                    09180000
                  ,C.DSTBN_SIDE_CD                                      09180000
                   FROM ACTIAST A, VTRNFR C                             09170000
                  WHERE (A.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND C.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
PB                   AND ((C.ACCT_DLVR_NBR <                            09180000
PB                              :ACAT23IO-KEY-DLVR-ACCT)                        
PB                    OR (C.ACCT_DLVR_NBR =                             09180000
PB                              :ACAT23IO-KEY-DLVR-ACCT                         
PB                     AND C.ACAT_CONTROL_NBR <                                 
PB                              :ACAT23IO-KEY-CONTROL-NBR)                      
PB                    OR (C.ACCT_DLVR_NBR =                             09180000
PB                              :ACAT23IO-KEY-DLVR-ACCT                         
PB                     AND C.ACAT_CONTROL_NBR =                                 
PB                              :ACAT23IO-KEY-CONTROL-NBR                       
PB                     AND A.ISIN_SEC_ISSUE_CD <                        09180000
PB                              :ACAT23IO-KEY-SECR)                             
PB                    OR (C.ACCT_DLVR_NBR =                             09180000
PB                              :ACAT23IO-KEY-DLVR-ACCT                         
PB                     AND C.ACAT_CONTROL_NBR =                                 
PB                              :ACAT23IO-KEY-CONTROL-NBR                       
PB                     AND A.ISIN_SEC_ISSUE_CD =                        09180000
PB                         :ACAT23IO-KEY-SECR                                   
PB                     AND A.CSH_MGN_SHRT_CD   <                        09180000
PB                          :ACAT23IO-KEY-CSH-MGN-SHRT-CD))                     
                     AND A.RCV_NBR                                      09180000
                              = C.RCV_NBR                               09190000
                     AND A.DLVR_NBR                                     09180000
                              = C.DLVR_NBR                              09180000
                     AND A.ACCT_DLVR_NBR                                09180000
                              = C.ACCT_DLVR_NBR                         09180000
BRAC                 AND A.ACCT_RCV_NBR                                 09180000
                              = C.ACCT_RCV_NBR                          09180000
LRM002               AND A.TRNFR_TYPE_CD IN ('RCR', 'FUL', 'PTR')       09180000
                     AND (A.NSCC_WTHLD_CD                               09180000
                              = 'W'                                             
LRM003                OR (A.STTLM_LCTN_CD   =  '45'                     09180000
LRM003                AND NOT A.STTLM_RSN_CD  =  'SMA'))                09180000
SE                   AND C.ACCT_RCV_NBR LIKE :ACAT23IO-SE-RCV-NBR       09180000
SE                   AND C.ACCT_DLVR_NBR LIKE :ACAT23IO-SE-DLVR-ACCT            
SE                   AND C.RR_CD         LIKE :ACAT23IO-SE-RR                   
SE                   AND C.TRNFR_TYPE_CD LIKE :ACAT23IO-SE-TRNFR-TYPE           
SE                   AND C.STTS_CD       LIKE :ACAT23IO-SE-STATUS)              
                  ORDER BY                                                      
                    ACCT_DLVR_NBR     DESC                              09180000
                   ,ACAT_CONTROL_NBR  DESC                                      
SEC                ,ISIN_SEC_ISSUE_CD DESC                              09180000
TYPE               ,CSH_MGN_SHRT_CD   DESC                              09180000
           END-EXEC.                                                            
     ***          SELECT                                                        
     ***           A.DLVR_NBR                                           09180000
     ***          ,A.ACCT_DLVR_NBR                                      09180000
     ***          ,A.RCV_NBR                                            09180000
     ***          ,A.ACCT_RCV_NBR                                       09180000
     ***          ,A.TRNFR_TYPE_CD                                              
     ***          ,B.ACAT_CONTROL_NBR                                           
     ***          ,B.RCV_CUST_NM                                                
     ***          ,B.STTS_CD                                                    
     ***          ,B.STTLM_ASCTD_DT                                             
SEC  ***          ,A.ISIN_SEC_ISSUE_CD                                  09180000
     ***          ,A.ASSET_DESC_TXT                                             
     ***          ,A.ISIN_CNTRY_CD                                      09180000
     ***          ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC ***          ,A.STTLM_LCTN_CD                                      09180000
TYPE ***          ,A.CSH_MGN_SHRT_CD                                    09180000
     ***          ,B.DSTBN_SIDE_CD                                      09180000
     ***           FROM ACTIAST A, ACTITRF B                            09170000
     ***          WHERE (A.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND B.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND A.RCV_NBR                                      09180000
     ***                      = B.RCV_NBR                               09190000
     ***             AND A.DLVR_NBR                                     09180000
     ***                      = B.DLVR_NBR                              09180000
     ***             AND A.ACCT_DLVR_NBR                                09180000
     ***                      = B.ACCT_DLVR_NBR                         09180000
BRAC ***             AND A.ACCT_RCV_NBR                                 09180000
     ***                      = B.ACCT_RCV_NBR                          09180000
     ***             AND (A.TRNFR_TYPE_CD                               09180000
     ***                      = 'RCR'                                   09190000
     ***               OR A.TRNFR_TYPE_CD                               09180000
     ***                      = 'FUL')                                  09190000
     ***             AND A.NSCC_WTHLD_CD                                09180000
     ***                      = 'W'                                             
     ***             AND (A.ISIN_SEC_ISSUE_CD <                         09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   =                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC                              
     ***               AND A.CSH_MGN_SHRT_CD   <                        09180000
     ***                    :ACAT23IO-CURRENT-TYPE)                             
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   <                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC)))                           
     ***        UNION                                                           
      *           ,C.CLIENT_NBR                                         09180000
      *           ,C.DLVR_NBR                                           09180000
      *           ,C.ACCT_DLVR_NBR                                      09180000
      *           ,C.RCV_NBR                                            09180000
      *           ,C.ACCT_RCV_NBR                                       09180000
      *           ,C.TRNFR_TYPE_CD                                              
      *           ,C.ACAT_CONTROL_NBR                                           
      *           ,C.RCV_CUST_NM                                                
      *           ,C.STTS_CD                                                    
      *           ,C.STTLM_ASCTD_DT                                             
      *                                                                         
      *            OR   (C.CLIENT_NBR                                   09180000
      *                       = :ACAT23IO-CLIENT-NBR                    09190000
      *              AND B.CLIENT_NBR                                   09180000
      *                       = :ACAT23IO-CLIENT-NBR                    09190000
      *              AND C.RCV_NBR                                      09180000
      *                       = B.RCV_NBR                               09190000
      *              AND C.DLVR_NBR                                     09180000
      *                       = B.DLVR_NBR                              09180000
      *              AND C.ACCT_DLVR_NBR                                09180000
      *                       = B.ACCT_DLVR_NBR                         09180000
BRAC  *              AND C.ACCT_RCV_NBR                                 09180000
      *                       = B.ACCT_RCV_NBR                          09180000
BRAC  *              AND C.ACAT_CONTROL_NBR                             09180000
      *                       = B.ACAT_CONTROL_NBR                      09190000
      *              AND (C.TRNFR_TYPE_CD                               09180000
      *                       = 'RCR'                                   09190000
      *                OR C.TRNFR_TYPE_CD                               09180000
      *                       = 'FUL')                                  09190000
      *              AND B.NSCC_WTHLD_CD                                09180000
      *                       = 'W')                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRI: READ FORWARD FOR SPECIFIED CLIENT INIT DB*                
      *--------------------------------------------------------*                
     ***   EXEC SQL                                                             
     ***      DECLARE TFRCSRI CURSOR FOR                                        
     ***          SELECT                                                        
     ***           A.DLVR_NBR                                           09180000
     ***          ,A.ACCT_DLVR_NBR                                      09180000
     ***          ,A.RCV_NBR                                            09180000
     ***          ,A.ACCT_RCV_NBR                                       09180000
     ***          ,A.TRNFR_TYPE_CD                                              
     ***          ,B.ACAT_CONTROL_NBR                                           
     ***          ,B.RCV_CUST_NM                                                
     ***          ,B.STTS_CD                                                    
     ***          ,B.STTLM_DT                                                   
SEC  ***          ,A.ISIN_SEC_ISSUE_CD                                  09180000
     ***          ,A.ASSET_DESC_TXT                                             
     ***          ,A.ISIN_CNTRY_CD                                      09180000
     ***          ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC ***          ,A.STTLM_LCTN_CD                                      09180000
TYPE ***          ,A.CSH_MGN_SHRT_CD                                    09180000
     ***          ,B.DSTBN_SIDE_CD                                      09180000
     ***           FROM ACTIAST A, ACTITRF B                            09170000
     ***          WHERE (A.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND B.CLIENT_NBR                                   09180000
     ***                      = :ACAT23IO-CLIENT-NBR                    09190000
     ***             AND A.RCV_NBR                                      09180000
     ***                      = B.RCV_NBR                               09190000
     ***             AND A.DLVR_NBR                                     09180000
     ***                      = B.DLVR_NBR                              09180000
     ***             AND A.ACCT_DLVR_NBR                                09180000
     ***                      = B.ACCT_DLVR_NBR                         09180000
BRAC ***             AND A.ACCT_RCV_NBR                                 09180000
     ***                      = B.ACCT_RCV_NBR                          09180000
     ***             AND (A.TRNFR_TYPE_CD                               09180000
     ***                      = 'RCR'                                   09190000
     ***               OR A.TRNFR_TYPE_CD                               09180000
     ***                      = 'FUL')                                  09190000
     ***             AND A.NSCC_WTHLD_CD                                09180000
     ***                      = 'W'                                             
     ***             AND (A.ISIN_SEC_ISSUE_CD >                         09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   =                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC                              
     ***               AND A.CSH_MGN_SHRT_CD   >                        09180000
     ***                    :ACAT23IO-CURRENT-TYPE)                             
     ***             OR (A.ISIN_SEC_ISSUE_CD =                          09180000
     ***                   :ACAT23IO-CURRENT-SECR                               
     ***               AND A.STTLM_LCTN_CD   >                          09180000
     ***                    :ACAT23IO-CURRENT-SLOC)))                           
     ***          ORDER BY                                                      
     ***            STTLM_DT                                                    
     ***           ,ACCT_DLVR_NBR                                       09180000
     ***           ,ISIN_CNTRY_CD                                       09180000
SEC  ***           ,ISIN_SEC_ISSUE_CD                                   09180000
     ***           ,ISIN_SEC_CDG_CD                                     09180000
SLOC ***           ,STTLM_LCTN_CD                                       09180000
TYPE ***           ,CSH_MGN_SHRT_CD                                     09180000
     ***           ,RCV_NBR                                             09180000
     ***           ,ACCT_RCV_NBR                                        09180000
     ***           ,TRNFR_TYPE_CD                                       09180000
     ***   END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRO: READ FORWARD FOR SPECIFIED CLIENT HSTY DB*                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRO CURSOR FOR                                        
                  SELECT                                                        
                   B.DLVR_NBR                                           09180000
                  ,B.ACCT_DLVR_NBR                                      09180000
                  ,B.RCV_NBR                                            09180000
                  ,B.ACCT_RCV_NBR                                       09180000
                  ,B.TRNFR_TYPE_CD                                              
                  ,B.ACAT_CONTROL_NBR                                           
                  ,B.RCV_CUST_NM                                                
                  ,B.STTS_CD                                                    
                  ,B.RR_CD                                                      
                  ,B.STTLM_DT                                                   
SEC               ,A.ISIN_SEC_ISSUE_CD                                  09180000
                  ,A.ASSET_DESC_TXT                                             
                  ,A.ISIN_CNTRY_CD                                      09180000
                  ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC              ,A.STTLM_LCTN_CD                                      09180000
TYPE              ,A.CSH_MGN_SHRT_CD                                    09180000
                  ,A.ASSET_SEQ_NBR                                      09180000
                  ,B.DSTBN_SIDE_CD                                      09180000
                   FROM VASTHSTY A, VTRNHSTY B                          09170000
                  WHERE (A.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND B.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND A.ACAT_CONTROL_NBR                             09180000
                              = B.ACAT_CONTROL_NBR                      09190000
LRM002               AND B.TRNFR_TYPE_CD IN ('RCR', 'FUL', 'PTR')       09180000
                     AND A.NSCC_PEND_CD                                 09180000
                              = 'W'                                             
SE                   AND B.ACCT_RCV_NBR LIKE :ACAT23IO-SE-RCV-NBR       09180000
SE                   AND B.ACCT_DLVR_NBR LIKE :ACAT23IO-SE-DLVR-ACCT            
SE                   AND B.RR_CD         LIKE :ACAT23IO-SE-RR                   
SE                   AND B.TRNFR_TYPE_CD LIKE :ACAT23IO-SE-TRNFR-TYPE           
SE                   AND B.STTS_CD       LIKE :ACAT23IO-SE-STATUS               
                     AND A.ASSET_SEQ_NBR >                              09180000
                           :ACAT23IO-CURRENT-SEQ-NBR)                           
                  ORDER BY                                                      
                    STTLM_DT                                                    
                   ,ACCT_DLVR_NBR                                       09180000
                   ,ASSET_SEQ_NBR                                       09180000
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRP: READ BACKWARD FOR SPECIFIED CLIENT HSTY  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRP CURSOR FOR                                        
                  SELECT                                                        
                   B.DLVR_NBR                                           09180000
                  ,B.ACCT_DLVR_NBR                                      09180000
                  ,B.RCV_NBR                                            09180000
                  ,B.ACCT_RCV_NBR                                       09180000
                  ,B.TRNFR_TYPE_CD                                              
                  ,B.ACAT_CONTROL_NBR                                           
                  ,B.RCV_CUST_NM                                                
                  ,B.STTS_CD                                                    
                  ,B.STTLM_DT                                                   
SEC               ,A.ISIN_SEC_ISSUE_CD                                  09180000
                  ,A.ASSET_DESC_TXT                                             
                  ,A.ISIN_CNTRY_CD                                      09180000
                  ,A.ISIN_SEC_CDG_CD                                    09180000
SLOC              ,A.STTLM_LCTN_CD                                      09180000
TYPE              ,A.CSH_MGN_SHRT_CD                                    09180000
                  ,A.ASSET_SEQ_NBR                                      09180000
                  ,B.DSTBN_SIDE_CD                                      09180000
                   FROM VASTHSTY A, VTRNHSTY B                          09170000
                  WHERE (A.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND B.CLIENT_NBR                                   09180000
                              = :ACAT23IO-CLIENT-NBR                    09190000
                     AND B.ACAT_CONTROL_NBR                             09180000
                              = B.ACAT_CONTROL_NBR                      09190000
LRM002               AND B.TRNFR_TYPE_CD IN ('RCR', 'FUL', 'PTR')       09180000
                     AND A.NSCC_PEND_CD                                 09180000
                              = 'W'                                             
                     AND A.ASSET_SEQ_NBR <                              09180000
                           :ACAT23IO-CURRENT-SEQ-NBR)                           
                  ORDER BY                                                      
                    STTLM_DT DESC                                               
                   ,ACCT_DLVR_NBR  DESC                                 09180000
                   ,ASSET_SEQ_NBR  DESC                                 09180000
           END-EXEC.                                                            
           EJECT                                                                
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA.                                                 01490000
           05  FILLER             PIC X(2000).                                  
                                                                                
       EJECT                                                                    
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
                                                                                
           IF ACAT23IO-OPEN-CURSORA                                             
           OR ACAT23IO-OPEN-CURSORB                                             
               PERFORM 0050-OPEN-CURSOR                                 09130000
           ELSE                                                                 
           IF ACAT23IO-READ-NEXT                                                
               PERFORM 0075-READ-NEXTA                                  09130000
           ELSE                                                                 
           IF ACAT23IO-CLOSE-CURSORA                                            
               PERFORM 0080-CLOSE-TFRCSRA                                       
           ELSE                                                                 
           IF ACAT23IO-READ-PREV                                                
               PERFORM 0075-READ-PREVB                                  09130000
           ELSE                                                                 
           IF ACAT23IO-CLOSE-CURSORB                                            
               PERFORM 0080-CLOSE-TFRCSRB                                       
           END-IF.                                                              
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
       0050-OPEN-CURSOR.                                                09130000
      *--------------------------------------------------------------*          
      *     SEARCH ENGINE WITH CLIENT                                *          
      *--------------------------------------------------------------*          
SE         IF ACAT23IO-SE-RCV-NBR  (1 : 1) NOT > SPACES                 09180000
               MOVE ALL '%' TO  ACAT23IO-SE-RCV-NBR.                    09180000
SE         IF ACAT23IO-SE-DLVR-ACCT (1 : 1) NOT > SPACES                09180000
               MOVE ALL '%' TO  ACAT23IO-SE-DLVR-ACCT.                  09180000
SE         IF ACAT23IO-SE-RR        (1 : 1) NOT > SPACES                09180000
               MOVE ALL '%' TO  ACAT23IO-SE-RR.                         09180000
SE         IF ACAT23IO-SE-TRNFR-TYPE (1 : 1) NOT > SPACES               09180000
               MOVE ALL '%' TO  ACAT23IO-SE-TRNFR-TYPE.                 09180000
SE         IF ACAT23IO-SE-STATUS     (1 : 1) NOT > SPACES               09180000
               MOVE ALL '%' TO  ACAT23IO-SE-STATUS.                     09180000
PF         IF ACAT23IO-KEY-STTLM-DT NOT > SPACES                                
PF            MOVE '0001-01-01' TO ACAT23IO-KEY-STTLM-DT.                       
                                                                                
LRM003     MOVE ACAT23IO-DLVR-ACCT(1 : 3) TO WS-BRANCH.                         
LRM003     MOVE ACAT23IO-DLVR-ACCT(4 : 5) TO WS-ACCOUNT.                        
LRM003     IF ACAT23IO-HISTORY-DB                                               
              IF ACAT23IO-OPEN-CURSORA                                          
                  EXEC SQL                                                      
                     OPEN TFRCSRO                                               
                  END-EXEC                                                      
               ELSE                                                             
                  EXEC SQL                                                      
                     OPEN TFRCSRP                                               
                  END-EXEC                                                      
               END-IF                                                           
LRM003     ELSE                                                                 
              IF ACAT23IO-OPEN-CURSORA                                          
                 EXEC SQL                                                       
                    OPEN TFRCSRA                                                
                 END-EXEC                                                       
              ELSE                                                              
                  EXEC SQL                                                      
                     OPEN TFRCSRB                                               
                  END-EXEC                                                      
           END-IF.                                                              
                                                                                
           IF SQLCODE = 0                                                       
              SET ACAT23IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
                                                                                
       EJECT                                                                    
                                                                                
       0075-READ-NEXTA.                                                 09130000
           IF ACAT23IO-HISTORY-DB                                               
              EXEC SQL                                                          
                FETCH                                                           
                  TFRCSRO                                                       
                   INTO                                                 09160000
                    :DCLVTRNHSTY.DLVR-NBR                               09190000
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                          09190000
                   ,:DCLVTRNHSTY.RCV-NBR                                09180000
                   ,:DCLVTRNHSTY.ACCT-RCV-NBR                           09180000
                   ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                  
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                               
                   ,:DCLVTRNHSTY.RCV-CUST-NM                                    
                   ,:DCLVTRNHSTY.STTS-CD                                        
                   ,:DCLVTRNHSTY.RR-CD                                          
                   ,:DCLVTRNHSTY.STTLM-DT                                       
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       09180000
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ISIN-CNTRY-CD                           09180000
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                         09180000
                   ,:DCLACTIAST.STTLM-LCTN-CD                           09180000
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                         09180000
                   ,:DCLACTIAST.ASSET-SEQ-NBR                           09180000
                   ,:DCLVTRNHSTY.DSTBN-SIDE-CD                          09180000
              END-EXEC                                                          
           ELSE                                                                 
              EXEC SQL                                                          
                FETCH                                                           
                  TFRCSRA                                                       
                   INTO                                                 09160000
                    :DCLVTRNFR.DLVR-NBR                                 09190000
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            09190000
                   ,:DCLVTRNFR.RCV-NBR                                  09180000
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             09180000
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.RCV-CUST-NM                                      
                   ,:DCLVTRNFR.STTS-CD                                          
                   ,:DCLVTRNFR.RR-CD                                            
XXX                ,:DCLVTRNFR.STTLM-DT                                         
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       09180000
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ISIN-CNTRY-CD                           09180000
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                         09180000
                   ,:DCLACTIAST.STTLM-LCTN-CD                           09180000
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                         09180000
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                            09180000
              END-EXEC                                                          
           END-IF.                                                              
      *            ,:DCLVTRNFR.CLIENT-NBR                                       
      *            ,:DCLVTRNFR.DLVR-NBR                                 09190000
      *            ,:DCLVTRNFR.ACCT-DLVR-NBR                            09190000
      *            ,:DCLVTRNFR.RCV-NBR                                  09180000
      *            ,:DCLVTRNFR.ACCT-RCV-NBR                             09180000
      *            ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
      *            ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
      *            ,:DCLVTRNFR.RCV-CUST-NM                                      
      *            ,:DCLVTRNFR.STTS-CD                                          
      *            ,:DCLVTRNFR.STTLM-ASCTD-DT                                   
           IF SQLCODE = 0                                                       
              IF ACAT23IO-HISTORY-DB                                            
                 MOVE RR-CD OF DCLVTRNHSTY TO SRCH-INP-RR                       
                 IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                          
                    MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO SRCH-INP-BRANCH         
                 ELSE                                                           
                    MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY TO SRCH-INP-BRANCH        
                 END-IF                                                         
              ELSE                                                              
                 MOVE RR-CD OF DCLVTRNFR TO SRCH-INP-RR                         
                 IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                            
                    MOVE ACCT-RCV-NBR OF DCLVTRNFR TO SRCH-INP-BRANCH           
                 ELSE                                                           
                    MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO SRCH-INP-BRANCH          
                 END-IF                                                         
              END-IF                                                            
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTA                                  09130000
              END-IF                                                            
              SET ACAT23IO-FOUND TO TRUE                                        
              MOVE DLVR-NBR         OF DCLVTRNFR TO                     09190000
                    ACAT23IO-DLVR-NBR                                   09190000
              MOVE ACCT-DLVR-NBR    OF DCLVTRNFR TO                     09190000
                    ACAT23IO-DLVR-ACCT                                  09190000
              MOVE RCV-NBR          OF DCLVTRNFR TO                     09180000
                    ACAT23IO-RCV-NBR                                    09190000
              MOVE ACCT-RCV-NBR     OF DCLVTRNFR TO                     09180000
                    ACAT23IO-RCV-ACCT                                   09190000
              MOVE TRNFR-TYPE-CD    OF DCLVTRNFR TO                     09190000
                    ACAT23IO-TRNFR-TYPE-CD                                      
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                     09190000
                    ACAT23IO-CONTROL-NBR                                        
              MOVE RCV-CUST-NM      OF DCLVTRNFR TO                     09190000
                    ACAT23IO-CUST-NM                                            
              MOVE STTS-CD          OF DCLVTRNFR TO                     09190000
                    ACAT23IO-STTS-CD                                            
              MOVE STTLM-DT   OF DCLVTRNFR TO                           09190000
                    ACAT23IO-ASCTD-DT                                           
              MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-SEC-ISSUE-CD                          09180000
              MOVE ASSET-DESC-TXT    OF DCLACTIAST TO                   09190000
                    ACAT23IO-DESC-TXT                                           
              MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-CNTRY-CD                                      
              MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-SEC-CDG-CD                                    
              MOVE STTLM-LCTN-CD     OF DCLACTIAST TO                   09180000
                    ACAT23IO-STTLM-LCTN-CD                                      
              MOVE CSH-MGN-SHRT-CD   OF DCLACTIAST TO                   09180000
                    ACAT23IO-CSH-MGN-SHRT-CD                                    
?TABLE        MOVE SQLCAID TO ACAT23IO-SQLCAID                                  
              MOVE SQLCODE TO ACAT23IO-SQLCODE                                  
              MOVE SQLERRM TO ACAT23IO-SQLERRM                                  
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT23IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT23DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
                                                                                
       0075-READ-PREVB.                                                 09130000
DEAD       IF ACAT23IO-HISTORY-DB                                               
              EXEC SQL                                                          
                FETCH                                                           
                  TFRCSRO                                                       
                   INTO                                                 09160000
                    :DCLVTRNHSTY.DLVR-NBR                               09190000
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                          09190000
                   ,:DCLVTRNHSTY.RCV-NBR                                09180000
                   ,:DCLVTRNHSTY.ACCT-RCV-NBR                           09180000
                   ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                  
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                               
                   ,:DCLVTRNHSTY.RCV-CUST-NM                                    
                   ,:DCLVTRNHSTY.STTS-CD                                        
                   ,:DCLVTRNHSTY.RR-CD                                          
                   ,:DCLVTRNHSTY.STTLM-DT                                       
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       09180000
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ISIN-CNTRY-CD                           09180000
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                         09180000
                   ,:DCLACTIAST.STTLM-LCTN-CD                           09180000
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                         09180000
                   ,:DCLACTIAST.ASSET-SEQ-NBR                           09180000
                   ,:DCLVTRNHSTY.DSTBN-SIDE-CD                          09180000
              END-EXEC                                                          
           ELSE                                                                 
              EXEC SQL                                                          
                FETCH                                                           
                  TFRCSRB                                                       
                   INTO                                                 09160000
                    :DCLVTRNFR.DLVR-NBR                                 09190000
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            09190000
                   ,:DCLVTRNFR.RCV-NBR                                  09180000
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             09180000
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.RCV-CUST-NM                                      
                   ,:DCLVTRNFR.STTS-CD                                          
                   ,:DCLVTRNFR.RR-CD                                            
                   ,:DCLVTRNFR.STTLM-DT                                         
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                       09180000
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ISIN-CNTRY-CD                           09180000
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                         09180000
                   ,:DCLACTIAST.STTLM-LCTN-CD                           09180000
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                         09180000
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                            09180000
              END-EXEC                                                          
           END-IF.                                                              
           IF SQLCODE = 0                                                       
              IF ACAT23IO-HISTORY-DB                                            
                 MOVE RR-CD OF DCLVTRNHSTY TO SRCH-INP-RR                       
                 IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                          
                    MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO SRCH-INP-BRANCH         
                 ELSE                                                           
                    MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY TO SRCH-INP-BRANCH        
                 END-IF                                                         
              ELSE                                                              
                 MOVE RR-CD OF DCLVTRNFR TO SRCH-INP-RR                         
                 IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                            
                    MOVE ACCT-RCV-NBR OF DCLVTRNFR TO SRCH-INP-BRANCH           
                 ELSE                                                           
                    MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO SRCH-INP-BRANCH          
                 END-IF                                                         
              END-IF                                                            
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-PREVB                                  09130000
              END-IF                                                            
              SET ACAT23IO-FOUND TO TRUE                                        
              MOVE DLVR-NBR         OF DCLVTRNFR TO                     09190000
                    ACAT23IO-DLVR-NBR                                   09190000
              MOVE ACCT-DLVR-NBR    OF DCLVTRNFR TO                     09190000
                    ACAT23IO-DLVR-ACCT                                  09190000
              MOVE RCV-NBR          OF DCLVTRNFR TO                     09180000
                    ACAT23IO-RCV-NBR                                    09190000
              MOVE ACCT-RCV-NBR     OF DCLVTRNFR TO                     09180000
                    ACAT23IO-RCV-ACCT                                   09190000
              MOVE TRNFR-TYPE-CD    OF DCLVTRNFR TO                     09190000
                    ACAT23IO-TRNFR-TYPE-CD                                      
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                     09190000
                    ACAT23IO-CONTROL-NBR                                        
              MOVE RCV-CUST-NM      OF DCLVTRNFR TO                     09190000
                    ACAT23IO-CUST-NM                                            
              MOVE STTS-CD          OF DCLVTRNFR TO                     09190000
                    ACAT23IO-STTS-CD                                            
              MOVE STTLM-DT   OF DCLVTRNFR TO                           09190000
                    ACAT23IO-ASCTD-DT                                           
              MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-SEC-ISSUE-CD                          09180000
              MOVE ASSET-DESC-TXT    OF DCLACTIAST TO                   09190000
                    ACAT23IO-DESC-TXT                                           
              MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-CNTRY-CD                                      
              MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO                   09180000
                    ACAT23IO-ISIN-SEC-CDG-CD                                    
              MOVE STTLM-LCTN-CD     OF DCLACTIAST TO                   09180000
                    ACAT23IO-STTLM-LCTN-CD                                      
              MOVE CSH-MGN-SHRT-CD   OF DCLACTIAST TO                   09180000
                    ACAT23IO-CSH-MGN-SHRT-CD                                    
              MOVE SQLCAID TO ACAT23IO-SQLCAID                                  
              MOVE SQLCODE TO ACAT23IO-SQLCODE                                  
              MOVE SQLERRM TO ACAT23IO-SQLERRM                                  
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT23IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT23DB - TFRCSRB FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0075-SIGNON-SECR-CHECK-RTN.                                              
           IF ACAT23IO-SUPER-SIGN-ON                                            
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
     ***   IF ACAT23IO-INITIAL-DB                                               
     ***      EXEC SQL                                                          
     ***         CLOSE TFRCSRI                                                  
     ***      END-EXEC                                                          
     ***   ELSE                                                                 
           IF ACAT23IO-HISTORY-DB                                               
              EXEC SQL                                                          
                 CLOSE TFRCSRO                                                  
              END-EXEC                                                          
           ELSE                                                                 
              EXEC SQL                                                          
                 CLOSE TFRCSRA                                                  
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
       0080-CLOSE-TFRCSRB.                                                      
DEAD ***   IF ACAT23IO-INITIAL-DB                                               
     ***      EXEC SQL                                                          
     ***         CLOSE TFRCSRI                                                  
     ***      END-EXEC                                                          
     ***   ELSE                                                                 
           IF ACAT23IO-HISTORY-DB                                               
              EXEC SQL                                                          
                 CLOSE TFRCSRO                                                  
              END-EXEC                                                          
           ELSE                                                                 
              EXEC SQL                                                          
                 CLOSE TFRCSRB                                                  
              END-EXEC                                                          
           END-IF.                                                              
       EJECT                                                                    
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
               MOVE 'ACAT23DB'         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE                   
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
       9500-RETURN-DB2-ERROR.                                                   
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                               
           SET ACAT23IO-DB2-ERROR TO TRUE                                       
           MOVE SQLCAID TO ACAT23IO-SQLCAID                                     
           MOVE SQLCODE TO ACAT23IO-SQLCODE                                     
           MOVE SQLERRM TO ACAT23IO-SQLERRM                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                   06220000
