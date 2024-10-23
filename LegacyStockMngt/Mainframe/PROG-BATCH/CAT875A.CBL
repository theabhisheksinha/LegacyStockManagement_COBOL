000001* PDX    - CAT875A  C0155513 03/12/01 07:58:23 TBDOJUN            00001000
000001* PDX    - CAT875A  C0121552 02/11/99 10:01:27 TBTARYB            00001000
000001* PDX    - CAT875A  C0120355 01/24/99 13:43:25 TBTARYB            00001000
000001* PDX    - CAT875A  C0117593 12/09/98 11:32:07 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT875A.                                                  
                                                                                
       DATE-WRITTEN. OCTOBER 98.                                                
      ******************************************************************        
      *                       REMARKS                                  *        
      ******************************************************************        
      *                     MORNING CYCLE                              *        
      ******************************************************************        
      * THIS PROGRAM IS THE FIRST OF THE THREE PROGRAMS THAT ARE       *        
      * INTENDED TO CREATE FUND/SERV RECORD IN VFNDRGST TABLE.  THIS   *        
      * PROGRAM SELECTS FROM VTRNFR TABLE ALL RECORDS, THAT HAVE :     *        
      *      -  TRANSFER TYPE = 'FUL'                                  *        
      * AND  -  DISTRIBUTION SIDE = 'R' (RECEIVER ONLY)                *        
      * AND  -  STATUS CODE = '200' (REVIEW) OR '210' (REVIEW-ADJUST)  *        
      * AND  -  NUMBER OF DAYS IN THE STATUS = 1.                      *        
      * WHEN A VTRNFR RECORD IS FOUND, A CORRESPONDING RECORD IS       *        
      * SELECTED FROM VASSET TABLE - IT WILL HAVE THE SAME CLIENT      *        
      * NUMBER AND ACAT CONTROL NUMBER AS THE TRNFR RECORD. AFTER THAT *        
      * AN FR-REQUEST RECORD WILL BE ADDED TO THE FR-REQUEST FILE.     *        
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT FR-REQUEST        ASSIGN  TO  FREQUEST.                       
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  FR-REQUEST                                                           
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 310 CHARACTERS.                                      
                                                                                
       01  FR-REQ-REC                       PIC  X(310).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
       77  WS-STREAM-IND                    PIC  X(01).                         
       77  S1                               PIC  9(03)  VALUE ZEROES.           
       77  S2                               PIC  9(03)  VALUE ZEROES.           
       77  FIRST-TIME-SW                    PIC  X(01).                         
           88  FIRST-TIME                               VALUE 'Y'.              
           88  NOT-FIRST-TIME                           VALUE 'N'.              
       77  B1-ACTIVE-SW                     PIC  X(01).                         
           88  B1-ACTIVE                                VALUE 'Y'.              
           88  B1-NOT-ACTIVE                            VALUE 'N'.              
       77  WS-CLIENT-NBR                    PIC  X(04).                         
       77  WS-DATE-TIME                     PIC  X(26).                         
       77  WS-CNTR                          PIC  9(09)  VALUE ZERO.             
       77  WS-RCV-NBR                       PIC  X(04)  VALUE SPACES.           
       77  WS-EOT                           PIC  X      VALUE SPACES.           
       77  WS-END-OF-ASSET                  PIC  X      VALUE SPACES.           
                                                                                
       01  CLIENT-TABLE-CNTR                PIC  9(03)  VALUE 0.                
                                                                                
       01  CLIENT-TABLE-AREA.                                                   
           05  CLIENT-TABLE OCCURS 500 TIMES.                                   
               10  CLIENT-NUM               PIC  9(04)  VALUE ZEROES.           
               10  TI-CNTR          COMP-3  PIC  9(09)  VALUE ZEROES.           
               10  AT-CNTR          COMP-3  PIC  9(09)  VALUE ZEROES.           
                                                                                
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN         COMP  PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN            COMP  PIC S9(09)  VALUE +80.              
                                                                                
           EJECT                                                                
           COPY CATFRR.                                                         
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
           COPY ZCATB1 REPLACING ==:ZCATB1:==  BY  ==ZCATB1==.                  
                                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE VASSET                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              DECLARE TI_CRSR CURSOR FOR                                        
                 SELECT   CLIENT_NBR                                            
                         ,ACAT_CONTROL_NBR                                      
                         ,ACCT_RCV_NBR                                          
                         ,RCV_CUST_NM                                           
                         ,DLVR_NBR                                              
                         ,TRNFR_TYPE_CD                                         
                         ,RCV_NBR                                               
                 FROM     VTRNFR                                                
                 WHERE    CLIENT_NBR    = :WS-CLIENT-NBR  AND                   
                          DSTBN_SIDE_CD =  'R'            AND                   
                          STTS_CD      IN ('200', '210')  AND                   
                          TRNFR_TYPE_CD =  'FUL'          AND                   
                          DAYS_STTS_QTY =   1                                   
                 ORDER BY ACAT_CONTROL_NBR                                      
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              DECLARE AT_CRSR CURSOR FOR                                        
                 SELECT   ASSET_AMT                                             
                         ,ASSET_DESC_TXT                                        
                         ,ASSET_QTY                                             
                         ,ASSET_SEQ_NBR                                         
                         ,CSH_MGN_SHRT_CD                                       
                         ,ISIN_SEC_ISSUE_CD                                     
                         ,ISIN_CNTRY_CD                                         
                         ,ISIN_SEC_CDG_CD                                       
                         ,ISO_CRNCY_CD                                          
                         ,NSCC_NON_ADP_IND                                      
                         ,SECURITY_ADP_NBR                                      
                         ,SYS_RJCT_RSN_CD                                       
                         ,TRNFR_TYPE_CD                                         
                 FROM     VASSET                                                
                 WHERE    CLIENT_NBR       = :FRR-CLIENT-NBR       AND          
                          ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR AND          
                          STTLM_LCTN_CD    = '10'                               
                 ORDER BY ASSET_SEQ_NBR                                         
           END-EXEC.                                                            
                                                                                
      /                                                                         
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CODE                PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
      ***<---COBOL LE                                                 '.        
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(04)  COMP.                   
           05  LS-STREAM-IND                PIC  X(01).                         
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ******************************************************************        
                                                                                
            COPY MSGCOBO.                                                       
                                                                                
            PERFORM INITIAL-ROUTINE.                                            
                                                                                
            PERFORM BUILD-CLIENT-TABLE.                                         
                                                                                
            PERFORM VARYING S1 FROM 1 BY 1                                      
               UNTIL S1 > CLIENT-TABLE-CNTR                                     
               MOVE CLIENT-NUM (S1)         TO  WS-CLIENT-NBR                   
               PERFORM OPEN-VTRNFR                                              
               PERFORM PROCESS-VTRNFR                                           
               PERFORM CLOSE-VTRNFR                                             
            END-PERFORM.                                                        
                                                                                
            PERFORM EOJ-ROUTINE.                                                
                                                                                
            GOBACK.                                                             
                                                                                
           EJECT                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
                                                BH-ACAT-INFO                    
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER                
              MOVE '015'                    TO  BH-LOGICAL-RECORD-CODE          
              MOVE '434500'                 TO  BH-B2-INFO-ID                   
              CALL  GETB1V               USING  BH-BROKER-HEADER-INFO           
                                                BH-ACAT-INFO                    
              IF BH-BROKER-ACTIVE AND                                           
                 BH-ACAT-ACTIVE   AND                                           
                 BH-ACAT-FUND-REGISTRATION = '1'                                
                 IF BH-BROKER-MINI-MAXI-SUBGROUP NOT = SPACES                   
                    MOVE BH-BROKER-MINI-MAXI-SUBGROUP                           
                                            TO  WS-STREAM-IND                   
                 ELSE                                                           
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                          
                                            TO  WS-STREAM-IND                   
                 END-IF                                                         
                 IF LS-STREAM-IND  = WS-STREAM-IND                              
                    ADD 1                   TO  S1                              
                    MOVE B1-SUB             TO  CLIENT-NUM (S1)                 
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF S1 = 0                                                            
              DISPLAY ' '                                                       
              DISPLAY '****************************************'                
              DISPLAY '* THERE ARE NOT ACAT ACTIVE CLIENTS ON *'                
              DISPLAY '* THIS STREAM: ' LS-STREAM-IND                           
                      '                       *'                                
              DISPLAY '****************************************'                
           ELSE                                                                 
              MOVE S1                       TO  CLIENT-TABLE-CNTR               
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PROCESS-VTRNFR.                                                          
      ****************                                                          
                                                                                
                                                                                
      *    PERFORM UNTIL WS-EOT = 'Y'                                           
                                                                                
           PERFORM FETCH-VTRNFR.                                                
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    ADD 1                   TO  TI-CNTR (S1)                    
                                                WS-CNTR                         
                    PERFORM OPEN-VASSET                                         
                    PERFORM PROCESS-VASSET                                      
                    PERFORM CLOSE-VASSET                                        
                 WHEN +100                                                      
                    CONTINUE                                                    
      *             MOVE 'Y'   TO WS-EOT                                        
                 WHEN OTHER                                                     
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '****************************'                      
                    DISPLAY '* BAD FETCH FROM TI CURSOR *'                      
                    DISPLAY '****************************'                      
                    PERFORM ABEND-ROUTINE                                       
                                                                                
              END-EVALUATE                                                      
              IF SQLCODE = +0                                                   
                 PERFORM FETCH-VTRNFR                                           
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *************                                                             
       OPEN-VTRNFR.                                                             
      *************                                                             
                                                                                
           EXEC SQL                                                             
              OPEN TI_CRSR                                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '*************************'                               
              DISPLAY '* BAD OPEN OF TI CURSOR *'                               
              DISPLAY '*************************'                               
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       FETCH-VTRNFR.                                                            
      **************                                                            
                                                                                
           INITIALIZE FRR-RECORD.                                               
                                                                                
           EXEC SQL                                                             
              FETCH TI_CRSR                                                     
                 INTO  :FRR-CLIENT-NBR                                          
                      ,:FRR-ACAT-CONTROL-NBR                                    
                      ,:FRR-ACCT-RCV-NBR                                        
                      ,:FRR-RCV-CUST-NM                                         
                      ,:FRR-DLVR-NBR                                            
                      ,:FRR-TRNFR-TYPE-CD                                       
                      ,:WS-RCV-NBR                                              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    FETCH TI_CRSR                                               
                       INTO  :FRR-CLIENT-NBR                                    
                            ,:FRR-ACAT-CONTROL-NBR                              
                            ,:FRR-ACCT-RCV-NBR                                  
                            ,:FRR-RCV-CUST-NM                                   
                            ,:FRR-DLVR-NBR                                      
                            ,:FRR-TRNFR-TYPE-CD                                 
                            ,:WS-RCV-NBR                                        
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0 OR +100                                              
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD FETCH IN TI CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       CLOSE-VTRNFR.                                                            
      **************                                                            
                                                                                
           EXEC SQL                                                             
              CLOSE TI_CRSR                                                     
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD CLOSE OF TI CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PROCESS-VASSET.                                                          
      ****************                                                          
      *    MOVE ' '     TO WS-END-OF-ASSET                                      
      *    PERFORM UNTIL WS-END-OF-ASSET = 'Y'                                  
                                                                                
           PERFORM FETCH-VASSET.                                                
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    IF FRR-TRNFR-TYPE-CD = ('FUL' OR 'PTD' OR                   
                                            'CRD' OR 'RCR')                     
                       MOVE WS-RCV-NBR      TO  FRR-SBMTG-PRTCP-NBR             
                    ELSE                                                        
                       IF FRR-TRNFR-TYPE-CD = 'RCL'                             
                          MOVE FRR-DLVR-NBR TO  FRR-SBMTG-PRTCP-NBR             
                       ELSE                                                     
                          MOVE SPACES       TO  FRR-SBMTG-PRTCP-NBR             
                       END-IF                                                   
                    END-IF                                                      
                    ADD 1                   TO  AT-CNTR (S1)                    
                    WRITE FR-REQ-REC   FROM  FRR-RECORD                         
                 WHEN +100                                                      
                    CONTINUE                                                    
      *             MOVE 'Y'     TO WS-END-OF-ASSET                             
                 WHEN OTHER                                                     
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '****************************'                      
                    DISPLAY '* BAD FETCH FROM AT CURSOR *'                      
                    DISPLAY '****************************'                      
                    PERFORM ABEND-ROUTINE                                       
              END-EVALUATE                                                      
              IF SQLCODE = +0                                                   
                 PERFORM FETCH-VASSET                                           
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *************                                                             
       OPEN-VASSET.                                                             
      *************                                                             
                                                                                
           EXEC SQL                                                             
              OPEN AT_CRSR                                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '*************************'                               
              DISPLAY '* BAD OPEN OF AT CURSOR *'                               
              DISPLAY '*************************'                               
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       FETCH-VASSET.                                                            
      **************                                                            
                                                                                
           EXEC SQL                                                             
              FETCH AT_CRSR                                                     
              INTO  :FRR-ASSET-AMT                                              
                   ,:FRR-ASSET-DESC-TXT                                         
                   ,:FRR-ASSET-QTY                                              
                   ,:FRR-ASSET-SEQ-NBR                                          
                   ,:FRR-CSH-MGN-SHRT-CD                                        
                   ,:FRR-ISIN-SEC-ISSUE-CD                                      
                   ,:FRR-ISIN-CNTRY-CD                                          
                   ,:FRR-ISIN-SEC-CDG-CD                                        
                   ,:FRR-ISO-CRNCY-CD                                           
                   ,:FRR-NSCC-NON-ADP-IND                                       
                   ,:FRR-SECURITY-ADP-NBR                                       
                   ,:FRR-SYS-RJCT-RSN-CD                                        
                   ,:FRR-TRNFR-TYPE-CD                                          
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    FETCH AT_CRSR                                               
                    INTO  :FRR-ASSET-AMT                                        
                         ,:FRR-ASSET-DESC-TXT                                   
                         ,:FRR-ASSET-QTY                                        
                         ,:FRR-ASSET-SEQ-NBR                                    
                         ,:FRR-CSH-MGN-SHRT-CD                                  
                         ,:FRR-ISIN-SEC-ISSUE-CD                                
                         ,:FRR-ISIN-CNTRY-CD                                    
                         ,:FRR-ISIN-SEC-CDG-CD                                  
                         ,:FRR-ISO-CRNCY-CD                                     
                         ,:FRR-NSCC-NON-ADP-IND                                 
                         ,:FRR-SECURITY-ADP-NBR                                 
                         ,:FRR-SYS-RJCT-RSN-CD                                  
                         ,:FRR-TRNFR-TYPE-CD                                    
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0 OR +100                                              
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD FETCH IN AT CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       CLOSE-VASSET.                                                            
      **************                                                            
                                                                                
           EXEC SQL                                                             
              CLOSE AT_CRSR                                                     
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD CLOSE OF AT CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ***************                                                           
       ABEND-ROUTINE.                                                           
      ***************                                                           
                                                                                
           DISPLAY 'ATTENTION!   PROGRAM IS ABENDING!'.                         
           CALL ABEND                    USING  ABEND-CODE.                     
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           OPEN OUTPUT FR-REQUEST.                                              
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           DISPLAY '************************'                                   
           DISPLAY '* PROCESSING STREAM: ' LS-STREAM-IND ' *'                   
           DISPLAY '************************'                                   
           DISPLAY 'DATE AND TIME: ' WS-DATE-TIME.                              
                                                                                
           MOVE 'DATE='                     TO  FRR-DATE-LIT.                   
           MOVE WS-DATE-TIME                TO  FRR-DATE-TIME.                  
                                                                                
           WRITE FR-REQ-REC               FROM  FRR-HEADER.                     
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE FR-REQUEST.                                                    
                                                                                
           IF WS-CNTR = 0                                                       
              DISPLAY '***********************************'                     
              DISPLAY '* NO FUND/SERV ACTIVITY FOR TODAY *'                     
              DISPLAY '***********************************'                     
           ELSE                                                                 
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > CLIENT-TABLE-CNTR                                   
                 DISPLAY ' '                                                    
                 DISPLAY '                      TOTALS FOR CLIENT '             
                         CLIENT-NUM (S1)                                        
                 DISPLAY '                      ----------------------'         
                 DISPLAY 'NUMBER OF TI FETCHES: ' TI-CNTR (S1)                  
                 DISPLAY 'NUMBER OF AT FETCHES: ' AT-CNTR (S1)                  
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************************'.                     
           DISPLAY '* CAT875A: COMPLETION IS SUCCESSFUL *'.                     
           DISPLAY '*************************************'.                     
                                                                                
