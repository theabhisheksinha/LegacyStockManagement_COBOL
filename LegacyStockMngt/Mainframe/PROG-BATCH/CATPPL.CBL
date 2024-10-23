000001* PDX    - CATPPL   C0272583 11/03/08 09:06:31 TBLAMUR            00001000
LRM001* SSR 0061164 ALLOW INITIATION WITH FUND COMPANY.                         
000001* PDX    - CATPPL   C0208114 07/06/04 09:58:17 TBLAMUR            00001000
000001* PDX    - CATPPL   C0184969 04/16/03 14:34:01 TBLAMUR            00001000
      * SSR 0024350 CHANGE FROM SIAC 018 FILE TO SIAC 068.                      
000001* PDX    - CATPPL   C0184969 01/15/03 08:24:02 TBLAMUR            00001000
000001* PDX    - CATPPL   C0158444 05/07/01 11:05:55 TBLAMUR            00001000
000001* PDX    - CATPPL   C0149951 02/08/01 15:57:52 TBTIKUO            00001000
000001* PDX    - CATPPL   C0130013 08/18/99 11:13:45 TBTIKUO            00001000
000001* PDX    - CATPPL   C0115132 10/30/98 08:15:50 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CATPPL.                                                     
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  MAY 1998.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *INPUT FILES:                                                             
      *   SIAC 068 FILE                                                         
      *   DB2 TABLE VPRTCPPF                                                    
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      *     UPDATE PARTICIPANT PROFILE TABLE                                    
      *                                                                         
      *PROGRAM LOGIC:                                                           
      *   MERGE DB2 TABLE AND SIAC 068 FILE.  ADD, UPDATE AND DELETE            
      *   AS NEEDED. ONLY DELETE THE DB2 PARTICIPANT WHEN MISSING FROM          
      *   SIAC 068 AND NO ACTIVE TIF FOUND.                                     
      *OUTPUT FILES:                                                            
      *   NONE                                                                  
      *                                                                         
      *OUTPUT DB2 TABLES:                                                       
      *   ACAT_PRTCP_PROFILE(VPRTCPPF)                                          
      *                                                                         
      *---------------------------------------------------------------*         
      *    CHANGE HISTORY:                                            *         
      *                                                               *         
      *      DATE    PGMR    SSR            CHANGE                    *         
      *      ----    ----    ---            ------                    *         
      *    05/11/98   LRM  XXXXXX   PROGRAM CREATED.                  *         
      *                                                               *         
      *    08/16/99   TCK  3440500  ADD BANK CLEARING NUMBER          *         
      *               PDX# 0130013                                    *         
      *    11/13/00   TCK           COBOL LE (TCK002)                 *         
      *    01/13/03   LRM  0024350  SIAC 068 FILE                     *         
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.  IBM-370.                                               
       OBJECT-COMPUTER.  IBM-370.                                               
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SKIP2                                                                
           SELECT SIAC068-FILE              ASSIGN TO  SIAC068.                 
           SELECT ACATS-PARTICIPANT-EXTRACT ASSIGN TO  PRTFLE.                  
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  SIAC068-FILE                                                         
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  SIAC068-RECORD              PIC X(80).                               
                                                                                
       FD  ACATS-PARTICIPANT-EXTRACT                                            
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  PARTICIPANT-RECORD          PIC X(150).                              
                                                                                
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  WS-NAME                          PIC X(40)                           
           VALUE 'CATPPL WORKING STORAGE STARTS HERE'.                          
       COPY SIAC0068.                                                           
       COPY ACATPRTC.                                                           
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_PRTCP_PROFILE TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VPRTCPPF                                                 
           END-EXEC.                                                            
      *--------------------------------------------------------------           
      *DCLGEN FOR ACCTIVE TRANSFER TABLE                                        
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNFR                                                   
           END-EXEC.                                                            
                                                                                
094500******************************************************************        
094600* DECLARE CURSOR FOR PARTICIPANTS IN PART NUMBER SEQ             *        
094800******************************************************************        
094900 01  FILLER                        PIC X(008) VALUE 'CURSOR'.             
095000     EXEC SQL                                                             
095100          DECLARE VPRTCPPF_CURSOR CURSOR WITH HOLD FOR                    
095200          SELECT                                                          
                 PRTCP_NBR                                                      
                ,BRKR_TIF_IND                                                   
                ,PRTCP_TYPE_CD                                                  
                ,PRTCP_NM                                                       
                ,FUND_SRV_ELGBL_IND                                             
                ,CRT_TMSTP                                                      
                ,UPDT_TMSTP                                                     
                ,CICS_TERM_ID_CD                                                
                ,PRGM_NM                                                        
           FROM    VPRTCPPF                                                     
            ORDER BY PRTCP_NBR                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
       01  COUNTERS COMP-3.                                                     
           05  SIAC068-IN-COUNT             PIC 9(11) VALUE 0.                  
           05  WS-NSCCP-HDR-RECORD-COUNT    PIC 9(11) VALUE 0.                  
           05  SIAC068-RECORDS-NOT-DELETED  PIC 9(11) VALUE 0.                  
           05  SIAC068-RECORDS-SKIPPED      PIC 9(11) VALUE 0.                  
           05  W-VPRTCPPF-ROWS-FETCHED      PIC 9(11) VALUE 0.                  
           05  W-RECORDS-INSERTED           PIC 9(11) VALUE 0.                  
TCK001     05  W-RECORDS-UPDATED            PIC 9(11) VALUE 0.                  
           05  W-RECORDS-DELETED            PIC 9(11) VALUE 0.                  
           05  W-PARTICIPANTS-WRITTEN       PIC 9(11) VALUE 0.                  
                                                                                
TCK002 COPY STUBCPY.                                                            
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
                                                                                
       01  WORK-AREA.                                                           
           05  W-DB2-PRTCP-NBR         PIC X(04) VALUE SPACES.                  
           05  PROGRAM-NAME            PIC X(08) VALUE 'CATPPL '.               
           05  W-DB2-SQLCODE           PIC ---9.                                
           05  ABORT-CODE   COMP SYNC  PIC S9(4) VALUE ZERO.                    
           05  WS-TIMESTAMP            PIC X(26).                               
           05  W-COMMIT-CNT            PIC 9(09) COMP-3                         
                                                       VALUE 0.                 
           05  W-SQL-UPDATE-COUNT      PIC 9(09) COMP-3                         
                                                       VALUE 0.                 
           05  COMMIT-SQLCA            PIC  X(122).                             
           05  COMMIT-RETURN           PIC S9(009) COMP.                        
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           EJECT                                                                
                                                                                
       01  SWITCHES-AND-FLAGS.                                                  
           05  EOF-SWITCHES.                                                    
               10  SIAC068-EOF-SW           PIC X     VALUE 'N'.                
                   88  SIAC068-EOF                    VALUE 'Y'.                
               10  WS-VRTCPPF-EOF-SW        PIC X     VALUE 'N'.                
                   88  VPRTCPPF-EOF                   VALUE 'Y'.                
                                                                                
CHRIS1                                                                          
CHRIS1 01  DSNTIAR                     PIC X(08) VALUE 'DSNTIAR'.               
CHRIS1 01  W-DB2-MESSAGE-AREA.                                                  
CHRIS1      05  W-DB2-MSG-LEN           PIC S9(04) COMP VALUE +960.             
CHRIS1      05  WS-ERROR-MSG            PIC X(80) OCCURS 12 TIMES               
CHRIS1              INDEXED BY WS-ERROR-INDEX.                                  
CHRIS1 01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.               
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
               88  PARM-LENGTH-VALID                    VALUE +16.              
           05  PARM-INFO.                                                       
               10  PARM-BYPASS-DATECK       PIC X(01).                          
           EJECT                                                                
                                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
           COPY MSGCOBO.                                                        
           PERFORM 0100-INITIALIZATION.                                         
                                                                                
           PERFORM 1000-PROCESS          THRU 1000-EXIT                         
                 UNTIL SIAC068-EOF                                              
                   AND VPRTCPPF-EOF.                                            
                                                                                
           CLOSE SIAC068-FILE.                                                  
           CLOSE ACATS-PARTICIPANT-EXTRACT                                      
                                                                                
           DISPLAY 'DB2 BROKERS READ    ' W-VPRTCPPF-ROWS-FETCHED.              
           DISPLAY 'SIAC RECORDS READ   ' SIAC068-IN-COUNT.                     
           DISPLAY 'SIAC RECORDS SKIPPED' SIAC068-RECORDS-SKIPPED.              
           DISPLAY 'DELETES SKIPPED     ' SIAC068-RECORDS-NOT-DELETED           
           DISPLAY 'RECORDS INSERTED    ' W-RECORDS-INSERTED.                   
TCK001     DISPLAY 'RECORDS UPDATED     ' W-RECORDS-UPDATED.                    
           DISPLAY 'RECORDS DELETED     ' W-RECORDS-DELETED.                    
           DISPLAY 'PARTICIPANTS EXTR   ' W-PARTICIPANTS-WRITTEN.               
           DISPLAY 'DB2 COMMITS         ' W-COMMIT-CNT.                         
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
       0100-INITIALIZATION.                                                     
           MOVE  'CATPPL  '                   TO BPDATES-CALLING-PGM.           
           MOVE  'C'                          TO BPDATES-REQ-TYPE.              
                                                                                
           CALL    BPDATES            USING BPDATES-PARAMETERS.                 
           EXEC SQL                                                             
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                            
           END-EXEC.                                                            
           DISPLAY 'DB2 SYSTEM CURRENT TIMESTAMP ' WS-TIMESTAMP.                
           DISPLAY 'PROCESS DATE ' BPD-PROC-DATE.                               
                                                                                
           PERFORM 0110-VERIFY-SIAC0068-REC-COUNT.                              
                                                                                
           OPEN INPUT SIAC068-FILE.                                             
           READ SIAC068-FILE INTO NSCCP-RECORD                                  
               AT END                                                           
                   SET SIAC068-EOF TO TRUE                                      
                   DISPLAY 'AT EOF ON SIAC 068 FILE'                            
                   MOVE HIGH-VALUES TO NSCCP-PARTICIPANT-NBR                    
           END-READ.                                                            
                                                                                
           EXEC SQL OPEN VPRTCPPF_CURSOR END-EXEC.                              
           IF SQLCODE NOT = +0                                                  
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              DISPLAY 'VPRTCPPF CURSOR OPEN ERROR '                             
                            'SQLCODE = ' W-DB2-SQLCODE                          
              DISPLAY 'PROGRAM ABENDS'                                          
              MOVE 1000 TO ABORT-CODE                                           
              PERFORM SQL-ERROR-ROUTINE                                         
           END-IF.                                                              
           PERFORM 3000-FETCH-VPRTCPPF.                                         
                                                                                
           IF NOT SIAC068-EOF                                                   
              PERFORM 2000-READ-SIAC068 THRU 2000-EXIT                          
           END-IF.                                                              
           OPEN OUTPUT ACATS-PARTICIPANT-EXTRACT.                               
                                                                                
       0110-VERIFY-SIAC0068-REC-COUNT.                                          
           OPEN INPUT SIAC068-FILE.                                             
           READ SIAC068-FILE INTO NSCCP-RECORD                                  
               AT END                                                           
                   SET SIAC068-EOF TO TRUE                                      
                   DISPLAY 'AT EOF ON SIAC 068 FILE'                            
                   MOVE HIGH-VALUES TO NSCCP-PARTICIPANT-NBR                    
           END-READ.                                                            
                                                                                
           ADD 1 TO SIAC068-IN-COUNT.                                           
           IF NOT NSCCP-HDR-RECORD                                              
              DISPLAY 'CATPPL NO HEADER RECORD ON SIAC 068 FILE'                
              DISPLAY 'PROGRAM ABENDS'                                          
              MOVE 1100 TO ABORT-CODE                                           
              PERFORM 9999-ABEND                                                
           END-IF.                                                              
                                                                                
           IF NOT NSCCP-HDR-FILE-068                                            
              DISPLAY 'CATPPL WRONG FILE ID ON SIAC 068 FILE HEADER'            
              DISPLAY 'PROGRAM ABENDS'                                          
              MOVE 1200 TO ABORT-CODE                                           
              PERFORM 9999-ABEND                                                
           END-IF.                                                              
                                                                                
           IF NSCCP-HDR-CCYYMMDD NOT = BPD-PROC-DATE                            
              DISPLAY 'CATPPL WRONG DATE ON SIAC 068 FILE HEADER'               
              DISPLAY '068 = ' NSCCP-HDR-CCYYMMDD                               
              DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE                           
              IF PARM-BYPASS-DATECK = '1'                                       
                 DISPLAY 'DATE ERROR BYPASSED DUE TO PARM'                      
              ELSE                                                              
                 DISPLAY 'PROGRAM ABENDS'                                       
                 MOVE 1300 TO ABORT-CODE                                        
                 PERFORM 9999-ABEND                                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCP-HDR-RECORD-COUNT NUMERIC                                    
              DISPLAY 'SIAC 0068 FILE HEADER DETAIL COUNT '                     
                                     NSCCP-HDR-RECORD-COUNT                     
           END-IF.                                                              
                                                                                
           IF  NSCCP-HDR-RECORD-COUNT NOT NUMERIC                               
              DISPLAY 'CATPPL HEADER RECORD ON SIAC 068 FILE'                   
              DISPLAY '  HAS BAD NON NUMERIC RECORD COUNT IN 64-73'             
              DISPLAY 'PROGRAM ABENDS'                                          
              MOVE 1400 TO ABORT-CODE                                           
              PERFORM 9999-ABEND                                                
           END-IF.                                                              
                                                                                
           MOVE NSCCP-HDR-RECORD-COUNT TO WS-NSCCP-HDR-RECORD-COUNT             
           PERFORM 2000-READ-SIAC068 THRU 2000-EXIT                             
               UNTIL SIAC068-EOF.                                               
                                                                                
           IF SIAC068-IN-COUNT NOT = WS-NSCCP-HDR-RECORD-COUNT                  
              DISPLAY 'CATPPL HEADER RECORD ON SIAC 068 FILE'                   
              DISPLAY '  HAS RECORD COUNT NOT MATCHING DETAIL COUNT'            
              DISPLAY 'HEADER RECORD 64-73 ' WS-NSCCP-HDR-RECORD-COUNT          
              DISPLAY 'DETAIL RECORDS COUNTED ' SIAC068-IN-COUNT                
              DISPLAY 'PROGRAM ABENDS'                                          
              MOVE 1500 TO ABORT-CODE                                           
              PERFORM 9999-ABEND                                                
           END-IF.                                                              
                                                                                
           MOVE 'N'   TO SIAC068-EOF-SW.                                        
           MOVE ZEROS TO  SIAC068-IN-COUNT                                      
           CLOSE SIAC068-FILE.                                                  
                                                                                
       1000-PROCESS.                                                            
                                                                                
                                                                                
           IF NSCCP-PARTICIPANT-NBR = W-DB2-PRTCP-NBR                           
              PERFORM 4000-UPDATE-VPRTCPPF THRU 4000-EXIT                       
              PERFORM 2000-READ-SIAC068 THRU 2000-EXIT                          
              PERFORM 3000-FETCH-VPRTCPPF                                       
           ELSE                                                                 
           IF NSCCP-PARTICIPANT-NBR < W-DB2-PRTCP-NBR                           
              PERFORM 5000-INSERT-VPRTCPPF THRU 5000-EXIT                       
              PERFORM 2000-READ-SIAC068 THRU 2000-EXIT                          
           ELSE                                                                 
              PERFORM 6000-DELETE-VPRTCPPF THRU 6000-EXIT                       
              PERFORM 3000-FETCH-VPRTCPPF                                       
           END-IF.                                                              
           IF  W-SQL-UPDATE-COUNT > 10                                          
               PERFORM 8100-COMMIT.                                             
                                                                                
       1000-EXIT. EXIT.                                                         
           EJECT                                                                
                                                                                
      /                                                                         
       2000-READ-SIAC068.                                                       
                                                                                
           READ SIAC068-FILE INTO NSCCP-RECORD                                  
               AT END                                                           
                   SET SIAC068-EOF TO TRUE                                      
                   MOVE HIGH-VALUES TO NSCCP-PARTICIPANT-NBR                    
                   DISPLAY 'REACHED EOF ON SIAC 068 FILE'                       
                   GO TO 2000-EXIT.                                             
                                                                                
           ADD 1 TO SIAC068-IN-COUNT.                                           
           IF NSCCP-BANK                                                        
           OR NSCCP-BROKER                                                      
LRM001     OR NSCCP-FUND                                                        
              CONTINUE                                                          
           ELSE                                                                 
              ADD 1 TO SIAC068-RECORDS-SKIPPED                                  
              GO TO 2000-READ-SIAC068.                                          
TEST       DISPLAY 'READ SIAC 068 ' NSCCP-PARTICIPANT-NBR.                      
       2000-EXIT. EXIT.                                                         
           EJECT                                                                
                                                                                
       3000-FETCH-VPRTCPPF.                                                     
           EXEC SQL                                                             
                FETCH VPRTCPPF_CURSOR                                           
            INTO                                                                
                 :DCLVPRTCPPF.PRTCP-NBR                                         
                ,:DCLVPRTCPPF.BRKR-TIF-IND                                      
                ,:DCLVPRTCPPF.PRTCP-TYPE-CD                                     
                ,:DCLVPRTCPPF.PRTCP-NM                                          
                ,:DCLVPRTCPPF.FUND-SRV-ELGBL-IND                                
                ,:DCLVPRTCPPF.CRT-TMSTP                                         
                ,:DCLVPRTCPPF.UPDT-TMSTP                                        
                ,:DCLVPRTCPPF.CICS-TERM-ID-CD                                   
                ,:DCLVPRTCPPF.PRGM-NM                                           
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           EVALUATE SQLCODE                                                     
               WHEN +0                                                          
                    MOVE PRTCP-NBR TO W-DB2-PRTCP-NBR                           
                    ADD 1 TO W-VPRTCPPF-ROWS-FETCHED                            
TEST                DISPLAY 'FETCHED ' W-DB2-PRTCP-NBR                          
               WHEN +100                                                        
                    DISPLAY ' VPRTCPPF CURSOR FETCH NOT FOUND '                 
                            ' SQLCODE = ' W-DB2-SQLCODE                         
                    MOVE HIGH-VALUES TO W-DB2-PRTCP-NBR                         
                    SET VPRTCPPF-EOF TO TRUE                                    
               WHEN OTHER                                                       
                    DISPLAY ' VPRTCPPF CURSOR FETCH ERROR '                     
                            ' SQLCODE = ' W-DB2-SQLCODE                         
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
TCK001 3000-EXIT. EXIT.                                                         
TCK001     EJECT                                                                
      /                                                                         
TCK001 4000-UPDATE-VPRTCPPF.                                                    
                                                                                
           MOVE NSCCP-PARTICIPANT-NAME TO PRTCP-NM.                             
TCK001     EXEC SQL                                                             
TCK001          UPDATE VPRTCPPF                                                 
TCK001          SET PRTCP_NM   = :PRTCP-NM                                      
               ,PRTCP_TYPE_CD  = :NSCCP-PARTICIPANT-TYPE                        
TCK001         ,UPDT_TMSTP     = :WS-TIMESTAMP                                  
TCK001         ,PRGM_NM        = 'CATPPL'                                       
TCK001            WHERE PRTCP_NBR = :NSCCP-PARTICIPANT-NBR                      
TCK001     END-EXEC.                                                            
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
TCK001     EVALUATE TRUE                                                        
TCK001         WHEN SQLCODE = +0                                                
TCK001             ADD 1            TO  W-RECORDS-UPDATED                       
                                        W-SQL-UPDATE-COUNT                      
TCK001         WHEN OTHER                                                       
TCK001             DISPLAY '* PROBLEM WITH UPDATE VPRTCPPF *'                   
                   DISPLAY 'FOR PARTICIPANT ' NSCCP-PARTICIPANT-NBR             
                   DISPLAY  'SQLCODE = ' W-DB2-SQLCODE                          
TCK001             PERFORM SQL-ERROR-ROUTINE                                    
TCK001     END-EVALUATE.                                                        
                                                                                
           MOVE SPACES TO WS-ACAT-PARTICIPANT-RECORD                            
           MOVE PRTCP-NBR           TO WS-PRTCP-NBR                             
           MOVE BRKR-TIF-IND        TO WS-BRKR-TIF-IND                          
           MOVE PRTCP-TYPE-CD       TO WS-PRTCP-TYPE-CD                         
           MOVE PRTCP-NM            TO WS-PRTCP-NM                              
           MOVE FUND-SRV-ELGBL-IND  TO WS-FUND-SRV-ELGBL-IND                    
           MOVE CRT-TMSTP   OF DCLVPRTCPPF TO WS-CRT-TMSTP                      
           MOVE UPDT-TMSTP  OF DCLVPRTCPPF TO WS-UPDT-TMSTP                     
           MOVE NSCCP-COST-BASIS-ELIGABLE  TO WS-PRT-COST-BASIS-IND             
           WRITE PARTICIPANT-RECORD                                             
                        FROM WS-ACAT-PARTICIPANT-RECORD                         
           ADD 1 TO W-PARTICIPANTS-WRITTEN.                                     
TCK001 4000-EXIT. EXIT.                                                         
TCK001     EJECT                                                                
      /                                                                         
       5000-INSERT-VPRTCPPF.                                                    
           INITIALIZE DCLVPRTCPPF.                                              
                                                                                
           MOVE 'CATPPL'               TO PRGM-NM OF DCLVPRTCPPF.               
           MOVE NSCCP-PARTICIPANT-NAME TO PRTCP-NM.                             
           EXEC SQL                                                             
               INSERT INTO VPRTCPPF                                             
               (                                                                
                 PRTCP_NBR                                                      
                ,BRKR_TIF_IND                                                   
                ,PRTCP_TYPE_CD                                                  
                ,PRTCP_NM                                                       
                ,FUND_SRV_ELGBL_IND                                             
                ,CRT_TMSTP                                                      
                ,UPDT_TMSTP                                                     
                ,CICS_TERM_ID_CD                                                
                ,PRGM_NM                                                        
               )                                                                
               VALUES                                                           
               (                                                                
                 :NSCCP-PARTICIPANT-NBR                                         
                ,'N'                                                            
                ,:NSCCP-PARTICIPANT-TYPE                                        
                ,:PRTCP-NM                                                      
                ,'N'                                                            
                ,:WS-TIMESTAMP                                                  
                ,:WS-TIMESTAMP                                                  
                ,'    '                                                         
                ,:PROGRAM-NAME                                                  
               )                                                                
           END-EXEC                                                             
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0                                                
                   ADD 1            TO  W-RECORDS-INSERTED                      
                                        W-SQL-UPDATE-COUNT                      
                   DISPLAY 'INSERTED ' NSCCP-PARTICIPANT-NBR                    
                                   ' ' PRTCP-NM                                 
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH INSERT VPRTCPPF *'                   
                   DISPLAY  'SQLCODE = ' W-DB2-SQLCODE                          
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
           MOVE SPACES TO WS-ACAT-PARTICIPANT-RECORD                            
           MOVE NSCCP-PARTICIPANT-NBR TO WS-PRTCP-NBR                           
           MOVE 'N'                 TO WS-BRKR-TIF-IND                          
           MOVE NSCCP-PARTICIPANT-TYPE TO WS-PRTCP-TYPE-CD                      
           MOVE PRTCP-NM            TO WS-PRTCP-NM                              
           MOVE 'N'                 TO WS-FUND-SRV-ELGBL-IND                    
           MOVE CRT-TMSTP   OF DCLVPRTCPPF TO WS-CRT-TMSTP                      
           MOVE UPDT-TMSTP  OF DCLVPRTCPPF TO WS-UPDT-TMSTP                     
           MOVE NSCCP-COST-BASIS-ELIGABLE  TO WS-PRT-COST-BASIS-IND             
           WRITE PARTICIPANT-RECORD                                             
                        FROM WS-ACAT-PARTICIPANT-RECORD                         
           ADD 1 TO W-PARTICIPANTS-WRITTEN.                                     
       5000-EXIT. EXIT.                                                         
           EJECT                                                                
      /                                                                         
       6000-DELETE-VPRTCPPF.                                                    
      * FIRST VERIFY THERE ARE NO ACTIVE TIFS FOR THIS BROKER NBR               
           EXEC SQL SELECT                                                      
                ACAT_CONTROL_NBR                                                
             INTO                                                               
                :DCLVTRNFR.ACAT-CONTROL-NBR                                     
             FROM VTRNFR                                                        
            WHERE   RCV_NBR = :W-DB2-PRTCP-NBR                                  
              OR   DLVR_NBR = :W-DB2-PRTCP-NBR                                  
            WITH UR                                                             
           END-EXEC.                                                            
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR -811                                        
                   DISPLAY 'DELETE SKIPPED FOR ' W-DB2-PRTCP-NBR                
                     ' CONTROL NUMBER FOUND ' ACAT-CONTROL-NBR                  
                   ADD 1 TO SIAC068-RECORDS-NOT-DELETED                         
                   MOVE SPACES TO WS-ACAT-PARTICIPANT-RECORD                    
                   MOVE PRTCP-NBR           TO WS-PRTCP-NBR                     
                   MOVE BRKR-TIF-IND        TO WS-BRKR-TIF-IND                  
                   MOVE PRTCP-TYPE-CD       TO WS-PRTCP-TYPE-CD                 
                   MOVE PRTCP-NM            TO WS-PRTCP-NM                      
                   MOVE FUND-SRV-ELGBL-IND  TO WS-FUND-SRV-ELGBL-IND            
                   MOVE CRT-TMSTP   OF DCLVPRTCPPF TO WS-CRT-TMSTP              
                   MOVE UPDT-TMSTP  OF DCLVPRTCPPF TO WS-UPDT-TMSTP             
                   MOVE SPACES          TO WS-PRT-COST-BASIS-IND                
                   WRITE PARTICIPANT-RECORD                                     
                                FROM WS-ACAT-PARTICIPANT-RECORD                 
                   ADD 1 TO W-PARTICIPANTS-WRITTEN                              
                   GO TO 6000-EXIT                                              
               WHEN SQLCODE = +100                                              
                   CONTINUE                                                     
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH VTRNFR READ *'                       
                   DISPLAY 'FOR PARTICIPANT ' W-DB2-PRTCP-NBR                   
                   DISPLAY  'SQLCODE = ' W-DB2-SQLCODE                          
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EXEC SQL                                                             
               DELETE FROM VPRTCPPF                                             
                WHERE PRTCP_NBR = :W-DB2-PRTCP-NBR                              
           END-EXEC.                                                            
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0                                                
                   DISPLAY 'DELETED BROKER ' W-DB2-PRTCP-NBR                    
                   ADD 1            TO  W-RECORDS-DELETED                       
                                        W-SQL-UPDATE-COUNT                      
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VPRTCPPF *'                   
                   DISPLAY 'FOR PARTICIPANT ' W-DB2-PRTCP-NBR                   
                   DISPLAY  'SQLCODE = ' W-DB2-SQLCODE                          
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
       6000-EXIT. EXIT.                                                         
           EJECT                                                                
      /                                                                         
       8100-COMMIT.                                                             
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CATPPL: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
               DISPLAY 'COMMIT OK ' W-COMMIT-CNT                                
           END-IF.                                                              
           MOVE ZERO TO W-SQL-UPDATE-COUNT.                                     
      /                                                                         
                                                                                
      *============================                                             
       SQL-ERROR-ROUTINE.                                                       
      *============================                                             
CHRIS1                                                                          
CHRIS1     CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
CHRIS1                              WS-ERR-LINE-LEN.                            
CHRIS1     PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
CHRIS1       UNTIL WS-ERROR-INDEX GREATER THAN 12                               
CHRIS1             IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                    
CHRIS1                DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)                     
CHRIS1             END-IF                                                       
CHRIS1     END-PERFORM.                                                         
CHRIS1                                                                          
CHRIS1     DISPLAY 'CATPPL DB2 PROBLEM'.                                        
CHRIS1     DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1     DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1     DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
