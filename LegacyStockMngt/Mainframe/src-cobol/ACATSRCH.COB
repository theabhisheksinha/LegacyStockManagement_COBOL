000001* PDX    - ACATSRCH C0279306 05/05/09 13:29:29 TBLAMUR            00001000
000001* LRM006 - SSR 64209 EDIT CONTRA BROKER ON S SCREEN, CHECK S/D            
000001* LRM006   GREATER TODAY ON T SCREEN.                                     
000001* PDX    - ACATSRCH C0272581 11/03/08 13:33:06 TBLAMUR            00001000
000001* LRM005 - SSR 61164 ADD PTF FOR B,E,F,J,H,N,S,T SCREENS                  
000001* PDX    - ACATSRCH C0272398 10/29/08 11:24:37 TBLAMUR            00001000
000001* LRM004 - TASK 61399 ADD NUMERIC DATE CHECK TO PREVENT ASRA.             
000001* PDX    - ACATSRCH C0216396 04/04/05 16:12:43 TBLAMUR            00001000
000001* LRM003 - ALLOW SEARCH STATUS ON PTR "J" SCREEN                  00001000
000001* PDX    - ACATSRCH C0215192 01/31/05 14:50:04 TBEDTAK            00001000
000001* ET0002 - INCLUDE REQUEST REJECT STTS TO S SCR                   00001000
000001* PDX    - ACATSRCH C0212918 10/29/04 14:53:15 TBEDTAK            00001000
000001* ET0001 - SSR 39701 - INCLUDE 'MFC' & 'PTR' TRNFR CODE TO N SCR  00001000
000001* PDX    - ACATSRCH C0205792 07/06/04 13:53:12 TBEDTAK            00001000
000001* PDX    - ACATSRCH C0179784 09/19/02 15:07:42 TBEDTAK            00001000
000001* PDX    - ACATSRCH C0157168 05/25/01 14:04:07 TBLAMUR            00001000
000001* PDX    - ACATSRCH C0133263 10/26/99 16:11:01 TBLAMUR            00001000
000001* PDX    - ACATSRCH C0120327 01/31/99 19:41:01 TBEDTAK            00001000
000001* PDX    - ACATSRCH C0117770 12/09/98 15:06:15 TBEDTAK            00001000
000001* PDX    - ACATSRCH C0117777 11/13/98 16:32:41 TBEDTAK            00001000
000001* PDX    - ACATSRCH C0109165 10/22/98 15:51:14 TBTIKUO            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACATSRCH.                                                 
       AUTHOR.        TINA KUO.                                                 
      *REMARKS.                                                                 
      **-------------------------------------------------------------**         
      **-------------------------------------------------------------**         
      **          ACAT SEARCH BAR FUNCTIONS                          **         
      **-------------------------------------------------------------**         
      **-------------------------------------------------------------**         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       01  WK-AREA.                                                             
           03  WS-MSG1                     PIC X(51)                            
           VALUE 'ENTER "FUL","STD","PTD","RCL","FRV","RCR", OR "CRD"'.         
           03  WS-MSG2                     PIC X(51)                            
           VALUE 'NONE OF THE SRCH CODE IS APPLICABLE FOR THIS SCREEN'.         
ET0001     03  WS-MSG3.                                                         
ET0001         05 WS-MSG3-1                PIC X(36)                            
ET0001            VALUE 'ENTER "FUL","STD","PTD","RCL","FRV",'.                 
ET0001         05 WS-MSG3-2                PIC X(27)                            
ET0001            VALUE '"RCR","CRD","MFC", OR "PTR"'.                          
           03  WS-SPACE-CNT                PIC S9(3).                           
           03  WS-YEAR                     PIC X(02).                           
           03  WS-YEAR-N    REDEFINES WS-YEAR                                   
                                           PIC 9(02).                           
           03  WS-DIVIDED                  PIC 9(03).                           
           03  WS-REMAIN                   PIC 9(03).                           
           03  WS-LEAP-YR-SW               PIC X(01).                           
               88  WS-LEAP-YR                        VALUE 'Y'.                 
           03  TSQ-SECR.                                                        
               09  TERM-ID-SECR           PIC X(04).                            
               09  TRAN-ID-SECR           PIC X(04)  VALUE 'AC@X'.              
           03  ITEM-NUM                   PIC S9(04) COMP VALUE +1.             
           03  IDX                        PIC S9(05) COMP-3.            01280002
           03  BRANCH-OK-FLAG             PIC X(01)  VALUE 'N'.         00990002
               88  BRANCH-OK              VALUE  'Y'.                   01000002
               88  BRANCH-NEW             VALUE  'R'.                   01000002
           03  RR-OK-FLAG                 PIC X(01)  VALUE 'N'.         00990002
               88  RR-OK                  VALUE  'Y'.                   01000002
               88  RR-NEW                 VALUE  'R'.                   01000002
           03  WORK-AUTH-BRANCH           PIC X(03).                            
           03  WORK-AUTH-RR               PIC X(03).                            
                                                                                
LRM006     03  WSABSTIME           PIC S9(08) COMP.                             
LRM006     03  WS-TDY-YYMMDD.                                                   
LRM006         09 WS-TDY-YY        PIC XX.                                      
LRM006         09 WS-TDY-MM        PIC XX.                                      
LRM006         09 WS-TDY-DD        PIC XX.                                      
LRM006     03  WS-STLM-YYMMDD.                                                  
LRM006         09 WS-STLM-YY       PIC XX.                                      
LRM006         09 WS-STLM-MM       PIC XX.                                      
LRM006         09 WS-STLM-DD       PIC XX.                                      
LRM006     03  WSMMDDYY.                                                        
LRM006         09 WS-CUR-MM        PIC XX.                                      
LRM006         09 WS-CUR-DD        PIC XX.                                      
LRM006         09 WS-CUR-YY        PIC XX.                                      
            EJECT                                                               
            COPY ACATSRCH.                                                      
            EJECT                                                               
       01  TSQ-SECR-AREA.                                                       
              05 TSQ-USER-ID                  PIC X(4).                 02040002
              05 TSQ-LK-SEC-BR-TABLE.                                   02040002
00384            07 TSQ-LK-SEC-BR-AREA OCCURS 999 TIMES.                02050002
00391               09 TSQ-LK-SEC-BR-LO       PIC X(3).                 02060002
00392               09 TSQ-LK-SEC-BR-COMMA    PIC X.                    02070002
00393               09 TSQ-LK-SEC-BR-HI       PIC X(3).                 02080002
              05 TSQ-LK-SEC-RR-TABLE.                                   02090002
00384            07 TSQ-LK-SEC-RR-AREA OCCURS 999 TIMES.                02100002
00391               09 TSQ-LK-SEC-RR-LO       PIC X(3).                 02110002
00392               09 TSQ-LK-SEC-RR-COMMA    PIC X.                    02120002
00393               09 TSQ-LK-SEC-RR-HI       PIC X(3).                 02130002
                                                                                
       01  EDIT-DATE-AREA.                                                      
           05  WK-DATE-CODE               PIC X(01) VALUE 'B'.                  
           05  WK-DATE-NUM-ITEM           PIC S9(03) COMP-3 VALUE +1.           
           05  WK-DATE-IN                 PIC X(08) VALUE LOW-VALUE.            
           05  WK-DATE-OUT                PIC S9(7) COMP-3.                     
           05  WK-DATE-RET-CODE           PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
LRM006 01  ACATPPIO-CALL-AREA.                                                  
LRM006     COPY ACATPPIO.                                                       
           EJECT                                                                
       EJECT                                                                    
      *********  END OF WORKING STORAGE  *******************                    
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA                     PIC X(120).                          
                                                                                
       PROCEDURE DIVISION.                                                      
      *                                                                         
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           IF EIBCALEN = 0                                                      
              EXEC CICS                                                         
                   RETURN                                                       
              END-EXEC.                                                         
                                                                                
           MOVE DFHCOMMAREA TO ACAT-SRCH-COMM-AREA.                             
           MOVE SPACE          TO  WS-SEARCH-RETURN.                            
                                                                                
           IF SECURITY-LOOKUP                                                   
              PERFORM SIGNON-SECURITY-CHECK-RTN                                 
           END-IF.                                                              
           IF SRCH-INP-BRANCH     = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-BRANCH.                                    
           IF SRCH-INP-ACCT       = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-ACCT.                                      
           IF SRCH-INP-RR         = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-RR.                                        
      *    IF SRCH-INP-CUR        = LOW-VALUE                                   
      *       MOVE SPACE TO SRCH-INP-CUR.                                       
           IF SRCH-INP-TFR-TYP    = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-TFR-TYP.                                   
           IF SRCH-INP-RCV-DEL    = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-RCV-DEL.                                   
           IF SRCH-INP-CONTRA-BKR = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-CONTRA-BKR.                                
           IF SRCH-INP-STATUS     = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-STATUS.                                    
           IF SRCH-INP-STTL-DT    = LOW-VALUE                                   
              MOVE SPACE TO SRCH-INP-STTL-DT.                                   
                                                                                
           IF SRCH-INP-BRANCH     = SPACE  AND                                  
              SRCH-INP-ACCT       = SPACE  AND                                  
              SRCH-INP-RR         = SPACE  AND                                  
      **      SRCH-INP-CUR        = SPACE  AND                                  
              SRCH-INP-TFR-TYP    = SPACE  AND                                  
              SRCH-INP-RCV-DEL    = SPACE  AND                                  
              SRCH-INP-CONTRA-BKR = SPACE  AND                                  
              SRCH-INP-STATUS     = SPACE  AND                                  
              SRCH-INP-STTL-DT    = SPACE                                       
                   IF EIBCALEN < 120                                            
                      MOVE ACAT-SRCH-COMM-AREA(1 : EIBCALEN)                    
                                TO DFHCOMMAREA(1 : EIBCALEN)                    
                   ELSE                                                         
                      MOVE ACAT-SRCH-COMM-AREA                                  
                                TO DFHCOMMAREA                                  
                   END-IF                                                       
                   EXEC CICS                                                    
                        RETURN                                                  
                   END-EXEC.                                                    
                                                                                
           EVALUATE WS-ACAT-SCREEN-ID                                           
              WHEN 'A'      PERFORM FUNCTION-A                                  
              WHEN 'B'      PERFORM FUNCTION-B                                  
              WHEN 'C'      PERFORM FUNCTION-C                                  
              WHEN 'E'      PERFORM FUNCTION-E                                  
              WHEN 'F'      PERFORM FUNCTION-F                                  
              WHEN 'G'      PERFORM FUNCTION-G                                  
              WHEN 'H'      PERFORM FUNCTION-H                                  
              WHEN 'J'      PERFORM FUNCTION-J                                  
              WHEN 'K'      PERFORM FUNCTION-K                                  
              WHEN 'L'      PERFORM FUNCTION-L                                  
              WHEN 'M'      PERFORM FUNCTION-M                                  
              WHEN 'N'      PERFORM FUNCTION-N                                  
              WHEN 'P'      PERFORM FUNCTION-P                                  
              WHEN 'Q'      PERFORM FUNCTION-Q                                  
              WHEN 'S'      PERFORM FUNCTION-S                                  
              WHEN 'T'      PERFORM FUNCTION-T                                  
              WHEN 'U'      PERFORM FUNCTION-U                                  
              WHEN 'V'      PERFORM FUNCTION-V                                  
              WHEN 'W'      PERFORM FUNCTION-W                                  
              WHEN 'Y'      PERFORM FUNCTION-Y                                  
              WHEN 'X'      PERFORM FUNCTION-X                                  
              WHEN 'Z'      PERFORM FUNCTION-Z                                  
              WHEN '1'      PERFORM FUNCTION-1                                  
           END-EVALUATE.                                                        
                                                                                
           IF EIBCALEN < 120                                                    
              MOVE ACAT-SRCH-COMM-AREA(1 : EIBCALEN)                            
                        TO DFHCOMMAREA(1 : EIBCALEN)                            
           ELSE                                                                 
              MOVE ACAT-SRCH-COMM-AREA                                          
                        TO DFHCOMMAREA                                          
           END-IF.                                                              
           EXEC CICS                                                            
                RETURN                                                          
           END-EXEC.                                                            
           EJECT                                                                
       SIGNON-SECURITY-CHECK-RTN.                                               
           EXEC CICS IGNORE CONDITION                                           
                     ILLOGIC INVREQ  IOERR  ITEMERR LENGERR  QIDERR             
           END-EXEC.                                                            
           MOVE 'AC@X'                   TO TRAN-ID-SECR.                       
           MOVE EIBTRMID                 TO TERM-ID-SECR.                       
           EXEC CICS  READQ TS QUEUE (TSQ-SECR)                                 
                      INTO (TSQ-SECR-AREA)                                      
                      ITEM(ITEM-NUM)                                            
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                          10410002
              SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                           
              IF EIBCALEN < 120                                                 
                 MOVE ACAT-SRCH-COMM-AREA(1 : EIBCALEN)                         
                           TO DFHCOMMAREA(1 : EIBCALEN)                         
              ELSE                                                              
                 MOVE ACAT-SRCH-COMM-AREA                                       
                           TO DFHCOMMAREA                                       
              END-IF                                                            
              EXEC CICS RETURN                                                  
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
           PERFORM AUTHORIZED-BR-AE-CHECK.                              04772510
           IF EIBCALEN < 120                                                    
              MOVE ACAT-SRCH-COMM-AREA(1 : EIBCALEN)                            
                        TO DFHCOMMAREA(1 : EIBCALEN)                            
           ELSE                                                                 
              MOVE ACAT-SRCH-COMM-AREA                                          
                        TO DFHCOMMAREA                                          
           END-IF.                                                              
           EXEC CICS                                                            
                RETURN                                                          
           END-EXEC.                                                            
                                                                                
       AUTHORIZED-BR-AE-CHECK.                                          04772510
           SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE.                             
                                                                                
           IF SRCH-INP-BRANCH = SPACES OR LOW-VALUE                     04597609
              CONTINUE                                                  04597809
           ELSE                                                         04599009
              MOVE SRCH-INP-BRANCH TO WORK-AUTH-BRANCH                          
              PERFORM AUTHORIZED-BRANCH-CHECK                           04600009
              IF BRANCH-OK                                              04601009
                 CONTINUE                                                       
              ELSE                                                              
                 PERFORM UNAUTH-BRANCH-RTN                                      
              END-IF                                                    04608009
           END-IF.                                                      04609009
           IF (SRCH-INP-RR  = SPACES OR LOW-VALUE)                      04609109
           OR SRCH-SIGNON-SECR-CHECK-FAIL                                       
              CONTINUE                                                  04609209
           ELSE                                                         04609709
              MOVE SRCH-INP-RR TO WORK-AUTH-RR                                  
              PERFORM AUTHORIZED-AE-CHECK                               04610009
              IF RR-OK                                                  04620009
                 CONTINUE                                                       
              ELSE                                                      04640009
                 PERFORM UNAUTH-AE-RTN                                          
              END-IF                                                    04690009
           END-IF.                                                      04700009
       AUTHORIZED-BRANCH-CHECK.                                         04778003
           MOVE 'N' TO BRANCH-OK-FLAG.                                  04779109
           MOVE 1   TO IDX.                                                     
           PERFORM UNTIL BRANCH-OK  OR BRANCH-NEW                       04779209
                   OR (TSQ-LK-SEC-BR-LO(IDX) = LOW-VALUE OR 'END')      04779309
                   OR (IDX > 999)                                       04779409
                   OR (IDX NOT > 0)                                             
                IF TSQ-LK-SEC-BR-LO(IDX) = 'ALL'                        04779509
                   SET BRANCH-OK TO TRUE                                04779609
                ELSE                                                    04779709
                IF WORK-AUTH-BRANCH = TSQ-LK-SEC-BR-LO(IDX)             04779509
                   SET BRANCH-OK TO TRUE                                04779609
                ELSE                                                    04779709
                IF (WORK-AUTH-BRANCH > TSQ-LK-SEC-BR-LO(IDX))           04779809
                AND (TSQ-LK-SEC-BR-COMMA(IDX) = ',' OR '-')             04779909
                AND (WORK-AUTH-BRANCH NOT > TSQ-LK-SEC-BR-HI(IDX))      04780009
                   SET BRANCH-OK TO TRUE                                04780109
                ELSE                                                    04780209
                IF WORK-AUTH-BRANCH > TSQ-LK-SEC-BR-HI(IDX)             04780309
                   ADD 1 TO IDX                                                 
                ELSE                                                            
                   SET BRANCH-NEW TO TRUE                               04780709
                END-IF END-IF END-IF END-IF                             04780809
           END-PERFORM.                                                 04781009
044000                                                                  04781605
040300 EJECT                                                            04781707
040400                                                                  04781807
       AUTHORIZED-AE-CHECK.                                             04781908
           MOVE 'N' TO RR-OK-FLAG.                                      04779109
           MOVE 1   TO IDX.                                                     
           PERFORM UNTIL RR-OK  OR RR-NEW                               04779209
                   OR (TSQ-LK-SEC-RR-LO(IDX) = LOW-VALUE OR 'END')      04779309
                   OR (IDX > 999)                                       04779409
                   OR (IDX NOT > 0)                                             
                IF TSQ-LK-SEC-RR-LO(IDX) = 'ALL'                        04779509
                   SET RR-OK TO TRUE                                    04779609
                ELSE                                                    04779709
                IF WORK-AUTH-RR = TSQ-LK-SEC-RR-LO(IDX)                 04779509
                   SET RR-OK TO TRUE                                    04779609
                ELSE                                                    04779709
                IF (WORK-AUTH-RR > TSQ-LK-SEC-RR-LO(IDX))               04779809
                AND (TSQ-LK-SEC-RR-COMMA(IDX) = ',' OR '-')             04779909
                AND (WORK-AUTH-RR NOT > TSQ-LK-SEC-RR-HI(IDX))          04780009
                   SET RR-OK TO TRUE                                    04780109
                ELSE                                                    04780209
                IF WORK-AUTH-RR > TSQ-LK-SEC-RR-HI(IDX)                 04780309
                   ADD 1 TO IDX                                                 
                ELSE                                                            
                   SET RR-NEW TO TRUE                                           
                END-IF END-IF END-IF END-IF                             04780809
           END-PERFORM.                                                 04781009
044000                                                                  04785107
040300 EJECT                                                            04777303
040400                                                                  04777403
       UNAUTH-BRANCH-RTN.                                                       
           SET SRCH-SIGNON-SECR-CHECK-FAIL TO TRUE                              
           MOVE 'USER SIGNON NOT AUTHORIZED FOR BRANCH '                        
                        TO SRCH-MSG.                                            
           MOVE WORK-AUTH-BRANCH TO SRCH-MSG(40 : 3).                           
                                                                        04770310
       UNAUTH-AE-RTN.                                                           
           SET SRCH-SIGNON-SECR-CHECK-FAIL TO TRUE                              
           MOVE 'USER SIGNON NOT AUTHORIZED FOR RR '                            
                        TO SRCH-MSG                                             
           MOVE WORK-AUTH-RR TO SRCH-MSG(35 : 3).                               
           EJECT                                                                
      *****************************************************************         
      *            ( RECEIVER FUNCTION )                              *         
      *                  INITIATE A FULL TRANSFER                     *         
      *****************************************************************         
       FUNCTION-A.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-BRANCH > SPACE                                           
              IF SRCH-INP-ACCT = SPACE                                          
                 SET SRCH-ACCT-ERR   TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER ACCOUNT NUMBER'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
          EJECT                                                                 
      ******************************************************************        
      *            ( RECEIVER FUNCTION )                               *        
      *                  INITIATE A PARTIAL TRANSFER                   *        
      ******************************************************************        
       FUNCTION-B.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH'                                         
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-BRANCH > SPACE                                           
              IF SRCH-INP-ACCT = SPACE                                          
                 SET SRCH-ACCT-ERR   TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER ACCOUNT NUMBER'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
LRM005     AND (SRCH-INP-TFR-TYP NOT = 'PTR' AND 'PTF')                         
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( RECEIVER FUNCTION )                               *        
      *              REVIEW STATNDARD TRANSFERS                        *        
      ******************************************************************        
       FUNCTION-C.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH'                                         
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                              
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD"'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              IF SRCH-INP-STATUS = 'REV' OR 'RVA' OR 'RVE' OR 'RVX'             
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "REV" OR "RVA" OR "RVE" OR "RVX"'               
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( RECEIVER FUNCTION )                               *        
      *             REVIEW NON-STANDARD TRANSFER                       *        
      ******************************************************************        
       FUNCTION-E.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH'                                         
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'PTD' OR 'RCL' OR 'FRV' OR                  
                                    'RCR' OR 'CRD' OR 'MFC' OR 'PTR'            
                                 OR 'PTF'                                       
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE                                                        
                    'ENTER "PTD","PTR","RCL","FRV","RCR","CRD" OR "MFC"'        
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( RECEIVER FUNCTION )                               *        
      *             TRANSFERS REJECTED BY CONTRA BROKER                *        
      ******************************************************************        
       FUNCTION-F.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
LRM005        IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD' OR 'PTR' OR 'PTF'            
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD" OR "PTR"'                        
                      TO SRCH-MSG                                               
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( RECEIVER FUNCTION )                               *        
      *            TRANSFERS REJECTED BY SYSTEM                        *        
      ******************************************************************        
       FUNCTION-G.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD' OR 'PTR'                     
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD" OR "PTR"'                        
                      TO SRCH-MSG                                               
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *             N E W  T R A N S F E R S                           *        
      ******************************************************************        
       FUNCTION-H.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                              
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD"'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
 11/23******        MOVE ' INVALID STATUS CODE '  TO  SRCH-MSG                  
                    MOVE 'ENTER "RAP" "RQP" "REV" "RVA" "RVE" OR "RVX"'         
                    TO SRCH-MSG                                                 
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *             PARTIAL TRANSFERS REQUEST                          *        
      ******************************************************************        
       FUNCTION-J.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
LRM005     AND (SRCH-INP-TFR-TYP NOT = 'PTR' AND 'PTD' AND 'PTF')               
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
LRM003        IF SRCH-INP-TFR-TYP NOT = 'PTD'                                   
LRM003        AND (SRCH-INP-STATUS = 'REV' OR 'RVE' OR 'STC'                    
LRM003                              OR 'INT' OR 'REJ' OR 'PUR')                 
LRM003           CONTINUE                                                       
LRM003        ELSE                                                              
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *                  INITIATE A PARTIAL DELIVERY                   *        
      ******************************************************************        
      *FUNCTION-K.                                                              
       FUNCTION-KKKKK.                                                          
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH'                                         
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-BRANCH > SPACE                                           
              IF SRCH-INP-ACCT = SPACE                                          
                 SET SRCH-ACCT-ERR   TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER ACCOUNT NUMBER'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *                  INITIATE A RECLAIM                            *        
      ******************************************************************        
      *FUNCTION-L.                                                              
       FUNCTION-K.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-BRANCH > SPACE                                           
              IF SRCH-INP-ACCT = SPACE                                          
                 SET SRCH-ACCT-ERR   TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER ACCOUNT NUMBER'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *                  INITIATE A FAIL REVERSAL                      *        
      ******************************************************************        
       FUNCTION-L.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-BRANCH > SPACE                                           
              IF SRCH-INP-ACCT = SPACE                                          
                 SET SRCH-ACCT-ERR   TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER ACCOUNT NUMBER'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY SEARCH NOT APPLICABLE'                          
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *                   RESIDUAL CREDITS                             *        
      ******************************************************************        
       FUNCTION-M.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *             TRANSFERS REJECTED BY THE CONTRA BROKER            *        
      ******************************************************************        
       FUNCTION-N.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD' OR 'PTD' OR                  
                                    'RCL' OR 'FRV' OR 'RCR' OR                  
LRM005                              'CRD' OR 'MFC' OR 'PTR' OR 'PTF'            
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
ET0001**            MOVE WS-MSG1                                                
ET0001              MOVE WS-MSG3                                                
                      TO SRCH-MSG                                               
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *            ( DELIVERER FUNCTION )                              *        
      *             TRANSFERS REJECTED BY THE SYSTEM                   *        
      ******************************************************************        
       FUNCTION-P.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD' OR 'PTR'                     
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD" OR "PTR"'                        
                      TO SRCH-MSG                                               
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *              ( INQUIRY FUNCTION )                              *        
      *                  O P E N    O R D E R S                        *        
      ******************************************************************        
       FUNCTION-Q.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                              
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER "FUL" OR "STD"'                                 
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'REQ' OR 'RQA' OR 'RAP' OR                
                                      'RQP' OR 'RQR' OR 'PUR' OR                
                                      'INT' OR 'REJ'                            
                     SET  SRCH-STATUS-ERR TO TRUE                               
                     IF SRCH-MSG = SPACE                                        
                        MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'           
                          TO  SRCH-MSG                                          
                     END-IF                                                     
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *               ( INQUIRY FUNCTION )                             *        
      *                     PENDING TRANSFERS                          *        
      ******************************************************************        
       FUNCTION-S.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF ALLOWED-TFR-TYPE                                               
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID TRANSFER TYPE SEARCH CODE'                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              IF SRCH-INP-RCV-DEL = 'R' OR 'D'                                  
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-RCV-DEL-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID RECEIVER/DELIVERER CODE'                      
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              IF SRCH-INP-RCV-DEL = SPACE                                       
                 SET  SRCH-RCV-DEL-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER RECEIVER/DELIVERER CODE'                        
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'RQR' OR 'CLP' OR                         
                                      'REJ' OR 'PUR' OR 'INT'                   
ET0002              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                        
                       SET  SRCH-STATUS-ERR TO TRUE                             
                       IF SRCH-MSG = SPACE                                      
ET0002                    MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE F        
ET0002-                        'OR A FULL TRANSFER'                             
ET0002                      TO  SRCH-MSG                                        
                       END-IF                                                   
ET0002              ELSE                                                        
ET0002                 CONTINUE                                                 
ET0002              END-IF                                                      
ET0002           ELSE                                                           
ET0002               CONTINUE                                                   
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           MOVE 0 TO WS-SPACE-CNT.                                              
           IF SRCH-INP-STTL-DT > SPACE                                          
              INSPECT SRCH-INP-STTL-DT                                          
                 TALLYING WS-SPACE-CNT  FOR ALL SPACES                          
              IF WS-SPACE-CNT > 0                                               
                 SET  SRCH-STTL-DT-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER SETTLEMENT DATE IN MMDDYY FORMAT'               
                      TO  SRCH-MSG                                              
                 END-IF                                                         
              ELSE                                                              
                 PERFORM SETTLEMENT-DATE-CHECK.                                 
                                                                                
LRM006     IF SRCH-INP-CONTRA-BKR > SPACE                                       
LRM006        MOVE SRCH-INP-CONTRA-BKR TO ACATPPIO-BRKR                         
LRM006        SET ACATPPIO-READ TO TRUE                                         
LRM006        PERFORM LINK-TO-ACATPPIO                                          
LRM006        IF NOT ACATPPIO-FOUND                                             
LRM006           SET SRCH-CONTRA-BKR-ERR TO TRUE                                
LRM006           IF SRCH-MSG = SPACE                                            
LRM006              MOVE 'INVALID CONTRA BROKER'                                
LRM006                TO  SRCH-MSG                                              
LRM006           END-IF                                                         
LRM006        END-IF                                                            
LRM006     END-IF.                                                              
       EJECT                                                                    
      ******************************************************************        
      *               ( INQUIRY FUNCTION )                             *        
      *                     TRANSFER HISTORY                           *        
      ******************************************************************        
       FUNCTION-T.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF ALLOWED-TFR-TYPE                                               
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID TRANSFER TYPE SEARCH CODE'                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              IF SRCH-INP-RCV-DEL = 'R' OR 'D'                                  
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-RCV-DEL-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID RECEIVER/DELIVERER CODE'                      
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              IF SRCH-INP-RCV-DEL = SPACE                                       
                 SET  SRCH-RCV-DEL-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER RECEIVER/DELIVERER CODE'                        
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'PUR' OR 'INT'                            
                     SET  SRCH-STATUS-ERR TO TRUE                               
                     IF SRCH-MSG = SPACE                                        
                        MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'           
                          TO  SRCH-MSG                                          
                     END-IF                                                     
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           MOVE 0 TO WS-SPACE-CNT.                                              
           IF SRCH-INP-STTL-DT > SPACE                                          
              INSPECT SRCH-INP-STTL-DT                                          
                 TALLYING WS-SPACE-CNT  FOR ALL SPACES                          
              IF WS-SPACE-CNT > 0                                               
                 SET  SRCH-STTL-DT-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER SETTLEMENT DATE IN MMDDYY FORMAT'               
                      TO  SRCH-MSG                                              
                 END-IF                                                         
              ELSE                                                              
                 PERFORM SETTLEMENT-DATE-CHECK.                                 
                                                                                
      /                                                                         
      ******************************************************************        
      *                ( INQUIRY FUNCTION )                            *        
      *                       ASSETS  WITHHELD                         *        
      ******************************************************************        
       FUNCTION-U.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                              
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID TRANSFER TYPE SEARCH CODE'                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'RQR' OR 'REJ' OR 'CLP' OR                
                                      'PUR' OR 'INT'                            
                     SET  SRCH-STATUS-ERR TO TRUE                               
                     IF SRCH-MSG = SPACE                                        
                        MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'           
                          TO  SRCH-MSG                                          
                     END-IF                                                     
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *              ( INQUIRY FUNCTION )                              *        
      *                    ACCOUNTS WITH ACTIVITY                      *        
      ******************************************************************        
       FUNCTION-V.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              IF SRCH-INP-TFR-TYP = 'FUL' OR 'STD'                              
                 CONTINUE                                                       
              ELSE                                                              
                 SET  SRCH-TFR-TYP-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID TRANSFER TYPE SEARCH CODE'                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'REQ' OR 'RQA' OR 'RAP' OR                
                                      'RQP' OR 'RQR' OR 'PUR' OR                
                                      'INT' OR 'REJ'                            
                     SET  SRCH-STATUS-ERR TO TRUE                               
                     IF SRCH-MSG = SPACE                                        
                        MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'           
                          TO  SRCH-MSG                                          
                     END-IF                                                     
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *               ( PROCESSING FUNCTION )                          *        
      *                     A L E R T  M E S S A G E                   *        
      ******************************************************************        
       FUNCTION-W.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      /                                                                         
      ******************************************************************        
      *               ( PROCESSING FUNCTION )                          *        
      *                     RESTRICTED SECURITIES                      *        
      ******************************************************************        
       FUNCTION-X.                                                              
           IF SRCH-INP-BRANCH > SPACE                                           
              SET SRCH-BRANCH-ERR TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-ACCT > SPACE                                             
              SET SRCH-ACCT-ERR TO TRUE                                         
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE  WS-MSG2  TO SRCH-MSG                                     
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE  WS-MSG2  TO SRCH-MSG                                     
              END-IF.                                                           
       EJECT                                                                    
      /                                                                         
      ******************************************************************        
      *               ( PROCESSING FUNCTION )                          *        
      *         RESIDUAL CREDIT EXCLUSIONS                             *        
      ******************************************************************        
       FUNCTION-Y.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
       EJECT                                                                    
      ******************************************************************        
      *               ( PROCESSING FUNCTION )                          *        
      *                     RESTRICTED ACCOUNTS                        *        
      ******************************************************************        
       FUNCTION-Z.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
                                                                                
      ******************************************************************        
      *               ( PROCESSING FUNCTION )                          *        
      *                     RESCIND BLOCK                              *        
      ******************************************************************        
       FUNCTION-1.                                                              
           IF SRCH-INP-ACCT > SPACE                                             
              IF SRCH-INP-BRANCH = SPACE                                        
                 SET SRCH-BRANCH-ERR TO TRUE                                    
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF SRCH-INP-RR > SPACE                                               
              SET  SRCH-RR-ERR    TO TRUE                                       
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RR SEARCH NOT APPLICABLE'                                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      **   IF SRCH-INP-CUR > SPACE                                              
      **      SET  SRCH-CUR-ERR   TO TRUE                                       
      **      IF SRCH-MSG = SPACE                                               
      **         MOVE 'CURRENCY CODE SEARCH NOT APPLICABLE'                     
      **           TO  SRCH-MSG                                                 
      **      END-IF.                                                           
           IF SRCH-INP-TFR-TYP > SPACE                                          
              SET  SRCH-TFR-TYP-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'TRANSFER TYPE SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-RCV-DEL > SPACE                                          
              SET  SRCH-RCV-DEL-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'RECEIVER/DELIVERER SEARCH NOT APPLICABLE'                
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-CONTRA-BKR > SPACE                                       
              SET  SRCH-CONTRA-BKR-ERR TO TRUE                                  
              IF SRCH-MSG = SPACE                                               
                 MOVE 'CONTRA BROKER SEARCH NOT APPLICABLE'                     
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STATUS > SPACE                                           
              SET  SRCH-STATUS-ERR TO TRUE                                      
              IF SRCH-MSG = SPACE                                               
                 MOVE 'STATUS SEARCH NOT APPLICABLE'                            
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
           IF SRCH-INP-STTL-DT > SPACE                                          
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'SETTLEMENT DATE SEARCH NOT APPLICABLE'                   
                   TO  SRCH-MSG                                                 
              END-IF.                                                           
      *                                                                         
      ******************************************************************        
      *            DATE CHAECK                                         *        
      ******************************************************************        
       SETTLEMENT-DATE-CHECK.                                                   
LRM004     IF SRCH-INP-STTL-DT NOT NUMERIC                                      
LRM004        SET  SRCH-STTL-DT-ERR TO TRUE                                     
LRM004        IF SRCH-MSG = SPACE                                               
LRM004           MOVE 'INVALID DATE' TO SRCH-MSG                                
LRM004        END-IF                                                            
LRM004     ELSE                                                                 
           MOVE SPACE TO WS-LEAP-YR-SW                                          
           MOVE SRCH-INP-STTL-DT (5:2) TO WS-YEAR                               
           DIVIDE WS-YEAR-N BY 4                                                
                GIVING WS-DIVIDED  REMAINDER WS-REMAIN                          
           IF WS-REMAIN = 0                                                     
              SET WS-LEAP-YR TO TRUE                                            
LRM004     END-IF                                                               
           IF SRCH-INP-STTL-DT (1:2) < '01' OR > '12'                           
              SET  SRCH-STTL-DT-ERR TO TRUE                                     
              IF SRCH-MSG = SPACE                                               
                 MOVE 'INVALID DATE' TO SRCH-MSG                                
              END-IF                                                            
           ELSE                                                                 
           IF SRCH-INP-STTL-DT (1:2) = '02'                                     
              IF WS-LEAP-YR                                                     
                 IF SRCH-INP-STTL-DT (3:2) < '01' OR > '29'                     
                    SET  SRCH-STTL-DT-ERR TO TRUE                               
                    IF SRCH-MSG = SPACE                                         
                       MOVE 'INVALID DATE' TO SRCH-MSG                          
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 IF SRCH-INP-STTL-DT (3:2) < '01' OR > '28'                     
                    SET  SRCH-STTL-DT-ERR TO TRUE                               
                    IF SRCH-MSG = SPACE                                         
                       MOVE 'INVALID DATE' TO SRCH-MSG                          
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF SRCH-INP-STTL-DT (1:2) = '02' OR '04' OR                          
                                       '06' OR '09' OR '11'                     
              IF SRCH-INP-STTL-DT (3:2) < '01' OR > '30'                        
                 SET  SRCH-STTL-DT-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID DATE' TO SRCH-MSG                             
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF SRCH-INP-STTL-DT (3:2) < '01' OR > '31'                        
                 SET  SRCH-STTL-DT-ERR TO TRUE                                  
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID DATE' TO SRCH-MSG                             
                 END-IF                                                         
LRM006        END-IF                                                            
LRM006     END-IF                                                               
LRM006     IF SRCH-MSG (1 : 12) NOT = 'INVALID DATE'                            
LRM006     AND WS-ACAT-SCREEN-ID = 'T'                                          
LRM006        EXEC  CICS ASKTIME                                                
LRM006              ABSTIME(WSABSTIME)                                          
LRM006        END-EXEC                                                          
LRM006        EXEC  CICS FORMATTIME                                             
LRM006              ABSTIME(WSABSTIME)                                          
LRM006              MMDDYY(WSMMDDYY)                                            
LRM006        END-EXEC                                                          
LRM006        MOVE WS-CUR-MM TO WS-TDY-MM                                       
LRM006        MOVE WS-CUR-DD TO WS-TDY-DD                                       
LRM006        MOVE WS-CUR-YY TO WS-TDY-YY                                       
LRM006        MOVE SRCH-INP-STTL-DT (1:2) TO WS-STLM-MM                         
LRM006        MOVE SRCH-INP-STTL-DT (3:2) TO WS-STLM-DD                         
LRM006        MOVE SRCH-INP-STTL-DT (5:2) TO WS-STLM-YY                         
LRM006        IF WS-STLM-YYMMDD > WS-TDY-YYMMDD                                 
LRM006           SET  SRCH-STTL-DT-ERR TO TRUE                                  
LRM006           IF SRCH-MSG = SPACE                                            
LRM006              MOVE 'INVALID FUTURE DATE' TO SRCH-MSG                      
LRM006           END-IF                                                         
           END-IF.                                                              
       LINK-TO-ACATPPIO.                                                        
           EXEC CICS LINK PROGRAM ('ACATPPDB')                                  
             COMMAREA(ACATPPIO-CALL-AREA)                                       
              LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                              
           END-EXEC.                                                            
