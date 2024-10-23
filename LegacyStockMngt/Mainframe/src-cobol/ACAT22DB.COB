000001* PDX    - ACAT22DB C0279306 05/26/09 10:26:23 TBLAMUR            00001000
000001* LRM003 - SSR 64209 MIP REDUCTION.  QUALIFY CURSOR BY HI/LOW     00001000
000001*  BRANCH AND RR TO GREATLY RESTRICT THE SELECTION VOLUME.        00001000
000001* PDX    - ACAT22DB C0279306 04/24/09 07:58:55 TBLAMUR            00001000
000001* PDX    - ACAT22DB C0223857 08/26/05 10:08:13 TBEDTAK            00001000
000001* ET0001 - SSR 40201 MIP REDUCTION                                00001000
000001* PDX    - ACAT22DB C0223857 08/24/05 10:12:42 TBEDTAK            00001000
000001* PDX    - ACAT22DB C0133622 01/14/00 12:27:32 TBLAMUR            00001000
000001* PDX    - ACAT22DB C0131728 09/27/99 09:56:51 TBLAMUR            00001000
000001* PDX    - ACAT22DB C0122848 03/12/99 15:35:18 TBEDTAK            00001000
000001* PDX    - ACAT22DB C0120330 01/31/99 19:12:13 TBEDTAK            00001000
000001* PDX    - ACAT22DB C0117817 12/03/98 16:46:09 TBEDTAK            00001000
000001* PDX    - ACAT22DB C0114558 10/20/98 10:03:45 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT22DB.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *      DB2 I/O PROGRAM FOR A TRANSFER HISTORY INQUIRY PROGRAM   *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
      *                                                                         
       01  WS-WORK-AREA.                                                        
           03  WS-TIMESTAMP                    PIC X(26).                       
           03  WS-ROW-COUNT                    PIC S9(9) COMP-3.                
       01  WS-ERR-DATA.                                                         
           03  WS-REQUEST-TYPE                 PIC X(01).                       
               88  WS-WRITE-ERROR-TO-LOG           VALUE 'Y'.                   
           03  CALLING-TRAN-ID                 PIC X(04).                       
           03  CALLING-PROGRAM-ID              PIC X(08).                       
           03  SQLCA-AREA                      PIC X(136).                      
       01  WS-PASSED-DATA-AREA.                                                 
           03  WS-PASSED-CLT                   PIC X(04).                       
           03  WS-PASSED-BR                    PIC X(03).                       
           03  WS-PASSED-AC                    PIC X(05).                       
           03  WS-PASSED-RR                    PIC X(03).                       
LRM003     03  WS-PASSED-RR-LO                 PIC X(03).                       
LRM003     03  WS-PASSED-RR-HI                 PIC X(03).                       
           03  WS-PASSED-TFR                   PIC X(03).                       
           03  WS-PASSED-RD                    PIC X(01).                       
           03  WS-PASSED-CBRKR-DEL             PIC X(04).                       
           03  WS-PASSED-CBRKR-REC             PIC X(04).                       
           03  WS-PASSED-STAT-FR               PIC X(03).                       
           03  WS-PASSED-STAT-TO               PIC X(03).                       
           03  WS-PASSED-SD-FR                 PIC X(10).                       
           03  WS-PASSED-SD-TO                 PIC X(10).                       
           03  WS-PASSED-TERMID                PIC X(04).                       
           03  WS-PASSED-ACAT                  PIC X(14).                       
           03  WS-PASSED-TO-BR                 PIC X(03).                       
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           HISTORY TRANSFER TABLE                               *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE VTRNHSTY                                                  
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    SQL COMMUNICATION AREA                                      *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       HISTORY TRANSFER TABLE DECLARE CURSOR STATMENT           *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSR  CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,TRANS_TYPE_CD                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_ACCT_TYPE_CD                                           
                    ,STTS_CD                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,CRT_TMSTP                                                  
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
ET0001               AND ((BRANCH_CD = :WS-PASSED-BR                            
ET0001                             AND                                          
ET0001                    BRANCH_CD <  :WS-PASSED-TO-BR                         
ET0001               AND ACCT_CD >= :WS-PASSED-AC)                              
LRM003                OR  (BRANCH_CD > :WS-PASSED-BR                            
LRM003                             AND                                          
LRM003                    BRANCH_CD <   :WS-PASSED-TO-BR))                      
                     AND RR_CD LIKE :WS-PASSED-RR                               
LRM003               AND ((RR_CD >=   :WS-PASSED-RR-LO                          
LRM003                AND RR_CD <=   :WS-PASSED-RR-HI)                          
LRM003                 OR RR_CD =  '   ')                                       
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD  >= :WS-PASSED-STAT-FR                        
                      AND STTS_CD  <= :WS-PASSED-STAT-TO)                       
                     AND (STTLM_DT >= :WS-PASSED-SD-FR                          
                      AND STTLM_DT <= :WS-PASSED-SD-TO)                         
                  ORDER BY                                                      
                     CLIENT_NBR                                                 
                    ,BRANCH_CD                                                  
                    ,ACCT_CD                                                    
                    ,ACAT_CONTROL_NBR                                           
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *    HISTORY TFR TBL DECLARE CURSOR STATMENT IN DESCENDING ORDER *        
      *----------------------------------------------------------------*        
           EXEC SQL                                                             
              DECLARE  TFRCSRD CURSOR FOR                                       
                  SELECT                                                        
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,TRANS_TYPE_CD                                              
                    ,RCV_CUST_NM                                                
                    ,RCV_ACCT_TYPE_CD                                           
                    ,STTS_CD                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,RR_CD                                                      
                    ,BRANCH_CD                                                  
                    ,ACCT_RJCT_RSBM_IND                                         
                    ,DAYS_STTS_QTY                                              
                    ,STTLM_DT                                                   
                    ,ACCT_CD                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,CRT_TMSTP                                                  
                  FROM                                                          
                     VTRNHSTY                                                   
                  WHERE                                                         
                     CLIENT_NBR = :WS-PASSED-CLT                                
                     AND NOT (BRANCH_CD < :WS-PASSED-BR)                        
                     AND NOT (ACCT_CD < :WS-PASSED-AC)                          
                     AND RR_CD LIKE :WS-PASSED-RR                               
                     AND TRNFR_TYPE_CD LIKE :WS-PASSED-TFR                      
                     AND DSTBN_SIDE_CD LIKE :WS-PASSED-RD                       
                     AND DLVR_NBR LIKE :WS-PASSED-CBRKR-DEL                     
                     AND RCV_NBR LIKE :WS-PASSED-CBRKR-REC                      
                     AND (STTS_CD  >= :WS-PASSED-STAT-FR                        
                      AND STTS_CD  <= :WS-PASSED-STAT-TO)                       
                     AND (STTLM_DT >= :WS-PASSED-SD-FR                          
                      AND STTLM_DT <= :WS-PASSED-SD-TO)                         
                  ORDER BY                                                      
                     CLIENT_NBR         DESC                                    
                    ,BRANCH_CD          DESC                                    
                    ,ACCT_CD            DESC                                    
                    ,ACAT_CONTROL_NBR   DESC                                    
                 FOR READ ONLY WITH UR                                          
           END-EXEC.                                                            
           EJECT                                                                
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
       COPY ACAT22IO.                                                           
       EJECT                                                                    
      *                                                                         
       PROCEDURE DIVISION.                                                      
           MOVE ACAT22-PASS-FLDS TO WS-PASSED-DATA-AREA.                        
           EXEC SQL                                                             
              SET :WS-TIMESTAMP = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
      *                                                                         
           EVALUATE TRUE                                                        
              WHEN ACAT22-OPN-TFRCSR                                            
                   PERFORM OPEN-TFR-CURSOR                                      
              WHEN ACAT22-FET-TFRCSR                                            
                   PERFORM FETCH-TFR-CURSOR                                     
              WHEN ACAT22-CLO-TFRCSR                                            
                   PERFORM CLOSE-TFR-CURSOR                                     
              WHEN ACAT22-OPN-TFRCSR-D                                          
                   PERFORM OPEN-TFR-CURSOR-D                                    
              WHEN ACAT22-FET-TFRCSR-D                                          
                   PERFORM FETCH-TFR-CURSOR-D                                   
              WHEN ACAT22-CLO-TFRCSR-D                                          
                   PERFORM CLOSE-TFR-CURSOR-D                                   
              WHEN ACAT22-GET-HIST-TRNFR                                        
                   PERFORM GET-HIST-TRANSFER                                    
           END-EVALUATE.                                                        
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN HISTORY TRANSFER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR.                                                         
           IF WS-PASSED-TO-BR < '100'                                           
              MOVE '100' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '110'                                           
ET0001        MOVE '110' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '120'                                           
ET0001        MOVE '120' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '130'                                           
ET0001        MOVE '130' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '140'                                           
ET0001        MOVE '140' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '150'                                           
              MOVE '150' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '160'                                           
ET0001        MOVE '160' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '170'                                           
ET0001        MOVE '170' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '180'                                           
ET0001        MOVE '180' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '190'                                           
ET0001        MOVE '190' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '200'                                           
              MOVE '200' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '210'                                           
ET0001        MOVE '210' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '220'                                           
ET0001        MOVE '220' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '230'                                           
ET0001        MOVE '230' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '240'                                           
ET0001        MOVE '240' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '250'                                           
              MOVE '250' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '260'                                           
ET0001        MOVE '260' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '270'                                           
ET0001        MOVE '270' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '280'                                           
ET0001        MOVE '280' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '290'                                           
ET0001        MOVE '290' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '300'                                           
              MOVE '300' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '310'                                           
ET0001        MOVE '310' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '320'                                           
ET0001        MOVE '320' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '330'                                           
ET0001        MOVE '330' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '340'                                           
ET0001        MOVE '340' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '350'                                           
              MOVE '350' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '360'                                           
ET0001        MOVE '360' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '370'                                           
ET0001        MOVE '370' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '380'                                           
ET0001        MOVE '380' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '390'                                           
ET0001        MOVE '390' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '400'                                           
              MOVE '400' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '410'                                           
ET0001        MOVE '410' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '420'                                           
ET0001        MOVE '420' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '430'                                           
ET0001        MOVE '430' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '440'                                           
ET0001        MOVE '440' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '450'                                           
              MOVE '450' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '460'                                           
ET0001        MOVE '460' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '470'                                           
ET0001        MOVE '470' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '480'                                           
ET0001        MOVE '480' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '490'                                           
ET0001        MOVE '490' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '500'                                           
              MOVE '500' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '506'                                           
ET0001        MOVE '506' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '507'                                           
ET0001        MOVE '507' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '510'                                           
ET0001        MOVE '510' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '520'                                           
ET0001        MOVE '520' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '530'                                           
ET0001        MOVE '530' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '540'                                           
ET0001        MOVE '540' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '550'                                           
              MOVE '550' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '560'                                           
ET0001        MOVE '560' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '570'                                           
ET0001        MOVE '570' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '580'                                           
ET0001        MOVE '580' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '590'                                           
ET0001        MOVE '590' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '600'                                           
              MOVE '600' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '610'                                           
ET0001        MOVE '610' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '620'                                           
ET0001        MOVE '620' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '630'                                           
ET0001        MOVE '630' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '640'                                           
ET0001        MOVE '640' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '650'                                           
              MOVE '650' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '660'                                           
ET0001        MOVE '660' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '670'                                           
ET0001        MOVE '670' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '680'                                           
ET0001        MOVE '680' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '690'                                           
ET0001        MOVE '690' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '700'                                           
              MOVE '700' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '710'                                           
ET0001        MOVE '710' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '720'                                           
ET0001        MOVE '720' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '730'                                           
ET0001        MOVE '730' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '740'                                           
ET0001        MOVE '740' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '750'                                           
              MOVE '750' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '760'                                           
ET0001        MOVE '760' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '770'                                           
ET0001        MOVE '770' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '780'                                           
ET0001        MOVE '780' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '790'                                           
ET0001        MOVE '790' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '800'                                           
              MOVE '800' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '810'                                           
ET0001        MOVE '810' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '820'                                           
ET0001        MOVE '820' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '830'                                           
ET0001        MOVE '830' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '840'                                           
ET0001        MOVE '840' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '850'                                           
              MOVE '850' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '860'                                           
ET0001        MOVE '860' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '870'                                           
ET0001        MOVE '870' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '880'                                           
ET0001        MOVE '880' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '890'                                           
ET0001        MOVE '890' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
           IF WS-PASSED-TO-BR < '900'                                           
              MOVE '900' TO WS-PASSED-TO-BR                                     
           ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '910'                                           
ET0001        MOVE '910' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '920'                                           
ET0001        MOVE '920' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '930'                                           
ET0001        MOVE '930' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '940'                                           
ET0001        MOVE '940' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '950'                                           
ET0001        MOVE '950' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '960'                                           
ET0001        MOVE '960' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '970'                                           
ET0001        MOVE '970' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '980'                                           
ET0001        MOVE '980' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
ET0001     IF WS-PASSED-TO-BR < '990'                                           
ET0001        MOVE '990' TO WS-PASSED-TO-BR                                     
ET0001     ELSE                                                                 
              MOVE HIGH-VALUES TO WS-PASSED-TO-BR                               
           END-IF.                                                              
           MOVE WS-PASSED-TO-BR TO ACAT22-PASS-TO-BR.                           
           EXEC SQL                                                             
              OPEN TFRCSR                                                       
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH HISTORY TRANSFER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR                                                        
              INTO                                                              
                 :CLIENT-NBR                                                    
                ,:ACAT-CONTROL-NBR                                              
                ,:DLVR-NBR                                                      
                ,:ACCT-DLVR-NBR                                                 
                ,:RCV-NBR                                                       
                ,:ACCT-RCV-NBR                                                  
                ,:TRNFR-TYPE-CD                                                 
                ,:TRANS-TYPE-CD                                                 
                ,:RCV-CUST-NM                                                   
                ,:RCV-ACCT-TYPE-CD                                              
                ,:STTS-CD                                                       
                ,:DSTBN-SIDE-CD                                                 
                ,:RR-CD                                                         
                ,:BRANCH-CD                                                     
                ,:ACCT-RJCT-RSBM-IND                                            
                ,:DAYS-STTS-QTY                                                 
                ,:STTLM-DT                                                      
                ,:ACCT-CD                                                       
                ,:STTLM-ASCTD-DT                                                
                ,:CRT-TMSTP                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              IF WS-PASSED-TO-BR NOT = HIGH-VALUES                              
LRM003        AND WS-PASSED-TO-BR NOT > ACAT22-PASS-SECR-BRANCH-HI              
                 PERFORM CLOSE-TFR-CURSOR                                       
                 MOVE WS-PASSED-TO-BR TO WS-PASSED-BR                           
                    PERFORM OPEN-TFR-CURSOR                                     
                    GO TO FETCH-TFR-CURSOR                                      
              END-IF                                                            
              SET ACAT22-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP COMMAREA TRANSFER RETURN DATA                  *          
      *--------------------------------------------------------------*          
       SETUP-TRANSFER-COMMAREA.                                                 
           MOVE CLIENT-NBR         TO ACAT22-TFR-CLT.                           
           MOVE ACAT-CONTROL-NBR   TO ACAT22-TFR-ACAT.                          
           MOVE DLVR-NBR           TO ACAT22-TFR-DLVR-NBR.                      
           MOVE ACCT-DLVR-NBR      TO ACAT22-TFR-DLVR-ACCT.                     
           MOVE RCV-NBR            TO ACAT22-TFR-RCV-NBR.                       
           MOVE ACCT-RCV-NBR       TO ACAT22-TFR-RCV-ACCT.                      
           MOVE TRNFR-TYPE-CD      TO ACAT22-TFR-TFR-TYPE.                      
           MOVE TRANS-TYPE-CD      TO ACAT22-TFR-TRANS-TYPE.                    
           MOVE RCV-CUST-NM        TO ACAT22-TFR-NAME.                          
           MOVE RCV-ACCT-TYPE-CD   TO ACAT22-TFR-ACCT-TYPE.                     
           MOVE STTS-CD            TO ACAT22-TFR-STTS.                          
           MOVE DSTBN-SIDE-CD      TO ACAT22-TFR-DSTBN.                         
           MOVE RR-CD              TO ACAT22-TFR-RR.                            
           MOVE BRANCH-CD          TO ACAT22-TFR-BRANCH.                        
           MOVE ACCT-RJCT-RSBM-IND TO ACAT22-TFR-RJCT-RSBM.                     
           MOVE DAYS-STTS-QTY      TO ACAT22-TFR-DAYS-STTS.                     
           MOVE STTLM-DT           TO ACAT22-TFR-STTLM-DT.                      
           MOVE ACCT-CD            TO ACAT22-TFR-ACCOUNT.                       
           MOVE STTLM-ASCTD-DT     TO ACAT22-TFR-STTL-ASCTD.                    
           MOVE CRT-TMSTP          TO ACAT22-TFR-TMSTP.                         
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE HISTORY TRANSFER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR.                                                        
           EXEC SQL                                                             
              CLOSE TFRCSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       OPEN-TFR-CURSOR-D.                                                       
           EXEC SQL                                                             
              OPEN TFRCSRD                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     FETCH HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       FETCH-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRD                                                       
              INTO                                                              
                 :CLIENT-NBR                                                    
                ,:ACAT-CONTROL-NBR                                              
                ,:DLVR-NBR                                                      
                ,:ACCT-DLVR-NBR                                                 
                ,:RCV-NBR                                                       
                ,:ACCT-RCV-NBR                                                  
                ,:TRNFR-TYPE-CD                                                 
                ,:TRANS-TYPE-CD                                                 
                ,:RCV-CUST-NM                                                   
                ,:RCV-ACCT-TYPE-CD                                              
                ,:STTS-CD                                                       
                ,:DSTBN-SIDE-CD                                                 
                ,:RR-CD                                                         
                ,:BRANCH-CD                                                     
                ,:ACCT-RJCT-RSBM-IND                                            
                ,:DAYS-STTS-QTY                                                 
                ,:STTLM-DT                                                      
                ,:ACCT-CD                                                       
                ,:STTLM-ASCTD-DT                                                
                ,:CRT-TMSTP                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT22-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *     CLOSE HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       CLOSE-TFR-CURSOR-D.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRD                                                     
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         GET HISTORY TRANSFER                                 *          
      *--------------------------------------------------------------*          
       GET-HIST-TRANSFER.                                                       
           EXEC SQL                                                             
              SELECT                                                            
                  CLIENT_NBR                                                    
                 ,ACAT_CONTROL_NBR                                              
                 ,DLVR_NBR                                                      
                 ,ACCT_DLVR_NBR                                                 
                 ,RCV_NBR                                                       
                 ,ACCT_RCV_NBR                                                  
                 ,TRNFR_TYPE_CD                                                 
                 ,TRANS_TYPE_CD                                                 
                 ,RCV_CUST_NM                                                   
                 ,RCV_ACCT_TYPE_CD                                              
                 ,STTS_CD                                                       
                 ,DSTBN_SIDE_CD                                                 
                 ,RR_CD                                                         
                 ,BRANCH_CD                                                     
                 ,ACCT_RJCT_RSBM_IND                                            
                 ,DAYS_STTS_QTY                                                 
                 ,STTLM_DT                                                      
                 ,ACCT_CD                                                       
                 ,STTLM_ASCTD_DT                                                
                 ,CRT_TMSTP                                                     
              INTO                                                              
                 :CLIENT-NBR                                                    
                ,:ACAT-CONTROL-NBR                                              
                ,:DLVR-NBR                                                      
                ,:ACCT-DLVR-NBR                                                 
                ,:RCV-NBR                                                       
                ,:ACCT-RCV-NBR                                                  
                ,:TRNFR-TYPE-CD                                                 
                ,:TRANS-TYPE-CD                                                 
                ,:RCV-CUST-NM                                                   
                ,:RCV-ACCT-TYPE-CD                                              
                ,:STTS-CD                                                       
                ,:DSTBN-SIDE-CD                                                 
                ,:RR-CD                                                         
                ,:BRANCH-CD                                                     
                ,:ACCT-RJCT-RSBM-IND                                            
                ,:DAYS-STTS-QTY                                                 
                ,:STTLM-DT                                                      
                ,:ACCT-CD                                                       
                ,:STTLM-ASCTD-DT                                                
                ,:CRT-TMSTP                                                     
              FROM                                                              
                  VTRNHSTY                                                      
              WHERE                                                             
                  CLIENT_NBR = :WS-PASSED-CLT                                   
                  AND ACAT_CONTROL_NBR = :WS-PASSED-ACAT                        
              WITH UR                                                           
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT22-NORMAL  TO TRUE                                        
              PERFORM SETUP-TRANSFER-COMMAREA                                   
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT22-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              SET ACAT22-ERROR  TO TRUE                                         
              MOVE SQLCODE  TO ACAT22-SQLCODE                                   
              PERFORM 9999-DB2-ERROR.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          ROLLBAKCK                                           *          
      *--------------------------------------------------------------*          
       9000-ROLLBACK.                                                           
           EXEC SQL                                                             
              ROLLBACK                                                          
           END-EXEC.                                                            
      *                                                                         
      *--------------------------------------------------------------*          
      *          WRITE DB2 ERROR LOG                                 *          
      *--------------------------------------------------------------*          
       9999-DB2-ERROR.                                                          
           MOVE SPACE      TO WS-ERR-DATA.                                      
           SET WS-WRITE-ERROR-TO-LOG TO TRUE.                                   
           MOVE EIBTRNID   TO CALLING-TRAN-ID.                                  
           MOVE 'ACAT22DB' TO CALLING-PROGRAM-ID.                               
           MOVE SQLCA      TO SQLCA-AREA.                                       
           EXEC CICS LINK PROGRAM('FPDB2LOG')                                   
                COMMAREA(WS-ERR-DATA)                                           
                LENGTH(LENGTH OF WS-ERR-DATA)                                   
                NOHANDLE                                                        
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
