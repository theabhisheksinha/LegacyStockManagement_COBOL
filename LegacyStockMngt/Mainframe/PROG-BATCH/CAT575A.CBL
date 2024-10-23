000001* PDX    - CAT575A  C0351499 02/12/14 11:53:11 TBLAMUR            00001000
000001* LRM006 - SSR 99826 IGNORE REJECTS ON ACTITRF WHEN ASCENDIS              
000001*   CLIENT AND IT WAS FORWARDED TO THEM.                                  
000001* PDX    - CAT575A  C0272583 12/08/08 15:13:29 TBDOJUN            00001000
000001* DJ0001 SSR 61164 POSITION TRANSFER FUND(PTF)                            
000001* PDX    - CAT575A  C0222024 09/06/05 09:45:17 TBLAMUR            00001000
000001* LRM005 - SSR 39440 CREATE F/R INTRA-DAY FOR FUL RECEIVES,               
000001*       OBTAINED FROM CAT511.ACATTRNS.                                    
000001* PDX    - CAT575A  C0215263 02/15/05 14:22:07 TBLAMUR            00001000
000001* LRM004 - SSR 40042 REPLACE DB2 INIT TBL WITH ACTI*** NEW KEYS.          
000001* LRM004 - REMOVE DATE CHECK                                              
000001* PDX    - CAT575A  C0214363 01/14/05 09:54:53 TBLAMUR            00001000
000001* LRM003 SSR 00039556 - BUILD F/R NON FULL RCVR INTRA-DAY (HOLD)          
000001* PDX    - CAT575A  C0205615 07/26/04 12:38:37 TBLAMUR            00001000
000001* LRM002 SSR 00032030 - BUILD F/R ON FULL RCVR ACCEL INTRA-DAY            
000001* PDX    - CAT575A  C0203025 03/11/04 15:25:59 TBLAMUR            00001000
000001* LRM001 SSR 00031496 - BUILD F/R FOR RCVR SIDE NON MEMO PTR      00001000
000001* PDX    - CAT575A  C0157686 04/20/01 14:03:19 TBLAMUR            00001000
000001* PDX    - CAT575A  C0123119 03/16/99 10:09:55 TBTIKUO            00001000
000001* PDX    - CAT575A  C0121552 02/12/99 14:23:24 TBTARYB            00001000
000001* PDX    - CAT575A  C0120355 01/24/99 13:44:41 TBTARYB            00001000
000001* PDX    - CAT575A  C0120194 01/21/99 09:18:35 TBYOHON            00001000
000001* PDX    - CAT575A  C0118641 01/08/99 08:55:34 TBTARYB            00001000
000001* PDX    - CAT575A  C0119343 12/16/98 09:13:14 TBTARYB            00001000
000001* PDX    - CAT575A  C0117593 12/09/98 11:12:14 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT575A.                                                  
                                                                                
       DATE-WRITTEN. OCTOBER 98.                                                
      ******************************************************************        
      *                       REMARKS                                  *        
      * TCK 03/99 - ADD PROCESS FOR ACCELERATED INITIAL TRANSFER AND   *        
      *             ASSET, MF RECORDS                                  *        
      ******************************************************************        
      *                      DAY CYCLE                                 *        
      ******************************************************************        
      * THIS PROGRAM IS THE FIRST OF THE THREE PROGRAMS THAT ARE       *        
      * INTENDED TO CREATE FUND/SERV RECORD IN VFNDRGST TABLE.  THIS   *        
      * PROGRAM SELECTS FROM VTRNFR TABLE ALL RECORDS, THAT HAVE :     *        
      *      -  TRANSFER TYPE NOT 'FUL' OR (NOT 'PTR' MEMO)            *        
      * AND  -  DISTRIBUTION SIDE = 'R' (RECEIVER ONLY).               *        
      * FOR EACH SELECTED RECORD ACTITRF IS CHECKED: TRANSACTION TYPE *         
      * SHOULD NOT BE 'R' (REJECT).                                    *        
      * WHEN A VTRNFR RECORD SATISFIES ALL REQUIREMENTS, A RECORD IS   *        
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
                                                                                
LRM002     SELECT INFILE           ASSIGN   TO  INFILE.                         
           SELECT FR-REQUEST        ASSIGN  TO  FREQUEST.                       
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
LRM002 FD  INFILE                                                               
LRM002     RECORDING MODE IS V                                                  
LRM002     RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
LRM002        DEPENDING ON W-REC-LEN-IN                                         
LRM002     BLOCK CONTAINS 0 RECORDS.                                            
LRM002                                                                          
LRM002     COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.                
LRM002/                                                                         
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
                                                                                
       77  ABEND-CODE                 COMP  PIC S9(04)  VALUE +9999.            
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
       77  WS-STREAM-IND                    PIC  X(01)  VALUE SPACES.           
       77  S1                               PIC  9(03)  VALUE ZEROES.           
       77  S2                               PIC  9(03)  VALUE ZEROES.           
       77  WS-CLIENT-NBR                    PIC  X(04).                         
       77  WS-RCV-NBR                       PIC  X(04).                         
       77  WS-ACCT-DLVR-NBR                 PIC  X(20).                         
       77  WS-TRANS-TYPE-CD                 PIC  X(01).                         
       77  WS-STTS-CD                       PIC  X(03)  VALUE SPACES.           
       77  WS-DATE-TIME                     PIC  X(26).                         
       77  WS-CNTR                  COMP-3  PIC  9(09)  VALUE ZEROES.           
TCK    77  WS-IT-SQLCODE                    PIC  S9(9) COMP-4.                  
       77  STOP-OK-SW                       PIC  X(01).                         
           88  STOP-OK                                  VALUE 'Y'.              
           88  STOP-NOT-OK                              VALUE 'N'.              
       77  LOOP-CNTR                        PIC  9(02)  VALUE ZEROES.           
LRM003 77  ACAT-DATE-JUL                    PIC X(07)  VALUE ' '.               
       01  W-INFILE-AREA.                                                       
           05  W-REC-LEN-IN                 PIC  9(005) VALUE 0.                
           05  W-INFILE-EOF-SW              PIC  X      VALUE 'N'.              
               88  INFILE-EOF                           VALUE 'Y'.              
           05  W-INFILE-RECS-READ           PIC 9(07) COMP-3 VALUE 0.           
           COPY STUBCPY.                                                        
       01  CLIENT-TABLE-CNTR                PIC  9(03)  VALUE 0.                
                                                                                
       01  CLIENT-TABLE-AREA.                                                   
           05  CLIENT-TABLE OCCURS 500 TIMES.                                   
               10  CLIENT-NUM               PIC  9(04)  VALUE ZEROES.           
LRM006         10  WS-ASCENDIS-USER         PIC  X.                             
               10  TI-CNTR          COMP-3  PIC  9(09)  VALUE ZEROES.           
               10  AT-CNTR          COMP-3  PIC  9(09)  VALUE ZEROES.           
TCK            10  IT-CNTR          COMP-3  PIC  9(09)  VALUE ZEROES.           
                                                                                
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
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
                                                                                
LRM002     COPY BPDATESC.                                                       
                                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE VASSET                                                    
           END-EXEC.                                                            
                                                                                
LRM002     EXEC SQL                                                             
LRM002        INCLUDE VFNDRGST                                                  
LRM002     END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              DECLARE TI_CRSR CURSOR FOR                                        
                 SELECT   CLIENT_NBR                                            
                         ,ACAT_CONTROL_NBR                                      
                         ,RCV_NBR                                               
                         ,ACCT_RCV_NBR                                          
                         ,RCV_CUST_NM                                           
                         ,DLVR_NBR                                              
                         ,ACCT_DLVR_NBR                                         
                         ,TRNFR_TYPE_CD                                         
                         ,STTS_CD                                               
                 FROM  VTRNFR                                                   
                 WHERE CLIENT_NBR    = :WS-CLIENT-NBR                AND        
                       DSTBN_SIDE_CD =  'R'                          AND        
DJ0001             (TRNFR_TYPE_CD IN ('PTD', 'PTR', 'RCR', 'CRD', 'PTF')        
                              AND            STTS_CD < '300')                   
LRM002******                        OR                                          
LRM002******             (TRNFR_TYPE_CD = 'FUL'                                 
LRM002******                  AND      STTS_CD = '230')         )               
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
TCK **************                                                              
           EXEC SQL                                                             
              DECLARE IT_CRSR CURSOR FOR                                        
                 SELECT   CLIENT_NBR                                            
                         ,ACAT_CONTROL_NBR                                      
                         ,RCV_NBR                                               
                         ,ACCT_RCV_NBR                                          
                         ,RCV_CUST_NM                                           
                         ,DLVR_NBR                                              
                         ,ACCT_DLVR_NBR                                         
                         ,TRNFR_TYPE_CD                                         
                         ,STTS_CD                                               
                 FROM  ACTITRF                                                  
                 WHERE CLIENT_NBR    = :WS-CLIENT-NBR      AND                  
                       DSTBN_SIDE_CD =  'R'                AND                  
                       TRNFR_TYPE_CD = 'FUL'               AND                  
                       TRANS_TYPE_CD = 'X'                                      
                 ORDER BY ACAT_CONTROL_NBR                                      
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(04)  COMP.                   
           05  LS-STREAM-IND                PIC  X(01).                         
LRM002     05  FILLER                       PIC  X(01).                         
LRM002     05  LS-PARM-RUN-INDICATOR        PIC  X(02).                         
LRM002         88  PARM-INTRA-DAY-RUN                  VALUE 'ID'.              
                                                                                
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
LRM002         IF PARM-LENGTH > 3                                               
LRM002         AND PARM-INTRA-DAY-RUN                                           
LRM002            PERFORM PROCESS-INTRA-DAY-FEED                                
LRM002              UNTIL INFILE-EOF OR                                         
LRM002                 INFILE-KEY-CLIENT-NBR > WS-CLIENT-NBR                    
LRM002         ELSE                                                             
                  PERFORM OPEN-VTRNFR                                           
                  PERFORM PROCESS-VTRNFR                                        
                  PERFORM CLOSE-VTRNFR                                          
TCK               PERFORM OPEN-ACTITRF                                          
TCK               PERFORM PROCESS-ACTITRF                                       
TCK               PERFORM CLOSE-ACTITRF                                         
LRM002         END-IF                                                           
            END-PERFORM.                                                        
                                                                                
            PERFORM EOJ-ROUTINE.                                                
                                                                                
            GOBACK.                                                             
LRM002 PROCESS-INTRA-DAY-FEED.                                                  
LRM002     ADD 1 TO W-INFILE-RECS-READ.                                         
LRM005*---------------------------------------------------------------          
LRM005*** DON'T BUILD F/R FOR 230 STATUS... ALREADY DONE IN REVIEW.             
LRM005*---------------------------------------------------------------          
LRM002***  IF  INFILE-KEY-CLIENT-NBR = WS-CLIENT-NBR                            
LRM002***  AND INFILE-S-RECEIVER                                                
LRM002***  AND INFILE-REVIEW-ACCEL                                              
LRM002***  AND INFILE-TRANSFER-OUTPUT                                           
LRM002***  AND INFILE-KEY-REC-TYPE-IS-TI                                        
LRM002***      MOVE INFILE-KEY-CLIENT-NBR   TO FRR-CLIENT-NBR                   
LRM002***      MOVE INFILE-KEY-ACAT-CTL-NBR TO FRR-ACAT-CONTROL-NBR             
LRM002***      PERFORM READ-VFNDRGST-RTN                                        
LRM002***      IF SQLCODE = +100                                                
LRM002***         PERFORM READ-VTRNFR-DIRECT                                    
LRM002***         IF SQLCODE = +0                                               
LRM002***            PERFORM OPEN-VASSET                                        
LRM002***            PERFORM PROCESS-VASSET                                     
LRM002***            PERFORM CLOSE-VASSET                                       
LRM002***         END-IF                                                        
LRM002***      END-IF                                                           
LRM002***      MOVE +0 TO SQLCODE                                               
LRM002***  END-IF.                                                              
LRM002                                                                          
LRM003     IF  INFILE-KEY-CLIENT-NBR = WS-CLIENT-NBR                            
LRM003     AND INFILE-S-RECEIVER                                                
LRM003     AND INFILE-ASSET-OUTPUT                                              
LRM003     AND INFILE-KEY-REC-TYPE-IS-AT                                        
LRM003     AND INFILE-REVIEW                                                    
LRM003     AND (INFILE-KEY-TFR-TYPE = 'PTR' OR 'PTD' OR 'RCR'                   
DJ0001                    OR 'PTF' OR 'FUL')                                    
LRM003     AND INFILE-AT-FUND-SERV                                              
LRM003         MOVE INFILE-KEY-CLIENT-NBR   TO FRR-CLIENT-NBR                   
LRM003         MOVE INFILE-KEY-ACAT-CTL-NBR TO FRR-ACAT-CONTROL-NBR             
LRM003         MOVE INFILE-AT-ASSET-SEQ-NBR TO FRR-ASSET-SEQ-NBR                
LRM003         PERFORM READ-VFNDRGST-DIRECT-RTN                                 
LRM003         IF SQLCODE = +100                                                
LRM003            PERFORM READ-VTRNFR-DIRECT                                    
LRM003            IF SQLCODE = +0                                               
LRM003               PERFORM READ-ASSET-DIRECT                                  
LRM003               IF SQLCODE = +0                                            
LRM003                  DISPLAY 'BUILD F/R INTRA DAY '                          
LRM003                      ' '   INFILE-KEY-CLIENT-NBR                         
LRM003                      ' '   INFILE-KEY-ACAT-CTL-NBR                       
LRM003                      ' '   INFILE-AT-ASSET-SEQ-NBR                       
LRM003                      ' '   INFILE-KEY-TFR-TYPE                           
LRM003                  MOVE WS-RCV-NBR      TO  FRR-SBMTG-PRTCP-NBR            
LRM003                  ADD 1                TO  AT-CNTR (S1)                   
LRM003                  WRITE FR-REQ-REC      FROM  FRR-RECORD                  
LRM003               END-IF                                                     
LRM003            END-IF                                                        
LRM003         END-IF                                                           
LRM003         MOVE +0 TO SQLCODE                                               
LRM003     END-IF.                                                              
LRM002                                                                          
LRM002     READ INFILE                                                          
LRM002        AT END SET INFILE-EOF TO TRUE                                     
LRM002     END-READ.                                                            
                                                                                
LRM002 READ-VFNDRGST-RTN.                                                       
LRM002     EXEC SQL SELECT                                                      
LRM002                    CLIENT_NBR                                            
LRM002        INTO  :DCLVFNDRGST.CLIENT-NBR                                     
LRM002           FROM  VFNDRGST                                                 
LRM002           WHERE    CLIENT_NBR       = :FRR-CLIENT-NBR       AND          
LRM002                    ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR              
LRM002        END-EXEC.                                                         
LRM002        DISPLAY 'VFNFRGST SELECT RC = '  SQLCODE                          
LRM002           ' FOR ' FRR-CLIENT-NBR ' ' FRR-ACAT-CONTROL-NBR                
LRM002        EVALUATE SQLCODE                                                  
LRM002           WHEN +0                                                        
LRM002              CONTINUE                                                    
LRM002           WHEN -811                                                      
LRM002              CONTINUE                                                    
LRM002           WHEN +100                                                      
LRM002              CONTINUE                                                    
LRM002           WHEN OTHER                                                     
LRM002              PERFORM DB2-ERROR-ROUTINE                                   
LRM002              DISPLAY '*************************'                         
LRM002              DISPLAY '* BAD SELECT ON VFNDRGST*'                         
LRM002              DISPLAY '*************************'                         
LRM002              PERFORM ABEND-ROUTINE                                       
LRM002        END-EVALUATE.                                                     
                                                                                
LRM003 READ-VFNDRGST-DIRECT-RTN.                                                
LRM003     EXEC SQL SELECT                                                      
LRM003                    CLIENT_NBR                                            
LRM003        INTO  :DCLVFNDRGST.CLIENT-NBR                                     
LRM003           FROM  VFNDRGST                                                 
LRM003           WHERE    CLIENT_NBR       = :FRR-CLIENT-NBR       AND          
LRM003                    ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR AND          
LRM003                    ASSET_SEQ_NBR    = :FRR-ASSET-SEQ-NBR                 
LRM003        END-EXEC.                                                         
LRM003        DISPLAY 'VFNFRGST SELECT RC = '  SQLCODE                          
LRM003           ' FOR ' FRR-CLIENT-NBR ' ' FRR-ACAT-CONTROL-NBR                
LRM003        EVALUATE SQLCODE                                                  
LRM003           WHEN +0                                                        
LRM003              CONTINUE                                                    
LRM003           WHEN -811                                                      
LRM003              CONTINUE                                                    
LRM003           WHEN +100                                                      
LRM003              CONTINUE                                                    
LRM003           WHEN OTHER                                                     
LRM003              PERFORM DB2-ERROR-ROUTINE                                   
LRM003              DISPLAY '*************************'                         
LRM003              DISPLAY '* BAD SELECT ON VFNDRGST*'                         
LRM003              DISPLAY '*************************'                         
LRM003              PERFORM ABEND-ROUTINE                                       
LRM003        END-EVALUATE.                                                     
                                                                                
LRM002 READ-VTRNFR-DIRECT.                                                      
LRM002     EXEC SQL SELECT                                                      
LRM002                    CLIENT_NBR                                            
LRM002                   ,ACAT_CONTROL_NBR                                      
LRM002                   ,RCV_NBR                                               
LRM002                   ,ACCT_RCV_NBR                                          
LRM002                   ,RCV_CUST_NM                                           
LRM002                   ,DLVR_NBR                                              
LRM002                   ,ACCT_DLVR_NBR                                         
LRM002                   ,TRNFR_TYPE_CD                                         
LRM002                   ,STTS_CD                                               
LRM002        INTO  :FRR-CLIENT-NBR                                             
LRM002             ,:FRR-ACAT-CONTROL-NBR                                       
LRM002             ,:WS-RCV-NBR                                                 
LRM002             ,:FRR-ACCT-RCV-NBR                                           
LRM002             ,:FRR-RCV-CUST-NM                                            
LRM002             ,:FRR-DLVR-NBR                                               
LRM002             ,:WS-ACCT-DLVR-NBR                                           
LRM002             ,:FRR-TRNFR-TYPE-CD                                          
LRM002             ,:WS-STTS-CD                                                 
LRM002           FROM  VTRNFR                                                   
LRM002           WHERE    CLIENT_NBR       = :FRR-CLIENT-NBR       AND          
LRM002                    ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR              
LRM002        END-EXEC.                                                         
LRM002        EVALUATE SQLCODE                                                  
LRM002           WHEN +0                                                        
LRM002              CONTINUE                                                    
LRM002           WHEN +100                                                      
LRM002              CONTINUE                                                    
LRM002           WHEN OTHER                                                     
LRM002              PERFORM DB2-ERROR-ROUTINE                                   
LRM002              DISPLAY '*************************'                         
LRM002              DISPLAY '* BAD SELECT ON VTRNFR  *'                         
LRM002              DISPLAY '*************************'                         
LRM002              PERFORM ABEND-ROUTINE                                       
LRM002        END-EVALUATE.                                                     
           EJECT                                                                
LRM003 READ-ASSET-DIRECT.                                                       
           EXEC SQL                                                             
              SELECT      ASSET_AMT                                             
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
                 FROM     VASSET                                                
                 WHERE    CLIENT_NBR       = :FRR-CLIENT-NBR       AND          
                          ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR AND          
                          ASSET_SEQ_NBR    = :FRR-ASSET-SEQ-NBR                 
           END-EXEC.                                                            
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
LRM006              MOVE BH-ACAT-ASCENDIS-USER                                  
LRM006                                      TO WS-ASCENDIS-USER (S1)            
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF S1 = 0                                                            
              DISPLAY ' '                                                       
              DISPLAY '***************************************'                 
              DISPLAY '* THERE ARE NO ACAT ACTIVE CLIENTS ON *'                 
              DISPLAY '* THIS STREAM: ' LS-STREAM-IND                           
                      '                       *'                                
              DISPLAY '***************************************'                 
           ELSE                                                                 
              MOVE S1                       TO  CLIENT-TABLE-CNTR               
              DISPLAY ' '                                                       
              DISPLAY '***************************'                             
              DISPLAY '* CLIENT-TABLE-CNTR = ' CLIENT-TABLE-CNTR ' *'           
              DISPLAY '***************************'                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PROCESS-VTRNFR.                                                          
      ****************                                                          
                                                                                
           PERFORM FETCH-VTRNFR.                                                
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
LRM004***     IF FRR-ACAT-CONTROL-NBR (1 : 7) = ACAT-DATE-JUL                   
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    EVALUATE TRUE                                               
                      WHEN FRR-TRNFR-TYPE-CD = 'PTD' AND                        
                           WS-STTS-CD > 300                                     
                          CONTINUE                                              
LRM001                WHEN FRR-TRNFR-TYPE-CD = 'PTR' AND                        
LRM001                     WS-STTS-CD > 300                                     
LRM001                    CONTINUE                                              
DJ0001                WHEN FRR-TRNFR-TYPE-CD = 'PTF' AND                        
DJ0001                     WS-STTS-CD > 300                                     
DJ0001                    CONTINUE                                              
                       WHEN FRR-TRNFR-TYPE-CD = 'FUL' AND                       
LRM005                       WS-STTS-CD = 230                                   
LRM005****                   WS-STTS-CD NOT = 230                               
                          CONTINUE                                              
                       WHEN OTHER                                               
                          PERFORM SELECT-ACTITRF                                
                          IF WS-TRANS-TYPE-CD NOT = 'R'                         
LRM006                    OR (WS-TRANS-TYPE-CD = 'R'                            
LRM006                    AND WS-ASCENDIS-USER (S1) > '0'                       
LRM006                    AND PRGM-NM OF DCLACTITRF = 'CAT500A'                 
LRM006                    AND NSCC-PEND-CD OF DCLACTITRF = 'Y')                 
                             ADD 1             TO  TI-CNTR (S1)                 
                                                   WS-CNTR                      
                             PERFORM OPEN-VASSET                                
                             PERFORM PROCESS-VASSET                             
                             PERFORM CLOSE-VASSET                               
                          END-IF                                                
DJ                        MOVE +0 TO SQLCODE                                    
                    END-EVALUATE                                                
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN OTHER                                                     
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '****************************'                      
                    DISPLAY '* BAD FETCH FROM TI CURSOR *'                      
                    DISPLAY '****************************'                      
                    PERFORM ABEND-ROUTINE                                       
              END-EVALUATE                                                      
LRM004***     END-IF                                                            
              IF SQLCODE = +0                                                   
                 PERFORM FETCH-VTRNFR                                           
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *************                                                             
       OPEN-VTRNFR.                                                             
      *************                                                             
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
           MOVE 1                           TO  LOOP-CNTR.                      
           PERFORM UNTIL STOP-OK                                                
              EXEC SQL                                                          
                 OPEN TI_CRSR                                                   
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    SET STOP-OK             TO  TRUE                            
                 WHEN -911                                                      
                    IF LOOP-CNTR > 10                                           
                       SET STOP-OK          TO  TRUE                            
                       PERFORM DB2-ERROR-ROUTINE                                
                       DISPLAY '*************************'                      
                       DISPLAY '* BAD OPEN OF TI CURSOR *'                      
                       DISPLAY '* CANNOT RESOLVE -911   *'                      
                       DISPLAY '*************************'                      
                       PERFORM ABEND-ROUTINE                                    
                    ELSE                                                        
                       DISPLAY '***********************************'            
                       DISPLAY '* -911 ON TI CURSOR: ATTEMPT # '                
                                  LOOP-CNTR ' *'                                
                       DISPLAY '***********************************'            
                       ADD 1                TO  LOOP-CNTR                       
                    END-IF                                                      
                 WHEN OTHER                                                     
                    SET STOP-OK             TO  TRUE                            
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '*************************'                         
                    DISPLAY '* BAD OPEN OF TI CURSOR *'                         
                    DISPLAY '*************************'                         
                    PERFORM ABEND-ROUTINE                                       
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      **************                                                            
       FETCH-VTRNFR.                                                            
      **************                                                            
                                                                                
           INITIALIZE FRR-RECORD.                                               
                                                                                
           EXEC SQL                                                             
              FETCH TI_CRSR                                                     
              INTO  :FRR-CLIENT-NBR                                             
                   ,:FRR-ACAT-CONTROL-NBR                                       
                   ,:WS-RCV-NBR                                                 
                   ,:FRR-ACCT-RCV-NBR                                           
                   ,:FRR-RCV-CUST-NM                                            
                   ,:FRR-DLVR-NBR                                               
                   ,:WS-ACCT-DLVR-NBR                                           
                   ,:FRR-TRNFR-TYPE-CD                                          
                   ,:WS-STTS-CD                                                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    FETCH TI_CRSR                                               
                    INTO  :FRR-CLIENT-NBR                                       
                         ,:FRR-ACAT-CONTROL-NBR                                 
                         ,:WS-RCV-NBR                                           
                         ,:FRR-ACCT-RCV-NBR                                     
                         ,:FRR-RCV-CUST-NM                                      
                         ,:FRR-DLVR-NBR                                         
                         ,:WS-ACCT-DLVR-NBR                                     
                         ,:FRR-TRNFR-TYPE-CD                                    
                         ,:WS-STTS-CD                                           
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
      *****************                                                         
       SELECT-ACTITRF.                                                          
      *****************                                                         
                                                                                
           MOVE ' '                         TO  WS-TRANS-TYPE-CD.               
                                                                                
           EXEC SQL                                                             
              SELECT  TRANS_TYPE_CD                                             
LRM006               ,NSCC_PEND_CD                                              
LRM006               ,PRGM_NM                                                   
              INTO   :WS-TRANS-TYPE-CD                                          
LRM006              ,:DCLACTITRF.NSCC-PEND-CD                                   
LRM006              ,:DCLACTITRF.PRGM-NM                                        
              FROM    ACTITRF                                                   
              WHERE CLIENT_NBR    = :FRR-CLIENT-NBR    AND                      
                    RCV_NBR       = :WS-RCV-NBR        AND                      
                    DLVR_NBR      = :FRR-DLVR-NBR      AND                      
                    ACCT_DLVR_NBR = :WS-ACCT-DLVR-NBR  AND                      
                    ACCT_RCV_NBR  = :FRR-ACCT-RCV-NBR  AND                      
                    TRNFR_TYPE_CD = :FRR-TRNFR-TYPE-CD AND                      
                    ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR                    
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +100                                                    
              MOVE ' '                      TO  WS-TRANS-TYPE-CD                
              DISPLAY '************************************************'        
              DISPLAY 'NO CORRESPONDING RECORD IS FOUND IN ACTITRF FOR'         
              DISPLAY 'CLIENT = ' FRR-CLIENT-NBR                                
                      ', RCV = ' WS-RCV-NBR                                     
                      ', DLVR = ' FRR-DLVR-NBR                                  
                      ', RCV ACCT = ' FRR-ACCT-RCV-NBR (1:8)                    
                      ', DLVR ACCT = ' WS-ACCT-DLVR-NBR (1:8)                   
                      ', TRNFR TYPE = ' FRR-TRNFR-TYPE-CD                       
           ELSE                                                                 
              IF SQLCODE NOT = +0                                               
                 PERFORM DB2-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PROCESS-VASSET.                                                          
      ****************                                                          
                                                                                
           PERFORM FETCH-VASSET.                                                
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
LRM001              IF FRR-TRNFR-TYPE-CD = ('FUL' OR 'PTD' OR 'PTR'             
DJ0001                          OR 'PTF' OR 'CRD' OR 'RCR')                     
                       MOVE WS-RCV-NBR      TO  FRR-SBMTG-PRTCP-NBR             
                    ELSE                                                        
                       IF FRR-TRNFR-TYPE-CD = 'RCL'                             
                          MOVE FRR-DLVR-NBR TO  FRR-SBMTG-PRTCP-NBR             
                       ELSE                                                     
                          MOVE SPACES       TO  FRR-SBMTG-PRTCP-NBR             
                       END-IF                                                   
                    END-IF                                                      
                    ADD 1                   TO  AT-CNTR (S1)                    
                    WRITE FR-REQ-REC      FROM  FRR-RECORD                      
                 WHEN +100                                                      
                    CONTINUE                                                    
                 WHEN OTHER                                                     
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '***'                                               
                    DISPLAY 'BAD FETCH FROM AT CURSOR'                          
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
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    OPEN AT_CRSR                                                
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD OPEN  OF AT CURSOR *'                              
              DISPLAY '**************************'                              
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
                 UNTIL S2 > 10  OR                                              
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
                                                                                
TEMP                                                                            
TEMP       IF SQLCODE = +0                                                      
              DISPLAY ' '                                                       
              DISPLAY ' CLIENT NBR = ' FRR-CLIENT-NBR                           
                      ' ACAT CNTL NBR = '  FRR-ACAT-CONTROL-NBR                 
                      ' ASSET SEQ NBR = '  FRR-ASSET-SEQ-NBR                    
                      ' ASSET DESC = ' FRR-ASSET-DESC-TXT                       
TEMP       END-IF                                                               
TEMP                                                                            
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
TCK ************************************************************                
      *******************                                                       
       PROCESS-ACTITRF.                                                         
      *******************                                                       
                                                                                
           PERFORM UNTIL WS-IT-SQLCODE NOT = +0                                 
              PERFORM FETCH-ACTITRF                                             
                 MOVE SQLCODE TO WS-IT-SQLCODE                                  
                 EVALUATE SQLCODE                                               
                    WHEN +0                                                     
                       ADD 1          TO  IT-CNTR (S1)                          
                                          WS-CNTR                               
                       PERFORM OPEN-VASSET                                      
                       PERFORM PROCESS-VASSET                                   
                       PERFORM CLOSE-VASSET                                     
                       MOVE +0 TO SQLCODE                                       
                    WHEN +100                                                   
                       CONTINUE                                                 
                    WHEN OTHER                                                  
                       PERFORM DB2-ERROR-ROUTINE                                
                       DISPLAY '****************************'                   
                       DISPLAY '* BAD FETCH FROM IT CURSOR *'                   
                       DISPLAY '****************************'                   
                       PERFORM ABEND-ROUTINE                                    
                 END-EVALUATE                                                   
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ****************                                                          
TCK    OPEN-ACTITRF.                                                            
      ****************                                                          
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
           MOVE 1                           TO  LOOP-CNTR.                      
           PERFORM UNTIL STOP-OK                                                
              EXEC SQL                                                          
                 OPEN IT_CRSR                                                   
              END-EXEC                                                          
              EVALUATE SQLCODE                                                  
                 WHEN +0                                                        
                    SET STOP-OK             TO  TRUE                            
                 WHEN -911                                                      
                    IF LOOP-CNTR > 10                                           
                       SET STOP-OK          TO  TRUE                            
                       PERFORM DB2-ERROR-ROUTINE                                
                       DISPLAY '*************************'                      
                       DISPLAY '* BAD OPEN OF IT CURSOR *'                      
                       DISPLAY '* CANNOT RESOLVE -911   *'                      
                       DISPLAY '*************************'                      
                       PERFORM ABEND-ROUTINE                                    
                    ELSE                                                        
                       DISPLAY '***********************************'            
                       DISPLAY '* -911 ON IT CURSOR: ATTEMPT # '                
                                  LOOP-CNTR ' *'                                
                       DISPLAY '***********************************'            
                       ADD 1                TO  LOOP-CNTR                       
                    END-IF                                                      
                 WHEN OTHER                                                     
                    SET STOP-OK             TO  TRUE                            
                    PERFORM DB2-ERROR-ROUTINE                                   
                    DISPLAY '*************************'                         
                    DISPLAY '* BAD OPEN OF IT CURSOR *'                         
                    DISPLAY '*************************'                         
                    PERFORM ABEND-ROUTINE                                       
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *****************                                                         
       FETCH-ACTITRF.                                                           
      *****************                                                         
                                                                                
           INITIALIZE FRR-RECORD.                                               
                                                                                
           EXEC SQL                                                             
              FETCH IT_CRSR                                                     
              INTO  :FRR-CLIENT-NBR                                             
                   ,:FRR-ACAT-CONTROL-NBR                                       
                   ,:WS-RCV-NBR                                                 
                   ,:FRR-ACCT-RCV-NBR                                           
                   ,:FRR-RCV-CUST-NM                                            
                   ,:FRR-DLVR-NBR                                               
                   ,:WS-ACCT-DLVR-NBR                                           
                   ,:FRR-TRNFR-TYPE-CD                                          
                   ,:WS-STTS-CD                                                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    FETCH TI_CRSR                                               
                    INTO  :FRR-CLIENT-NBR                                       
                         ,:FRR-ACAT-CONTROL-NBR                                 
                         ,:WS-RCV-NBR                                           
                         ,:FRR-ACCT-RCV-NBR                                     
                         ,:FRR-RCV-CUST-NM                                      
                         ,:FRR-DLVR-NBR                                         
                         ,:WS-ACCT-DLVR-NBR                                     
                         ,:FRR-TRNFR-TYPE-CD                                    
                         ,:WS-STTS-CD                                           
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
TEMP       IF SQLCODE = +0                                                      
              DISPLAY ' '                                                       
              DISPLAY ' *******  AN ACCELERATED INITAIL XFR *******'            
              DISPLAY '        CLIENT NBR = ' FRR-CLIENT-NBR                    
                      '        ACAT CNTL NBR = '  FRR-ACAT-CONTROL-NBR          
TEMP       END-IF                                                               
           IF SQLCODE = +0 OR +100                                              
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD FETCH IN IT CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       CLOSE-ACTITRF.                                                           
      *****************                                                         
                                                                                
           EXEC SQL                                                             
              CLOSE IT_CRSR                                                     
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '**************************'                              
              DISPLAY '* BAD CLOSE OF IT CURSOR *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
           END-IF.                                                              
                                                                                
           MOVE  0  TO WS-IT-SQLCODE.                                           
                                                                                
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
                                                                                
LRM002     OPEN INPUT  INFILE.                                                  
LRM002     READ INFILE                                                          
LRM002        AT END SET INFILE-EOF TO TRUE                                     
LRM002     END-READ.                                                            
                                                                                
           OPEN OUTPUT FR-REQUEST.                                              
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           DISPLAY '**********************************'.                        
           DISPLAY '* CURRENT PROCESSING STREAM IS ' LS-STREAM-IND              
                   ' *'.                                                        
           DISPLAY '**********************************'.                        
LRM002     DISPLAY 'PARM RUN IND = ' LS-PARM-RUN-INDICATOR.                     
           DISPLAY ' '                                                          
           DISPLAY '***************************************************'        
           .                                                                    
           DISPLAY '* CURRENT TIMESTAMP IS ' WS-DATE-TIME ' *'.                 
           DISPLAY '***************************************************'        
           .                                                                    
                                                                                
           MOVE 'DATE='                     TO  FRR-DATE-LIT.                   
           MOVE WS-DATE-TIME                TO  FRR-DATE-TIME.                  
                                                                                
           WRITE FR-REQ-REC               FROM  FRR-HEADER.                     
                                                                                
LRM003     MOVE  'CAT575A '                   TO BPDATES-CALLING-PGM.           
LRM003     MOVE  'C'                          TO BPDATES-REQ-TYPE.              
                                                                                
LRM003     CALL    BPDATES            USING BPDATES-PARAMETERS.                 
                                                                                
LRM003     MOVE BPD-JULIAN-PROC-DATE  TO ACAT-DATE-JUL.                         
LRM003     DISPLAY 'CURRENT INIT DATE ' ACAT-DATE-JUL.                          
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
LRM002     DISPLAY 'INTRA-DAY INFILE RECS READ ' W-INFILE-RECS-READ.            
LRM002     CLOSE INFILE.                                                        
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
                 DISPLAY 'NUMBER OF IT FETCHES: ' IT-CNTR (S1)                  
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************************'.                     
           DISPLAY '* CAT575A: COMPLETION IS SUCCESSFUL *'.                     
           DISPLAY '*************************************'.                     
                                                                                
