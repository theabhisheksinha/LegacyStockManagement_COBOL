000001* PDX    - CATDEL   C0157686 04/20/01 14:09:02 TBLAMUR            00001000
000001* PDX    - CATDEL   C0119899 12/30/98 08:07:44 TBLAMUR            00001000
000001* PDX    - CATDEL   C0116408 11/11/98 12:17:37 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CATDEL.                                                     
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  NOV 1998.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      *     DELETE ALL ROWS FROM DB2 TABLES; TO BE USED AS PART OF              
      *     QA STARTUP PROCEDURE.                                               
      *---------------------------------------------------------------*         
      *    CHANGE HISTORY:                                            *         
      *                                                               *         
      *      DATE    PGMR    SSR            CHANGE                    *         
      *      ----    ----    ---            ------                    *         
      *    11/04/98   LRM  XXXXXX   PROGRAM CREATED.                  *         
      *                                                               *         
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.  IBM-370.                                               
       OBJECT-COMPUTER.  IBM-370.                                               
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SKIP2                                                                
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  WS-NAME                          PIC X(40)                           
           VALUE 'CATDEL WORKING STORAGE STARTS HERE'.                          
           COPY STUBCPY.                                                        
       01  W-COMMIT-CTR              PIC S9(04) COMP VALUE ZEROS.       CAT515  
           EJECT                                                                
       01  W-SINGLE-CLIENT-IND       PIC X(01) VALUE SPACES.            CAT515  
           88 SINGLE-CLIENT          VALUE 'S'.                                 
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_TRANSFER TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VINITRNF                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_ASSET TABLE                                         
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VINITAST                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE TRANSFER TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNFR                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE ASSET TABLE                                       
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VASSET                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECURITY (RCR)                                
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDACC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND REGISTRATION TABLE                                  
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDRGST                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECURITY TABLE                                
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTSEC                                                  
           END-EXEC.                                                            
                                                                                
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ALERT TABLE                                              
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VALERT                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT TRANSFER HISTORY TABLE                                   
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       01  WORK-AREA.                                                           
           05  PROGRAM-NAME            PIC X(08) VALUE 'CATDEL '.               
           05  WS-INDEX                PIC 9(04) COMP.                          
           EJECT                                                                
                                                                                
                                                                                
       01  WS-MISC.                                                             
           05  SUB1                         PIC 9(2)  VALUE ZERO.               
           05  ABORT-CODE     COMP SYNC     PIC S9(4) VALUE ZERO.               
           05  WS-TIMESTAMP                 PIC X(26).                          
CHRIS1                                                                          
CHRIS1 01  DSNTIAR                     PIC X(08) VALUE 'DSNTIAR'.               
CHRIS1 01  WS-DB2-MESSAGE-AREA.                                                 
CHRIS1      05  WS-DB2-MSG-LEN          PIC S9(04) COMP VALUE +960.             
CHRIS1      05  WS-ERROR-MSG            PIC X(80) OCCURS 12 TIMES               
CHRIS1              INDEXED BY WS-ERROR-INDEX.                                  
CHRIS1 01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.               
                                                                                
           SKIP3                                                                
       LINKAGE SECTION.                                                         
           SKIP1                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH            PIC S9(4)    COMP.                        
           05  PARM-CLIENT            PIC X(04).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VINITRNF          PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VINITAST          PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VTRNFR            PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VFNDRGST          PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VRSDACC           PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VRSTSEC           PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VALERT            PIC X(01).                                
           05  FILLER                 PIC X.                                    
           05  PARM-VTRNHSTY          PIC X(01).                                
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION             USING  PARM-AREA.                         
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           IF PARM-LENGTH NOT GREATER ZEROS                                     
              DISPLAY 'CATDEL: NO PARM RECIEVED - PROCESSING BYPASSED'          
              GOBACK                                                            
           END-IF.                                                              
                                                                                
           IF PARM-CLIENT NUMERIC                                               
              DISPLAY 'USING SINGLE CLIENT PARM OVERRIDE ' PARM-CLIENT          
              SET SINGLE-CLIENT TO TRUE                                         
           ELSE                                                                 
              DISPLAY 'DELETE MODE FOR ALL CLIENTS'                             
           END-IF.                                                              
                                                                                
           IF PARM-VINITRNF = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1100-CLEAR-INIT-TRNFR.                                    
                                                                                
           IF PARM-VINITAST = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1200-CLEAR-INIT-ASSET.                                    
                                                                                
           IF PARM-VTRNFR   = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1300-CLEAR-ACTIVE-TRNFR.                                  
                                                                                
******** THE FOLLOWING IS SPECIAL DELETE ROUTINE WHERE ONLY ASSETS              
******** MARKED AS DELETE TRANS-TYPE = D ARE DELETED:                           
           IF PARM-VTRNFR   = 'D'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1350-CLEAR-DELETED-ASSETS.                                
                                                                                
           IF PARM-VFNDRGST = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1400-CLEAR-FUND-RGSTN.                                    
                                                                                
           IF PARM-VRSDACC  = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1500-CLEAR-RESTRICT-ACCT.                                 
                                                                                
           IF PARM-VRSTSEC  = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1600-CLEAR-RESTRICT-SECR.                                 
                                                                                
           IF PARM-VALERT   = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1700-CLEAR-VALERT.                                        
                                                                                
           IF PARM-VTRNHSTY = 'Y'                                               
              MOVE 0 TO W-COMMIT-CTR                                            
              PERFORM 1800-CLEAR-VTRNHSTY.                                      
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
       1100-CLEAR-INIT-TRNFR.                                                   
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VINITRNF                                             
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VINITRNF                                             
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'INITIAL TRANSFER TABLE CLEARED'                     
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1100-CLEAR-INIT-TRNFR                               
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VINITRNF *'                   
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1200-CLEAR-INIT-ASSET.                                                   
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VINITAST                                             
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VINITAST                                             
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'INITIAL ASSET TABLE CLEARED'                        
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1200-CLEAR-INIT-ASSET                               
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VINITAST *'                   
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1300-CLEAR-ACTIVE-TRNFR.                                                 
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VTRNFR                                               
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VTRNFR                                               
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'ACTIVE TRANSFER TABLE CLEARED'                      
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1300-CLEAR-ACTIVE-TRNFR                             
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VINITAST *'                   
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1350-CLEAR-DELETED-ASSETS.                                               
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VASSET                                               
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
                     AND TRANS_TYPE_CD = 'D'                                    
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VASSET                                               
                   WHERE TRANS_TYPE_CD = 'D'                                    
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'ACTIVE ASSET MARKED AS D CLEARED'                   
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1350-CLEAR-DELETED-ASSETS                           
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VASSET *'                     
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1400-CLEAR-FUND-RGSTN.                                                   
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VFNDRGST                                             
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VFNDRGST                                             
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'FUND REGISTRATION TABLE CLEARED'                    
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1400-CLEAR-FUND-RGSTN                               
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VFNDRGST *'                   
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1500-CLEAR-RESTRICT-ACCT.                                                
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VRSDACC                                              
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VRSDACC                                              
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'RESTRICTED ACCOUNT TABLE CLEARED'                   
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1500-CLEAR-RESTRICT-ACCT                            
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VRSDACC *'                    
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1600-CLEAR-RESTRICT-SECR.                                                
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VRSTSEC                                              
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VRSTSEC                                              
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'RESTRICTED SECURITY TABLE CLEARED'                  
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1600-CLEAR-RESTRICT-SECR                            
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VRSDACC *'                    
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1700-CLEAR-VALERT.                                                       
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VALERT                                               
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VALERT                                               
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'VALERT TABLE CLEARED'                               
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1700-CLEAR-VALERT                                   
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VALERT *'                     
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1800-CLEAR-VTRNHSTY.                                                     
           IF SINGLE-CLIENT                                                     
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VTRNHSTY                                             
                   WHERE CLIENT_NBR = :PARM-CLIENT                              
               END-EXEC                                                         
           ELSE                                                                 
               EXEC SQL                                                         
                   DELETE                                                       
                      FROM VTRNHSTY                                             
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0 OR +100                                        
                   DISPLAY 'VTRNHSTY TABLE CLEARED'                             
                   PERFORM 2000-COMMIT-RTN                                      
               WHEN SQLCODE = -911                                              
                   ADD 1 TO W-COMMIT-CTR                                        
                   IF W-COMMIT-CTR < 10                                 CAT515  
                      GO TO 1800-CLEAR-VTRNHSTY                                 
                   END-IF                                                       
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH DELETE VTRNHSTY *'                   
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
                                                                                
       2000-COMMIT-RTN.                                                         
                                                                        CAT515  
           EXEC SQL COMMIT                                              CAT515  
           END-EXEC                                                     CAT515  
                                                                        CAT515  
           EVALUATE TRUE                                                        
               WHEN SQLCODE = +0                                                
                   DISPLAY 'COMMIT OK'                                          
               WHEN OTHER                                                       
                   DISPLAY '* PROBLEM WITH COMMIT *'                            
                   PERFORM SQL-ERROR-ROUTINE                                    
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *============================                                             
       SQL-ERROR-ROUTINE.                                                       
      *============================                                             
CHRIS1                                                                          
CHRIS1     CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                         
CHRIS1                              WS-ERR-LINE-LEN.                            
CHRIS1     PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
CHRIS1       UNTIL WS-ERROR-INDEX GREATER THAN 12                               
CHRIS1             IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                    
CHRIS1                DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)                     
CHRIS1             END-IF                                                       
CHRIS1     END-PERFORM.                                                         
CHRIS1                                                                          
CHRIS1*    DISPLAY 'CATDEL DB2 PROBLEM'.                                        
CHRIS1*    DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1*    DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1*    DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
                                                                                
