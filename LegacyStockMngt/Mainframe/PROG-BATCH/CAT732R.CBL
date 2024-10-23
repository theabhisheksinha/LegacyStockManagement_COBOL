000001* PDX    - CAT732R  C0278295 04/06/09 13:09:28 TBDOJUN            00001000
      * DJ0001 SSR 61867 USE ADP-NO IN ISIN_SEC_ISSUE_CD(NO MORE CUSIP) 00001000
000001* PDX    - CAT732R  C0273763 12/15/08 15:16:29 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT732R.                                                  
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      *    ACATS - RESTRICTED SECURITY (X SCREEN) REPORT                        
      *                                                                         
      *    INPUT   :                                                            
      *            1) RESTRICTED SECURITY DB2                                   
      *            2) RESTRICTED BROKER   DB2                                   
      *            3) MSD                                                       
      *    OUTPUT  :                                                            
      *            1) B***.CAT732R.RSPI           O/P - REPORT                  
      *                                                                         
      *---------------------------------------------------------------*         
      * 12/01/08 DJ  - SSR#57653 NEW PROGRAM                          *         
      *---------------------------------------------------------------*         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT REPT-FILE              ASSIGN TO UT-S-REPT                    
                                         FILE STATUS IS REPT-STAT.              
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  REPT-FILE                                                            
           RECORDING MODE IS F.                                                 
                                                                                
       01  REPT-REC.                                                            
           03 REPT-LINE                  PIC  X(133).                           
           03 REPT-CLT                   PIC S9(003) COMP-3.                    
           03 REPT-FIL                   PIC  X(008).                           
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.                  
           05  REPT-STAT                 PIC  X(02) VALUE '00'.                 
               88 REPT-OKAY                         VALUE '00'.                 
           05  W-VRSTSEC-CNT             PIC  9(11) VALUE 0.                    
           05  W-VRSTSEC-CLT-CNT         PIC  9(11) VALUE 0.                    
           05  W-MSD-FND-CNT             PIC  9(11) VALUE 0.                    
DJ0001     05  W-CUS-BLANK-CNT           PIC  9(11) VALUE 0.                    
DJ0001     05  W-CUS-FND-CNT             PIC  9(11) VALUE 0.                    
           05  W-SEC-NOTFND-CNT          PIC  9(11) VALUE 0.                    
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.                    
           05  W-LINE-CNT                PIC  9(03) VALUE 60.                   
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-SYS-YY              PIC  X(002).                           
               10  W-SYS-MM              PIC  X(002).                           
               10  W-SYS-DD              PIC  X(002).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-SYS-HH              PIC  X(002).                           
               10  W-SYS-MN              PIC  X(002).                           
               10  W-SYS-SS              PIC  X(002).                           
               10  W-SYS-MS              PIC  X(002).                           
           05  W-REPT-CLT                PIC  9(03) VALUE 0.                    
           05  W-REPT-LINE               PIC  X(133).                           
                                                                                
       01  W-PREV-AREA.                                                         
           05  W-PREV-CLIENT-NBR         PIC X(0004).                           
       01  W-CURRENT-FIELDS.                                                    
           05  W-CURRENT-CLIENT          PIC X(004).                            
DJ0001     05  W-ISIN-SEC-ISSUE-CD       PIC X(009).                            
       01  W-VRSTBRKR-FIELDS.                                                   
           03  W-VRSTBRKR-CNT            PIC 9(11) VALUE 0.                     
           03  W-DTL3-SUB                PIC 9(03) VALUE 0.                     
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLT-NBR               PIC 9(04).                          
               05  B1-CLT-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
               05  B1-PRINT                 PIC X(01).                          
       01  B1-WORK-FIELEDS.                                                     
           03  B1-SUB                       PIC 9(03) VALUE 0.                  
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.                  
      /                                                                         
      *****************************************************************         
      * B1 HEADER                                                               
      *****************************************************************         
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
      *****************************************************************         
      * B1 ACAT SECTION                                                         
      *****************************************************************         
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
      *****************************************************************         
      * BPDATE COMMAREA                                                         
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      *****************************************************************         
      * GETMSDC COMMAREA                                                        
      *****************************************************************         
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
      *****************************************************************         
      * DB2TEST.DCLGEN.SRCLIB(VRSDSEC)   RESTRICTED SECURITY TABLE              
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
      /                                                                         
      *****************************************************************         
      * DB2TEST.DCLGEN.SRCLIB(VRSTBRKR)  RESTRICTED BROKER   TABLE              
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'VRSTBRKR'.           
           EXEC SQL INCLUDE VRSTBRKR     END-EXEC.                              
      /                                                                         
      *****************************************************************         
      * DB2 COMMAREA                                                            
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      *****************************************************************         
      * DB2 ERROR MESSAGE AREA                                                  
      *****************************************************************         
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CTR              PIC  9(009) COMP-3                     
                                              VALUE 0.                          
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SEC-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-BRK-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      *****************************************************************         
      * DECLARE CURSOR FOR RESTRICTED SECURITY  TABLE                           
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'CURSOR '.            
           EXEC SQL                                                             
                DECLARE VRSTSEC_CURSOR CURSOR WITH HOLD FOR                     
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,TRNFR_MEMO_IND                                              
                   ,TRNFR_BRKR_TYPE_CD                                          
                   ,RSTRD_MSG_TXT                                               
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,SECURITY_ADP_NBR                                            
                   ,EXPTN_DT                                                    
                   ,COMMENT_TXT                                                 
                   ,CICS_SGNON_ID                                               
                   ,TPSCRT_USR_NM                                               
                   ,TPSCRT_USR_ID                                               
                   ,CICS_NET_NM                                                 
                FROM VRSTSEC                                                    
                WHERE CLIENT_NBR = :W-CURRENT-CLIENT                            
                ORDER BY CLIENT_NBR, ISIN_SEC_ISSUE_CD                          
           END-EXEC.                                                            
      /                                                                         
      *****************************************************************         
      * DECLARE CURSOR FOR RESTRICTED BROKER    TABLE                           
      *****************************************************************         
       01  FILLER                        PIC X(008) VALUE 'CURSOR2'.            
           EXEC SQL                                                             
                DECLARE VRSTBRKR_CURSOR CURSOR WITH HOLD FOR                    
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,BRKR_CONTRA_NBR                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                FROM VRSTBRKR                                                   
                WHERE CLIENT_NBR        = :W-CURRENT-CLIENT                     
                  AND ISIN_SEC_ISSUE_CD = :W-ISIN-SEC-ISSUE-CD                  
                ORDER BY CLIENT_NBR, ISIN_SEC_ISSUE_CD, BRKR_CONTRA_NBR         
           END-EXEC.                                                            
      /                                                                         
       01  W-HDR1-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '1'.               
           05  FILLER                       PIC  X(08) VALUE                    
               'CAT732R '.                                                      
           05  W-HDR1-CLT                   PIC  Z999.                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(04) VALUE ' '.               
           05  FILLER                       PIC  X(42) VALUE                    
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(12) VALUE ' '.               
           05  FILLER                       PIC  X(13) VALUE                    
               'PROCESS DATE '.                                                 
           05  W-HDR1-MM                    PIC  X(02).                         
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-DD                    PIC  X(02).                         
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-YY                    PIC  X(02).                         
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(05) VALUE                    
               'PAGE '.                                                         
           05  W-HDR1-PAGE                  PIC  ZZZ9.                          
                                                                                
       01  W-HDR2-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(08) VALUE                    
               'BROKER  '.                                                      
           05  W-HDR2-BKR                   PIC  X(04).                         
           05  FILLER                       PIC  X(43) VALUE ' '.               
           05  FILLER                       PIC  X(42) VALUE                    
               'RESTRICTED SECURITY REPORT       '.                             
           05  FILLER                       PIC  X(08) VALUE ' '.               
           05  FILLER                       PIC  X(09) VALUE                    
               'RUN TIME '.                                                     
           05  W-HDR2-MM                    PIC  X(02).                         
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-DD                    PIC  X(02).                         
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-YY                    PIC  X(02).                         
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-HDR2-HH                    PIC  X(02).                         
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.               
           05  W-HDR2-MN                    PIC  X(02).                         
           05  FILLER                       PIC  X(04) VALUE ' '.               
                                                                                
       01  W-HDR3-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER               PIC  X(10) VALUE 'SECURITY  '.              
           05  FILLER               PIC  X(11) VALUE 'CUSIP     '.              
           05  FILLER               PIC  X(06) VALUE ' MEMO '.                  
           05  FILLER               PIC  X(10) VALUE 'TFR TYPE  '.              
           05  FILLER               PIC  X(06) VALUE 'CMNT  '.                  
           05  FILLER               PIC  X(12) VALUE 'DATE ADDED  '.            
           05  FILLER               PIC  X(12) VALUE 'LAST UPDATE '.            
           05  FILLER               PIC  X(12) VALUE ' EXP DATE   '.            
           05  FILLER               PIC  X(06) VALUE 'TERM  '.                  
           05  FILLER               PIC  X(06) VALUE 'SNON  '.                  
           05  FILLER               PIC  X(22) VALUE '    NAME  '.              
           05  FILLER               PIC  X(10) VALUE '   ID     '.              
           05  FILLER               PIC  X(09) VALUE 'NETNAME '.                
                                                                                
       01  W-DTL1-REC.                                                          
           05  FILLER                      PIC  X(01) VALUE '0'.                
           05  W-DTL1-ISIN-SEC-ISSUE-CD    PIC  X(07) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
DJ0001     05  W-DTL1-CUSIP                PIC  X(12) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-TRNFR-MEMO-IND       PIC  X(01) VALUE ' '.                
           05  FILLER                      PIC  X(05) VALUE ' '.                
           05  W-DTL1-TRNFR-BRKR-TYPE-CD   PIC  X(04) VALUE ' '.                
           05  FILLER                      PIC  X(05) VALUE ' '.                
           05  W-DTL1-COMMENT-TXT          PIC  X(01) VALUE ' '.                
           05  FILLER                      PIC  X(04) VALUE ' '.                
           05  W-DTL1-CRT-TMSTP            PIC  X(10) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-UPDT-TMSTP           PIC  X(10) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-EXPTN-DT             PIC  X(10) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-CICS-TERM-ID-CD      PIC  X(04) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-CICS-SGNON-ID        PIC  X(04) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-TPSCRT-USR-NM        PIC  X(20) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-TPSCRT-USR-ID        PIC  X(08) VALUE ' '.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  W-DTL1-CICS-NET-NM          PIC  X(08) VALUE ' '.                
           05  FILLER                      PIC  X(01) VALUE ' '.                
                                                                                
       01  W-DTL2-REC.                                                          
           05  FILLER                      PIC  X(11) VALUE                     
               '      DESC:'.                                                   
           05  FILLER                      PIC  X(01) VALUE ' '.                
           05  W-DTL2-DESC                 PIC  X(120) VALUE ' '.               
           05  FILLER                      PIC  X(01) VALUE ' '.                
                                                                                
       01  W-DTL3-REC.                                                          
           05  FILLER                      PIC  X(11) VALUE                     
               '   BROKERS:'.                                                   
           05  FILLER                      PIC  X(01) VALUE ' '.                
           05  W-DTL3-AREA.                                                     
               07  W-DTL3-TAB OCCURS 14 TIMES.                                  
                   09  W-DTL3-ENTRY        PIC  X(04).                          
                   09  W-DTL3-BLANK        PIC  X(01).                          
           05  FILLER                      PIC  X(51) VALUE ' '.                
                                                                                
       01  W-DTL4-REC.                                                          
           05  FILLER                      PIC  X(11) VALUE                     
               '   MESSAGE:'.                                                   
           05  FILLER                      PIC  X(01) VALUE ' '.                
           05  W-DTL4-RSTRD-MSG-TXT        PIC  X(70) VALUE ' '.                
           05  FILLER                      PIC  X(51) VALUE ' '.                
                                                                                
       01  W-DTL5-REC.                                                          
           05  FILLER                      PIC  X(11) VALUE                     
               '   COMMENT:'.                                                   
           05  FILLER                      PIC  X(01) VALUE ' '.                
           05  W-DTL5-COMMENT-TXT          PIC  X(120) VALUE ' '.               
           05  FILLER                      PIC  X(01) VALUE ' '.                
                                                                                
                                                                                
       01  W-DTLX-REC.                                                          
           05  FILLER                      PIC  X(01) VALUE '0'.                
           05  FILLER                      PIC  X(02) VALUE ' '.                
           05  FILLER                      PIC  X(40) VALUE                     
           'NO DETAILS TODAY'.                                                  
           05  FILLER                      PIC  X(90) VALUE ' '.                
      /                                                                         
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CD                  PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
      ***<---COBOL LE                                                           
                                                                                
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
                                                                                
           DISPLAY 'CAT732R - ACATS RESTRICTED SECURITY REPORT'.                
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT          THRU 1000-EXIT.                           
                                                                                
           PERFORM 2000-PROCESS       THRU 2000-EXIT                            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                           
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
                                                                                
           DISPLAY 'CAT732R: L-STREAM = ' L-STREAM.                             
                                                                                
           MOVE 'CAT732R'                TO BPDATES-CALLING-PGM.                
           SET  LNKDATZ-REQUEST          TO TRUE.                               
           CALL  BPDATES  USING BPDATES-PARAMETERS.                             
           DISPLAY 'CAT732R: PROC-DATE= ' BPD-PROC-DATE                         
                                                                                
           ACCEPT W-SYS-DATE             FROM DATE.                             
           ACCEPT W-SYS-TIME             FROM TIME.                             
                                                                                
           EXEC SQL                                                             
                SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                    
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT732R: W-CURRENT-TIMESTAMP = '                        
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT732R: W-CURRENT-TIMESTAMP NOT SET'                   
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           OPEN OUTPUT REPT-FILE.                                               
           DISPLAY 'CAT732R: REPORTS  OPENED FOR OUTPUT '                       
                       ' FILE STATUS = ' REPT-STAT                              
                                                                                
           IF  REPT-OKAY                                                        
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3001                 TO ABEND-CD                            
               DISPLAY ' '                                                      
               DISPLAY 'CAT732R: U3001 - DD REPORT OPEN ERROR, '                
                       ' FILE STATUS = ' REPT-STAT                              
               CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                                 
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND                   
           MOVE 'R'                      TO GETMSD-ACCESS-IND                   
           MOVE 'E'                      TO GETMSD-FORMAT-IND                   
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT732R: 1500-LOAD-B1'.                                     
                                                                                
           MOVE SPACES                   TO B1-TABLE-AREA.                      
           MOVE 0                        TO B1-SUB.                             
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO BH-BROKER-HEADER-INFO               
                                            BH-ACAT-INFO                        
             MOVE  B1-SUB                TO BH-BROKER-NUMBER-N                  
             MOVE  '015'                 TO BH-LOGICAL-RECORD-CODE              
             MOVE  '434500'              TO BH-B2-INFO-ID                       
             CALL   GETB1V            USING BH-BROKER-HEADER-INFO               
                                            BH-ACAT-INFO                        
             IF   BH-BROKER-ACTIVE                                              
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-CLT-NBR    (B1-SUB)              
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLT-NAME   (B1-SUB)              
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-SUB)              
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                       
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                        
                                         TO B1-STREAM     (B1-SUB)              
                   ELSE                                                         
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR                       
                                         TO B1-STREAM     (B1-SUB)              
                   END-IF                                                       
                   MOVE  BH-BROKER-STATUS                                       
                                         TO B1-STATUS     (B1-SUB)              
               IF  L-STREAM = 'Z'                                               
                   MOVE 'Z'              TO B1-STREAM     (B1-SUB)              
               END-IF                                                           
               IF  B1-STREAM (B1-SUB) = L-STREAM                                
               AND BH-ACAT-ACTIVE                                               
                   ADD 1 TO B1-ACTIVE-CNT                                       
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-SUB)              
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-SUB)              
                                        ' ' B1-CLT-NAME   (B1-SUB)              
                                    ' BKR ' B1-BKR-CLR-NO (B1-SUB)              
                                    ' STR ' B1-STREAM     (B1-SUB)              
                                    ' STA ' B1-STATUS     (B1-SUB)              
               ELSE                                                             
                   MOVE ' '              TO B1-ACAT-STATUS(B1-SUB)              
               END-IF                                                           
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                         
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  GET CLIENT FOR THIS STREAM, AND FETCH DATA                             
      *****************************************************************         
       2000-PROCESS    SECTION.                                                 
           MOVE '2000-PROCESS            ' TO W-ROUTINE-1.                      
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
              IF  B1-STREAM      (B1-SUB) = L-STREAM                            
              AND B1-STATUS      (B1-SUB) = 'A'                                 
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                                 
                  MOVE B1-CLT-NBR(B1-SUB) TO W-CURRENT-CLIENT                   
                  MOVE 0                  TO W-VRSTSEC-CLT-CNT                  
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT                     
                  IF W-VRSTSEC-CLT-CNT = 0                                      
                     PERFORM 7100-WRITE-NO-ACTIVITY THRU 7100-EXIT              
                  END-IF                                                        
              END-IF                                                            
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      * GET RESTRICTED SECURITIES FOR THIS CLIENT                               
      *****************************************************************         
       3000-FETCH-TRANFER SECTION.                                              
           MOVE '3000-FETCH        ' TO W-ROUTINE-1.                            
                                                                                
           EXEC SQL OPEN VRSTSEC_CURSOR END-EXEC                                
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-SEC-SQLCODE                                        
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VRSTSEC CURSOR OPEN ERROR '                              
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-SEC-SQLCODE NOT = +0                                 
                                                                                
              EXEC SQL                                                          
                   FETCH VRSTSEC_CURSOR                                         
               INTO                                                             
                    :DCLVRSTSEC.CLIENT-NBR                                      
                   ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSTSEC.TRNFR-MEMO-IND                                  
                   ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                              
                   ,:DCLVRSTSEC.RSTRD-MSG-TXT                                   
                   ,:DCLVRSTSEC.PRGM-NM                                         
                   ,:DCLVRSTSEC.CICS-TERM-ID-CD                                 
                   ,:DCLVRSTSEC.CRT-TMSTP                                       
                   ,:DCLVRSTSEC.UPDT-TMSTP                                      
                   ,:DCLVRSTSEC.SECURITY-ADP-NBR                                
                   ,:DCLVRSTSEC.EXPTN-DT                                        
                   ,:DCLVRSTSEC.COMMENT-TXT                                     
                   ,:DCLVRSTSEC.CICS-SGNON-ID                                   
                   ,:DCLVRSTSEC.TPSCRT-USR-NM                                   
                   ,:DCLVRSTSEC.TPSCRT-USR-ID                                   
                   ,:DCLVRSTSEC.CICS-NET-NM                                     
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              MOVE SQLCODE TO W-SEC-SQLCODE                                     
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       ADD 1 TO W-VRSTSEC-CNT                                   
                       PERFORM 4000-LOAD THRU 4000-EXIT                         
                  WHEN +100                                                     
                    IF W-VRSTSEC-CLT-CNT = 0                                    
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' CNT=' W-VRSTSEC-CLT-CNT                         
                              ' VRSTSEC FETCH NOT FOUND '                       
                              ' SQLCODE=' W-DB2-SQLCODE                         
                    ELSE                                                        
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' CNT=' W-VRSTSEC-CLT-CNT                         
                              ' VRSTSEC FETCH ENDED     '                       
                              ' SQLCODE=' W-DB2-SQLCODE                         
                    END-IF                                                      
                  WHEN OTHER                                                    
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' CNT=' W-VRSTSEC-CLT-CNT                         
                              ' VRSTSEC FETCH ERROR '                           
                              ' SQLCODE=' W-DB2-SQLCODE                         
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
                CLOSE VRSTSEC_CURSOR                                            
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-SEC-SQLCODE                                        
           IF  SQLCODE NOT = +0                                                 
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' VRSTSEC CURSOR CLOSE ERROR '                    
                              ' SQLCODE=' W-DB2-SQLCODE                         
                              ' W-VRSTSEC-CLT-CNT=' W-VRSTSEC-CLT-CNT           
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       4000-LOAD                SECTION.                                        
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' ' TO W-DTL2-DESC                                              
           MOVE 0   TO W-DTL3-SUB                                               
           MOVE ' ' TO W-DTL3-AREA                                              
DJ0001     MOVE ISIN-SEC-ISSUE-CD OF DCLVRSTSEC TO W-ISIN-SEC-ISSUE-CD          
           PERFORM 5000-GET-VRSTBRKR THRU 5000-EXIT                             
                                                                                
           PERFORM 7000-WRITE-REPORT THRU 7000-EXIT                             
                                                                                
           ADD 1 TO W-VRSTSEC-CLT-CNT.                                          
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      *****************************************************************         
      *  GET BROKERS WHO ARE RESTRICTED FOR THIS SECURITY                       
      *  MOVE BROKER NUMBER TO REPORT AREA. LOAD UP TO 14 BROKERS               
      *****************************************************************         
       5000-GET-VRSTBRKR        SECTION.                                        
           MOVE '5000-GET-VRSTBRKR    ' TO W-ROUTINE-1.                         
                                                                                
           EXEC SQL OPEN VRSTBRKR_CURSOR END-EXEC                               
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-BRK-SQLCODE                                        
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VRSTBRKR CURSOR OPEN ERROR '                             
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-BRK-SQLCODE NOT = +0                                 
                                                                                
              MOVE ' ' TO DCLVRSTBRKR                                           
              EXEC SQL                                                          
                   FETCH VRSTBRKR_CURSOR                                        
               INTO                                                             
                    :DCLVRSTBRKR.CLIENT-NBR                                     
                   ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                
                   ,:DCLVRSTBRKR.CRT-TMSTP                                      
                   ,:DCLVRSTBRKR.UPDT-TMSTP                                     
                   ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                
                   ,:DCLVRSTBRKR.PRGM-NM                                        
                   ,:DCLVRSTBRKR.SECURITY-ADP-NBR                               
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              MOVE SQLCODE TO W-BRK-SQLCODE                                     
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       ADD 1 TO W-VRSTBRKR-CNT                                  
                       IF  W-DTL3-SUB < 14                                      
                           ADD 1 TO W-DTL3-SUB                                  
                           MOVE BRKR-CONTRA-NBR OF DCLVRSTBRKR                  
                                      TO W-DTL3-TAB(W-DTL3-SUB)                 
                       END-IF                                                   
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' VRSTBRKR FETCH ERROR '                          
                              ' SQLCODE=' W-DB2-SQLCODE                         
DJ0001                        ' ISIN-SEC-ISSUE-CD=' W-ISIN-SEC-ISSUE-CD         
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
                CLOSE VRSTBRKR_CURSOR                                           
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-BRK-SQLCODE                                        
           IF  SQLCODE NOT = +0                                                 
                       DISPLAY 'CLT=' W-CURRENT-CLIENT                          
                              ' VRSTBRKR CURSOR CLOSE ERROR '                   
                              ' SQLCODE=' W-DB2-SQLCODE                         
                              ' W-VRSTSEC-CLT-CNT=' W-VRSTSEC-CLT-CNT           
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
       7000-WRITE-REPORT SECTION.                                               
                                                                                
           IF  (W-CURRENT-CLIENT NOT = W-PREV-CLIENT-NBR)                       
               MOVE 0                    TO W-PAGE-CNT                          
               MOVE 60                   TO W-LINE-CNT                          
           END-IF                                                               
           MOVE W-CURRENT-CLIENT         TO W-PREV-CLIENT-NBR                   
                                                                                
           IF  W-LINE-CNT > 55                                                  
               PERFORM 7500-WRITE-HDR THRU 7500-EXIT                            
           END-IF                                                               
                                                                                
           PERFORM 7300-WRITE-LINE THRU 7300-EXIT.                              
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-NO-ACTIVITY SECTION.                                          
                                                                                
           MOVE 0                    TO W-PAGE-CNT                              
           PERFORM 7500-WRITE-HDR THRU 7500-EXIT                                
                                                                                
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTLX-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7300-WRITE-LINE SECTION.                                                 
                                                                                
           PERFORM 7700-GETMSD THRU 7700-EXIT                                   
                                                                                
           MOVE ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                                
                                         TO W-DTL1-ISIN-SEC-ISSUE-CD            
           MOVE TRNFR-MEMO-IND     OF DCLVRSTSEC                                
                                         TO W-DTL1-TRNFR-MEMO-IND               
           IF  TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'B'                           
               MOVE 'BOTH'               TO W-DTL1-TRNFR-BRKR-TYPE-CD           
           ELSE                                                                 
               IF TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'D'                        
                  MOVE 'DLV '            TO W-DTL1-TRNFR-BRKR-TYPE-CD           
               ELSE                                                             
                IF TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'R'                       
                  MOVE 'RCV '            TO W-DTL1-TRNFR-BRKR-TYPE-CD           
                ELSE                                                            
                  MOVE '    '            TO W-DTL1-TRNFR-BRKR-TYPE-CD           
                END-IF                                                          
               END-IF                                                           
           END-IF                                                               
           MOVE RSTRD-MSG-TXT      OF DCLVRSTSEC                                
                                         TO W-DTL4-RSTRD-MSG-TXT                
           MOVE CICS-TERM-ID-CD    OF DCLVRSTSEC                                
                                         TO W-DTL1-CICS-TERM-ID-CD              
           MOVE CRT-TMSTP          OF DCLVRSTSEC                                
                                         TO W-DTL1-CRT-TMSTP                    
           MOVE UPDT-TMSTP         OF DCLVRSTSEC                                
                                         TO W-DTL1-UPDT-TMSTP                   
                                                                                
DJ0001     MOVE ' ' TO W-DTL1-CUSIP                                             
DJ0001     IF  MS-CUSIP-AREA > ' '                                              
DJ0001         MOVE MS-CUSIP-AREA TO W-DTL1-CUSIP                               
DJ0001         ADD 1 TO W-CUS-FND-CNT                                           
DJ0001     ELSE                                                                 
DJ0001         ADD 1 TO W-CUS-BLANK-CNT                                         
DJ0001         MOVE 'XX'        TO W-DTL1-CUSIP(2:2)                            
DJ0001         MOVE MS-ADP-NO   TO W-DTL1-CUSIP(4:7)                            
DJ0001     END-IF                                                               
                                                                                
           IF  EXPTN-DT OF DCLVRSTSEC = '0001-01-01'                            
               MOVE 'NO EXP DT '         TO W-DTL1-EXPTN-DT                     
           ELSE                                                                 
               MOVE EXPTN-DT       OF DCLVRSTSEC                                
                                         TO W-DTL1-EXPTN-DT                     
           END-IF                                                               
           MOVE COMMENT-TXT        OF DCLVRSTSEC                                
                                         TO W-DTL5-COMMENT-TXT                  
           MOVE CICS-SGNON-ID      OF DCLVRSTSEC                                
                                         TO W-DTL1-CICS-SGNON-ID                
           MOVE TPSCRT-USR-NM      OF DCLVRSTSEC                                
                                         TO W-DTL1-TPSCRT-USR-NM                
           MOVE TPSCRT-USR-ID      OF DCLVRSTSEC                                
                                         TO W-DTL1-TPSCRT-USR-ID                
           MOVE CICS-NET-NM        OF DCLVRSTSEC                                
                                         TO W-DTL1-CICS-NET-NM                  
                                                                                
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTL1-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTL2-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTL3-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTL4-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           MOVE W-DTL5-REC               TO REPT-LINE.                          
           WRITE REPT-REC.                                                      
           ADD 6                         TO W-LINE-CNT.                         
                                                                                
       7300-EXIT. EXIT.                                                         
      /                                                                         
       7500-WRITE-HDR    SECTION.                                               
                                                                                
           ADD  1                        TO W-PAGE-CNT.                         
                                                                                
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
                                                                                
           MOVE B1-CLT-NBR(B1-SUB)       TO W-HDR1-CLT.                         
           MOVE B1-CLT-NAME (B1-SUB)     TO W-HDR1-CLT-NAME.                    
                                                                                
           MOVE BPD-PROC-DATE(5:2)       TO W-HDR1-MM.                          
           MOVE BPD-PROC-DATE(7:2)       TO W-HDR1-DD.                          
           MOVE BPD-PROC-DATE(3:2)       TO W-HDR1-YY.                          
                                                                                
           MOVE W-HDR1-REC               TO REPT-LINE.                          
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           WRITE REPT-REC                                                       
                                                                                
           MOVE B1-BKR-CLR-NO (B1-SUB)   TO W-HDR2-BKR.                         
           MOVE W-SYS-MM                 TO W-HDR2-MM.                          
           MOVE W-SYS-DD                 TO W-HDR2-DD.                          
           MOVE W-SYS-YY                 TO W-HDR2-YY.                          
           MOVE W-SYS-HH                 TO W-HDR2-HH.                          
           MOVE W-SYS-MN                 TO W-HDR2-MN.                          
           MOVE W-HDR2-REC               TO REPT-LINE.                          
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           WRITE REPT-REC                                                       
                                                                                
           MOVE W-HDR3-REC               TO REPT-LINE.                          
           MOVE B1-CLT-NBR(B1-SUB)       TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL.                           
           WRITE REPT-REC                                                       
                                                                                
           MOVE 4                        TO W-LINE-CNT.                         
                                                                                
       7500-EXIT. EXIT.                                                         
      /                                                                         
       7700-GETMSD         SECTION.                                             
                                                                                
           MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA              
           MOVE ISIN-SEC-ISSUE-CD OF DCLVRSTSEC                                 
                                         TO GETMSD-SEARCH-KEY                   
           MOVE ZERO                     TO GETMSD-WI-CODE                      
           MOVE W-CURRENT-CLIENT         TO GETMSD-CLIENT-PL2                   
           CALL GETMSDC USING MASTER-SECURITY-RECORD                            
           IF  GETMSD-RETURN-VALID                                              
               ADD 1 TO W-MSD-FND-CNT                                           
               MOVE MS-DESC1             TO W-DTL2-DESC(01:30)                  
               MOVE MS-DESC2             TO W-DTL2-DESC(32:30)                  
               MOVE MS-DESC3             TO W-DTL2-DESC(63:30)                  
           ELSE                                                                 
               ADD 1 TO W-SEC-NOTFND-CNT                                        
                     DISPLAY 'CLT=' W-CURRENT-CLIENT                            
DJ0001                       ' SEC ' ISIN-SEC-ISSUE-CD OF DCLVRSTSEC            
                             ' NOT FND ON MSD FOR '                             
                             ' ' MS-DESC1 ' ' MS-DESC2                          
                     MOVE '(SECURITY NOT FOUND IN MSD)'                         
                                            TO W-DTL2-DESC(94:27)               
           END-IF.                                                              
                                                                                
       7700-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-VRSTSEC-CNT                                
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           DISPLAY 'CAT732R: U3999 - ABENDING ON BAD DB2 STATUS'                
           DISPLAY 'CAT732R: INFILE  COUNT      = ' W-VRSTSEC-CNT               
           DISPLAY 'CAT732R: W-VRSTSEC-CLT-CNT  = ' W-VRSTSEC-CLT-CNT   NT      
           DISPLAY 'CAT732R: PROGRAM ENDED ABNORMALLY'                          
           MOVE +3999 TO ABEND-CD                                               
           CALL  ABEND  USING ABEND-CD.                                         
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
                                                                                
           CLOSE REPT-FILE.                                                     
           DISPLAY 'CAT732R: REPORT   CLOSED. STATUS = ' REPT-STAT              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT732R: W-VRSTSEC-CNT    = ' W-VRSTSEC-CNT                 
           DISPLAY 'CAT732R: W-VRSTBRKR-CNT   = ' W-VRSTBRKR-CNT                
           DISPLAY 'CAT732R: W-MSD-FND-CNT    = ' W-MSD-FND-CNT                 
           DISPLAY 'CAT732R: W-SEC-NOTFND-CNT = ' W-SEC-NOTFND-CNT              
DJ0001     DISPLAY 'CAT732R: W-CUS-FND-CNT    = ' W-CUS-FND-CNT                 
DJ0001     DISPLAY 'CAT732R: W-CUS-BLANK-CNT  = ' W-CUS-BLANK-CNT               
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT732R: PROGRAM ENDED SUCCESSFULLY'.                       
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
