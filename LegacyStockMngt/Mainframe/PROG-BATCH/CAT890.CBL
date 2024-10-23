000001* PDX    - CAT890   C0348882 12/06/13 06:53:17 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT890   C0296621 06/07/10 15:51:04 TBLAMUR            00001000
LRM006* SSR 71810 FOREIGN FEE - EXTRACT NEW COL                                 
000001* PDX    - CAT890   C0226568 11/14/05 10:10:24 TBEDTAK            00001000
ET0002* ET0002 - SSR 31952 FIX WHERE REPORTED FEES DO NOT MATCH WITH    00001000
ET0002* ET0002   BOOKED FEES.  SEE ALSO REPORT PROGRAM CAT31.           00001000
ET0001* ET0001 - SSR 36630 DO NOT SHOW WITHHELD ASSETS ON ACATPRV REPORT        
ET0001* ET0001   SEE ALSO PROGRAM CAT892 AND CAT31.                             
000001* PDX    - CAT890   C0210812 09/13/04 08:12:52 TBLAMUR            00001000
000001* LRM005 - SSR# 0038145 REMOVE COPY NASEGPPE; DOESN'T USE N/A             
000001* LRM005 - DELETED ALL N/A COPYS.                                         
000001* PDX    - CAT890   C0184969 01/23/03 09:26:48 TBLAMUR            00001000
      * LRM004 SSR 0024350 LOOKUP MISSING BROKER NAMES ON VPRTCPPF              
000001* PDX    - CAT890   C0172743 03/21/02 10:04:13 TBEDTAK            00001000
000001* PDX    - CAT890   C0149951 02/08/01 16:35:21 TBTIKUO            00001000
000001* PDX    - CAT890   C0122686 03/04/99 20:36:58 TBYOHON            00001000
000001* PDX    - CAT890   C0121406 02/11/99 11:49:31 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT890.                                                   
       DATE-WRITTEN.  FEB  1999.                                                
                                                                                
      *****************************************************************         
      *                         REMARKS                               *         
      *****************************************************************         
      * THIS PROGRAM FETCHES RECORDS FROM VTRNFR TABLE AND RECREATES  *         
      * ACATDEL FILE, FORMERLY CREATED BY CAT30.                      *         
      *****************************************************************         
                                                                                
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT  BROKER-FILE         ASSIGN  TO  BRKRFL                       
              ORGANIZATION IS  INDEXED                                          
              ACCESS       IS  DYNAMIC                                          
              RECORD KEY   IS  BROKER-KEY                                       
              FILE STATUS  IS  BROKER-FILE-STATUS.                              
                                                                                
           SELECT ACAT-DELIVER                  ASSIGN  TO  ACATDEL.            
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  BROKER-FILE.                                                         
                                                                                
       01  BROKER-REC.                                                          
           05  BROKER-KEY.                                                      
               10  BROKER-EXCHANGE          PIC  X(01).                         
               10  BROKER-BADGE             PIC  X(04).                         
               10  FILLER                   PIC  X(06).                         
           05  FILLER                       PIC  X(12).                         
           05  BROKER-NAME                  PIC  X(33).                         
           05  FILLER                       PIC  X(24).                         
                                                                                
       FD  ACAT-DELIVER                                                         
           RECORDING MODE IS V                                                  
           LABEL RECORDS ARE STANDARD                                           
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  ACAT-DELIVER-REC                 PIC  X(300).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       01  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       01  WS-TMSTMP                        PIC  X(26)  VALUE SPACES.           
       01  WS-CLIENT-NBR                    PIC  X(04)  VALUE SPACES.           
       01  WS-PRTCP-NM                      PIC  X(60)  VALUE SPACES.           
       01  GETNA-SW                         PIC  X(01).                         
           88  GETNA-OK                                 VALUE 'Y'.              
           88  GETNA-NOT-OK                             VALUE 'N'.              
       01  WS-STREAM-IND                    PIC  X(01)  VALUE SPACES.           
       01  S1                               PIC  9(04)  VALUE ZEROES.           
       01  S2                               PIC  9(04)  VALUE ZEROES.           
       01  B1-SUB                           PIC  9(04)  VALUE ZEROES.           
       01  BROKER-FILE-STATUS               PIC  X(02).                         
           88  BROKER-FILE-OK                           VALUE '00'.             
           88  BROKER-OPEN-OK                           VALUE '00' '97'.        
           88  BROKER-NOTFOUND                          VALUE '23'.             
           88  BROKER-ENDFILE                           VALUE '10'.             
       01  RANGE-FOUND-SW                   PIC  X(01)  VALUE 'N'.              
           88  RANGE-FOUND                              VALUE 'Y'.              
           88  RANGE-NOT-FOUND                          VALUE 'N'.              
                                                                                
       01  CLIENT-TABLE-CNTR                PIC  9(04)  VALUE 0.                
                                                                                
       01  CLIENT-TABLE-AREA.                                                   
           05  CLIENT-TABLE OCCURS 500 TIMES.                                   
               10  CLIENT-NUM               PIC  9(04)  VALUE ZEROES.           
      *        10  CLIENT-CNTL-CODE-NO      PIC  9(03)  COMP-3                  
      *                                                 VALUE ZEROES.           
      *        10  CLIENT-CNTL-CODES.                                           
      *          15 CLIENT-CNTL-CODE-EN  OCCURS 100 TIMES.                      
      *             20 CLIENT-CNTL-CODE-LO  PIC  X(03)  VALUE SPACES.           
      *             20 CLIENT-CNTL-CODE-HI  PIC  X(03)  VALUE SPACES.           
      *             20 CLIENT-CNTL-CODE     PIC  X(03)  VALUE SPACES.           
               10  CLIENT-FETCH-CNTR        PIC  9(09)  COMP-3                  
                                                        VALUE ZEROES.           
      *        10  CLIENT-BYPASS-CNTR       PIC  9(09)  COMP-3                  
      *                                                 VALUE ZEROES.           
                                                                                
       01  WS-ACATS-CNTL-NBR.                                                   
           05  WS-ACATS-CCYY                PIC  X(04).                         
           05  WS-ACATS-JULIAN              PIC  9(03).                         
           05  FILLER                       PIC  X(02).                         
           05  WS-ACATS-SEQ                 PIC  9(05).                         
                                                                                
       01  WS-CTRL-NO.                                                          
           05  WS-CTRL-JULIAN               PIC  9(03).                         
           05  WS-CTRL-SEQ                  PIC  9(05).                         
                                                                                
       01  CURSOR-AREA.                                                         
           05  CR-ACCT-DLVR-NBR             PIC  X(20)  VALUE SPACES.           
           05  CR-RCV-NBR                   PIC  X(04)  VALUE SPACES.           
           05  CR-DLVR-NBR                  PIC  X(04)  VALUE SPACES.           
           05  CR-ACATS-CNTL-NBR            PIC  X(14)  VALUE SPACES.           
           05  CR-ACCT-RCV-NBR              PIC  X(20)  VALUE SPACES.           
           05  CR-RCV-CUST-NM               PIC  X(60)  VALUE SPACES.           
           05  CR-RCV-SS-PRIM-NBR           PIC  X(09)  VALUE SPACES.           
           05  CR-RCV-ACCT-TYPE-CD          PIC  X(02)  VALUE SPACES.           
ET0002     05  CR-ACCT-TRNFR-FEE-AMT        PIC S9(3)V9(2) COMP-3.              
ET0002     05  CR-ACCT-IRA-TRMNT-AMT        PIC S9(3)V9(2) COMP-3.              
ET0002     05  CR-ACCT-IRA-MAINT-AMT        PIC S9(3)V9(2) COMP-3.              
LRM006     05  CR-FOREIGN-FEE-AMT           PIC S9(5)V9(2) COMP-3.              
                                                                                
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN                  PIC S9(09) COMP VALUE +80.          
                                                                                
           EJECT                                                                
           COPY ACATDELV.                                                       
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
           COPY BHBTS2.                                                         
                                                                                
           EJECT                                                                
           COPY BHICS.                                                          
                                                                                
           EJECT                                                                
           COPY BHATB.                                                          
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
           EJECT                                                                
TCK001     COPY STUBCPY.                                                        
                                                                                
      *DB2 COMMUNICATION AREA                                                   
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE VPRTCPPF                                                  
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              DECLARE VTRNFR_CRSR CURSOR FOR                                    
              SELECT                                                            
                 ACCT_DLVR_NBR                                                  
                ,RCV_NBR                                                        
                ,DLVR_NBR                                                       
                ,ACAT_CONTROL_NBR                                               
                ,ACCT_RCV_NBR                                                   
                ,RCV_CUST_NM                                                    
                ,RCV_SS_PRIM_NBR                                                
                ,RCV_ACCT_TYPE_CD                                               
ET0002          ,ACCT_TRNFR_FEE_AMT                                             
ET0002          ,ACCT_IRA_TRMNT_AMT                                             
ET0002          ,ACCT_IRA_MAINT_AMT                                             
LRM006          ,FOREIGN_FEE_AMT                                                
              FROM                                                              
                 VTRNFR                                                         
              WHERE                                                             
                 CLIENT_NBR    = :WS-CLIENT-NBR  AND                            
                 DSTBN_SIDE_CD = 'D'             AND                            
                 STTS_CD IN ('100', '110')       AND                            
                 DAYS_STTS_QTY  = 1                                             
              ORDER BY                                                          
                 ACCT_DLVR_NBR                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(04)  COMP.                   
           05  LS-STREAM-IND                PIC  X(01).                         
                                                                                
           EJECT                                                                
      *****************************************************************         
       PROCEDURE DIVISION USING PARM-AREA.                                      
      *****************************************************************         
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           PERFORM BUILD-CLIENT-TABLE.                                          
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL S1 > CLIENT-TABLE-CNTR OR                                   
                    S1 > 500                                                    
              MOVE CLIENT-NUM (S1)          TO  WS-CLIENT-NBR                   
              PERFORM OPEN-VTRNFR-ROUTINE                                       
              PERFORM FETCH-VTRNFR-ROUTINE                                      
              PERFORM UNTIL SQLCODE NOT = +0                                    
                 ADD 1                      TO  CLIENT-FETCH-CNTR (S1)          
      *          PERFORM CHECK-CONTROL-RANGE                                    
      *          IF RANGE-FOUND                                                 
                    PERFORM FORMAT-ACAT-DELIVER                                 
                    PERFORM READ-BROKER-NAME                                    
                    WRITE ACAT-DELIVER-REC  FROM  ACAT-RECORD-DATA              
      *          ELSE                                                           
      *             ADD 1                   TO CLIENT-BYPASS-CNTR (S1)          
      *          END-IF                                                         
                 PERFORM FETCH-VTRNFR-ROUTINE                                   
              END-PERFORM                                                       
              PERFORM CLOSE-VTRNFR-ROUTINE                                      
           END-PERFORM.                                                         
                                                                                
           PERFORM ENDJOB-ROUTINE.                                              
                                                                                
           GOBACK.                                                              
                                                                                
      *    EJECT                                                                
      *********************                                                     
      *CHECK-CONTROL-RANGE.                                                     
      *********************                                                     
                                                                                
      *    SET RANGE-NOT-FOUND              TO  TRUE.                           
      *                                                                         
      *    PERFORM VARYING S2 FROM 1 BY 1                                       
      *       UNTIL S2 > CLIENT-CNTL-CODE-NO (S1) OR                            
      *             S2 > 100                      OR                            
      *             RANGE-FOUND                                                 
      *       IF CR-ACCT-DLVR-NBR (1:3) >= CLIENT-CNTL-CODE-LO (S1, S2)         
      *                                 AND                                     
      *          CR-ACCT-DLVR-NBR (1:3) <= CLIENT-CNTL-CODE-HI (S1, S2)         
      *          SET RANGE-FOUND             TO  TRUE                           
      *       END-IF                                                            
      *    END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ******************                                                        
       READ-BROKER-NAME.                                                        
      ******************                                                        
                                                                                
           MOVE LOW-VALUES                  TO  BROKER-KEY.                     
           MOVE 'O'                         TO  BROKER-EXCHANGE.                
           MOVE CR-RCV-NBR                  TO  BROKER-BADGE.                   
                                                                                
           START BROKER-FILE                                                    
              KEY IS NOT < BROKER-KEY.                                          
                                                                                
           IF BROKER-OPEN-OK OR                                                 
              BROKER-ENDFILE                                                    
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY '****************************************'                
              DISPLAY '* BROKER FILE START ERROR, STATUS = '                    
                         BROKER-FILE-STATUS ' *'                                
              DISPLAY '* PROGRAM IS ABENDIN!                  *'                
              DISPLAY '****************************************'                
TCK001*       CALL 'ILBOABN0'            USING  ABEND-CODE                      
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           MOVE 'OTHER BROKER'              TO  ACAT-BROKER-NAME.               
                                                                                
           IF BROKER-OPEN-OK                                                    
              READ BROKER-FILE NEXT                                             
              IF BROKER-FILE-OK        AND                                      
                 BROKER-EXCHANGE = 'O' AND                                      
                 BROKER-BADGE = CR-RCV-NBR                                      
                 MOVE BROKER-NAME           TO  ACAT-BROKER-NAME                
LRM004        ELSE                                                              
LRM004           PERFORM SELECT-NAME-FROM-VPRTCPPF                              
              END-IF                                                            
LRM004     ELSE                                                                 
LRM004        PERFORM SELECT-NAME-FROM-VPRTCPPF                                 
           END-IF.                                                              
                                                                                
LRM004 SELECT-NAME-FROM-VPRTCPPF.                                               
LRM004     EXEC SQL SELECT                                                      
LRM004          PRTCP_NM                                                        
LRM004       INTO :PRTCP-NM                                                     
LRM004          FROM VPRTCPPF                                                   
LRM004       WHERE    PRTCP_NBR  =  :CR-RCV-NBR                                 
LRM004     END-EXEC.                                                            
LRM004     IF SQLCODE = +0                                                      
LRM004        MOVE PRTCP-NM       TO ACAT-BROKER-NAME                           
LRM004     END-IF.                                                              
LRM004     MOVE +0 TO SQLCODE.                                                  
           EJECT                                                                
      *********************                                                     
       FORMAT-ACAT-DELIVER.                                                     
      *********************                                                     
                                                                                
           MOVE LOW-VALUES                  TO  ACAT-RECORD-DATA.               
           MOVE WS-CLIENT-NBR (2:3)         TO  ACAT-CLT.                       
           MOVE CR-ACCT-DLVR-NBR (1:3)      TO  ACAT-BR.                        
           MOVE CR-ACCT-DLVR-NBR (4:5)      TO  ACAT-ACCT.                      
           MOVE '0'                         TO  ACAT-FILE-CODE.                 
           MOVE 0                           TO  ACAT-SEQ-NO.                    
           MOVE '3A'                        TO  ACAT-REC-CODE.                  
           MOVE CR-RCV-NBR                  TO  ACAT-CONTRA-BROKER.             
           MOVE CR-DLVR-NBR                 TO  ACAT-BROKER-CLR-NO.             
           MOVE CR-ACATS-CNTL-NBR           TO  WS-ACATS-CNTL-NBR.              
           MOVE WS-ACATS-JULIAN             TO  WS-CTRL-JULIAN.                 
           MOVE WS-ACATS-SEQ                TO  WS-CTRL-SEQ.                    
           MOVE WS-CTRL-NO                  TO  ACAT-CTRL-NO.                   
           MOVE CR-ACCT-RCV-NBR (1:15)      TO  ACAT-CONTRA-ACCT.               
           MOVE CR-RCV-CUST-NM (1:30)       TO  ACAT-ACCT-NAME1.                
           MOVE CR-RCV-CUST-NM (31:30)      TO  ACAT-ACCT-NAME2.                
           MOVE WS-PRTCP-NM                 TO  ACAT-BROKER-NAME.               
           MOVE CR-RCV-SS-PRIM-NBR          TO  ACAT-CONTRA-TAXID.              
           MOVE CR-RCV-ACCT-TYPE-CD         TO  ACAT-CONTRA-ACCT-TYPE.          
ET0001     MOVE CR-ACATS-CNTL-NBR           TO  ACAT-CONTROL-NUMBER.            
ET0002     MOVE CR-ACCT-TRNFR-FEE-AMT       TO  ACAT-TRNFR-FEE-AMT.     ACATRECO
ET0002     MOVE CR-ACCT-IRA-TRMNT-AMT       TO  ACAT-IRA-TRMNT-AMT.     ACATRECO
ET0002     MOVE CR-ACCT-IRA-MAINT-AMT       TO  ACAT-IRA-MAINT-AMT.     ACATRECO
LRM006     MOVE CR-FOREIGN-FEE-AMT          TO  ACAT-FRGN-FEE-AMT-TOT.          
                                                                                
           EJECT                                                                
      **********************                                                    
       FETCH-VTRNFR-ROUTINE.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              FETCH VTRNFR_CRSR                                                 
              INTO :CURSOR-AREA                                                 
           END-EXEC                                                             
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    FETCH VTRNRF_CRSR                                           
                    INTO :CURSOR-AREA                                           
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 CONTINUE                                                       
              WHEN +100                                                         
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 PERFORM DB2-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *********************                                                     
       OPEN-VTRNFR-ROUTINE.                                                     
      *********************                                                     
                                                                                
           EXEC SQL                                                             
              OPEN VTRNFR_CRSR                                                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    OPEN VTRNFR_CRSR                                            
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 PERFORM DB2-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *********************                                                     
       CLOSE-VTRNFR-ROUTINE.                                                    
      *********************                                                     
                                                                                
           EXEC SQL                                                             
              CLOSE VTRNFR_CRSR                                                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S2 FROM 1 BY 1                                    
                 UNTIL S2 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    CLOSE VTRNFR_CRSR                                           
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 PERFORM DB2-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
                                                BH-ACAT-INFO                    
              MOVE B1-SUB (2:3)             TO  BH-BROKER-NUMBER                
              MOVE '015'                    TO  BH-LOGICAL-RECORD-CODE          
              MOVE '434500'                 TO  BH-B2-INFO-ID                   
TCK001        CALL  GETB1V               USING  BH-BROKER-HEADER-INFO           
                                                BH-ACAT-INFO                    
              IF BH-BROKER-ACTIVE AND BH-ACAT-ACTIVE                            
                 IF BH-BROKER-MINI-MAXI-SUBGROUP NOT = SPACES                   
                    MOVE BH-BROKER-MINI-MAXI-SUBGROUP                           
                                            TO  WS-STREAM-IND                   
                 ELSE                                                           
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                          
                                            TO  WS-STREAM-IND                   
                 END-IF                                                         
                 IF LS-STREAM-IND  = WS-STREAM-IND                              
                    MOVE ' '                TO  BH-ICS-INFO                     
                    MOVE B1-SUB (2:3)       TO  BH-BROKER-NUMBER                
                    MOVE '015'              TO  BH-LOGICAL-RECORD-CODE          
                    MOVE '501000'           TO  BH-B2-INFO-ID                   
TCK001              CALL  GETB1V         USING  BH-BROKER-HEADER-INFO,          
                                                BH-ICS-INFO                     
                                                                                
                    MOVE ' '                TO  BH-BTS2-INFO                    
                    MOVE B1-SUB (2:3)       TO  BH-BROKER-NUMBER                
                    MOVE '015'              TO  BH-LOGICAL-RECORD-CODE          
                    MOVE '511000'           TO  BH-B2-INFO-ID                   
TCK001              CALL  GETB1V         USING  BH-BROKER-HEADER-INFO,          
                                                BH-BTS2-INFO                    
                    IF BH-ICS-ACTIVE                                            
                       IF BH-ICS-ACAT-DATA-EXTRACT NOT =  '0' AND               
                          BH-ICS-ACAT-DATA-EXTRACT = '1'      AND               
                          BH-BTS2-ACTIVE                      AND               
                          BH-BTS2-ACAT-RETAIL-IRA-CTL-RP = '1'                  
                          ADD 1             TO  S1                              
                          MOVE B1-SUB       TO  CLIENT-NUM (S1)                 
      *                   MOVE ' '          TO  BH-ATB-INFO                     
      *                   MOVE B1-SUB (2:3) TO  BH-BROKER-NUMBER                
      *                   MOVE '015'        TO  BH-LOGICAL-RECORD-CODE          
      *                   MOVE '451140'     TO  BH-B2-INFO-ID                   
      *                   CALL 'GETB1V'  USING  BH-BROKER-HEADER-INFO           
      *                                         BH-ATB-INFO                     
      *                   IF BH-ATB-ACTIVE                                      
      *                      MOVE BH-ATB-ACAT-BR-CONTROL-CODE-NO                
      *                                     TO  CLIENT-CNTL-CODE-NO (S1)        
      *                      MOVE BH-ATB-ACAT-BR-CONTROL-CODES                  
      *                                     TO  CLIENT-CNTL-CODES (S1)          
      *                   END-IF                                                
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF S1 = 0                                                            
              DISPLAY ' '                                                       
              DISPLAY '***************************************'                 
              DISPLAY '* THERE ARE NO ACAT ACTIVE CLIENTS ON *'                 
              DISPLAY '* THIS STREAM: ' LS-STREAM-IND                           
                      '                      *'                                 
              DISPLAY '***************************************'                 
           ELSE                                                                 
              MOVE S1                       TO  CLIENT-TABLE-CNTR               
              DISPLAY ' '                                                       
              DISPLAY '*****************************************'               
              DISPLAY '* CURRENT PROCESSING STREAM IS ' LS-STREAM-IND           
                      '        *'                                               
              DISPLAY '* THERE ARE ' CLIENT-TABLE-CNTR ' CLIENTS ON THIS        
      -               ' STREAM *'                                               
              DISPLAY '*****************************************'               
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR                  USING  SQLCA                           
                                                WS-DB2-MESSAGE-AREA             
                                                WS-ERR-LINE-LEN.                
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
TCK001*    CALL 'ILBOABN0'               USING  ABEND-CODE.                     
TCK001     CALL  ABEND                   USING  ABEND-CODE.                     
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           OPEN INPUT BROKER-FILE.                                              
                                                                                
           IF NOT BROKER-OPEN-OK                                                
              DISPLAY '***************************************'                 
              DISPLAY '* BROKER FILE OPEN ERROR, STATUS = '                     
                         BROKER-FILE-STATUS ' *'                                
              DISPLAY '* PROGRAM IS ABENDING!                *'                 
TCK001*       CALL 'ILBOABN0'            USING  ABEND-CODE                      
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT  ACAT-DELIVER.                                           
                                                                                
           INITIALIZE BPDATES-PARAMETERS.                                       
           MOVE 'CAT890'                   TO  BPDATES-CALLING-PGM.             
           MOVE 'C'                        TO  BPDATES-REQ-TYPE.                
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                       TO  BPDATES-CALENDAR-TYPE.           
CSG001     MOVE '  '                       TO  BPDATES-CALENDAR-TYPE.           
TCK001     CALL  BPDATES                USING  BPDATES-PARAMETERS.              
                                                                                
           IF NOT BPD-VALID-RETURN                                              
              DISPLAY '**************************************'                  
              DISPLAY '* CALL TO BPDATES ROUTINE HAS FAILED *'                  
              DISPLAY '* BPD-RETURN-CODE = ' BPDATES-RETURN-CODE                
                      '               *'                                        
              DISPLAY '* PROGRAM IS ABENDING!               *'                  
              DISPLAY '**************************************'                  
TCK001        CALL  ABEND               USING  ABEND-CODE                       
           END-IF.                                                              
                                                                                
           MOVE LOW-VALUES                 TO  ACAT-DATE-RECORD.                
           MOVE 'DATE='                    TO  ACAT-DATE-ID.                    
           MOVE BPD-PROC-DATE (5:2)        TO  ACAT-DATE-MMDDYY (1:2).          
           MOVE BPD-PROC-DATE (7:2)        TO  ACAT-DATE-MMDDYY (3:2).          
           MOVE BPD-PROC-DATE (3:2)        TO  ACAT-DATE-MMDDYY (5:2).          
           WRITE ACAT-DELIVER-REC        FROM  ACAT-DATE-RECORD.                
                                                                                
           EXEC SQL                                                             
               SET :WS-TMSTMP = CURRENT TIMESTAMP                               
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           DISPLAY '**********************************************'.            
           DISPLAY '* CURRENT DATE AND TIME: ' WS-TMSTMP (1:19) ' *'            
           DISPLAY '**********************************************'.            
                                                                                
           EJECT                                                                
      ****************                                                          
       ENDJOB-ROUTINE.                                                          
      ****************                                                          
                                                                                
           CLOSE  ACAT-DELIVER.                                                 
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '                   TOTALS FOR CAT890'.                      
           DISPLAY '                   -----------------'.                      
           IF CLIENT-TABLE-CNTR = 0                                             
              DISPLAY '*************************'                               
              DISPLAY '* NO PARTICIPANTS FOUND *'                               
              DISPLAY '*************************'                               
           ELSE                                                                 
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > CLIENT-TABLE-CNTR OR 500                            
                 DISPLAY 'FOR CLIENT ' CLIENT-NUM (S1)                          
                         ' NUMBER OF FETCHES IS ' CLIENT-FETCH-CNTR (S1)        
      *                  ' NUMBER OF BYPASSES IS '                              
      *                    CLIENT-BYPASS-CNTR (S1)                              
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '********************************************'.              
           DISPLAY '* PROGRAM CAT890 IS COMPLETED SUCCESSFULLY *'.              
           DISPLAY '********************************************'.              
           DISPLAY ' '.                                                         
