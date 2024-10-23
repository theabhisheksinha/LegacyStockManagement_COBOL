000001* PDX    - ACATRST  C0346519 12/04/13 14:20:20 TBLAMUR            00001000
LRM006* SSR 96477 ADD LOOKUP OF BANK DEPOSIT FUNDS (BDF)                        
000001* PDX    - ACATRST  C0278346 03/16/09 16:06:05 TBLAMUR            00001000
LRM005* SSR 61867 USE ADP-NO TO ACCESS VRSTSEC AND VRSTBRKR                     
000001* PDX    - ACATRST  C0239585 09/22/06 11:27:22 TBLAMUR            00001000
LRM004* SSR 48434 RECOMPILE TO USE EXPANDED COPY FACZ1CA                        
LRM004* SSR 48634 CORRECT ISIN LOOKUP TO NOT FALSELY RETURN RESTRICT            
000001* PDX    - ACATRST  C0231507 06/12/06 11:12:09 TBLAMUR            00001000
LRM003* SSR 45744 LOOKUP ACCOUNT FREEZE VIA CALLING FREEZE MODULE               
000001* PDX    - ACATRST  C0227932 12/12/05 08:38:30 TBLAMUR            00001000
LRM002* SSR 42405 EDIT CONTRA ACCOUNT AGAINST B1 434730 EDIT PATTERN            
000001* PDX    - ACATRST  C0222033 06/06/05 13:06:55 TBLAMUR            00001000
000001* PDX    - ACATRST  C0109165 11/03/98 17:07:11 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACATRST.                                          00020000
       AUTHOR.        LARRY MUREY.                                      00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS       * 00070000
      *   TO VERIFY RESTRICTIONS OF BROKER, ACCOUNT OR CUSIP.         * 00070000
LRM001* CORRECT RESTRICTED LOOKUP FOR R/D ONLY                        *         
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       COPY PDXIDCOB.                                                   00120002
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACATRST WORKING STORAGE BEGINS HERE'.                 00480000
                                                                        00490000
           SKIP3                                                        00540000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACATRST DETECTED ABEND'.                                          
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.              
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-ROW-COUNT                PIC S9(4) COMP VALUE +0.     00444000
           05  WS-RESP                     PIC S9(8) COMP.              00444000
           05  WS-SEC-DESC                 PIC X(30).                           
           05  SUB                         PIC S9(04) COMP.                     
LRM002     05  SUB2                        PIC S9(04) COMP.                     
LRM002     05  WS-EDIT-MASK                PIC X(20).                           
LRM002     05  WS-EDIT-NBR                 PIC X(2)   VALUE SPACES.             
LRM002     05  WS-SPECIFIC-CHAR-FLAG       PIC X      VALUE 'N'.                
LRM002         88  SPECIFIC-CHAR-MISMATCH             VALUE 'F'.                
LRM002         88  SPECIFIC-CHAR-MATCHED              VALUE 'M'.                
LRM002         88  SPECIFIC-CHAR-NOTFND               VALUE 'N'.                
LRM002     05  WS-ABN-TEST-FLAG            PIC X      VALUE 'P'.                
LRM002         88  A-B-N-TEST-PASS                    VALUE 'P'.                
LRM002         88  A-B-N-TEST-FAIL                    VALUE 'F'.                
                                                                                
           EJECT                                                                
       01  WS-ACATRSIO-AREA.                                                    
           COPY ACATRSIO.                                               01510000
                                                                                
       01  WS-PRNGFL-RECORD.                                            00300000
           03  WS-PRNGFL-KEY.                                           00301000
               05  WS-PRNG-HIGH-NBR      PIC X(7).                      00302000
           03  WS-PRNG-LOW-NBR           PIC X(7).                      00303000
           03  WS-PRNG-CLIENT            PIC X(3).                      00304000
           03  FILLER                    PIC X(63).                     00305000
                                                                        00306000
LRM002 01  B1-PARM-AREA.                                                        
LRM002     05  B1-REQUEST-AREA.                                                 
LRM002         10  B1-CLIENT                PIC 9(03).                          
LRM002         10  B1-REC-CODE              PIC 9(03).                          
LRM002         10  B1-CARD-NUM              PIC X(06).                          
LRM002     05  B1-RETURN-AREA.                                                  
LRM002         10  B1-RETURN-CODE           PIC X(01).                          
LRM002         10  B1-INFO-AREA             PIC X(17200).                       
LRM002                                                                          
LRM002     COPY  BHACAT.                                                        
           EJECT                                                                
LRM003     COPY FACZ1CA REPLACING ==:P:== BY ==FRZ==.                           
           EJECT                                                                
           EXEC SQL                                                             
           INCLUDE SQLCA                                                        
           END-EXEC                                                             
                                                                                
      *DCLGEN FOR RESTRICTED BROKER TABLE.                                      
014700     EXEC SQL                                                     01400000
               INCLUDE VRSTBRKR                                         01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR RESTRICTED ACCOUNT TABLE.                                     
014700*    EXEC SQL                                                     01400000
      *        INCLUDE VRSTACCT                                         01410000
014900*    END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR RESTRICTED SECURITY TABLE.                                    
014700     EXEC SQL                                                     01400000
               INCLUDE VRSTSEC                                          01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
           EJECT                                                                
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA.                                                 01490000
           05  FILLER              PIC X(200).                                  
                                                                                
       EJECT                                                                    
      **********************************************************        01590000
      *****   P R O C E D U R E   D I V I S I O N           *****       01600000
      **********************************************************        01610000
       PROCEDURE DIVISION.                                              01620000
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-ACATRSIO-AREA.                  
           IF EIBCALEN NOT > ZERO                                               
              EXEC CICS RETURN END-EXEC.                                        
                                                                                
           IF ACATRSIO-VERIFY-ACCOUNT                                           
               PERFORM 0200-VERIFY-ACCOUNT-RTN                          09130000
           ELSE                                                                 
           IF ACATRSIO-VERIFY-ISIN-SEC                                          
               PERFORM 0300-VERIFY-ISIN-RTN                             09130000
           ELSE                                                                 
LRM002     IF ACATRSIO-EDIT-CONTRA-ACCT                                         
LRM002         PERFORM 2000-VERIFY-CONTRA-ACCT-RTN                              
LRM002            THRU 2000-EXIT                                                
LRM002     ELSE                                                                 
LRM003     IF ACATRSIO-LOOKUP-ACCOUNT-FREEZE                                    
LRM003         PERFORM 3000-LOOKUP-ACCOUNT-FREEZE-RTN                           
LRM003            THRU 3000-EXIT                                                
LRM003     ELSE                                                                 
LRM006     IF ACATRSIO-LOOKUP-BANK-DEPOSIT                                      
LRM006         PERFORM 4000-LOOKUP-BANK-DEPOSIT-RTN                             
LRM006            THRU 4000-EXIT                                                
LRM006     ELSE                                                                 
               SET ACATRSIO-NOT-FOUND TO TRUE.                                  
                                                                                
           MOVE WS-ACATRSIO-AREA(1 : EIBCALEN)                                  
                                        TO DFHCOMMAREA(1 : EIBCALEN).           
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
           EJECT                                                                
       0200-VERIFY-ACCOUNT-RTN.                                         09130000
    **** THE FOLLOWING RESTRICTED ACCOUNT TABLE WAS DETERMINED TO APPLY         
    **** ONLY TO RESIDUAL CREDIT PROCESSING AND IS THEREFORE REMOVED            
    **** AT THIS TIME.                                                          
                                                                                
           SET ACATRSIO-NOT-FOUND TO TRUE.                              09270000
                                                                                
      *0200-DUMMY-PARA.                                                         
      *    EXEC SQL                                                     09140000
      *          SELECT CLIENT_NBR                                              
      *            INTO :DCLVRSTACCT.CLIENT-NBR                                 
      *              FROM VRSTACCT                                      09170000
      *            WHERE CLIENT_NBR                                     09180000
      *                   = :ACATRSIO-CLIENT-NBR  AND                   09190000
      *                  ACCT_CD                                                
      *                   = :ACATRSIO-ACCOUNT     AND                           
      *                  BRANCH_CD                                              
      *                   = :ACATRSIO-BRANCH                                    
      *    END-EXEC.                                                    09200000
093300*                                                                 09210000
093400*    EVALUATE SQLCODE                                             09220000
093500*         WHEN +0                                                 09230000
      *              SET ACATRSIO-FOUND TO TRUE                                 
093800*         WHEN +100                                               09260000
093900*              SET ACATRSIO-NOT-FOUND TO TRUE                     09270000
094000*         WHEN OTHER                                              09280000
      *              SET ACATRSIO-DB2-ERROR TO TRUE                             
      *              MOVE SQLCAID TO ACATRSIO-SQLCAID                           
      *              MOVE SQLCODE TO ACATRSIO-SQLCODE                           
      *              MOVE SQLERRM TO ACATRSIO-SQLERRM                           
      *              PERFORM 9000-WRITE-TO-CICS-LOG                             
094200*    END-EVALUATE.                                                09300000
                                                                                
           EJECT                                                                
       0300-VERIFY-ISIN-RTN.                                            09130000
LRM004     SET ACATRSIO-NOT-FOUND TO TRUE                                       
           EXEC SQL                                                     09140000
                 SELECT TRNFR_MEMO_IND                                          
                       ,TRNFR_BRKR_TYPE_CD                                      
                       ,RSTRD_MSG_TXT                                           
                  INTO :ACATRSIO-MEMO-IND                               09150000
LRM001                ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                   09160000
                      ,:ACATRSIO-RSTRD-MSG-TXT                          09160000
                     FROM VRSTSEC                                       09170000
                   WHERE CLIENT_NBR                                     09180000
                          = :ACATRSIO-CLIENT-NBR  AND                   09190000
                         ISIN_SEC_ISSUE_CD                                      
LRM005                    = :ACATRSIO-ADP-NBR                                   
           END-EXEC.                                                    09200000
LRM005*********           = :ACATRSIO-ISIN-SEC                                  
093300*                                                                 09210000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
                     PERFORM 0350-VERIFY-ISIN-BRKR-RTN                  09270000
                        THRU 0350-EXIT                                          
                WHEN +100                                               09260000
LRM004               CONTINUE                                                   
                WHEN OTHER                                              09280000
                     SET ACATRSIO-DB2-ERROR TO TRUE                             
                     MOVE SQLCAID TO ACATRSIO-SQLCAID                           
                     MOVE SQLCODE TO ACATRSIO-SQLCODE                           
                     MOVE SQLERRM TO ACATRSIO-SQLERRM                           
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
           END-EVALUATE.                                                09300000
                                                                                
           EJECT                                                                
       0350-VERIFY-ISIN-BRKR-RTN.                                       09270000
    ****** FIRST VERIFY THE DISTRIBUTION SIDE APPLIES TO THIS REQUEST...        
           IF (ACATRSIO-DELIVERER                                               
           AND TRNFR-BRKR-TYPE-CD = 'R' )                                       
           OR (ACATRSIO-RECEIVER                                                
           AND TRNFR-BRKR-TYPE-CD = 'D' )                                       
              GO TO 0350-EXIT                                                   
           END-IF.                                                              
                                                                                
LRM001     MOVE TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC TO                     09160000
LRM001                  ACATRSIO-BRKR-TYPE-CD.                          09160000
                                                                                
    ****** READ FOR THIS CONTRA BROKER...                                       
           EXEC SQL                                                     09140000
                 SELECT CLIENT_NBR                                              
                   INTO :DCLVRSTBRKR.CLIENT-NBR                                 
                     FROM VRSTBRKR                                      09170000
                   WHERE CLIENT_NBR                                     09180000
                          = :ACATRSIO-CLIENT-NBR  AND                   09190000
                         ISIN_SEC_ISSUE_CD                                      
LRM005                    = :ACATRSIO-ADP-NBR     AND                           
                         BRKR_CONTRA_NBR                                        
                          = :ACATRSIO-BRKR-CONTRA-NBR                           
           END-EXEC.                                                    09200000
LRM005*********           = :ACATRSIO-ISIN-SEC    AND                           
093300*                                                                 09210000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
                     SET ACATRSIO-FOUND TO TRUE                                 
093800          WHEN +100                                               09260000
093900               PERFORM 0370-VERIFY-GENERIC-ISIN-RTN               09270000
094000          WHEN OTHER                                              09280000
                     SET ACATRSIO-DB2-ERROR TO TRUE                             
                     MOVE SQLCAID TO ACATRSIO-SQLCAID                           
                     MOVE SQLCODE TO ACATRSIO-SQLCODE                           
                     MOVE SQLERRM TO ACATRSIO-SQLERRM                           
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
094200     END-EVALUATE.                                                09300000
                                                                                
       0350-EXIT. EXIT.                                                         
                                                                                
       0370-VERIFY-GENERIC-ISIN-RTN.                                    09270000
    ****** WHEN THERE ARE NO BROKER ROWS UNDER THIS CUSIP ROW, THEN             
    ****** THIS CUSIP IS RESTRICTED FOR ALL CONTRA BROKERS...                   
           MOVE +0 TO WS-ROW-COUNT.                                             
           EXEC SQL                                                     09140000
                 SELECT COUNT(*)                                                
                   INTO :WS-ROW-COUNT                                           
                     FROM VRSTBRKR                                      09170000
                   WHERE CLIENT_NBR                                     09180000
                          = :ACATRSIO-CLIENT-NBR                        09190000
                     AND ISIN_SEC_ISSUE_CD                                      
LRM005                    = :ACATRSIO-ADP-NBR                                   
           END-EXEC.                                                    09200000
LRM005********            = :ACATRSIO-ISIN-SEC                                  
093300*                                                                 09210000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
                     IF WS-ROW-COUNT = +0                                       
                         SET ACATRSIO-FOUND TO TRUE                             
                     ELSE                                                       
                         PERFORM 1000-BROWSE-PRIVATE-RANGE-RTN          01547000
                            THRU 1000-EXIT                              01548000
                     END-IF                                                     
093800          WHEN +100                                               09260000
                     PERFORM 1000-BROWSE-PRIVATE-RANGE-RTN              01547000
                        THRU 1000-EXIT                                  01548000
094000          WHEN OTHER                                              09280000
                     SET ACATRSIO-DB2-ERROR TO TRUE                             
                     MOVE SQLCAID TO ACATRSIO-SQLCAID                           
                     MOVE SQLCODE TO ACATRSIO-SQLCODE                           
                     MOVE SQLERRM TO ACATRSIO-SQLERRM                           
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
094200     END-EVALUATE.                                                09300000
                                                                                
094300*                                                                 09310000
094400 0100-EXIT.                                                       09320000
094500     EXIT.                                                        09330000
                                                                                
       1000-BROWSE-PRIVATE-RANGE-RTN.                                   02223000
   ****** SEE IF ADP SECURITY IS IN PRIVATE RANGE TABLE...                      
           MOVE ACATRSIO-ADP-NBR TO WS-PRNGFL-KEY                       02224000
           EXEC CICS STARTBR                                            02225000
             FILE   ('PRNGFL')                                          02226000
             RIDFLD (WS-PRNGFL-KEY)                                     02227000
             GTEQ                                                       02228000
             RESP   (WS-RESP)                                           02229000
           END-EXEC                                                     02230000
                                                                        02231000
           IF WS-RESP = DFHRESP(NOTFND)                                 02232000
              MOVE 'N' TO ACATRSIO-PRIVATE-RANGE-IND                    02233000
              GO TO 1000-EXIT                                           02234000
           END-IF                                                       02235000
                                                                        02236000
           IF WS-RESP NOT = ZERO                                        02237000
              MOVE WS-RESP TO ACATRSIO-PRNGFL-RESP                      02238000
              SET ACATRSIO-PRIVATE-RANGE-IOERR TO TRUE                  02233000
              GO TO 1000-EXIT                                           02242000
           END-IF                                                       02243000
                                                                        02244000
           EXEC CICS READNEXT                                           02245000
              FILE   ('PRNGFL')                                         02246000
              RIDFLD (WS-PRNGFL-KEY)                                    02247000
              INTO   (WS-PRNGFL-RECORD)                                 02248000
              LENGTH (LENGTH OF WS-PRNGFL-RECORD)                       02249000
              RESP   (WS-RESP)                                          02250000
           END-EXEC                                                     02251000
                                                                        02252000
           IF WS-RESP = DFHRESP(NOTFND)                                 02253000
              MOVE 'N' TO ACATRSIO-PRIVATE-RANGE-IND                    02233000
              GO TO 1000-END-BROWSE                                     02255000
           END-IF                                                       02256000
                                                                        02257000
           IF WS-RESP = DFHRESP(ENDFILE)                                02258000
              MOVE 'N' TO ACATRSIO-PRIVATE-RANGE-IND                    02233000
              GO TO 1000-EXIT                                           02260000
           END-IF                                                       02261000
                                                                        02262000
           IF WS-RESP NOT = ZERO                                        02263000
              MOVE WS-RESP TO ACATRSIO-PRNGFL-RESP                      02264000
              SET ACATRSIO-PRIVATE-RANGE-IOERR TO TRUE                  02233000
              GO TO 1000-EXIT                                           02268000
           END-IF                                                       02269000
                                                                        02270000
           IF ACATRSIO-ADP-NBR = WS-PRNG-HIGH-NBR                       02271000
           OR ACATRSIO-ADP-NBR >= WS-PRNG-LOW-NBR                       02272000
              IF (WS-PRNG-CLIENT = '000' OR '096')                      02273000
                 MOVE 'N' TO ACATRSIO-PRIVATE-RANGE-IND                 02233000
              ELSE                                                      02275000
                 MOVE 'Y' TO ACATRSIO-PRIVATE-RANGE-IND                 02233000
              END-IF                                                    02277000
           END-IF.                                                      02278000
                                                                        02279000
       1000-END-BROWSE.                                                 02280000
           EXEC CICS ENDBR                                              02281000
                FILE ('PRNGFL')                                         02282000
           END-EXEC.                                                    02283000
                                                                        02284000
       1000-EXIT.                                                       02285000
            EXIT.                                                       02286000
                                                                        02287000
LRM002 2000-VERIFY-CONTRA-ACCT-RTN.                                             
LRM002*----------------------------------------------------------------         
LRM002** B1 CARD-434730                                                         
LRM002** READ THE BHACAT SECTION (ONE SHOT) TO OBTAIN THIS TABLE                
LRM002*----------------------------------------------------------------         
LRM002     SET ACATRSIO-FOUND TO TRUE.                                          
           MOVE ACATRSIO-CLIENT-NBR (2 : 3) TO B1-CLIENT.                       
           MOVE 015                         TO B1-REC-CODE.                     
           MOVE 434500                      TO B1-CARD-NUM.                     
                                                                                
           EXEC CICS LINK                                                       
                PROGRAM  ('B1READ')                                             
                COMMAREA (B1-PARM-AREA)                                         
                LENGTH   (LENGTH OF B1-PARM-AREA)                               
           END-EXEC.                                                            
                                                                                
LRM002*----------------------------------------------------------------         
LRM002*** WHEN B1 READ ISSUE, SKIP THE EDIT                                     
LRM002*----------------------------------------------------------------         
           IF B1-RETURN-CODE = 'N' OR 'O' OR 'X'                                
              GO TO 2000-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE B1-INFO-AREA       TO BH-ACAT-INFO                              
LRM002*----------------------------------------------------------------         
LRM002*** WHEN NO B1 ENTRIES EXIST FOR THIS CONTRA, SKIP THE EDIT.              
LRM002*----------------------------------------------------------------         
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL                                
                SUB > BH-ACAT-ACCT-NUMBER-EDIT-NO                               
                  OR ACATRSIO-BRKR-CONTRA-NBR =                                 
                                  BH-ACAT-ANE-CONTRA-BROKER-NUM(SUB)            
           END-PERFORM.                                                         
           IF SUB > BH-ACAT-ACCT-NUMBER-EDIT-NO                                 
              GO TO 2000-EXIT                                                   
           END-IF.                                                              
                                                                                
LRM002*----------------------------------------------------------------         
LRM002* SINCE ONE OR ENTRIES EXIST FOR THIS CONTRA, FIRST LOOK FOR              
LRM002* A SPECIFIC MATCHING ENTRY, IDENTIFIED BY ANY NON A,B,N VALUE            
LRM002* IN THE B1 PATTERN, AND ALL THE NON A,B,N VALUES MUST MATCH              
LRM002* THE CONTRA ACCOUNT, FOR IT TO BE CONSIDERED AS THE ONLY PATTERN         
LRM002* TO MATCH AGAINST.  IE. 98NNNNNN STARTS WITH 98, SO THE NEXT             
LRM002* 6 DIGITS MUST BE NUMERIC, ELSE FAIL.                                    
LRM002*----------------------------------------------------------------         
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL                                
                SUB > BH-ACAT-ACCT-NUMBER-EDIT-NO                               
                          OR ACATRSIO-CONTRA-EDIT-FAIL                          
             IF ACATRSIO-BRKR-CONTRA-NBR =                                      
                                  BH-ACAT-ANE-CONTRA-BROKER-NUM(SUB)            
                MOVE BH-ACAT-ANE-CONTRA-ACCT-FORMAT (SUB) TO                    
                                              WS-EDIT-MASK                      
                MOVE BH-ACAT-ANE-CONTRA-BROKER-SEQ (SUB) TO                     
                                              WS-EDIT-NBR                       
                PERFORM 2100-SPECIFIC-EDIT-RTN                                  
                IF SPECIFIC-CHAR-MATCHED                                        
                   PERFORM 2200-TEST-A-B-N-RTN                                  
                   IF A-B-N-TEST-FAIL                                           
                      SET ACATRSIO-CONTRA-EDIT-FAIL TO TRUE                     
                   END-IF                                                       
                ELSE                                                            
                   IF SPECIFIC-CHAR-MISMATCH                                    
                      MOVE SPACES TO BH-ACAT-ANE-CONTRA-BROKER-NUM(SUB)         
                   END-IF                                                       
                END-IF                                                          
             END-IF                                                             
           END-PERFORM.                                                         
                                                                                
           IF ACATRSIO-CONTRA-EDIT-FAIL                                         
              MOVE WS-EDIT-MASK TO  ACATRSIO-CONTRA-ACCT-FAIL-PTRN              
              MOVE WS-EDIT-NBR  TO  ACATRSIO-CONTRA-ACCT-FAIL-NBR               
              GO TO 2000-EXIT                                                   
           END-IF.                                                              
LRM002*----------------------------------------------------------------         
LRM002* AT THIS POINT, THE CONTRA BROKER NUMBERS WERE SPACED OUT IN THE         
LRM002* B1 TABLE, WHEN THERE WAS A SPECIFIC VALUE AND THAT MASK DID NOT         
LRM002* APPLY, SUCH AS 98NNNNN VS. 9111111.  THE CONTRA ACCOUNT MUST            
LRM002* MATCH ONE IF THE REMAINING B1 EDIT PATTERNS, ELSE FAIL.                 
LRM002*----------------------------------------------------------------         
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL                                
                SUB > BH-ACAT-ACCT-NUMBER-EDIT-NO                               
             IF ACATRSIO-BRKR-CONTRA-NBR =                                      
                                  BH-ACAT-ANE-CONTRA-BROKER-NUM(SUB)            
                MOVE BH-ACAT-ANE-CONTRA-ACCT-FORMAT (SUB) TO                    
                                              WS-EDIT-MASK                      
                MOVE BH-ACAT-ANE-CONTRA-BROKER-SEQ (SUB) TO                     
                                              WS-EDIT-NBR                       
                PERFORM 2200-TEST-A-B-N-RTN                                     
                IF A-B-N-TEST-PASS                                              
                   GO TO 2000-EXIT                                              
                END-IF                                                          
             END-IF                                                             
           END-PERFORM.                                                         
           SET ACATRSIO-CONTRA-EDIT-FAIL TO TRUE.                               
                                                                                
LRM002 2000-EXIT. EXIT.                                                         
                                                                                
LRM002 2100-SPECIFIC-EDIT-RTN.                                                  
           SET SPECIFIC-CHAR-NOTFND TO TRUE.                                    
           PERFORM VARYING SUB2 FROM 1 BY 1                                     
                      UNTIL SUB2 > 20                                           
                   OR WS-EDIT-MASK (SUB2 : 1) NOT > ' '                         
              IF WS-EDIT-MASK (SUB2 : 1) NOT = 'A' AND 'B' AND 'N'              
                 IF WS-EDIT-MASK (SUB2 : 1) =                                   
                            ACATRSIO-CONTRA-ACCT (SUB2 : 1)                     
                    SET SPECIFIC-CHAR-MATCHED TO TRUE                           
                 ELSE                                                           
                    MOVE 20 TO SUB2                                             
                    SET SPECIFIC-CHAR-MISMATCH TO TRUE                          
                 END-IF                                                         
             END-IF                                                             
           END-PERFORM.                                                         
                                                                                
       2200-TEST-A-B-N-RTN.                                                     
LRM002     SET A-B-N-TEST-PASS TO TRUE.                                         
           PERFORM VARYING SUB2 FROM 1 BY 1                                     
                      UNTIL SUB2 > 20                                           
                   OR A-B-N-TEST-FAIL                                           
                   OR (WS-EDIT-MASK (SUB2 : 1) NOT > ' '                        
                   AND ACATRSIO-CONTRA-ACCT (SUB2 : 1) NOT > ' ')               
              IF WS-EDIT-MASK (SUB2 : 1) = 'A'                                  
                 IF (ACATRSIO-CONTRA-ACCT (SUB2 : 1) < 'A' OR > 'Z')            
                    SET A-B-N-TEST-FAIL TO TRUE                                 
                 END-IF                                                         
              ELSE                                                              
              IF WS-EDIT-MASK (SUB2 : 1) = 'B'                                  
                 IF (ACATRSIO-CONTRA-ACCT (SUB2 : 1) NOT < 'A'                  
                 AND ACATRSIO-CONTRA-ACCT (SUB2 : 1) NOT > 'Z')                 
                 OR (ACATRSIO-CONTRA-ACCT (SUB2 : 1) NOT < '0'                  
                 AND ACATRSIO-CONTRA-ACCT (SUB2 : 1) NOT > '9')                 
                    CONTINUE                                                    
                 ELSE                                                           
                    SET A-B-N-TEST-FAIL TO TRUE                                 
                 END-IF                                                         
              ELSE                                                              
              IF WS-EDIT-MASK (SUB2 : 1) = 'N'                                  
                 IF (ACATRSIO-CONTRA-ACCT (SUB2 : 1) < '0' OR > '9')            
                    SET A-B-N-TEST-FAIL TO TRUE                                 
                 END-IF                                                         
              ELSE                                                              
              IF WS-EDIT-MASK (SUB2 : 1) = ' '                                  
              AND ACATRSIO-CONTRA-ACCT (SUB2 : 1) > ' '                         
                 SET A-B-N-TEST-FAIL TO TRUE                                    
              END-IF END-IF END-IF END-IF                                       
           END-PERFORM.                                                         
           EJECT                                                                
LRM003 3000-LOOKUP-ACCOUNT-FREEZE-RTN.                                          
LRM003***--------------------------------------------------------------         
LRM003***  TEMP HARD CODING FOR TESTING, UNTIL FREEZE MODULE IS AVAIL--         
LRM003******** LINK TO MOD 1X - FACZ1O ALL 7 INDICSTORS ARE RETURNED.           
LRM003***--------------------------------------------------------------         
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-A.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-B.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-C.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-D.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-E.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-F.                                       
LRM003     MOVE 'N' TO ACATRSIO-FREEZE-ALL.                                     
                                                                                
LRM003     MOVE SPACES TO FRZCOMMAREA-FACZ1CA.                                  
LRM003     MOVE 'ACATRST' TO FRZCA-I-CALLER-PGM-ID.                             
LRM003     MOVE ACATRSIO-CLIENT-NBR TO FRZCA-I-CLIENT4.                         
LRM003     MOVE ACATRSIO-BRANCH     TO FRZCA-I-BRANCH                           
LRM003     MOVE ACATRSIO-ACCOUNT    TO FRZCA-I-ACCT                             
LRM003                                                                          
LRM003     SET FRZCA-I-IND-REQUESTS-INIT TO TRUE.                               
LRM003     SET FRZCA-I-CASH-IN-REQ-YES    TO TRUE.                              
LRM003     SET FRZCA-I-CASH-OUT-REQ-YES   TO TRUE.                              
LRM003     EXEC CICS LINK PROGRAM('FACZ1O')                                     
LRM003         COMMAREA(FRZCOMMAREA-FACZ1CA)                                    
LRM003         LENGTH (LENGTH OF FRZCOMMAREA-FACZ1CA)                           
LRM003         RESP   (WS-RESP)                                         02250000
LRM003     END-EXEC.                                                            
LRM003     IF WS-RESP = +0                                                      
LRM003        IF FRZCA-R-RESP-IS-FREEZE-YES                                     
LRM003           MOVE 'Y' TO ACATRSIO-FREEZE-ALL                                
LRM003        END-IF                                                            
LRM003        IF FRZCA-A-CASH-OUT-FRZ-YES                                       
LRM003           MOVE 'Y' TO ACATRSIO-FREEZE-A                                  
LRM003        END-IF                                                            
LRM003        IF FRZCA-A-CASH-IN-FRZ-YES                                        
LRM003           MOVE 'Y' TO ACATRSIO-FREEZE-B                                  
LRM003        END-IF                                                            
LRM003        IF FRZCA-A-SEC-OUT-FRZ-YES                                        
LRM003          MOVE 'Y' TO ACATRSIO-FREEZE-C                                   
LRM003        END-IF                                                            
LRM003        IF FRZCA-A-SEC-IN-FRZ-YES                                         
LRM003           MOVE 'Y' TO ACATRSIO-FREEZE-D                                  
LRM003     END-IF.                                                              
LRM003 3000-EXIT. EXIT.                                                         
LRM006 4000-LOOKUP-BANK-DEPOSIT-RTN.                                            
LRM006     MOVE ZERO TO ACATRSIO-BDF-COUNT.                                     
LRM006     MOVE 'M'              TO CLIENT-NBR OF DCLVRSTSEC(1:1)               
LRM006     MOVE ACATRSIO-CLIENT-NBR(2:3)                                        
LRM006                           TO CLIENT-NBR OF DCLVRSTSEC(2:3)               
LRM006     EXEC SQL                                                             
LRM006         SELECT COMMENT_TXT                                               
LRM006         INTO :DCLVRSTSEC.COMMENT-TXT                                     
LRM006         FROM VRSTSEC                                                     
LRM006         WHERE CLIENT_NBR = :DCLVRSTSEC.CLIENT-NBR                        
LRM006         WITH UR                                                          
LRM006     END-EXEC                                                             
LRM006     IF SQLCODE = 0                                                       
LRM006        SET ACATRSIO-FOUND TO TRUE                                        
LRM006        MOVE COMMENT-TXT OF DCLVRSTSEC TO ACATRSIO-BDF-AREA               
LRM006     ELSE                                                                 
LRM006        SET ACATRSIO-NOT-FOUND TO TRUE                                    
LRM006     END-IF.                                                              
LRM006                                                                          
LRM006 4000-EXIT. EXIT.                                                         
                                                                                
       ABENDED.                                                                 
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                         
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                               
     ***   MOVE '9999' TO BHST-RETURN-CODE.                                     
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
               MOVE 'ACATRST '         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE                   
               END-EXEC                                                         
           END-IF.                                                              
           EXEC CICS RETURN END-EXEC.                                   06220000
