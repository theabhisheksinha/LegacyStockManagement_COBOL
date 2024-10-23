000001* PDX    - CATUPLD  C0367472 06/09/15 11:54:10 TBLAMUR            00001000
LRM017* SSR 103577 NEW COL SENT-BNWTRAN-IND ON VFNDRGST.                        
000001* PDX    - CATUPLD  C0361186 01/08/15 08:29:38 TBLAMUR            00001000
LRM016* SSR 103323 NEW COL PAPER STATEMENT FEE ON VTRNFR AND HSTY.              
000001* PDX    - CATUPLD  C0353648 04/07/14 10:15:50 TBLAMUR            00001000
LRM015* SSR 100417 FUND AGENT NEW COL ON ACATIMF VFNDRGST                       
000001* PDX    - CATUPLD  C0339180 04/09/13 09:57:56 TBLAMUR            00001000
LRM014* SSR 90340 SAVE ORIG DELIVERY QTY                                        
000001* PDX    - CATUPLD  C0329036 07/19/12 14:42:07 TBLAMUR            00001000
LRM013* SSR 84763 80728 NEW COL FOR DELIVERING NON U$ POSITIONS.                
000001* PDX    - CATUPLD  C0317345 10/26/11 09:49:36 TBLAMUR            00001000
LRM012* SSR 79096 80728 NEW COLS FOR PENDING DIVIDEND AND NTWLVL4 FUND.         
000001* PDX    - CATUPLD  C0296621 06/21/10 14:56:15 TBLAMUR            00001000
LRM011* SSR 71810 NEW COLS FOR FOREIGN FEES                                     
000001* PDX    - CATUPLD  C0296134 05/07/10 12:30:47 TBLAMUR            00001000
LRM010* SSR 65158 NEW COLS FOR MFRS OFFSHORE CHANGE                             
000001* PDX    - CATUPLD  C0287774 11/03/09 11:14:32 TBLAMUR            00001000
LRM009* SSR 65670 NEW COLS FOR SUB-PENNY PRICE AND EXPANDED OPT STRIKE.         
000001* PDX    - CATUPLD  C0276888 04/06/09 10:49:10 TBDOJUN            00001000
DJ0002* SSR 61684 NEW COL FOR AUCTION RATE SECURITY                             
000001* PDX    - CATUPLD  C0266770 06/25/08 10:58:38 TBLAMUR            00001000
DJ0001* SSR 0055171 NEW TABLE ACTRBSC (PARENT=VACTRBHY)                         
000001* PDX    - CATUPLD  C0259499 01/15/08 09:49:46 TBLAMUR            00001000
LRM008* SSR 47237 NEW COLS VRSTSEC, VRSTBRKR                                    
000001* PDX    - CATUPLD  C0253977 09/07/07 12:04:31 TBLAMUR            00001000
LRM007* SSR 0054091 NEW COL FOR CONVERSION ACCOUNT                              
000001* PDX    - CATUPLD  C0246152 03/13/07 16:29:27 TBLAMUR            00001000
LRM006* SSR 47213 NEW COLS VRSDACC, VRSDSEC                                     
000001* PDX    - CATUPLD  C0240170 12/20/06 08:17:09 TBLAMUR            00001000
LRM005* QUALIFY CONTROL NUMBER ON ACTITRF PROCESSING                            
000001* PDX    - CATUPLD  C0240752 10/23/06 15:31:47 TBLAMUR            00001000
LRM004* SSR 0049202 NEW COLS GIFT IND, ALT BRANCH, ONLINE FLAGS                 
000001* PDX    - CATUPLD  C0233532 04/10/06 09:23:09 TBLAMUR            00001000
LRM003* SSR 0040661 NEW COLS FOR ONLINE USER REPORT AND FREEZE IND              
000001* PDX    - CATUPLD  C0226392 10/10/05 08:05:26 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0222440 06/20/05 10:55:03 TBLAMUR            00001000
LRM002* SSR 0029849 RETAIN 866 SECURITY NBR AND AMOUNT                          
000001* PDX    - CATUPLD  C0213444 01/21/05 14:44:08 TBLAMUR            00001000
LRM001*        - USE NEW TABLES ACTITRF,ACTIAST,ACTIMF,ACTIOPN                  
000001* PDX    - CATUPLD  C0210469 11/18/04 16:25:48 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0179727 10/01/02 11:47:31 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0160782 07/24/01 14:13:02 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0152145 01/16/01 16:27:57 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0150927 12/05/00 10:39:24 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0125684 06/08/99 11:30:17 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0124318 04/09/99 13:56:54 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0123183 03/23/99 11:19:24 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0121814 02/16/99 15:43:56 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0121314 02/03/99 19:21:56 TBLAMUR            00001000
000001* PDX    - CATUPLD  C0119411 12/30/98 11:50:23 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CATUPLD.                                                    
       AUTHOR.      LARRY MUREY.                                                
       DATE-WRITTEN.  NOV 1998.                                                 
      **REMARKS.                                                                
      *****************************************************************         
      *                                                                         
      *PROGRAM DESCRIPTION:                                                     
      *     UPLOADS (INSERTS ROWS) INTO ACATS DB2 TABLES. THE EXTRACT           
      *     FILE CREATED BY PROGRAM CATEXTR IS INPUT. THIS PROGRAM              
      *     MAY BE USED TO COPY THE PRODUCTION OR QA ACATS DATABASE             
      *     TABLES INTO THE TEST DB2 FOR TESTING/RESOVOLING ISSUES.             
      *     THIS PROGRAM SHOULD NEVER BE RUN IN PRODUCTION.                     
      *---------------------------------------------------------------*         
      *    CHANGE HISTORY:                                            *         
      *                                                               *         
      *      DATE    PGMR    SSR            CHANGE                    *         
      *      ----    ----    ---            ------                    *         
      *    11/27/98   LRM  XXXXXX   PROGRAM CREATED.                  *         
      *                                                               *         
      *****************************************************************         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.  IBM-370.                                               
       OBJECT-COMPUTER.  IBM-370.                                               
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT EXTRACT-FILE                  ASSIGN  TO  EXTR.               
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
       FD  EXTRACT-FILE                                                         
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  EXTRACT-RECORD.                                                      
           05  RECORD-SEG-ID        PIC X(08).                                  
           05  RECORD-DETAIL        PIC X(742).                                 
                                                                                
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  WS-NAME                          PIC X(40)                           
           VALUE 'CATUPLD WORKING STORAGE STARTS HERE'.                         
                                                                                
       01  WS-EOF-IND                PIC X(01) VALUE SPACES.            CAT515  
           88 EOF                    VALUE 'Y'.                                 
       01  ABEND                     PIC X(08) VALUE 'ILBOABN0'.                
       01  WORKAREA.                                                            
           05  WS-ACTITRF-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIAST-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIMF-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIOPN-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNFR-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASSET-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDBLK-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VACTRBHY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
DJ0001     05  WS-ACTRBSC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMF-COUNT           PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTN-COUNT         PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDRGST-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDSRVS-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYBL-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYNA-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDNA-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMFHSTY-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTHSTY-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTBRKR-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTSEC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDSEC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDACC-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VPRTCPPF-COUNT      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VALERT-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.             
                                                                                
           05  W-COMMIT-CTR              PIC S9(005) COMP-3             CAT519  
                                              VALUE 0.                  CAT519  
           05  WS-COMMITS-PERFORMED      PIC S9(005) COMP-3             CAT519  
                                              VALUE 0.                  CAT519  
                                                                                
           05  WS-ACTITRF-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.              
           05  WS-ACTIAST-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.              
           05  WS-ACTIMF-COUNT-REPL   PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-ACTIOPN-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VTRNFR-COUNT-REPL   PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASSET-COUNT-REPL   PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDBLK-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VACTRBHY-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
DJ0001     05  WS-ACTRBSC-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMF-COUNT-REPL      PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTN-COUNT-REPL    PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDRGST-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDSRVS-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYBL-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDPYNA-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VFNDNA-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.               
           05  WS-VTRNHSTY-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VASTHSTY-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VMFHSTY-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VOPTHSTY-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTBRKR-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSTSEC-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDSEC-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VRSDACC-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.              
           05  WS-VPRTCPPF-COUNT-REPL PIC S9(9) COMP-3 VALUE ZEROS.             
           05  WS-VALERT-COUNT-REPL   PIC S9(9) COMP-3 VALUE ZEROS.             
                                                                                
           EJECT                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_TRANSFER TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTITRF                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_ASSET TABLE                                         
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIAST                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_MF TABLE                                            
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIMF                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT_INIT_OPN TABLE                                           
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE ACTIOPN                                                  
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
      *DCLGEN FOR ACAT RESCIND BLOCK TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDBLK                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESCIND BLOCK HISTORY TABLE                              
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VACTRBHY                                                 
           END-EXEC.                                                            
                                                                                
DJ0001*--------------------------------------------------------------           
DJ0001*DCLGEN FOR ACAT ASSET DELIVERY RULE TABLE  PARENT=VACTRBHY               
DJ0001*--------------------------------------------------------------           
DJ0001     EXEC SQL                                                             
DJ0001         INCLUDE ACTRBSC                                                  
DJ0001     END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE MF TABLE                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VMF                                                      
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ACTIVE OPTN TABLE                                        
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VOPTN                                                    
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND REGISTRATION TABLE                                  
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDRGST                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND SERV TABLE                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDSRVS                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND PAYABLE                                             
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDPYBL                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND PAYABLE NA                                          
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDPYNA                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT FUND NA                                                  
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VFNDNA                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY TRANSFER TABLE                                   
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VTRNHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY ASSET TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VASTHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY MF TABLE                                         
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VMFHSTY                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT HISTORY OPTN TABLE                                       
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VOPTHSTY                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED BRKR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTBRKR                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSTSEC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED SECR TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDSEC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT RESTRICTED ACCT TABLE                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VRSDACC                                                  
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT PARTICIPANT PROFILE TABLE                                
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VPRTCPPF                                                 
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      *DCLGEN FOR ACAT ALERT MESSAGE TABLE                                      
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE VALERT                                                   
           END-EXEC.                                                            
                                                                                
      *--------------------------------------------------------------           
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                                    
      *--------------------------------------------------------------           
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       01  WORK-AREA.                                                           
           05  PROGRAM-NAME            PIC X(08) VALUE 'CATUPLD '.              
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
       01  WS-ERR-LINE-LEN             PIC S9(09) COMP VALUE +80.               
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                                      
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
                                                                                
           OPEN INPUT EXTRACT-FILE.                                             
           PERFORM 1000-PROCESS-INPUT                                           
              THRU 1000-EXIT                                                    
                 UNTIL EOF.                                                     
                                                                                
           CLOSE EXTRACT-FILE.                                                  
                                                                                
           DISPLAY 'RECORDS INSERTED:'.                                         
           DISPLAY 'ACTITRF  = ' WS-ACTITRF-COUNT                               
           DISPLAY 'ACTIAST  = ' WS-ACTIAST-COUNT                               
           DISPLAY 'ACTIMF   = ' WS-ACTIMF-COUNT                                
           DISPLAY 'ACTIOPN  = ' WS-ACTIOPN-COUNT                               
           DISPLAY 'VTRNFR   = ' WS-VTRNFR-COUNT                                
           DISPLAY 'VASSET   = ' WS-VASSET-COUNT                                
           DISPLAY 'VMF      = ' WS-VMF-COUNT                                   
           DISPLAY 'VOPTN    = ' WS-VOPTN-COUNT                                 
           DISPLAY 'VFNDRGST = ' WS-VFNDRGST-COUNT                              
           DISPLAY 'VFNDSRVS = ' WS-VFNDSRVS-COUNT                              
           DISPLAY 'VFNDPYBL = ' WS-VFNDPYBL-COUNT                              
           DISPLAY 'VFNDPYNA = ' WS-VFNDPYNA-COUNT                              
           DISPLAY 'VFNDNA   = ' WS-VFNDNA-COUNT                                
           DISPLAY 'VTRNHSTY = ' WS-VTRNHSTY-COUNT                              
           DISPLAY 'VASTHSTY = ' WS-VASTHSTY-COUNT                              
           DISPLAY 'VMFHSTY  = ' WS-VMFHSTY-COUNT                               
           DISPLAY 'VOPTHSTY = ' WS-VOPTHSTY-COUNT                              
           DISPLAY 'VRSTBRKR = ' WS-VRSTBRKR-COUNT                              
           DISPLAY 'VRSTSEC  = ' WS-VRSTSEC-COUNT                               
           DISPLAY 'VRSDSEC  = ' WS-VRSDSEC-COUNT                               
           DISPLAY 'VRSDACC  = ' WS-VRSDACC-COUNT                               
           DISPLAY 'VPRTCPPF = ' WS-VPRTCPPF-COUNT                              
           DISPLAY 'VALERT    = ' WS-VALERT-COUNT                               
           DISPLAY 'VRSDBLK   = ' WS-VRSDBLK-COUNT                              
           DISPLAY 'VACTRBHY  = ' WS-VACTRBHY-COUNT                             
DJ0001     DISPLAY 'ACTRBSC   = ' WS-ACTRBSC-COUNT                              
           DISPLAY ' '.                                                         
           DISPLAY 'RECORDS UPDATED:'.                                          
           DISPLAY 'ACTITRF  = ' WS-ACTITRF-COUNT-REPL                          
           DISPLAY 'ACTIAST  = ' WS-ACTIAST-COUNT-REPL                          
           DISPLAY 'ACTIMF   = ' WS-ACTIMF-COUNT-REPL                           
           DISPLAY 'ACTIOPN  = ' WS-ACTIOPN-COUNT-REPL                          
           DISPLAY 'VTRNFR   = ' WS-VTRNFR-COUNT-REPL                           
           DISPLAY 'VASSET   = ' WS-VASSET-COUNT-REPL                           
           DISPLAY 'VMF      = ' WS-VMF-COUNT-REPL                              
           DISPLAY 'VOPTN    = ' WS-VOPTN-COUNT-REPL                            
           DISPLAY 'VFNDRGST = ' WS-VFNDRGST-COUNT-REPL                         
           DISPLAY 'VFNDSRVS = ' WS-VFNDSRVS-COUNT-REPL                         
           DISPLAY 'VFNDPYBL = ' WS-VFNDPYBL-COUNT-REPL                         
           DISPLAY 'VFNDPYNA = ' WS-VFNDPYNA-COUNT-REPL                         
           DISPLAY 'VFNDNA   = ' WS-VFNDNA-COUNT-REPL                           
           DISPLAY 'VTRNHSTY = ' WS-VTRNHSTY-COUNT-REPL                         
           DISPLAY 'VASTHSTY = ' WS-VASTHSTY-COUNT-REPL                         
           DISPLAY 'VMFHSTY  = ' WS-VMFHSTY-COUNT-REPL                          
           DISPLAY 'VOPTHSTY = ' WS-VOPTHSTY-COUNT-REPL                         
           DISPLAY 'VRSTBRKR = ' WS-VRSTBRKR-COUNT-REPL                         
           DISPLAY 'VRSTSEC  = ' WS-VRSTSEC-COUNT-REPL                          
           DISPLAY 'VRSDSEC  = ' WS-VRSDSEC-COUNT-REPL                          
           DISPLAY 'VRSDACC  = ' WS-VRSDACC-COUNT-REPL                          
           DISPLAY 'VPRTCPPF = ' WS-VPRTCPPF-COUNT-REPL                         
           DISPLAY 'VALERT   = ' WS-VALERT-COUNT-REPL                           
           DISPLAY 'VRSDBLK  = ' WS-VRSDBLK-COUNT-REPL                          
           DISPLAY 'VACTRBHY = ' WS-VACTRBHY-COUNT-REPL                         
DJ0001     DISPLAY 'ACTRBSC  = ' WS-ACTRBSC-COUNT-REPL                          
           DISPLAY 'COMMITS  = ' WS-COMMITS-PERFORMED.                  CAT519  
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
       1000-PROCESS-INPUT.                                                      
           READ EXTRACT-FILE                                                    
              AT END                                                            
                 SET EOF TO TRUE                                                
                 GO TO 1000-EXIT.                                               
                                                                                
           IF W-COMMIT-CTR > +299                                               
              PERFORM 8100-SQL-COMMIT                                   CAT519  
           END-IF.                                                              
                                                                                
           IF RECORD-SEG-ID = 'ACTITRF'                                         
              PERFORM 1100-CREATE-ACTITRF-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'ACTIAST'                                         
              PERFORM 1200-CREATE-INITIAL-ASSET-RTN                             
           ELSE                                                                 
           IF RECORD-SEG-ID = 'ACTIMF '                                         
              PERFORM 1300-CREATE-INITIAL-MF-RTN                                
           ELSE                                                                 
           IF RECORD-SEG-ID = 'ACTIOPN'                                         
              PERFORM 1400-CREATE-INITIAL-OPN-RTN                               
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VTRNFR  '                                        
              PERFORM 1500-CREATE-VTRNFR-RTN                                    
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VASSET  '                                        
              PERFORM 1600-CREATE-ACTIVE-ASSET-RTN                              
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VMF     '                                        
              PERFORM 1700-CREATE-ACTIVE-MF-RTN                                 
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VOPTN   '                                        
              PERFORM 1800-CREATE-ACTIVE-OPTN-RTN                               
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VFNDRGST'                                        
              PERFORM 1900-CREATE-VFNDRGST-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VFNDSRVS'                                        
              PERFORM 1950-CREATE-VFNDSRVS-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VFNDPYBL'                                        
              PERFORM 1970-CREATE-VFNDPYBL-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VFNDPYNA'                                        
              PERFORM 1980-CREATE-VFNDPYNA-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VFNDNA  '                                        
              PERFORM 1990-CREATE-VFNDNA-RTN                                    
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VTRNHSTY'                                        
              PERFORM 2000-CREATE-VTRNHSTY-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VASTHSTY'                                        
              PERFORM 2200-CREATE-VASTHSTY-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VMFHSTY'                                         
              PERFORM 2300-CREATE-VMFHSTY-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VOPTHSTY'                                        
              PERFORM 2400-CREATE-VOPTHSTY-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSTBRKR'                                        
              PERFORM 2500-CREATE-VRSTBRKR-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSTSEC '                                        
              PERFORM 2600-CREATE-VRSTSEC-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSDSEC '                                        
              PERFORM 2700-CREATE-VRSDSEC-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSDACC'                                         
              PERFORM 2800-CREATE-VRSDACC-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VPRTCPPF'                                        
              PERFORM 2900-CREATE-VPRTCPPF-RTN                                  
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VALERT'                                          
              PERFORM 3000-CREATE-VALERT-RTN                                    
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VRSDBLK'                                         
              PERFORM 3100-CREATE-VRSDBLK-RTN                                   
           ELSE                                                                 
           IF RECORD-SEG-ID = 'VACTRBHY'                                        
              PERFORM 3200-CREATE-VACTRBHY-RTN                                  
           ELSE                                                                 
DJ0001     IF RECORD-SEG-ID = 'ACTRBSC'                                         
DJ0001        PERFORM 3300-CREATE-ACTRBSC-RTN                                   
DJ0001     ELSE                                                                 
           IF RECORD-SEG-ID = 'DATE  '                                          
              DISPLAY 'USING EXTRACT FILE ' RECORD-DETAIL(1 : 26)               
           ELSE                                                                 
              DISPLAY 'UNKNOWN RECORD ' RECORD-SEG-ID ' BYPASSED'               
              GO TO 1000-EXIT                                                   
           END-IF.                                                              
                                                                                
           ADD +1 TO W-COMMIT-CTR.                                              
                                                                                
       1000-EXIT. EXIT.                                                         
                                                                                
            EJECT                                                               
       1100-CREATE-ACTITRF-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLACTITRF.                                    
           EXEC SQL                                                             
                 INSERT                                                         
                    INTO ACTITRF                                                
                    (                                                           
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,TRNFR_TYPE_CD                                              
                    ,RCV_NBR_STTS_CD                                            
                    ,DLVR_NBR_STTS_CD                                           
                    ,ACCT_RCV_STTS_CD                                           
                    ,ACCT_DLVR_STTS_CD                                          
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,ACAT_CONTROL_NBR                                           
                    ,CONTROL_NBR_STS_CD                                         
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,RCV_CUST_NM                                                
                    ,RCV_CUST_NM_STS_CD                                         
                    ,RCV_SS_PRIM_NBR                                            
                    ,RCV_SS_PRIM_STS_CD                                         
                    ,RCV_SS_SCNDY_NBR                                           
                    ,RCV_SS_SCDY_STS_CD                                         
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_ACT_TYP_STS_CD                                         
                    ,RCV_OCC_BRKR_NBR                                           
                    ,RCV_OCC_STTS_CD                                            
                    ,RCV_CRSPN_NBR                                              
                    ,RCV_CRSPN_STTS_CD                                          
                    ,ACAT_CNTL_ASTD_NBR                                         
                    ,CNTL_ASTD_STTS_CD                                          
                    ,CMNT_TXT                                                   
                    ,CMNT_STTS_CD                                               
                    ,PRCS_DT                                                    
                    ,STTS_CD                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRNFR_TYPE_RJCT_CD                                         
                    ,TRNFR_TYPE_RJC1_CD                                         
                    ,TRNFR_TYPE_RJC2_CD                                         
                    ,TRN_TYP_RJC_STS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,PRTCP_CONTRA_CD                                            
                    ,CYCLE_CD                                                   
                    ,DAYS_STTS_QTY                                              
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,DB_CR_CD                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_ASCTD_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,UPDT_TMSTP                                                 
                    ,CRT_TMSTP                                                  
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,RR_CD                                                      
                    ,CICS_SGNON_ID                                              
LRM003              ,CICS_NET_NM                                                
LRM003              ,TPSCRT_USR_ID                                              
LRM003              ,TPSCRT_USR_NM                                              
LRM004              ,GIFT_IND                                                   
LRM012              ,PEND_DVDND_DB_AMT                                          
                    )                                                           
                    VALUES                                                      
                    (                                                           
                    :DCLACTITRF.CLIENT-NBR                                      
                   ,:DCLACTITRF.DLVR-NBR                                        
                   ,:DCLACTITRF.ACCT-DLVR-NBR                                   
                   ,:DCLACTITRF.RCV-NBR                                         
                   ,:DCLACTITRF.ACCT-RCV-NBR                                    
                   ,:DCLACTITRF.TRNFR-TYPE-CD                                   
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:DCLACTITRF.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                                
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTITRF.TRANS-TYPE-CD                                   
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTITRF.RCV-CUST-NM                                     
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-PRIM-NBR                                 
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
                   ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:DCLACTITRF.RCV-CRSPN-NBR                                   
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:DCLACTITRF.CMNT-TXT                                        
                   ,:DCLACTITRF.CMNT-STTS-CD                                    
                   ,:DCLACTITRF.PRCS-DT                                         
                   ,:DCLACTITRF.STTS-CD                                         
                   ,:DCLACTITRF.DSTBN-SIDE-CD                                   
                   ,:DCLACTITRF.SYS-ACT-CD                                      
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                              
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTITRF.LGCL-SEQ-NBR                                    
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
                   ,:DCLACTITRF.CYCLE-CD                                        
                   ,:DCLACTITRF.DAYS-STTS-QTY                                   
                   ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:DCLACTITRF.NSCC-PEND-CD                                    
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,:DCLACTITRF.UPDT-TMSTP                                      
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,:DCLACTITRF.PRGM-NM                                         
                   ,:DCLACTITRF.RR-CD                                           
                   ,:DCLACTITRF.CICS-SGNON-ID                                   
LRM003             ,:DCLACTITRF.CICS-NET-NM                                     
LRM003             ,:DCLACTITRF.TPSCRT-USR-ID                                   
LRM003             ,:DCLACTITRF.TPSCRT-USR-NM                                   
LRM004             ,:DCLACTITRF.GIFT-IND                                        
LRM012             ,:DCLACTITRF.PEND-DVDND-DB-AMT                               
                   )                                                            
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
                 WHEN -803                                                      
                    PERFORM 1110-UPDATE-ACTITRF                                 
                 WHEN +0                                                        
                    ADD 1 TO WS-ACTITRF-COUNT                                   
                 WHEN OTHER                                                     
                    DISPLAY 'DB2 ERROR ON ACTITRF INSERT'                       
                    MOVE 1100 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1110-UPDATE-ACTITRF.                                                     
           EXEC SQL                                                             
               UPDATE ACTITRF                                                   
                 SET                                                            
                RCV_NBR_STTS_CD     = :DCLACTITRF.RCV-NBR-STTS-CD               
               ,DLVR_NBR_STTS_CD    = :DCLACTITRF.DLVR-NBR-STTS-CD              
               ,ACCT_RCV_STTS_CD    = :DCLACTITRF.ACCT-RCV-STTS-CD              
               ,ACCT_DLVR_STTS_CD   = :DCLACTITRF.ACCT-DLVR-STTS-CD             
               ,SBMTG_PRTCP_NBR     = :DCLACTITRF.SBMTG-PRTCP-NBR               
               ,SBMT_PRT_NR_STS_CD  = :DCLACTITRF.SBMT-PRT-NR-STS-CD            
               ,CONTROL_NBR_STS_CD  = :DCLACTITRF.CONTROL-NBR-STS-CD            
               ,TRNFR_TYPE_STTS_CD  = :DCLACTITRF.TRNFR-TYPE-STTS-CD            
               ,TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD                 
               ,TRANS_TYPE_STTS_CD  = :DCLACTITRF.TRANS-TYPE-STTS-CD            
               ,RCV_CUST_NM         = :DCLACTITRF.RCV-CUST-NM                   
               ,RCV_CUST_NM_STS_CD  = :DCLACTITRF.RCV-CUST-NM-STS-CD            
               ,RCV_SS_PRIM_NBR     = :DCLACTITRF.RCV-SS-PRIM-NBR               
               ,RCV_SS_PRIM_STS_CD  = :DCLACTITRF.RCV-SS-PRIM-STS-CD            
               ,RCV_SS_SCNDY_NBR    = :DCLACTITRF.RCV-SS-SCNDY-NBR              
               ,RCV_SS_SCDY_STS_CD  = :DCLACTITRF.RCV-SS-SCDY-STS-CD            
               ,RCV_ACCT_TYPE_CD    = :DCLACTITRF.RCV-ACCT-TYPE-CD              
               ,RCV_ACT_TYP_STS_CD  = :DCLACTITRF.RCV-ACT-TYP-STS-CD            
               ,RCV_OCC_BRKR_NBR    = :DCLACTITRF.RCV-OCC-BRKR-NBR              
               ,RCV_OCC_STTS_CD     = :DCLACTITRF.RCV-OCC-STTS-CD               
               ,RCV_CRSPN_NBR       = :DCLACTITRF.RCV-CRSPN-NBR                 
               ,RCV_CRSPN_STTS_CD   = :DCLACTITRF.RCV-CRSPN-STTS-CD             
               ,ACAT_CNTL_ASTD_NBR  = :DCLACTITRF.ACAT-CNTL-ASTD-NBR            
               ,CNTL_ASTD_STTS_CD   = :DCLACTITRF.CNTL-ASTD-STTS-CD             
               ,CMNT_TXT            = :DCLACTITRF.CMNT-TXT                      
               ,CMNT_STTS_CD        = :DCLACTITRF.CMNT-STTS-CD                  
               ,PRCS_DT             = :DCLACTITRF.PRCS-DT                       
               ,STTS_CD             = :DCLACTITRF.STTS-CD                       
               ,DSTBN_SIDE_CD       = :DCLACTITRF.DSTBN-SIDE-CD                 
               ,SYS_ACT_CD          = :DCLACTITRF.SYS-ACT-CD                    
               ,SYS_RJCT_RSN_CD     = :DCLACTITRF.SYS-RJCT-RSN-CD               
               ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD            
               ,TRNFR_TYPE_RJC1_CD  = :DCLACTITRF.TRNFR-TYPE-RJC1-CD            
               ,TRNFR_TYPE_RJC2_CD  = :DCLACTITRF.TRNFR-TYPE-RJC2-CD            
               ,TRN_TYP_RJC_STS_CD  = :DCLACTITRF.TRN-TYP-RJC-STS-CD            
               ,PHSCL_SEQ_NBR       = :DCLACTITRF.PHSCL-SEQ-NBR                 
               ,PHSCL_SEQ_STTS_CD   = :DCLACTITRF.PHSCL-SEQ-STTS-CD             
               ,LGCL_SEQ_NBR        = :DCLACTITRF.LGCL-SEQ-NBR                  
               ,LGCL_SEQ_NR_STS_CD  = :DCLACTITRF.LGCL-SEQ-NR-STS-CD            
               ,PRTCP_CONTRA_CD     = :DCLACTITRF.PRTCP-CONTRA-CD               
               ,CYCLE_CD            = :DCLACTITRF.CYCLE-CD                      
               ,DAYS_STTS_QTY       = :DCLACTITRF.DAYS-STTS-QTY                 
               ,TRANS_RFRN_ID_CD    = :DCLACTITRF.TRANS-RFRN-ID-CD              
               ,TRANS_RFRN_STTS_CD  = :DCLACTITRF.TRANS-RFRN-STTS-CD            
               ,DB_CR_CD            = :DCLACTITRF.DB-CR-CD                      
               ,STTLM_ASCTD_DT      = :DCLACTITRF.STTLM-ASCTD-DT                
               ,STTLM_ASCTD_STS_CD  = :DCLACTITRF.STTLM-ASCTD-STS-CD            
               ,RCRD_LNGTH_STTS_CD  = :DCLACTITRF.RCRD-LNGTH-STTS-CD            
               ,RCRD_STTS_CD        = :DCLACTITRF.RCRD-STTS-CD                  
               ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD                  
               ,NSCC_ACK_IND        = :DCLACTITRF.NSCC-ACK-IND                  
               ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                    
               ,CRT_TMSTP           = :DCLACTITRF.CRT-TMSTP                     
               ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD               
               ,PRGM_NM             = :DCLACTITRF.PRGM-NM                       
               ,RR_CD               = :DCLACTITRF.RR-CD                         
               ,CICS_SGNON_ID       = :DCLACTITRF.CICS-SGNON-ID                 
LRM003         ,CICS_NET_NM         = :DCLACTITRF.CICS-NET-NM                   
LRM003         ,TPSCRT_USR_ID       = :DCLACTITRF.TPSCRT-USR-ID                 
LRM003         ,TPSCRT_USR_NM       = :DCLACTITRF.TPSCRT-USR-NM                 
LRM004         ,GIFT_IND            = :DCLACTITRF.GIFT-IND                      
LRM012         ,PEND_DVDND_DB_AMT   = :DCLACTITRF.PEND-DVDND-DB-AMT             
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLACTITRF.CLIENT-NBR    AND                                
                    DLVR_NBR      =                                             
                   :DCLACTITRF.DLVR-NBR      AND                                
                    ACCT_DLVR_NBR =                                             
                   :DCLACTITRF.ACCT-DLVR-NBR   AND                              
                    RCV_NBR       =                                             
                   :DCLACTITRF.RCV-NBR         AND                              
                    ACCT_RCV_NBR  =                                             
                   :DCLACTITRF.ACCT-RCV-NBR    AND                              
                    TRNFR_TYPE_CD =                                             
                   :DCLACTITRF.TRNFR-TYPE-CD   AND                              
LRM005              ACAT_CONTROL_NBR    =                                       
LRM005             :DCLACTITRF.ACAT-CONTROL-NBR                                 
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-ACTITRF-COUNT-REPL                              
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTITRF UPDATE'                       
                    MOVE 1110 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1200-CREATE-INITIAL-ASSET-RTN.                                           
                                                                                
           MOVE RECORD-DETAIL TO DCLACTIAST.                                    
           EXEC SQL                                                             
               INSERT INTO ACTIAST                                              
                    (                                                           
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,CSH_MRG_SHT_STS_CD                                         
                    ,STTLM_LCTN_STTS_CD                                         
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,ACAT_CONTROL_NBR                                           
                    ,CONTROL_NBR_STS_CD                                         
                    ,ASSET_SEQ_NBR                                              
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,ASSET_PRC_CTGY_CD                                          
                    ,AST_PRC_CTG_STS_CD                                         
                    ,STTLM_RSN_CD                                               
                    ,STTLM_RSN_STTS_CD                                          
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_DESC_STTS_CD                                         
                    ,ASSET_RQST_QTY_CD                                          
                    ,ASSET_RQST_STS_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,AST_RQ_TRAN_STS_CD                                         
                    ,ASSET_QTY                                                  
                    ,ASSET_QTY_STTS_CD                                          
                    ,ASSET_PCT                                                  
                    ,ASSET_PCT_STTS_CD                                          
                    ,PSTN_CD                                                    
                    ,PSTN_CD_STTS_CD                                            
                    ,ISO_CRNCY_CD                                               
                    ,ISO_CRNCY_STTS_CD                                          
                    ,ASSET_AMT                                                  
                    ,ASSET_AMT_STTS_CD                                          
                    ,BEARER_BOND_CD                                             
                    ,BEARER_BND_STTS_CD                                         
                    ,WHI_CD                                                     
                    ,WHI_STTS_CD                                                
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,TRN_TYP_RSN_STS_CD                                         
                    ,MBS_SERIAL_NBR                                             
                    ,MBS_SERIAL_STTS_CD                                         
                    ,ASSET_CMNT_TXT                                             
                    ,ASSET_CMNT_STTS_CD                                         
                    ,NSCC_WTHLD_CD                                              
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,OPTN_CTGY_CD                                               
                    ,OPTN_CTGY_STTS_CD                                          
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,UPDT_TMSTP                                                 
                    ,CRT_TMSTP                                                  
                    ,SECURITY_ADP_NBR                                           
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_NBR_STTS_CD                                            
                    ,DLVR_NBR_STTS_CD                                           
                    ,CAGE_TAG_NBR                                               
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
                    ,CICS_SGNON_ID                                              
LRM003              ,CICS_NET_NM                                                
LRM003              ,TPSCRT_USR_ID                                              
LRM003              ,TPSCRT_USR_NM                                              
LRM011              ,FOREIGN_FEE_IND                                            
LRM013              ,CRNCY_CD                                                   
                    )                                                           
               VALUES                                                           
                    (                                                           
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.RCV-NBR                                          
                  ,:DCLACTIAST.ACCT-RCV-NBR                                     
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.LGCL-SEQ-NBR                                     
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                                
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLACTIAST.PSTN-CD                                          
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLACTIAST.ISO-CRNCY-CD                                     
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-AMT                                        
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLACTIAST.BEARER-BOND-CD                                   
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLACTIAST.WHI-CD                                           
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLACTIAST.MBS-SERIAL-NBR                                   
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:DCLACTIAST.ASSET-CMNT-TXT                                   
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
                  ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLACTIAST.OPTN-CTGY-CD                                     
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-ACK-IND                                     
                  ,:DCLACTIAST.PRGM-NM                                          
                  ,:DCLACTIAST.CICS-TERM-ID-CD                                  
                  ,:DCLACTIAST.UPDT-TMSTP                                       
                  ,:DCLACTIAST.CRT-TMSTP                                        
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.TRNFR-TYPE-CD                                    
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTIAST.CAGE-TAG-NBR                                     
LRM002            ,:DCLACTIAST.SCRTY-866-NBR                                    
LRM002            ,:DCLACTIAST.ASSET-866-QTY                                    
                  ,:DCLACTIAST.CICS-SGNON-ID                                    
LRM003            ,:DCLACTIAST.CICS-NET-NM                                      
LRM003            ,:DCLACTIAST.TPSCRT-USR-ID                                    
LRM003            ,:DCLACTIAST.TPSCRT-USR-NM                                    
LRM011            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM013            ,:DCLACTIAST.CRNCY-CD                                         
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                 PERFORM 1210-UPDATE-ACTIAST-RTN                                
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIAST-COUNT                                   
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIAST INSERT'                       
                    MOVE 1200 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1210-UPDATE-ACTIAST-RTN.                                                 
           EXEC SQL                                                             
               UPDATE ACTIAST                                                   
                 SET                                                            
                CSH_MRG_SHT_STS_CD = :DCLACTIAST.CSH-MRG-SHT-STS-CD             
               ,STTLM_LCTN_STTS_CD = :DCLACTIAST.STTLM-LCTN-STTS-CD             
               ,ISIN_CNTRY_STTS_CD = :DCLACTIAST.ISIN-CNTRY-STTS-CD             
               ,SBMTG_PRTCP_NBR    = :DCLACTIAST.SBMTG-PRTCP-NBR                
               ,SBMT_PRT_NR_STS_CD = :DCLACTIAST.SBMT-PRT-NR-STS-CD             
               ,CONTROL_NBR_STS_CD = :DCLACTIAST.CONTROL-NBR-STS-CD             
               ,AST_SEQ_NBR_STS_CD = :DCLACTIAST.AST-SEQ-NBR-STS-CD             
               ,TRANS_TYPE_CD      = :DCLACTIAST.TRANS-TYPE-CD                  
               ,TRANS_TYPE_STTS_CD = :DCLACTIAST.TRANS-TYPE-STTS-CD             
               ,PHSCL_SEQ_NBR      = :DCLACTIAST.PHSCL-SEQ-NBR                  
               ,PHSCL_SEQ_STTS_CD  = :DCLACTIAST.PHSCL-SEQ-STTS-CD              
               ,LGCL_SEQ_NBR       = :DCLACTIAST.LGCL-SEQ-NBR                   
               ,LGCL_SEQ_NR_STS_CD = :DCLACTIAST.LGCL-SEQ-NR-STS-CD             
               ,ASSET_PRC_CTGY_CD  = :DCLACTIAST.ASSET-PRC-CTGY-CD              
               ,AST_PRC_CTG_STS_CD = :DCLACTIAST.AST-PRC-CTG-STS-CD             
               ,STTLM_RSN_CD       = :DCLACTIAST.STTLM-RSN-CD                   
               ,STTLM_RSN_STTS_CD  = :DCLACTIAST.STTLM-RSN-STTS-CD              
               ,ASSET_DESC_TXT     = :DCLACTIAST.ASSET-DESC-TXT                 
               ,ASSET_DESC_STTS_CD = :DCLACTIAST.ASSET-DESC-STTS-CD             
               ,ASSET_RQST_QTY_CD  = :DCLACTIAST.ASSET-RQST-QTY-CD              
               ,ASSET_RQST_STS_CD  = :DCLACTIAST.ASSET-RQST-STS-CD              
               ,AST_RQST_TRANS_CD  = :DCLACTIAST.AST-RQST-TRANS-CD              
               ,AST_RQ_TRAN_STS_CD = :DCLACTIAST.AST-RQ-TRAN-STS-CD             
               ,ASSET_QTY          = :DCLACTIAST.ASSET-QTY                      
               ,ASSET_QTY_STTS_CD  = :DCLACTIAST.ASSET-QTY-STTS-CD              
               ,ASSET_PCT          = :DCLACTIAST.ASSET-PCT                      
               ,ASSET_PCT_STTS_CD  = :DCLACTIAST.ASSET-PCT-STTS-CD              
               ,PSTN_CD            = :DCLACTIAST.PSTN-CD                        
               ,PSTN_CD_STTS_CD    = :DCLACTIAST.PSTN-CD-STTS-CD                
               ,ISO_CRNCY_CD       = :DCLACTIAST.ISO-CRNCY-CD                   
               ,ISO_CRNCY_STTS_CD  = :DCLACTIAST.ISO-CRNCY-STTS-CD              
               ,ASSET_AMT          = :DCLACTIAST.ASSET-AMT                      
               ,ASSET_AMT_STTS_CD  = :DCLACTIAST.ASSET-AMT-STTS-CD              
               ,BEARER_BOND_CD     = :DCLACTIAST.BEARER-BOND-CD                 
               ,BEARER_BND_STTS_CD = :DCLACTIAST.BEARER-BND-STTS-CD             
               ,WHI_CD             = :DCLACTIAST.WHI-CD                         
               ,WHI_STTS_CD        = :DCLACTIAST.WHI-STTS-CD                    
               ,TRNFR_TYPE_RSN_CD  = :DCLACTIAST.TRNFR-TYPE-RSN-CD              
               ,TRN_TYP_RSN_STS_CD = :DCLACTIAST.TRN-TYP-RSN-STS-CD             
               ,MBS_SERIAL_NBR     = :DCLACTIAST.MBS-SERIAL-NBR                 
               ,MBS_SERIAL_STTS_CD = :DCLACTIAST.MBS-SERIAL-STTS-CD             
               ,ASSET_CMNT_TXT     = :DCLACTIAST.ASSET-CMNT-TXT                 
               ,ASSET_CMNT_STTS_CD = :DCLACTIAST.ASSET-CMNT-STTS-CD             
               ,NSCC_WTHLD_CD      = :DCLACTIAST.NSCC-WTHLD-CD                  
               ,TRANS_RFRN_ID_CD   = :DCLACTIAST.TRANS-RFRN-ID-CD               
               ,TRANS_RFRN_STTS_CD = :DCLACTIAST.TRANS-RFRN-STTS-CD             
               ,ISIN_SEC_IS_STS_CD = :DCLACTIAST.ISIN-SEC-IS-STS-CD             
               ,ISIN_SEC_CD_STS_CD = :DCLACTIAST.ISIN-SEC-CD-STS-CD             
               ,OPTN_CTGY_CD       = :DCLACTIAST.OPTN-CTGY-CD                   
               ,OPTN_CTGY_STTS_CD  = :DCLACTIAST.OPTN-CTGY-STTS-CD              
               ,RCRD_LNGTH_STTS_CD = :DCLACTIAST.RCRD-LNGTH-STTS-CD             
               ,RCRD_STTS_CD       = :DCLACTIAST.RCRD-STTS-CD                   
               ,NSCC_PEND_CD       = :DCLACTIAST.NSCC-PEND-CD                   
               ,NSCC_ACK_IND       = :DCLACTIAST.NSCC-ACK-IND                   
               ,PRGM_NM            = :DCLACTIAST.PRGM-NM                        
               ,CICS_TERM_ID_CD    = :DCLACTIAST.CICS-TERM-ID-CD                
               ,UPDT_TMSTP         = :DCLACTIAST.UPDT-TMSTP                     
               ,CRT_TMSTP          = :DCLACTIAST.CRT-TMSTP                      
               ,SECURITY_ADP_NBR   = :DCLACTIAST.SECURITY-ADP-NBR               
               ,TRNFR_TYPE_STTS_CD = :DCLACTIAST.TRNFR-TYPE-STTS-CD             
               ,RCV_NBR_STTS_CD    = :DCLACTIAST.RCV-NBR-STTS-CD                
               ,DLVR_NBR_STTS_CD   = :DCLACTIAST.DLVR-NBR-STTS-CD               
               ,CAGE_TAG_NBR       = :DCLACTIAST.CAGE-TAG-NBR                   
LRM002         ,SCRTY_866_NBR      = :DCLACTIAST.SCRTY-866-NBR                  
LRM002         ,ASSET_866_QTY      = :DCLACTIAST.ASSET-866-QTY                  
               ,CICS_SGNON_ID      = :DCLACTIAST.CICS-SGNON-ID                  
LRM003         ,CICS_NET_NM        = :DCLACTIAST.CICS-NET-NM                    
LRM003         ,TPSCRT_USR_ID      = :DCLACTIAST.TPSCRT-USR-ID                  
LRM003         ,TPSCRT_USR_NM      = :DCLACTIAST.TPSCRT-USR-NM                  
LRM011         ,FOREIGN_FEE_IND    = :DCLACTIAST.FOREIGN-FEE-IND                
LRM013         ,CRNCY_CD           = :DCLACTIAST.CRNCY-CD                       
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLACTIAST.CLIENT-NBR    AND                                
                    DLVR_NBR      =                                             
                   :DCLACTIAST.DLVR-NBR      AND                                
                    ACCT_DLVR_NBR =                                             
                   :DCLACTIAST.ACCT-DLVR-NBR   AND                              
                    RCV_NBR       =                                             
                   :DCLACTIAST.RCV-NBR         AND                              
                    ACCT_RCV_NBR  =                                             
                   :DCLACTIAST.ACCT-RCV-NBR    AND                              
                    ISIN_CNTRY_CD  =                                            
                   :DCLACTIAST.ISIN-CNTRY-CD    AND                             
                    ISIN_SEC_ISSUE_CD =                                         
                   :DCLACTIAST.ISIN-SEC-ISSUE-CD   AND                          
                    ISIN_SEC_CDG_CD   =                                         
                   :DCLACTIAST.ISIN-SEC-CDG-CD   AND                            
                    STTLM_LCTN_CD    =                                          
                   :DCLACTIAST.STTLM-LCTN-CD     AND                            
                    CSH_MGN_SHRT_CD  =                                          
                   :DCLACTIAST.CSH-MGN-SHRT-CD   AND                            
LRM001              ACAT_CONTROL_NBR   =                                        
LRM001             :DCLACTIAST.ACAT-CONTROL-NBR  AND                            
LRM001              ASSET_SEQ_NBR      =                                        
LRM001             :DCLACTIAST.ASSET-SEQ-NBR     AND                            
LRM001              TRNFR_TYPE_CD      =                                        
LRM001             :DCLACTIAST.TRNFR-TYPE-CD                                    
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIAST-COUNT-REPL                              
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIAST UPDATE'                       
                    MOVE 1210 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1300-CREATE-INITIAL-MF-RTN.                                              
                                                                                
           MOVE RECORD-DETAIL TO DCLACTIMF.                                     
           EXEC SQL                                                             
               INSERT INTO ACTIMF                                               
                    (                                                           
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,ACCT_TYPE_CD                                               
                    ,ACCT_TYPE_STTS_CD                                          
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,DVDND_PAYEE_CD                                             
                    ,DVDND_PYE_STTS_CD                                          
                    ,LTCG_CD                                                    
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,STCG_CD                                                    
                    ,MF_FULL_PRTL_CD                                            
                    ,MF_FUL_PRTL_STS_CD                                         
                    ,RGSTN_CD                                                   
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,FCST_ACCT_RCVR_NBR                                         
LRM001              ,ACAT_CONTROL_NBR                                           
LRM001              ,ASSET_SEQ_NBR                                              
LRM001              ,TRNFR_TYPE_CD                                              
LRM015              ,FND_AGNT_CD                                                
                    )                                                           
               VALUES                                                           
                    (                                                           
                   :DCLACTIMF.CLIENT-NBR                                        
                  ,:DCLACTIMF.DLVR-NBR                                          
                  ,:DCLACTIMF.ACCT-DLVR-NBR                                     
                  ,:DCLACTIMF.RCV-NBR                                           
                  ,:DCLACTIMF.ACCT-RCV-NBR                                      
                  ,:DCLACTIMF.ISIN-CNTRY-CD                                     
                  ,:DCLACTIMF.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLACTIMF.ISIN-SEC-CDG-CD                                   
                  ,:DCLACTIMF.STTLM-LCTN-CD                                     
                  ,:DCLACTIMF.CSH-MGN-SHRT-CD                                   
                  ,:DCLACTIMF.BK-PHSCL-SHR-CD                                   
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                
                  ,:DCLACTIMF.NTWRK-CNTL-CD                                     
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                
                  ,:DCLACTIMF.ACCT-TYPE-CD                                      
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                 
                  ,:DCLACTIMF.DVDND-CD                                          
                  ,:DCLACTIMF.DVDND-STTS-CD                                     
                  ,:DCLACTIMF.DVDND-PAYEE-CD                                    
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                                 
                  ,:DCLACTIMF.LTCG-CD                                           
                  ,:DCLACTIMF.BRKR-EXCTG-NBR                                    
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                
                  ,:DCLACTIMF.STCG-CD                                           
                  ,:DCLACTIMF.MF-FULL-PRTL-CD                                   
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                
                  ,:DCLACTIMF.RGSTN-CD                                          
                  ,:DCLACTIMF.FNBR                                              
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                
                  ,:DCLACTIMF.DSTBN-SIDE-CD                                     
                  ,:DCLACTIMF.PRCS-DT                                           
                  ,:DCLACTIMF.CRT-TMSTP                                         
                  ,:DCLACTIMF.UPDT-TMSTP                                        
                  ,:DCLACTIMF.CICS-TERM-ID-CD                                   
                  ,:DCLACTIMF.PRGM-NM                                           
                  ,:DCLACTIMF.SECURITY-ADP-NBR                                  
                  ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
LRM001            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
LRM001            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
LRM001            ,:DCLACTIMF.TRNFR-TYPE-CD                                     
LRM015            ,:DCLACTIMF.FND-AGNT-CD                                       
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                 PERFORM 1310-UPDATE-ACTIMF-RTN                                 
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIMF-COUNT                                    
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIMF  INSERT'                       
                    MOVE 1300 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1310-UPDATE-ACTIMF-RTN.                                                  
           EXEC SQL                                                             
               UPDATE ACTIMF                                                    
                 SET                                                            
                BK_PHSCL_SHR_CD      = :DCLACTIMF.BK-PHSCL-SHR-CD               
               ,BK_PHSC_SHR_STS_CD   = :DCLACTIMF.BK-PHSC-SHR-STS-CD            
               ,NTWRK_CNTL_CD        = :DCLACTIMF.NTWRK-CNTL-CD                 
               ,NTWRK_CNTL_STTS_CD   = :DCLACTIMF.NTWRK-CNTL-STTS-CD            
               ,ACCT_TYPE_CD         = :DCLACTIMF.ACCT-TYPE-CD                  
               ,ACCT_TYPE_STTS_CD    = :DCLACTIMF.ACCT-TYPE-STTS-CD             
               ,DVDND_CD             = :DCLACTIMF.DVDND-CD                      
               ,DVDND_STTS_CD        = :DCLACTIMF.DVDND-STTS-CD                 
               ,DVDND_PAYEE_CD       = :DCLACTIMF.DVDND-PAYEE-CD                
               ,DVDND_PYE_STTS_CD    = :DCLACTIMF.DVDND-PYE-STTS-CD             
               ,LTCG_CD              = :DCLACTIMF.LTCG-CD                       
               ,BRKR_EXCTG_NBR       = :DCLACTIMF.BRKR-EXCTG-NBR                
               ,BRKR_EXCTG_STTS_CD   = :DCLACTIMF.BRKR-EXCTG-STTS-CD            
               ,STCG_CD              = :DCLACTIMF.STCG-CD                       
               ,MF_FULL_PRTL_CD      = :DCLACTIMF.MF-FULL-PRTL-CD               
               ,MF_FUL_PRTL_STS_CD   = :DCLACTIMF.MF-FUL-PRTL-STS-CD            
               ,RGSTN_CD             = :DCLACTIMF.RGSTN-CD                      
               ,FNBR                 = :DCLACTIMF.FNBR                          
               ,FND_ACT_NBR_STS_CD   = :DCLACTIMF.FND-ACT-NBR-STS-CD            
               ,DSTBN_SIDE_CD        = :DCLACTIMF.DSTBN-SIDE-CD                 
               ,PRCS_DT              = :DCLACTIMF.PRCS-DT                       
               ,CRT_TMSTP            = :DCLACTIMF.CRT-TMSTP                     
               ,UPDT_TMSTP           = :DCLACTIMF.UPDT-TMSTP                    
               ,CICS_TERM_ID_CD      = :DCLACTIMF.CICS-TERM-ID-CD               
               ,PRGM_NM              = :DCLACTIMF.PRGM-NM                       
               ,SECURITY_ADP_NBR     = :DCLACTIMF.SECURITY-ADP-NBR              
               ,FCST_ACCT_RCVR_NBR   = :DCLACTIMF.FCST-ACCT-RCVR-NBR            
LRM015         ,FND_AGNT_CD          = :DCLACTIMF.FND-AGNT-CD                   
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLACTIMF.CLIENT-NBR     AND                                
                    DLVR_NBR      =                                             
                   :DCLACTIMF.DLVR-NBR       AND                                
                    ACCT_DLVR_NBR =                                             
                   :DCLACTIMF.ACCT-DLVR-NBR    AND                              
                    RCV_NBR       =                                             
                   :DCLACTIMF.RCV-NBR          AND                              
                    ACCT_RCV_NBR  =                                             
                   :DCLACTIMF.ACCT-RCV-NBR     AND                              
                    ISIN_CNTRY_CD  =                                            
                   :DCLACTIMF.ISIN-CNTRY-CD     AND                             
                    ISIN_SEC_ISSUE_CD =                                         
                   :DCLACTIMF.ISIN-SEC-ISSUE-CD    AND                          
                    ISIN_SEC_CDG_CD   =                                         
                   :DCLACTIMF.ISIN-SEC-CDG-CD    AND                            
                    STTLM_LCTN_CD    =                                          
                   :DCLACTIMF.STTLM-LCTN-CD      AND                            
                    CSH_MGN_SHRT_CD  =                                          
                   :DCLACTIMF.CSH-MGN-SHRT-CD    AND                            
LRM001              ACAT_CONTROL_NBR   =                                        
LRM001             :DCLACTIMF.ACAT-CONTROL-NBR   AND                            
LRM001              ASSET_SEQ_NBR      =                                        
LRM001             :DCLACTIMF.ASSET-SEQ-NBR      AND                            
LRM001              TRNFR_TYPE_CD      =                                        
LRM001             :DCLACTIMF.TRNFR-TYPE-CD                                     
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIMF-COUNT-REPL                               
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIMF  UPDATE'                       
                    MOVE 1310 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1400-CREATE-INITIAL-OPN-RTN.                                             
                                                                                
           MOVE RECORD-DETAIL TO DCLACTIOPN.                                    
           EXEC SQL                                                             
               INSERT INTO ACTIOPN                                              
                    (                                                           
                     CLIENT_NBR                                                 
                    ,DLVR_NBR                                                   
                    ,ACCT_DLVR_NBR                                              
                    ,RCV_NBR                                                    
                    ,ACCT_RCV_NBR                                               
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,STTLM_LCTN_CD                                              
                    ,CSH_MGN_SHRT_CD                                            
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_TST_CD                                         
                    ,SYM_CD                                                     
                    ,SYM_STTS_CD                                                
                    ,EXPTN_DT                                                   
                    ,STPRC_INTEGER_AMT                                          
                    ,STPRC_INTR_STTS_CD                                         
                    ,STPRC_FRCTN_AMT                                            
                    ,STPRC_FRCT_STTS_CD                                         
                    ,DLVR_OCC_NBR                                               
                    ,OPTN_ACCT_TYPE_CD                                          
                    ,OPT_ACT_TYP_STS_CD                                         
                    ,ACCT_SUB_CD                                                
                    ,ACCT_SUB_STTS_CD                                           
                    ,OPTN_CMNT_TXT                                              
                    ,OPTN_CMNT_CD                                               
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM001              ,ACAT_CONTROL_NBR                                           
LRM001              ,ASSET_SEQ_NBR                                              
LRM001              ,TRNFR_TYPE_CD                                              
LRM009              ,STPRC_INTEGER2_AMT                                         
                    )                                                           
               VALUES                                                           
                    (                                                           
                   :DCLACTIOPN.CLIENT-NBR                                       
                  ,:DCLACTIOPN.DLVR-NBR                                         
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
                  ,:DCLACTIOPN.RCV-NBR                                          
                  ,:DCLACTIOPN.ACCT-RCV-NBR                                     
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIOPN.STTLM-LCTN-CD                                    
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIOPN.BS-CD                                            
                  ,:DCLACTIOPN.BS-STTS-CD                                       
                  ,:DCLACTIOPN.PTCL-CD                                          
                  ,:DCLACTIOPN.PTCL-STTS-CD                                     
                  ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                                 
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
                  ,:DCLACTIOPN.SYM-CD                                           
                  ,:DCLACTIOPN.SYM-STTS-CD                                      
                  ,:DCLACTIOPN.EXPTN-DT                                         
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
                  ,:DCLACTIOPN.DLVR-OCC-NBR                                     
                  ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                                
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
                  ,:DCLACTIOPN.ACCT-SUB-CD                                      
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
                  ,:DCLACTIOPN.OPTN-CMNT-TXT                                    
                  ,:DCLACTIOPN.OPTN-CMNT-CD                                     
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
                  ,:DCLACTIOPN.NSCC-ACK-IND                                     
                  ,:DCLACTIOPN.NSCC-PEND-CD                                     
                  ,:DCLACTIOPN.CRT-TMSTP                                        
                  ,:DCLACTIOPN.UPDT-TMSTP                                       
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
                  ,:DCLACTIOPN.PRGM-NM                                          
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
LRM001            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
LRM001            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
LRM001            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
LRM009            ,:DCLACTIOPN.STPRC-INTEGER2-AMT                               
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                 PERFORM 1410-UPDATE-ACTIOPN-RTN                                
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIOPN-COUNT                                   
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIOPN INSERT'                       
                    MOVE 1400 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1410-UPDATE-ACTIOPN-RTN.                                                 
           EXEC SQL                                                             
               UPDATE ACTIOPN                                                   
                 SET                                                            
                BS_CD                = :DCLACTIOPN.BS-CD                        
               ,BS_STTS_CD           = :DCLACTIOPN.BS-STTS-CD                   
               ,PTCL_CD              = :DCLACTIOPN.PTCL-CD                      
               ,PTCL_STTS_CD         = :DCLACTIOPN.PTCL-STTS-CD                 
               ,OPTN_OPN_CLSD_CD     = :DCLACTIOPN.OPTN-OPN-CLSD-CD             
               ,OPT_OPN_CLS_TST_CD   = :DCLACTIOPN.OPT-OPN-CLS-TST-CD           
               ,SYM_CD               = :DCLACTIOPN.SYM-CD                       
               ,SYM_STTS_CD          = :DCLACTIOPN.SYM-STTS-CD                  
               ,EXPTN_DT             = :DCLACTIOPN.EXPTN-DT                     
               ,STPRC_INTEGER_AMT    = :DCLACTIOPN.STPRC-INTEGER-AMT            
               ,STPRC_INTR_STTS_CD   = :DCLACTIOPN.STPRC-INTR-STTS-CD           
               ,STPRC_FRCTN_AMT      = :DCLACTIOPN.STPRC-FRCTN-AMT              
               ,STPRC_FRCT_STTS_CD   = :DCLACTIOPN.STPRC-FRCT-STTS-CD           
               ,DLVR_OCC_NBR         = :DCLACTIOPN.DLVR-OCC-NBR                 
               ,OPTN_ACCT_TYPE_CD    = :DCLACTIOPN.OPTN-ACCT-TYPE-CD            
               ,OPT_ACT_TYP_STS_CD   = :DCLACTIOPN.OPT-ACT-TYP-STS-CD           
               ,ACCT_SUB_CD          = :DCLACTIOPN.ACCT-SUB-CD                  
               ,ACCT_SUB_STTS_CD     = :DCLACTIOPN.ACCT-SUB-STTS-CD             
               ,OPTN_CMNT_TXT        = :DCLACTIOPN.OPTN-CMNT-TXT                
               ,OPTN_CMNT_CD         = :DCLACTIOPN.OPTN-CMNT-CD                 
               ,OPTN_EXPTN_DT_CD     = :DCLACTIOPN.OPTN-EXPTN-DT-CD             
               ,OPT_OCC_DLV_STS_CD   = :DCLACTIOPN.OPT-OCC-DLV-STS-CD           
               ,NSCC_ACK_IND         = :DCLACTIOPN.NSCC-ACK-IND                 
               ,NSCC_PEND_CD         = :DCLACTIOPN.NSCC-PEND-CD                 
               ,CRT_TMSTP            = :DCLACTIOPN.CRT-TMSTP                    
               ,UPDT_TMSTP           = :DCLACTIOPN.UPDT-TMSTP                   
               ,CICS_TERM_ID_CD      = :DCLACTIOPN.CICS-TERM-ID-CD              
               ,PRGM_NM              = :DCLACTIOPN.PRGM-NM                      
               ,SECURITY_ADP_NBR     = :DCLACTIOPN.SECURITY-ADP-NBR             
LRM009         ,STPRC_INTEGER2_AMT   = :DCLACTIOPN.STPRC-INTEGER2-AMT           
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLACTIOPN.CLIENT-NBR    AND                                
                    DLVR_NBR      =                                             
                   :DCLACTIOPN.DLVR-NBR      AND                                
                    ACCT_DLVR_NBR =                                             
                   :DCLACTIOPN.ACCT-DLVR-NBR   AND                              
                    RCV_NBR       =                                             
                   :DCLACTIOPN.RCV-NBR         AND                              
                    ACCT_RCV_NBR  =                                             
                   :DCLACTIOPN.ACCT-RCV-NBR    AND                              
                    ISIN_CNTRY_CD  =                                            
                   :DCLACTIOPN.ISIN-CNTRY-CD    AND                             
                    ISIN_SEC_ISSUE_CD =                                         
                   :DCLACTIOPN.ISIN-SEC-ISSUE-CD   AND                          
                    ISIN_SEC_CDG_CD   =                                         
                   :DCLACTIOPN.ISIN-SEC-CDG-CD   AND                            
                    STTLM_LCTN_CD    =                                          
                   :DCLACTIOPN.STTLM-LCTN-CD     AND                            
                    CSH_MGN_SHRT_CD  =                                          
                   :DCLACTIOPN.CSH-MGN-SHRT-CD   AND                            
LRM001              ACAT_CONTROL_NBR   =                                        
LRM001             :DCLACTIOPN.ACAT-CONTROL-NBR  AND                            
LRM001              ASSET_SEQ_NBR      =                                        
LRM001             :DCLACTIOPN.ASSET-SEQ-NBR     AND                            
LRM001              TRNFR_TYPE_CD      =                                        
LRM001             :DCLACTIOPN.TRNFR-TYPE-CD                                    
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-ACTIOPN-COUNT-REPL                              
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTIOPN UPDATE'                       
                    MOVE 1410 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1500-CREATE-VTRNFR-RTN.                                                  
           MOVE RECORD-DETAIL TO DCLVTRNFR.                                     
           EXEC SQL                                                             
               INSERT INTO VTRNFR                                               
                    (                                                           
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR                                                    
                   ,DLVR_NBR_STTS_CD                                            
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_DLVR_STTS_CD                                           
                   ,RCV_NBR                                                     
                   ,RCV_NBR_STTS_CD                                             
                   ,ACCT_RCV_NBR                                                
                   ,ACCT_RCV_STTS_CD                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,RCV_CUST_NM                                                 
                   ,RCV_CUST_NM_STS_CD                                          
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_PRIM_STS_CD                                          
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_SS_SCDY_STS_CD                                          
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_ACT_TYP_STS_CD                                          
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_OCC_STTS_CD                                             
                   ,RCV_CRSPN_NBR                                               
                   ,RCV_CRSPN_STTS_CD                                           
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,CNTL_ASTD_STTS_CD                                           
                   ,CMNT_TXT                                                    
                   ,CMNT_STTS_CD                                                
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRN_TYP_RJC_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,RR_CD                                                       
                   ,BRANCH_CD                                                   
                   ,DVDND_NAA_CD                                                
                   ,SELL_INSTN_NAA_CD                                           
                   ,CASH_SWEEP_NAA_CD                                           
                   ,PRTCP_CONTRA_CD                                             
                   ,ACM_HOLDER_NAA_CD                                           
                   ,ACCT_ACTIVITY_IND                                           
                   ,ACCT_ORDERS_IND                                             
                   ,ACCT_RJCT_RSBM_IND                                          
                   ,ACCT_DB_BAL_T1_IND                                          
                   ,ACCT_MRGN_DB_IND                                            
                   ,ACCT_SHRT_PSTN_IND                                          
                   ,ACCT_SEC_RSTRD_IND                                          
                   ,ACCT_AST_EXCS_IND                                           
                   ,ACCT_OPTN_PSTN_IND                                          
                   ,ACCT_LTD_PRTNR_IND                                          
                   ,ACCT_TIN_MSMTH_IND                                          
                   ,ACCT_DPLCT_TRN_IND                                          
                   ,ACCT_CUST_70_IND                                            
                   ,ACCT_QULFD_PLN_IND                                          
                   ,ACCT_MNGD_IND                                               
                   ,ACCT_PRVT_RNG_IND                                           
                   ,ACCT_BRKR_TIF_IND                                           
                   ,NSCC_NON_ADP_IND                                            
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,STTLM_DT                                                    
                   ,ACCT_NA_UPDT_IND                                            
                   ,ACCT_TRNFR_FEE_AMT                                  L,      
                   ,ACCT_IRA_TRMNT_AMT                                  L,      
                   ,ACCT_IRA_MAINT_AMT                                  L,      
                   ,ACCT_DLRV_PRGR_IND                                          
                   ,ACCT_CD                                                     
                   ,STTLM_ASCTD_DT                                              
                   ,STTLM_ASCTD_STS_CD                                          
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ACCT_EQUITY_AMT                                             
                   ,ALERT_IND                                                   
                   ,ACCT_RB_SEC_IND                                             
                   ,ACCT_CLT_RSCND_IND                                          
                   ,ACCT_LGL_BLK_IND                                            
                   ,FRV_MFC_CMPLT_IND                                           
LRM003             ,ACCT_FRZN_IND                                               
LRM004             ,BRANCH_ALTNT_CD                                             
LRM004             ,GIFT_IND                                                    
LRM004             ,RSTR_TRD_90_DY_IND                                          
LRM004             ,REG_T_IND                                                   
LRM004             ,ADOPT_AGRMT_IND                                             
LRM004             ,RR_ORGNL_CD                                                 
LRM007             ,CVRSN_ACCT_NBR                                              
DJ0002             ,AUCTION_RT_IND                                              
LRM009             ,PENNY_STK_IND                                               
LRM010             ,GEO_CD                                                      
LRM011             ,FOREIGN_FEE_IND                                             
LRM011             ,FOREIGN_FEE_AMT                                             
LRM012             ,PEND_DVDND_DB_AMT                                           
LRM012             ,NTWRK_LVL4_FND_IND                                          
LRM016             ,PAPER_FEE_AMT                                               
                    )                                                           
                    VALUES                                                      
                    (                                                           
                      :DCLVTRNFR.CLIENT-NBR                                     
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                               
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                             
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                             
                     ,:DCLVTRNFR.DLVR-NBR                                       
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                               
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                                  
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                              
                     ,:DCLVTRNFR.RCV-NBR                                        
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                                
                     ,:DCLVTRNFR.ACCT-RCV-NBR                                   
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                               
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                                  
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                             
                     ,:DCLVTRNFR.TRANS-TYPE-CD                                  
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                             
                     ,:DCLVTRNFR.RCV-CUST-NM                                    
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                             
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                             
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                               
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                             
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                               
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                             
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                               
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                                
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                                  
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                              
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                             
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                              
                     ,:DCLVTRNFR.CMNT-TXT                                       
                     ,:DCLVTRNFR.CMNT-STTS-CD                                   
                     ,:DCLVTRNFR.PRCS-DT                                        
                     ,:DCLVTRNFR.STTS-CD                                        
                     ,:DCLVTRNFR.STTLM-TM-CD                                    
                     ,:DCLVTRNFR.VAL-FREE-CD                                    
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                               
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                             
                     ,:DCLVTRNFR.DB-CR-CD                                       
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                                  
                     ,:DCLVTRNFR.SYS-ACT-CD                                     
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                             
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                             
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                             
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                             
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                                  
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                              
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                                   
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                             
                     ,:DCLVTRNFR.RR-CD                                          
                     ,:DCLVTRNFR.BRANCH-CD                                      
                     ,:DCLVTRNFR.DVDND-NAA-CD                                   
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                              
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                              
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                                
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                              
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                              
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                                
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                             
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                             
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                               
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                             
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                             
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                              
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                             
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                             
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                             
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                             
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                               
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                             
                     ,:DCLVTRNFR.ACCT-MNGD-IND                                  
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                              
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                              
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                               
                     ,:DCLVTRNFR.CYCLE-CD                                       
                     ,:DCLVTRNFR.DAYS-STTS-QTY                                  
                     ,:DCLVTRNFR.STTLM-DT                                       
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                               
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     -3.     
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     -3.     
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     -3.     
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                             
                     ,:DCLVTRNFR.ACCT-CD                                        
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                                 
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                             
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                             
                     ,:DCLVTRNFR.RCRD-STTS-CD                                   
                     ,:DCLVTRNFR.NSCC-PEND-CD                                   
                     ,:DCLVTRNFR.NSCC-ACK-IND                                   
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                                
                     ,:DCLVTRNFR.PRGM-NM                                        
                     ,:DCLVTRNFR.CRT-TMSTP                                      
                     ,:DCLVTRNFR.UPDT-TMSTP                                     
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                                
                     ,:DCLVTRNFR.ALERT-IND                                      
                     ,:DCLVTRNFR.ACCT-RB-SEC-IND                                
                     ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                             
                     ,:DCLVTRNFR.ACCT-LGL-BLK-IND                               
                     ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                              
LRM003               ,:DCLVTRNFR.ACCT-FRZN-IND                                  
LRM004               ,:DCLVTRNFR.BRANCH-ALTNT-CD                                
LRM004               ,:DCLVTRNFR.GIFT-IND                                       
LRM004               ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                             
LRM004               ,:DCLVTRNFR.REG-T-IND                                      
LRM004               ,:DCLVTRNFR.ADOPT-AGRMT-IND                                
LRM004               ,:DCLVTRNFR.RR-ORGNL-CD                                    
LRM007               ,:DCLVTRNFR.CVRSN-ACCT-NBR                                 
DJ0002               ,:DCLVTRNFR.AUCTION-RT-IND                                 
LRM009               ,:DCLVTRNFR.PENNY-STK-IND                                  
LRM010               ,:DCLVTRNFR.GEO-CD                                         
LRM011               ,:DCLVTRNFR.FOREIGN-FEE-IND                                
LRM011               ,:DCLVTRNFR.FOREIGN-FEE-AMT                                
LRM012               ,:DCLVTRNFR.PEND-DVDND-DB-AMT                              
LRM012               ,:DCLVTRNFR.NTWRK-LVL4-FND-IND                             
LRM016               ,:DCLVTRNFR.PAPER-FEE-AMT                                  
                   )                                                            
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VTRNFR-COUNT                                       
              WHEN -803                                                         
                 PERFORM 1510-UPDATE-VTRNFR                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VTRNFR  INSERT'                       
                 MOVE 1500 TO ABORT-CODE                                        
                 PERFORM SQL-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
                                                                                
       1510-UPDATE-VTRNFR.                                                      
           EXEC SQL                                                             
               UPDATE VTRNFR                                                    
                 SET                                                            
                 SBMTG_PRTCP_NBR     =  :DCLVTRNFR.SBMTG-PRTCP-NBR              
                ,SBMT_PRT_NR_STS_CD  =  :DCLVTRNFR.SBMT-PRT-NR-STS-CD           
                ,CONTROL_NBR_STS_CD  =  :DCLVTRNFR.CONTROL-NBR-STS-CD           
                ,DLVR_NBR            =  :DCLVTRNFR.DLVR-NBR                     
                ,DLVR_NBR_STTS_CD    =  :DCLVTRNFR.DLVR-NBR-STTS-CD             
                ,ACCT_DLVR_NBR       =  :DCLVTRNFR.ACCT-DLVR-NBR                
                ,ACCT_DLVR_STTS_CD   =  :DCLVTRNFR.ACCT-DLVR-STTS-CD            
                ,RCV_NBR             =  :DCLVTRNFR.RCV-NBR                      
                ,RCV_NBR_STTS_CD     =  :DCLVTRNFR.RCV-NBR-STTS-CD              
                ,ACCT_RCV_NBR        =  :DCLVTRNFR.ACCT-RCV-NBR                 
                ,ACCT_RCV_STTS_CD    =  :DCLVTRNFR.ACCT-RCV-STTS-CD             
                ,TRNFR_TYPE_CD       =  :DCLVTRNFR.TRNFR-TYPE-CD                
                ,TRNFR_TYPE_STTS_CD  =  :DCLVTRNFR.TRNFR-TYPE-STTS-CD           
                ,TRANS_TYPE_CD       =  :DCLVTRNFR.TRANS-TYPE-CD                
                ,TRANS_TYPE_STTS_CD  =  :DCLVTRNFR.TRANS-TYPE-STTS-CD           
                ,RCV_CUST_NM         =  :DCLVTRNFR.RCV-CUST-NM                  
                ,RCV_CUST_NM_STS_CD  =  :DCLVTRNFR.RCV-CUST-NM-STS-CD           
                ,RCV_SS_PRIM_NBR     =  :DCLVTRNFR.RCV-SS-PRIM-NBR              
                ,RCV_SS_PRIM_STS_CD  =  :DCLVTRNFR.RCV-SS-PRIM-STS-CD           
                ,RCV_SS_SCNDY_NBR    =  :DCLVTRNFR.RCV-SS-SCNDY-NBR             
                ,RCV_SS_SCDY_STS_CD  =  :DCLVTRNFR.RCV-SS-SCDY-STS-CD           
                ,RCV_ACCT_TYPE_CD    =  :DCLVTRNFR.RCV-ACCT-TYPE-CD             
                ,RCV_ACT_TYP_STS_CD  =  :DCLVTRNFR.RCV-ACT-TYP-STS-CD           
                ,RCV_OCC_BRKR_NBR    =  :DCLVTRNFR.RCV-OCC-BRKR-NBR             
                ,RCV_OCC_STTS_CD     =  :DCLVTRNFR.RCV-OCC-STTS-CD              
                ,RCV_CRSPN_NBR       =  :DCLVTRNFR.RCV-CRSPN-NBR                
                ,RCV_CRSPN_STTS_CD   =  :DCLVTRNFR.RCV-CRSPN-STTS-CD            
                ,ACAT_CNTL_ASTD_NBR  =  :DCLVTRNFR.ACAT-CNTL-ASTD-NBR           
                ,CNTL_ASTD_STTS_CD   =  :DCLVTRNFR.CNTL-ASTD-STTS-CD            
                ,CMNT_TXT            =  :DCLVTRNFR.CMNT-TXT                     
                ,CMNT_STTS_CD        =  :DCLVTRNFR.CMNT-STTS-CD                 
                ,PRCS_DT             =  :DCLVTRNFR.PRCS-DT                      
                ,STTS_CD             =  :DCLVTRNFR.STTS-CD                      
                ,STTLM_TM_CD         =  :DCLVTRNFR.STTLM-TM-CD                  
                ,VAL_FREE_CD         =  :DCLVTRNFR.VAL-FREE-CD                  
                ,TRANS_RFRN_ID_CD    =  :DCLVTRNFR.TRANS-RFRN-ID-CD             
                ,TRANS_RFRN_STTS_CD  =  :DCLVTRNFR.TRANS-RFRN-STTS-CD           
                ,DB_CR_CD            =  :DCLVTRNFR.DB-CR-CD                     
                ,DSTBN_SIDE_CD       =  :DCLVTRNFR.DSTBN-SIDE-CD                
                ,SYS_ACT_CD          =  :DCLVTRNFR.SYS-ACT-CD                   
                ,SYS_RJCT_RSN_CD     =  :DCLVTRNFR.SYS-RJCT-RSN-CD              
                ,TRNFR_TYPE_RJC1_CD  =  :DCLVTRNFR.TRNFR-TYPE-RJC1-CD           
                ,TRNFR_TYPE_RJC2_CD  =  :DCLVTRNFR.TRNFR-TYPE-RJC2-CD           
                ,TRNFR_TYPE_RJCT_CD  =  :DCLVTRNFR.TRNFR-TYPE-RJCT-CD           
                ,TRN_TYP_RJC_STS_CD  =  :DCLVTRNFR.TRN-TYP-RJC-STS-CD           
                ,PHSCL_SEQ_NBR       =  :DCLVTRNFR.PHSCL-SEQ-NBR                
                ,PHSCL_SEQ_STTS_CD   =  :DCLVTRNFR.PHSCL-SEQ-STTS-CD            
                ,LGCL_SEQ_NBR        =  :DCLVTRNFR.LGCL-SEQ-NBR                 
                ,LGCL_SEQ_NR_STS_CD  =  :DCLVTRNFR.LGCL-SEQ-NR-STS-CD           
                ,RR_CD               =  :DCLVTRNFR.RR-CD                        
                ,BRANCH_CD           =  :DCLVTRNFR.BRANCH-CD                    
                ,DVDND_NAA_CD        =  :DCLVTRNFR.DVDND-NAA-CD                 
                ,SELL_INSTN_NAA_CD   =  :DCLVTRNFR.SELL-INSTN-NAA-CD            
                ,CASH_SWEEP_NAA_CD   =  :DCLVTRNFR.CASH-SWEEP-NAA-CD            
                ,PRTCP_CONTRA_CD     =  :DCLVTRNFR.PRTCP-CONTRA-CD              
                ,ACM_HOLDER_NAA_CD   =  :DCLVTRNFR.ACM-HOLDER-NAA-CD            
                ,ACCT_ACTIVITY_IND   =  :DCLVTRNFR.ACCT-ACTIVITY-IND            
                ,ACCT_ORDERS_IND     =  :DCLVTRNFR.ACCT-ORDERS-IND              
                ,ACCT_RJCT_RSBM_IND  =  :DCLVTRNFR.ACCT-RJCT-RSBM-IND           
                ,ACCT_DB_BAL_T1_IND  =  :DCLVTRNFR.ACCT-DB-BAL-T1-IND           
                ,ACCT_MRGN_DB_IND    =  :DCLVTRNFR.ACCT-MRGN-DB-IND             
                ,ACCT_SHRT_PSTN_IND  =  :DCLVTRNFR.ACCT-SHRT-PSTN-IND           
                ,ACCT_SEC_RSTRD_IND  =  :DCLVTRNFR.ACCT-SEC-RSTRD-IND           
                ,ACCT_AST_EXCS_IND   =  :DCLVTRNFR.ACCT-AST-EXCS-IND            
                ,ACCT_OPTN_PSTN_IND  =  :DCLVTRNFR.ACCT-OPTN-PSTN-IND           
                ,ACCT_LTD_PRTNR_IND  =  :DCLVTRNFR.ACCT-LTD-PRTNR-IND           
                ,ACCT_TIN_MSMTH_IND  =  :DCLVTRNFR.ACCT-TIN-MSMTH-IND           
                ,ACCT_DPLCT_TRN_IND  =  :DCLVTRNFR.ACCT-DPLCT-TRN-IND           
                ,ACCT_CUST_70_IND    =  :DCLVTRNFR.ACCT-CUST-70-IND             
                ,ACCT_QULFD_PLN_IND  =  :DCLVTRNFR.ACCT-QULFD-PLN-IND           
                ,ACCT_MNGD_IND       =  :DCLVTRNFR.ACCT-MNGD-IND                
                ,ACCT_PRVT_RNG_IND   =  :DCLVTRNFR.ACCT-PRVT-RNG-IND            
                ,ACCT_BRKR_TIF_IND   =  :DCLVTRNFR.ACCT-BRKR-TIF-IND            
                ,NSCC_NON_ADP_IND    =  :DCLVTRNFR.NSCC-NON-ADP-IND             
                ,CYCLE_CD            =  :DCLVTRNFR.CYCLE-CD                     
                ,DAYS_STTS_QTY       =  :DCLVTRNFR.DAYS-STTS-QTY                
                ,STTLM_DT            =  :DCLVTRNFR.STTLM-DT                     
                ,ACCT_NA_UPDT_IND    =  :DCLVTRNFR.ACCT-NA-UPDT-IND             
                ,ACCT_TRNFR_FEE_AMT  =  :DCLVTRNFR.ACCT-TRNFR-FEE-AMT           
                ,ACCT_IRA_TRMNT_AMT  =  :DCLVTRNFR.ACCT-IRA-TRMNT-AMT           
                ,ACCT_IRA_MAINT_AMT  =  :DCLVTRNFR.ACCT-IRA-MAINT-AMT           
                ,ACCT_DLRV_PRGR_IND  =  :DCLVTRNFR.ACCT-DLRV-PRGR-IND           
                ,ACCT_CD             =  :DCLVTRNFR.ACCT-CD                      
                ,STTLM_ASCTD_DT      =  :DCLVTRNFR.STTLM-ASCTD-DT               
                ,STTLM_ASCTD_STS_CD  =  :DCLVTRNFR.STTLM-ASCTD-STS-CD           
                ,RCRD_LNGTH_STTS_CD  =  :DCLVTRNFR.RCRD-LNGTH-STTS-CD           
                ,RCRD_STTS_CD        =  :DCLVTRNFR.RCRD-STTS-CD                 
                ,NSCC_PEND_CD        =  :DCLVTRNFR.NSCC-PEND-CD                 
                ,NSCC_ACK_IND        =  :DCLVTRNFR.NSCC-ACK-IND                 
                ,CICS_TERM_ID_CD     =  :DCLVTRNFR.CICS-TERM-ID-CD              
                ,PRGM_NM             =  :DCLVTRNFR.PRGM-NM                      
                ,CRT_TMSTP           =  :DCLVTRNFR.CRT-TMSTP                    
                ,UPDT_TMSTP          =  :DCLVTRNFR.UPDT-TMSTP                   
                ,ACCT_EQUITY_AMT     =  :DCLVTRNFR.ACCT-EQUITY-AMT              
                ,ALERT_IND           =  :DCLVTRNFR.ALERT-IND                    
                ,ACCT_RB_SEC_IND     =  :DCLVTRNFR.ACCT-RB-SEC-IND              
                ,ACCT_CLT_RSCND_IND  =  :DCLVTRNFR.ACCT-CLT-RSCND-IND           
                ,ACCT_LGL_BLK_IND    =  :DCLVTRNFR.ACCT-LGL-BLK-IND             
                ,FRV_MFC_CMPLT_IND   =  :DCLVTRNFR.FRV-MFC-CMPLT-IND            
LRM003          ,ACCT_FRZN_IND       =  :DCLVTRNFR.ACCT-FRZN-IND                
LRM004          ,BRANCH_ALTNT_CD     =  :DCLVTRNFR.BRANCH-ALTNT-CD              
LRM004          ,GIFT_IND            =  :DCLVTRNFR.GIFT-IND                     
LRM004          ,RSTR_TRD_90_DY_IND  =  :DCLVTRNFR.RSTR-TRD-90-DY-IND           
LRM004          ,REG_T_IND           =  :DCLVTRNFR.REG-T-IND                    
LRM004          ,ADOPT_AGRMT_IND     =  :DCLVTRNFR.ADOPT-AGRMT-IND              
LRM004          ,RR_ORGNL_CD         =  :DCLVTRNFR.RR-ORGNL-CD                  
LRM007          ,CVRSN_ACCT_NBR      =  :DCLVTRNFR.CVRSN-ACCT-NBR               
DJ0002          ,AUCTION_RT_IND      =  :DCLVTRNFR.AUCTION-RT-IND               
LRM009          ,PENNY_STK_IND       =  :DCLVTRNFR.PENNY-STK-IND                
LRM010          ,GEO_CD              =  :DCLVTRNFR.GEO-CD                       
LRM011          ,FOREIGN_FEE_IND     =  :DCLVTRNFR.FOREIGN-FEE-IND              
LRM011          ,FOREIGN_FEE_AMT     =  :DCLVTRNFR.FOREIGN-FEE-AMT              
LRM012          ,PEND_DVDND_DB_AMT   =  :DCLVTRNFR.PEND-DVDND-DB-AMT            
LRM012          ,NTWRK_LVL4_FND_IND  =  :DCLVTRNFR.NTWRK-LVL4-FND-IND           
LRM016          ,PAPER_FEE_AMT       =  :DCLVTRNFR.PAPER-FEE-AMT                
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVTRNFR.CLIENT-NBR   AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVTRNFR.ACAT-CONTROL-NBR                                  
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VTRNFR-COUNT-REPL                               
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VTRNFR  UPDATE'                       
                    MOVE 1510 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
      ******************                                                        
       1600-CREATE-ACTIVE-ASSET-RTN.                                            
      ******************                                                        
                                                                                
           MOVE RECORD-DETAIL TO DCLVASSET.                                     
           EXEC SQL                                                             
               INSERT INTO VASSET                                               
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,ASSET_PRC_CTGY_CD                                          
                    ,AST_PRC_CTG_STS_CD                                         
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_LCTN_STTS_CD                                         
                    ,STTLM_RSN_CD                                               
                    ,STTLM_RSN_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_DESC_STTS_CD                                         
                    ,ASSET_RQST_QTY_CD                                          
                    ,ASSET_RQST_STS_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,AST_RQ_TRAN_STS_CD                                         
                    ,ASSET_QTY                                                  
                    ,ASSET_QTY_STTS_CD                                          
                    ,ASSET_PCT                                                  
                    ,ASSET_PCT_STTS_CD                                          
                    ,PSTN_CD                                                    
                    ,PSTN_CD_STTS_CD                                            
                    ,ISO_CRNCY_CD                                               
                    ,ISO_CRNCY_STTS_CD                                          
                    ,ASSET_AMT                                                  
                    ,ASSET_AMT_STTS_CD                                          
                    ,BEARER_BOND_CD                                             
                    ,BEARER_BND_STTS_CD                                         
                    ,CSH_MGN_SHRT_CD                                            
                    ,CSH_MRG_SHT_STS_CD                                         
                    ,WHI_CD                                                     
                    ,WHI_STTS_CD                                                
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,TRN_TYP_RSN_STS_CD                                         
                    ,MBS_SERIAL_NBR                                             
                    ,MBS_SERIAL_STTS_CD                                         
                    ,ASSET_CMNT_TXT                                             
                    ,ASSET_CMNT_STTS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,FAIL_SENT_CAGE_IND                                         
                    ,FAIL_OPEN_CAGE_IND                                         
                    ,NSCC_NON_ADP_IND                                           
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,OPTN_CTGY_CD                                               
                    ,OPTN_CTGY_STTS_CD                                          
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,ISIN_SEC_EXCPT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,RCL_SENT_NSCC_IND                                          
                    ,FRV_SENT_NSCC_IND                                          
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RESTRICTED_IND                                             
                    ,CAGE_TAG_NBR                                               
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
DJ0002              ,AUCTION_RT_IND                                             
LRM011              ,FOREIGN_FEE_IND                                            
LRM013              ,CRNCY_CD                                                   
LRM014              ,MEMO_ORG_RVRSL_QTY                                         
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVASSET.CLIENT-NBR                                        
                  ,:DCLVASSET.ACAT-CONTROL-NBR                                  
                  ,:DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                                
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                                  
                  ,:DCLVASSET.RCV-NBR-STTS-CD                                   
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                                   
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                
                  ,:DCLVASSET.SYS-ACT-CD                                        
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                                   
                  ,:DCLVASSET.TRANS-TYPE-CD                                     
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                                
                  ,:DCLVASSET.PHSCL-SEQ-NBR                                     
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                 
                  ,:DCLVASSET.LGCL-SEQ-NBR                                      
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                                 
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                                
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                                
                  ,:DCLVASSET.STTLM-RSN-CD                                      
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                                 
                  ,:DCLVASSET.ISIN-CNTRY-CD                                     
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                                   
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                                
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                                 
                  ,:DCLVASSET.ASSET-RQST-STS-CD                                 
                  ,:DCLVASSET.AST-RQST-TRANS-CD                                 
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-PCT                                         
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                                 
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.PSTN-CD-STTS-CD                                   
                  ,:DCLVASSET.ISO-CRNCY-CD                                      
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                                 
                  ,:DCLVASSET.BEARER-BOND-CD                                    
                  ,:DCLVASSET.BEARER-BND-STTS-CD                                
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                
                  ,:DCLVASSET.WHI-CD                                            
                  ,:DCLVASSET.WHI-STTS-CD                                       
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                
                  ,:DCLVASSET.MBS-SERIAL-NBR                                    
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                                
                  ,:DCLVASSET.ASSET-CMNT-TXT                                    
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                                
                  ,:DCLVASSET.NSCC-ACK-IND                                      
                  ,:DCLVASSET.NSCC-PEND-CD                                      
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                                
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                
                  ,:DCLVASSET.NSCC-NON-ADP-IND                                  
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                                  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                                
                  ,:DCLVASSET.OPTN-CTGY-CD                                      
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                                 
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                
                  ,:DCLVASSET.RCRD-STTS-CD                                      
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                
                  ,:DCLVASSET.CRT-TMSTP                                         
                  ,:DCLVASSET.UPDT-TMSTP                                        
                  ,:DCLVASSET.CICS-TERM-ID-CD                                   
                  ,:DCLVASSET.PRGM-NM                                           
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                                 
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                                 
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                                
                  ,:DCLVASSET.RESTRICTED-IND                                    
                  ,:DCLVASSET.CAGE-TAG-NBR                                      
LRM002            ,:DCLVASSET.SCRTY-866-NBR                                     
LRM002            ,:DCLVASSET.ASSET-866-QTY                                     
DJ0002            ,:DCLVASSET.AUCTION-RT-IND                                    
LRM011            ,:DCLVASSET.FOREIGN-FEE-IND                                   
LRM013            ,:DCLVASSET.CRNCY-CD                                          
LRM014            ,:DCLVASSET.MEMO-ORG-RVRSL-QTY                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1610-UPDATE-VASSET-RTN                               
              WHEN +0                                                           
                    ADD 1 TO WS-VASSET-COUNT                                    
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VASSET  INSERT'                       
                    MOVE 1600 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       1610-UPDATE-VASSET-RTN.                                                  
           EXEC SQL                                                             
               UPDATE VASSET                                                    
                 SET                                                            
                 CONTROL_NBR_STS_CD  = :DCLVASSET.CONTROL-NBR-STS-CD            
                ,DLVR_NBR_STTS_CD    = :DCLVASSET.DLVR-NBR-STTS-CD              
                ,RCV_NBR_STTS_CD     = :DCLVASSET.RCV-NBR-STTS-CD               
                ,SBMTG_PRTCP_NBR     = :DCLVASSET.SBMTG-PRTCP-NBR               
                ,SBMT_PRT_NR_STS_CD  = :DCLVASSET.SBMT-PRT-NR-STS-CD            
                ,AST_SEQ_NBR_STS_CD  = :DCLVASSET.AST-SEQ-NBR-STS-CD            
                ,SYS_ACT_CD          = :DCLVASSET.SYS-ACT-CD                    
                ,SYS_RJCT_RSN_CD     = :DCLVASSET.SYS-RJCT-RSN-CD               
                ,TRANS_TYPE_CD       = :DCLVASSET.TRANS-TYPE-CD                 
                ,TRANS_TYPE_STTS_CD  = :DCLVASSET.TRANS-TYPE-STTS-CD            
                ,PHSCL_SEQ_NBR       = :DCLVASSET.PHSCL-SEQ-NBR                 
                ,PHSCL_SEQ_STTS_CD   = :DCLVASSET.PHSCL-SEQ-STTS-CD             
                ,LGCL_SEQ_NBR        = :DCLVASSET.LGCL-SEQ-NBR                  
                ,LGCL_SEQ_NR_STS_CD  = :DCLVASSET.LGCL-SEQ-NR-STS-CD            
                ,ASSET_PRC_CTGY_CD   = :DCLVASSET.ASSET-PRC-CTGY-CD             
                ,AST_PRC_CTG_STS_CD  = :DCLVASSET.AST-PRC-CTG-STS-CD            
                ,STTLM_LCTN_CD       = :DCLVASSET.STTLM-LCTN-CD                 
                ,STTLM_LCTN_STTS_CD  = :DCLVASSET.STTLM-LCTN-STTS-CD            
                ,STTLM_RSN_CD        = :DCLVASSET.STTLM-RSN-CD                  
                ,STTLM_RSN_STTS_CD   = :DCLVASSET.STTLM-RSN-STTS-CD             
                ,ISIN_CNTRY_CD       = :DCLVASSET.ISIN-CNTRY-CD                 
                ,ISIN_CNTRY_STTS_CD  = :DCLVASSET.ISIN-CNTRY-STTS-CD            
                ,ISIN_SEC_ISSUE_CD   = :DCLVASSET.ISIN-SEC-ISSUE-CD             
                ,ISIN_SEC_IS_STS_CD  = :DCLVASSET.ISIN-SEC-IS-STS-CD            
                ,ISIN_SEC_CDG_CD     = :DCLVASSET.ISIN-SEC-CDG-CD               
                ,ISIN_SEC_CD_STS_CD  = :DCLVASSET.ISIN-SEC-CD-STS-CD            
                ,ASSET_DESC_TXT      = :DCLVASSET.ASSET-DESC-TXT                
                ,ASSET_DESC_STTS_CD  = :DCLVASSET.ASSET-DESC-STTS-CD            
                ,ASSET_RQST_QTY_CD   = :DCLVASSET.ASSET-RQST-QTY-CD             
                ,ASSET_RQST_STS_CD   = :DCLVASSET.ASSET-RQST-STS-CD             
                ,AST_RQST_TRANS_CD   = :DCLVASSET.AST-RQST-TRANS-CD             
                ,AST_RQ_TRAN_STS_CD  = :DCLVASSET.AST-RQ-TRAN-STS-CD            
                ,ASSET_QTY           = :DCLVASSET.ASSET-QTY                     
                ,ASSET_QTY_STTS_CD   = :DCLVASSET.ASSET-QTY-STTS-CD             
                ,ASSET_PCT           = :DCLVASSET.ASSET-PCT                     
                ,ASSET_PCT_STTS_CD   = :DCLVASSET.ASSET-PCT-STTS-CD             
                ,PSTN_CD             = :DCLVASSET.PSTN-CD                       
                ,PSTN_CD_STTS_CD     = :DCLVASSET.PSTN-CD-STTS-CD               
                ,ISO_CRNCY_CD        = :DCLVASSET.ISO-CRNCY-CD                  
                ,ISO_CRNCY_STTS_CD   = :DCLVASSET.ISO-CRNCY-STTS-CD             
                ,ASSET_AMT           = :DCLVASSET.ASSET-AMT                     
                ,ASSET_AMT_STTS_CD   = :DCLVASSET.ASSET-AMT-STTS-CD             
                ,BEARER_BOND_CD      = :DCLVASSET.BEARER-BOND-CD                
                ,BEARER_BND_STTS_CD  = :DCLVASSET.BEARER-BND-STTS-CD            
                ,CSH_MGN_SHRT_CD     = :DCLVASSET.CSH-MGN-SHRT-CD               
                ,CSH_MRG_SHT_STS_CD  = :DCLVASSET.CSH-MRG-SHT-STS-CD            
                ,WHI_CD              = :DCLVASSET.WHI-CD                        
                ,WHI_STTS_CD         = :DCLVASSET.WHI-STTS-CD                   
                ,TRNFR_TYPE_RSN_CD   = :DCLVASSET.TRNFR-TYPE-RSN-CD             
                ,TRN_TYP_RSN_STS_CD  = :DCLVASSET.TRN-TYP-RSN-STS-CD            
                ,MBS_SERIAL_NBR      = :DCLVASSET.MBS-SERIAL-NBR                
                ,MBS_SERIAL_STTS_CD  = :DCLVASSET.MBS-SERIAL-STTS-CD            
                ,ASSET_CMNT_TXT      = :DCLVASSET.ASSET-CMNT-TXT                
                ,ASSET_CMNT_STTS_CD  = :DCLVASSET.ASSET-CMNT-STTS-CD            
                ,NSCC_ACK_IND        = :DCLVASSET.NSCC-ACK-IND                  
                ,NSCC_PEND_CD        = :DCLVASSET.NSCC-PEND-CD                  
                ,FAIL_SENT_CAGE_IND  = :DCLVASSET.FAIL-SENT-CAGE-IND            
                ,FAIL_OPEN_CAGE_IND  = :DCLVASSET.FAIL-OPEN-CAGE-IND            
                ,NSCC_NON_ADP_IND    = :DCLVASSET.NSCC-NON-ADP-IND              
                ,TRANS_RFRN_ID_CD    = :DCLVASSET.TRANS-RFRN-ID-CD              
                ,TRANS_RFRN_STTS_CD  = :DCLVASSET.TRANS-RFRN-STTS-CD            
                ,OPTN_CTGY_CD        = :DCLVASSET.OPTN-CTGY-CD                  
                ,OPTN_CTGY_STTS_CD   = :DCLVASSET.OPTN-CTGY-STTS-CD             
                ,RCRD_LNGTH_STTS_CD  = :DCLVASSET.RCRD-LNGTH-STTS-CD            
                ,RCRD_STTS_CD        = :DCLVASSET.RCRD-STTS-CD                  
                ,ISIN_SEC_EXCPT_IND  = :DCLVASSET.ISIN-SEC-EXCPT-IND            
                ,CRT_TMSTP           = :DCLVASSET.CRT-TMSTP                     
                ,UPDT_TMSTP          = :DCLVASSET.UPDT-TMSTP                    
                ,CICS_TERM_ID_CD     = :DCLVASSET.CICS-TERM-ID-CD               
                ,PRGM_NM             = :DCLVASSET.PRGM-NM                       
                ,SECURITY_ADP_NBR    = :DCLVASSET.SECURITY-ADP-NBR              
                ,RCL_SENT_NSCC_IND   = :DCLVASSET.RCL-SENT-NSCC-IND             
                ,FRV_SENT_NSCC_IND   = :DCLVASSET.FRV-SENT-NSCC-IND             
                ,TRNFR_TYPE_CD       = :DCLVASSET.TRNFR-TYPE-CD                 
                ,TRNFR_TYPE_STTS_CD  = :DCLVASSET.TRNFR-TYPE-STTS-CD            
                ,RESTRICTED_IND      = :DCLVASSET.RESTRICTED-IND                
                ,CAGE_TAG_NBR        = :DCLVASSET.CAGE-TAG-NBR                  
LRM002          ,SCRTY_866_NBR       = :DCLVASSET.SCRTY-866-NBR                 
LRM002          ,ASSET_866_QTY       = :DCLVASSET.ASSET-866-QTY                 
DJ0002          ,AUCTION_RT_IND      = :DCLVASSET.AUCTION-RT-IND                
LRM011          ,FOREIGN_FEE_IND     = :DCLVASSET.FOREIGN-FEE-IND               
LRM013          ,CRNCY_CD            = :DCLVASSET.CRNCY-CD                      
LRM014          ,MEMO_ORG_RVRSL_QTY  = :DCLVASSET.MEMO-ORG-RVRSL-QTY            
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVASSET.CLIENT-NBR   AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVASSET.ACAT-CONTROL-NBR  AND                             
                    ASSET_SEQ_NBR  =                                            
                   :DCLVASSET.ASSET-SEQ-NBR                                     
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VASSET-COUNT-REPL                               
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VASSET  UPDATE'                       
                    MOVE 1610 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1700-CREATE-ACTIVE-MF-RTN.                                               
                                                                                
           MOVE RECORD-DETAIL TO DCLVMF.                                        
           EXEC SQL                                                             
               INSERT INTO VMF                                                  
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,ACCT_TYPE_CD                                               
                    ,ACCT_TYPE_STTS_CD                                          
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,DVDND_PAYEE_CD                                             
                    ,DVDND_PYE_STTS_CD                                          
                    ,LTCG_CD                                                    
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,STCG_CD                                                    
                    ,MF_FULL_PRTL_CD                                            
                    ,MF_FUL_PRTL_STS_CD                                         
                    ,RGSTN_CD                                                   
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,FCST_ACCT_RCVR_NBR                                         
                    ,FCST_RCVR_STTS_CD                                          
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVMF.CLIENT-NBR                                           
                  ,:DCLVMF.ACAT-CONTROL-NBR                                     
                  ,:DCLVMF.ASSET-SEQ-NBR                                        
                  ,:DCLVMF.BK-PHSCL-SHR-CD                                      
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                                   
                  ,:DCLVMF.NTWRK-CNTL-CD                                        
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                                   
                  ,:DCLVMF.ACCT-TYPE-CD                                         
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                                    
                  ,:DCLVMF.DVDND-CD                                             
                  ,:DCLVMF.DVDND-STTS-CD                                        
                  ,:DCLVMF.DVDND-PAYEE-CD                                       
                  ,:DCLVMF.DVDND-PYE-STTS-CD                                    
                  ,:DCLVMF.LTCG-CD                                              
                  ,:DCLVMF.BRKR-EXCTG-NBR                                       
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                                   
                  ,:DCLVMF.STCG-CD                                              
                  ,:DCLVMF.MF-FULL-PRTL-CD                                      
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                                   
                  ,:DCLVMF.RGSTN-CD                                             
                  ,:DCLVMF.FNBR                                                 
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                                   
                  ,:DCLVMF.DSTBN-SIDE-CD                                        
                  ,:DCLVMF.PRCS-DT                                              
                  ,:DCLVMF.CRT-TMSTP                                            
                  ,:DCLVMF.UPDT-TMSTP                                           
                  ,:DCLVMF.CICS-TERM-ID-CD                                      
                  ,:DCLVMF.PRGM-NM                                              
                  ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                  ,:DCLVMF.FCST-RCVR-STTS-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1710-UPDATE-VMF-RTN                                  
              WHEN +0                                                           
                    ADD 1 TO WS-VMF-COUNT                                       
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VMF     INSERT'                       
                    MOVE 1700 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       1710-UPDATE-VMF-RTN.                                                     
           EXEC SQL                                                             
               UPDATE VMF                                                       
                 SET                                                            
                 BK_PHSCL_SHR_CD       = :DCLVMF.BK-PHSCL-SHR-CD                
                ,BK_PHSC_SHR_STS_CD    = :DCLVMF.BK-PHSC-SHR-STS-CD             
                ,NTWRK_CNTL_CD         = :DCLVMF.NTWRK-CNTL-CD                  
                ,NTWRK_CNTL_STTS_CD    = :DCLVMF.NTWRK-CNTL-STTS-CD             
                ,ACCT_TYPE_CD          = :DCLVMF.ACCT-TYPE-CD                   
                ,ACCT_TYPE_STTS_CD     = :DCLVMF.ACCT-TYPE-STTS-CD              
                ,DVDND_CD              = :DCLVMF.DVDND-CD                       
                ,DVDND_STTS_CD         = :DCLVMF.DVDND-STTS-CD                  
                ,DVDND_PAYEE_CD        = :DCLVMF.DVDND-PAYEE-CD                 
                ,DVDND_PYE_STTS_CD     = :DCLVMF.DVDND-PYE-STTS-CD              
                ,LTCG_CD               = :DCLVMF.LTCG-CD                        
                ,BRKR_EXCTG_NBR        = :DCLVMF.BRKR-EXCTG-NBR                 
                ,BRKR_EXCTG_STTS_CD    = :DCLVMF.BRKR-EXCTG-STTS-CD             
                ,STCG_CD               = :DCLVMF.STCG-CD                        
                ,MF_FULL_PRTL_CD       = :DCLVMF.MF-FULL-PRTL-CD                
                ,MF_FUL_PRTL_STS_CD    = :DCLVMF.MF-FUL-PRTL-STS-CD             
                ,RGSTN_CD              = :DCLVMF.RGSTN-CD                       
                ,FNBR                  = :DCLVMF.FNBR                           
                ,FND_ACT_NBR_STS_CD    = :DCLVMF.FND-ACT-NBR-STS-CD             
                ,DSTBN_SIDE_CD         = :DCLVMF.DSTBN-SIDE-CD                  
                ,PRCS_DT               = :DCLVMF.PRCS-DT                        
                ,CRT_TMSTP             = :DCLVMF.CRT-TMSTP                      
                ,UPDT_TMSTP            = :DCLVMF.UPDT-TMSTP                     
                ,CICS_TERM_ID_CD       = :DCLVMF.CICS-TERM-ID-CD                
                ,PRGM_NM               = :DCLVMF.PRGM-NM                        
                ,FCST_ACCT_RCVR_NBR    = :DCLVMF.FCST-ACCT-RCVR-NBR             
                ,FCST_RCVR_STTS_CD     = :DCLVMF.FCST-RCVR-STTS-CD              
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVMF.CLIENT-NBR   AND                                     
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVMF.ACAT-CONTROL-NBR  AND                                
                    ASSET_SEQ_NBR  =                                            
                   :DCLVMF.ASSET-SEQ-NBR                                        
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VMF-COUNT-REPL                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VMF     UPDATE'                       
                    MOVE 1710 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1800-CREATE-ACTIVE-OPTN-RTN.                                             
                                                                                
           MOVE RECORD-DETAIL TO DCLVOPTN.                                      
           EXEC SQL                                                             
               INSERT INTO VOPTN                                                
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_STS_CD                                         
                    ,SYM_CD                                                     
                    ,SYM_STTS_CD                                                
                    ,EXPTN_DT                                                   
                    ,STPRC_INTEGER_AMT                                          
                    ,STPRC_INTR_STTS_CD                                         
                    ,STPRC_FRCTN_AMT                                            
                    ,STPRC_FRCT_STTS_CD                                         
                    ,DLVR_OCC_NBR                                               
                    ,OPTN_ACCT_TYPE_CD                                          
                    ,OPT_ACT_TYP_STS_CD                                         
                    ,ACCT_SUB_CD                                                
                    ,ACCT_SUB_STTS_CD                                           
                    ,OPTN_CMNT_TXT                                              
                    ,OPTN_CMNT_STTS_CD                                          
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,ACCT_TYPE_MSMT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,STPRC_DEC_FRCN_IND                                         
                    ,STPRC_INTEGER2_AMT                                         
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVOPTN.CLIENT-NBR                                         
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                                   
                  ,:DCLVOPTN.ASSET-SEQ-NBR                                      
                  ,:DCLVOPTN.BS-CD                                              
                  ,:DCLVOPTN.BS-STTS-CD                                         
                  ,:DCLVOPTN.PTCL-CD                                            
                  ,:DCLVOPTN.PTCL-STTS-CD                                       
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                                   
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                                 
                  ,:DCLVOPTN.SYM-CD                                             
                  ,:DCLVOPTN.SYM-STTS-CD                                        
                  ,:DCLVOPTN.EXPTN-DT                                           
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                                  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                                 
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                                    
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                                 
                  ,:DCLVOPTN.DLVR-OCC-NBR                                       
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                                  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                                 
                  ,:DCLVOPTN.ACCT-SUB-CD                                        
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                                   
                  ,:DCLVOPTN.OPTN-CMNT-TXT                                      
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                                  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                                   
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                                 
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                                 
                  ,:DCLVOPTN.CRT-TMSTP                                          
                  ,:DCLVOPTN.UPDT-TMSTP                                         
                  ,:DCLVOPTN.PRGM-NM                                            
                  ,:DCLVOPTN.CICS-TERM-ID-CD                                    
                  ,:DCLVOPTN.STPRC-DEC-FRCN-IND                                 
LRM009            ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1810-UPDATE-VOPTN-RTN                                
              WHEN +0                                                           
                    ADD 1 TO WS-VOPTN-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VOPTN   INSERT'                       
                    MOVE 1800 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       1810-UPDATE-VOPTN-RTN.                                                   
           EXEC SQL                                                             
               UPDATE VOPTN                                                     
                 SET                                                            
                 BS_CD              = :DCLVOPTN.BS-CD                           
                ,BS_STTS_CD         = :DCLVOPTN.BS-STTS-CD                      
                ,PTCL_CD            = :DCLVOPTN.PTCL-CD                         
                ,PTCL_STTS_CD       = :DCLVOPTN.PTCL-STTS-CD                    
                ,OPTN_OPN_CLSD_CD   = :DCLVOPTN.OPTN-OPN-CLSD-CD                
                ,OPT_OPN_CLS_STS_CD = :DCLVOPTN.OPT-OPN-CLS-STS-CD              
                ,SYM_CD             = :DCLVOPTN.SYM-CD                          
                ,SYM_STTS_CD        = :DCLVOPTN.SYM-STTS-CD                     
                ,EXPTN_DT           = :DCLVOPTN.EXPTN-DT                        
                ,STPRC_INTEGER_AMT  = :DCLVOPTN.STPRC-INTEGER-AMT               
                ,STPRC_INTR_STTS_CD = :DCLVOPTN.STPRC-INTR-STTS-CD              
                ,STPRC_FRCTN_AMT    = :DCLVOPTN.STPRC-FRCTN-AMT                 
                ,STPRC_FRCT_STTS_CD = :DCLVOPTN.STPRC-FRCT-STTS-CD              
                ,DLVR_OCC_NBR       = :DCLVOPTN.DLVR-OCC-NBR                    
                ,OPTN_ACCT_TYPE_CD  = :DCLVOPTN.OPTN-ACCT-TYPE-CD               
                ,OPT_ACT_TYP_STS_CD = :DCLVOPTN.OPT-ACT-TYP-STS-CD              
                ,ACCT_SUB_CD        = :DCLVOPTN.ACCT-SUB-CD                     
                ,ACCT_SUB_STTS_CD   = :DCLVOPTN.ACCT-SUB-STTS-CD                
                ,OPTN_CMNT_TXT      = :DCLVOPTN.OPTN-CMNT-TXT                   
                ,OPTN_CMNT_STTS_CD  = :DCLVOPTN.OPTN-CMNT-STTS-CD               
                ,OPTN_EXPTN_DT_CD   = :DCLVOPTN.OPTN-EXPTN-DT-CD                
                ,OPT_OCC_DLV_STS_CD = :DCLVOPTN.OPT-OCC-DLV-STS-CD              
                ,ACCT_TYPE_MSMT_IND = :DCLVOPTN.ACCT-TYPE-MSMT-IND              
                ,CRT_TMSTP          = :DCLVOPTN.CRT-TMSTP                       
                ,UPDT_TMSTP         = :DCLVOPTN.UPDT-TMSTP                      
                ,PRGM_NM            = :DCLVOPTN.PRGM-NM                         
                ,CICS_TERM_ID_CD    = :DCLVOPTN.CICS-TERM-ID-CD                 
                ,STPRC_DEC_FRCN_IND = :DCLVOPTN.STPRC-DEC-FRCN-IND              
LRM009          ,STPRC_INTEGER2_AMT = :DCLVOPTN.STPRC-INTEGER2-AMT              
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVOPTN.CLIENT-NBR   AND                                   
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVOPTN.ACAT-CONTROL-NBR  AND                              
                    ASSET_SEQ_NBR  =                                            
                   :DCLVOPTN.ASSET-SEQ-NBR                                      
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VOPTN-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VOPTN   UPDATE'                       
                    MOVE 1810 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       1900-CREATE-VFNDRGST-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVFNDRGST.                                   
           EXEC SQL                                                             
               INSERT INTO VFNDRGST                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,CONTROL_NBR_STS_CD                                         
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,MF_TRANS_TYPE_CD                                           
                    ,MF_TRAN_TYP_STS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,NRA_TAX_PCT                                                
                    ,NRA_TAX_PCT_CD                                             
                    ,DSBMT_ACCRL_CD                                             
                    ,DSBMT_ACCRL_STS_CD                                         
                    ,DSBMT_FRCTN_CSH_CD                                         
                    ,DSBMT_FRCTN_STS_CD                                         
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,FRCTN_CD                                                   
                    ,FRCTN_STTS_CD                                              
                    ,DLRVY_CD                                                   
                    ,TPA_NBR                                                    
                    ,TPA_NBR_STTS_CD                                            
                    ,CUST_NM                                                    
                    ,CUST_NM_STTS_CD                                            
                    ,FUND_ACCT_CD                                               
                    ,FUND_ACCT_STTS_CD                                          
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,DSBMT_RSDL_CD                                              
                    ,DSBMT_RSDL_STS_CD                                          
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,LTCG_CD                                                    
                    ,SS_TIN_CD                                                  
                    ,STCG_CD                                                    
                    ,WTHLD_CD                                                   
                    ,WTHLD_STTS_CD                                              
                    ,PYBL_INFO_CD                                               
                    ,PYBL_INFO_STTS_CD                                          
                    ,ZIP5_CD                                                    
                    ,ZIP5_STTS_CD                                               
                    ,ZIP4_CD                                                    
                    ,ZIP4_STTS_CD                                               
                    ,SOC_CD                                                     
                    ,SOC_STTS_CD                                                
                    ,NAV_ACCT_IND                                               
                    ,NAV_ACCT_STTS_CD                                           
                    ,MRGN_ACCT_IND                                              
                    ,MRGN_ACCT_STTS_CD                                          
                    ,CHCK_WRTNG_IND                                             
                    ,CHCK_WRTNG_STTS_CD                                         
                    ,SL_ST_CD                                                   
                    ,SL_ST_STTS_CD                                              
                    ,CNTRY_ORGN_CD                                              
                    ,CNTRY_ORGN_STTS_CD                                         
                    ,ACCT_RR_NM                                                 
                    ,ACCT_RR_NM_STTS_CD                                         
                    ,ACCT_RR_CD                                                 
                    ,ACCT_RR_STTS_CD                                            
                    ,BRCH_NBR                                                   
                    ,BRCH_NBR_STTS_CD                                           
                    ,PYBL_QTY                                                   
                    ,PYBL_QTY_STTS_CD                                           
                    ,MEMO_TXT                                                   
                    ,MEMO_STTS_CD                                               
                    ,ACH_IND                                                    
                    ,ACH_STTS_CD                                                
                    ,PAC_IND                                                    
                    ,PAC_STTS_CD                                                
                    ,SWP_IND                                                    
                    ,SWP_STTS_CD                                                
                    ,ROA_LOI_AMT                                                
                    ,ROA_LOI_STTS_CD                                            
                    ,LOI_DT                                                     
                    ,LOI_STTS_CD                                                
                    ,TRD_RLTD_IND                                               
                    ,TRD_RLTD_STTS_CD                                           
                    ,ACCT_RLTD_NBR                                              
                    ,ACCT_RLTD_STTS_CD                                          
                    ,ACCT_RLTD_CD                                               
                    ,ACCT_RLT_IN_STS_CD                                         
                    ,SWP_PAC_EFFCT_DT                                           
                    ,SWP_PAC_DT_STTS_CD                                         
                    ,CDSC_PYMNT_CD                                              
                    ,CDSC_PYMNT_STTS_CD                                         
                    ,DSBMT_OPTN_CD                                              
                    ,DSBMT_OPTN_STTS_CD                                         
                    ,DSBMT_AMT                                                  
                    ,DSBMT_AMT_STTS_CD                                          
                    ,PYMNT_JAN_IND                                              
                    ,PYMNT_FEB_IND                                              
                    ,PYMNT_MAR_IND                                              
                    ,PYMNT_APR_IND                                              
                    ,PYMNT_MAY_IND                                              
                    ,PYMNT_JUN_IND                                              
                    ,PYMNT_JUL_IND                                              
                    ,PYMNT_AUG_IND                                              
                    ,PYMNT_SEP_IND                                              
                    ,PYMNT_OCT_IND                                              
                    ,PYMNT_NOV_IND                                              
                    ,PYMNT_DEC_IND                                              
                    ,PYMNT_MO_STTS_CD                                           
                    ,PYMNT_DT_CD                                                
                    ,PYMNT_DT_STTS_CD                                           
                    ,RTRMT_TAX_CD                                               
                    ,RTRMT_TAX_STTS_CD                                          
                    ,SHRHR_BNK_ACCT_NBR                                         
                    ,SHR_BNK_ACT_STS_CD                                         
                    ,SHRHR_BNK_TYPE_CD                                          
                    ,SHR_BNK_TYP_STS_CD                                         
                    ,CHCK_FRST_DT                                               
                    ,CHCK_FRS_DT_STS_CD                                         
                    ,ABA_ROUTING_NBR                                            
                    ,ABA_ROTNG_STTS_CD                                          
                    ,COST_BSS_CD                                                
                    ,COST_BS_OPT_STS_CD                                         
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,SS_TIN_NBR                                                 
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,TRANS_TYPE_STTS_CD                                         
                    ,TRNFR_TYPE_CD                                              
                    ,TRNFR_TYPE_STTS_CD                                         
                    ,RCV_NBR_STTS_CD                                            
                    ,DLVR_NBR_STS_CD                                            
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,PI_DLRVY_CD                                                
                    ,PI_DLVRY_STTS_CD                                           
                    ,AST_PRC_CTG_STS_CD                                         
                    ,SS_TIN_STTS_CD                                             
                    ,SS_TIN_NBR_STTS_CD                                         
                    ,CUST_NM_LN_STTS_CD                                         
                    ,NM_END_LN_QTY                                              
                    ,NM_END_LN_STTS_CD                                          
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,ACTION_TYPE_CD                                             
                    ,FND_SERV_CNTL_NBR                                          
                    ,CUST_FUND_NM                                               
                    ,CERT_NBR                                                   
                    ,ASSET_QTY                                                  
                    ,ASSET_ORGNL_QTY                                            
                    ,ISO_CRNCY_CD                                               
                    ,ASSET_AMT                                                  
                    ,DB_CR_CD                                                   
                    ,ASSET_DESC_TXT                                             
                    ,CERT_DT                                                    
                    ,STTLM_ASCTD_DT                                             
                    ,STTLM_DT                                                   
                    ,RJCT_CD                                                    
                    ,NSCC_NON_ADP_IND                                           
                    ,NSCC_PEND_CD                                               
                    ,NSCC_ACK_IND                                               
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,SECURITY_ADP_NBR                                           
                    ,DLVR_NBR                                                   
                    ,ROA_LOI_CD                                                 
                    ,FUND_BK_CD                                                 
                    ,W8_WTHLD_CD                                                
                    ,W8_CERT_DT                                                 
                    ,W8_EXPTN_DT                                                
                    ,W8_OVRD_NRA_SPC_RT                                         
                    ,W8_QULFD_INTRM_IND                                         
                    ,W8_OVRD_CNTRY_CD                                           
                    ,W8_WTHLD_STTS_CD                                           
                    ,W8_CERT_DT_STTS_CD                                         
                    ,W8_EXPTN_DT_STS_CD                                         
                    ,W8_SPCL_RT_STTS_CD                                         
                    ,W8_QLFD_INT_STS_CD                                         
                    ,W8_ORD_CTRY_STS_CD                                         
LRM015              ,FND_AGNT_CD                                                
LRM017              ,SENT_BNWTRAN_IND                                           
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVFNDRGST.CLIENT-NBR                                      
                  ,:DCLVFNDRGST.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDRGST.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDRGST.SBMTG-PRTCP-NBR                                 
                  ,:DCLVFNDRGST.SBMT-PRT-NR-STS-CD                              
                  ,:DCLVFNDRGST.CONTROL-NBR-STS-CD                              
                  ,:DCLVFNDRGST.AST-SEQ-NBR-STS-CD                              
                  ,:DCLVFNDRGST.SYS-ACT-CD                                      
                  ,:DCLVFNDRGST.SYS-RJCT-RSN-CD                                 
                  ,:DCLVFNDRGST.MF-TRANS-TYPE-CD                                
                  ,:DCLVFNDRGST.MF-TRAN-TYP-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-STTS-CD                                    
                  ,:DCLVFNDRGST.NRA-TAX-PCT                                     
                  ,:DCLVFNDRGST.NRA-TAX-PCT-CD                                  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-CD                                  
                  ,:DCLVFNDRGST.DSBMT-ACCRL-STS-CD                              
                  ,:DCLVFNDRGST.DSBMT-FRCTN-CSH-CD                              
                  ,:DCLVFNDRGST.DSBMT-FRCTN-STS-CD                              
                  ,:DCLVFNDRGST.BK-PHSCL-SHR-CD                                 
                  ,:DCLVFNDRGST.BK-PHSC-SHR-STS-CD                              
                  ,:DCLVFNDRGST.FRCTN-CD                                        
                  ,:DCLVFNDRGST.FRCTN-STTS-CD                                   
                  ,:DCLVFNDRGST.DLRVY-CD                                        
                  ,:DCLVFNDRGST.TPA-NBR                                         
                  ,:DCLVFNDRGST.TPA-NBR-STTS-CD                                 
                  ,:DCLVFNDRGST.CUST-NM                                         
                  ,:DCLVFNDRGST.CUST-NM-STTS-CD                                 
                  ,:DCLVFNDRGST.FUND-ACCT-CD                                    
                  ,:DCLVFNDRGST.FUND-ACCT-STTS-CD                               
                  ,:DCLVFNDRGST.BRKR-EXCTG-NBR                                  
                  ,:DCLVFNDRGST.BRKR-EXCTG-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-RSDL-CD                                   
                  ,:DCLVFNDRGST.DSBMT-RSDL-STS-CD                               
                  ,:DCLVFNDRGST.NTWRK-CNTL-CD                                   
                  ,:DCLVFNDRGST.NTWRK-CNTL-STTS-CD                              
                  ,:DCLVFNDRGST.DVDND-CD                                        
                  ,:DCLVFNDRGST.DVDND-STTS-CD                                   
                  ,:DCLVFNDRGST.FNBR                                            
                  ,:DCLVFNDRGST.FND-ACT-NBR-STS-CD                              
                  ,:DCLVFNDRGST.LTCG-CD                                         
                  ,:DCLVFNDRGST.SS-TIN-CD                                       
                  ,:DCLVFNDRGST.STCG-CD                                         
                  ,:DCLVFNDRGST.WTHLD-CD                                        
                  ,:DCLVFNDRGST.WTHLD-STTS-CD                                   
                  ,:DCLVFNDRGST.PYBL-INFO-CD                                    
                  ,:DCLVFNDRGST.PYBL-INFO-STTS-CD                               
                  ,:DCLVFNDRGST.ZIP5-CD                                         
                  ,:DCLVFNDRGST.ZIP5-STTS-CD                                    
                  ,:DCLVFNDRGST.ZIP4-CD                                         
                  ,:DCLVFNDRGST.ZIP4-STTS-CD                                    
                  ,:DCLVFNDRGST.SOC-CD                                          
                  ,:DCLVFNDRGST.SOC-STTS-CD                                     
                  ,:DCLVFNDRGST.NAV-ACCT-IND                                    
                  ,:DCLVFNDRGST.NAV-ACCT-STTS-CD                                
                  ,:DCLVFNDRGST.MRGN-ACCT-IND                                   
                  ,:DCLVFNDRGST.MRGN-ACCT-STTS-CD                               
                  ,:DCLVFNDRGST.CHCK-WRTNG-IND                                  
                  ,:DCLVFNDRGST.CHCK-WRTNG-STTS-CD                              
                  ,:DCLVFNDRGST.SL-ST-CD                                        
                  ,:DCLVFNDRGST.SL-ST-STTS-CD                                   
                  ,:DCLVFNDRGST.CNTRY-ORGN-CD                                   
                  ,:DCLVFNDRGST.CNTRY-ORGN-STTS-CD                              
                  ,:DCLVFNDRGST.ACCT-RR-NM                                      
                  ,:DCLVFNDRGST.ACCT-RR-NM-STTS-CD                              
                  ,:DCLVFNDRGST.ACCT-RR-CD                                      
                  ,:DCLVFNDRGST.ACCT-RR-STTS-CD                                 
                  ,:DCLVFNDRGST.BRCH-NBR                                        
                  ,:DCLVFNDRGST.BRCH-NBR-STTS-CD                                
                  ,:DCLVFNDRGST.PYBL-QTY                                        
                  ,:DCLVFNDRGST.PYBL-QTY-STTS-CD                                
                  ,:DCLVFNDRGST.MEMO-TXT                                        
                  ,:DCLVFNDRGST.MEMO-STTS-CD                                    
                  ,:DCLVFNDRGST.ACH-IND                                         
                  ,:DCLVFNDRGST.ACH-STTS-CD                                     
                  ,:DCLVFNDRGST.PAC-IND                                         
                  ,:DCLVFNDRGST.PAC-STTS-CD                                     
                  ,:DCLVFNDRGST.SWP-IND                                         
                  ,:DCLVFNDRGST.SWP-STTS-CD                                     
                  ,:DCLVFNDRGST.ROA-LOI-AMT                                     
                  ,:DCLVFNDRGST.ROA-LOI-STTS-CD                                 
                  ,:DCLVFNDRGST.LOI-DT                                          
                  ,:DCLVFNDRGST.LOI-STTS-CD                                     
                  ,:DCLVFNDRGST.TRD-RLTD-IND                                    
                  ,:DCLVFNDRGST.TRD-RLTD-STTS-CD                                
                  ,:DCLVFNDRGST.ACCT-RLTD-NBR                                   
                  ,:DCLVFNDRGST.ACCT-RLTD-STTS-CD                               
                  ,:DCLVFNDRGST.ACCT-RLTD-CD                                    
                  ,:DCLVFNDRGST.ACCT-RLT-IN-STS-CD                              
                  ,:DCLVFNDRGST.SWP-PAC-EFFCT-DT                                
                  ,:DCLVFNDRGST.SWP-PAC-DT-STTS-CD                              
                  ,:DCLVFNDRGST.CDSC-PYMNT-CD                                   
                  ,:DCLVFNDRGST.CDSC-PYMNT-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-OPTN-CD                                   
                  ,:DCLVFNDRGST.DSBMT-OPTN-STTS-CD                              
                  ,:DCLVFNDRGST.DSBMT-AMT                                       
                  ,:DCLVFNDRGST.DSBMT-AMT-STTS-CD                               
                  ,:DCLVFNDRGST.PYMNT-JAN-IND                                   
                  ,:DCLVFNDRGST.PYMNT-FEB-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MAR-IND                                   
                  ,:DCLVFNDRGST.PYMNT-APR-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MAY-IND                                   
                  ,:DCLVFNDRGST.PYMNT-JUN-IND                                   
                  ,:DCLVFNDRGST.PYMNT-JUL-IND                                   
                  ,:DCLVFNDRGST.PYMNT-AUG-IND                                   
                  ,:DCLVFNDRGST.PYMNT-SEP-IND                                   
                  ,:DCLVFNDRGST.PYMNT-OCT-IND                                   
                  ,:DCLVFNDRGST.PYMNT-NOV-IND                                   
                  ,:DCLVFNDRGST.PYMNT-DEC-IND                                   
                  ,:DCLVFNDRGST.PYMNT-MO-STTS-CD                                
                  ,:DCLVFNDRGST.PYMNT-DT-CD                                     
                  ,:DCLVFNDRGST.PYMNT-DT-STTS-CD                                
                  ,:DCLVFNDRGST.RTRMT-TAX-CD                                    
                  ,:DCLVFNDRGST.RTRMT-TAX-STTS-CD                               
                  ,:DCLVFNDRGST.SHRHR-BNK-ACCT-NBR                              
                  ,:DCLVFNDRGST.SHR-BNK-ACT-STS-CD                              
                  ,:DCLVFNDRGST.SHRHR-BNK-TYPE-CD                               
                  ,:DCLVFNDRGST.SHR-BNK-TYP-STS-CD                              
                  ,:DCLVFNDRGST.CHCK-FRST-DT                                    
                  ,:DCLVFNDRGST.CHCK-FRS-DT-STS-CD                              
                  ,:DCLVFNDRGST.ABA-ROUTING-NBR                                 
                  ,:DCLVFNDRGST.ABA-ROTNG-STTS-CD                               
                  ,:DCLVFNDRGST.COST-BSS-CD                                     
                  ,:DCLVFNDRGST.COST-BS-OPT-STS-CD                              
                  ,:DCLVFNDRGST.RCRD-LNGTH-STTS-CD                              
                  ,:DCLVFNDRGST.SS-TIN-NBR                                      
                  ,:DCLVFNDRGST.LGCL-SEQ-NR-STS-CD                              
                  ,:DCLVFNDRGST.TRANS-TYPE-STTS-CD                              
                  ,:DCLVFNDRGST.TRNFR-TYPE-CD                                   
                  ,:DCLVFNDRGST.TRNFR-TYPE-STTS-CD                              
                  ,:DCLVFNDRGST.RCV-NBR-STTS-CD                                 
                  ,:DCLVFNDRGST.DLVR-NBR-STS-CD                                 
                  ,:DCLVFNDRGST.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDRGST.ISIN-CNTRY-STTS-CD                              
                  ,:DCLVFNDRGST.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDRGST.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVFNDRGST.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDRGST.ISIN-SEC-CD-STS-CD                              
                  ,:DCLVFNDRGST.PI-DLRVY-CD                                     
                  ,:DCLVFNDRGST.PI-DLVRY-STTS-CD                                
                  ,:DCLVFNDRGST.AST-PRC-CTG-STS-CD                              
                  ,:DCLVFNDRGST.SS-TIN-STTS-CD                                  
                  ,:DCLVFNDRGST.SS-TIN-NBR-STTS-CD                              
                  ,:DCLVFNDRGST.CUST-NM-LN-STTS-CD                              
                  ,:DCLVFNDRGST.NM-END-LN-QTY                                   
                  ,:DCLVFNDRGST.NM-END-LN-STTS-CD                               
                  ,:DCLVFNDRGST.PHSCL-SEQ-STTS-CD                               
                  ,:DCLVFNDRGST.DSTBN-SIDE-CD                                   
                  ,:DCLVFNDRGST.PRCS-DT                                         
                  ,:DCLVFNDRGST.ACTION-TYPE-CD                                  
                  ,:DCLVFNDRGST.FND-SERV-CNTL-NBR                               
                  ,:DCLVFNDRGST.CUST-FUND-NM                                    
                  ,:DCLVFNDRGST.CERT-NBR                                        
                  ,:DCLVFNDRGST.ASSET-QTY                                       
                  ,:DCLVFNDRGST.ASSET-ORGNL-QTY                                 
                  ,:DCLVFNDRGST.ISO-CRNCY-CD                                    
                  ,:DCLVFNDRGST.ASSET-AMT                                       
                  ,:DCLVFNDRGST.DB-CR-CD                                        
                  ,:DCLVFNDRGST.ASSET-DESC-TXT                                  
                  ,:DCLVFNDRGST.CERT-DT                                         
                  ,:DCLVFNDRGST.STTLM-ASCTD-DT                                  
                  ,:DCLVFNDRGST.STTLM-DT                                        
                  ,:DCLVFNDRGST.RJCT-CD                                         
                  ,:DCLVFNDRGST.NSCC-NON-ADP-IND                                
                  ,:DCLVFNDRGST.NSCC-PEND-CD                                    
                  ,:DCLVFNDRGST.NSCC-ACK-IND                                    
                  ,:DCLVFNDRGST.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDRGST.PRGM-NM                                         
                  ,:DCLVFNDRGST.CRT-TMSTP                                       
                  ,:DCLVFNDRGST.UPDT-TMSTP                                      
                  ,:DCLVFNDRGST.SECURITY-ADP-NBR                                
                  ,:DCLVFNDRGST.DLVR-NBR                                        
                  ,:DCLVFNDRGST.ROA-LOI-CD                                      
                  ,:DCLVFNDRGST.FUND-BK-CD                                      
                  ,:DCLVFNDRGST.W8-WTHLD-CD                                     
                  ,:DCLVFNDRGST.W8-CERT-DT                                      
                  ,:DCLVFNDRGST.W8-EXPTN-DT                                     
                  ,:DCLVFNDRGST.W8-OVRD-NRA-SPC-RT                              
                  ,:DCLVFNDRGST.W8-QULFD-INTRM-IND                              
                  ,:DCLVFNDRGST.W8-OVRD-CNTRY-CD                                
                  ,:DCLVFNDRGST.W8-WTHLD-STTS-CD                                
                  ,:DCLVFNDRGST.W8-CERT-DT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-EXPTN-DT-STS-CD                              
                  ,:DCLVFNDRGST.W8-SPCL-RT-STTS-CD                              
                  ,:DCLVFNDRGST.W8-QLFD-INT-STS-CD                              
                  ,:DCLVFNDRGST.W8-ORD-CTRY-STS-CD                              
LRM015            ,:DCLVFNDRGST.FND-AGNT-CD                                     
LRM017            ,:DCLVFNDRGST.SENT-BNWTRAN-IND                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1910-UPDATE-VFNDRGST-RTN                             
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDRGST-COUNT                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDRGST INSERT'                      
                    MOVE 1900 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1910-UPDATE-VFNDRGST-RTN.                                                
           EXEC SQL                                                             
               UPDATE VFNDRGST                                                  
                 SET                                                            
                 SBMTG_PRTCP_NBR     = :DCLVFNDRGST.SBMTG-PRTCP-NBR             
                ,SBMT_PRT_NR_STS_CD  = :DCLVFNDRGST.SBMT-PRT-NR-STS-CD          
                ,CONTROL_NBR_STS_CD  = :DCLVFNDRGST.CONTROL-NBR-STS-CD          
                ,AST_SEQ_NBR_STS_CD  = :DCLVFNDRGST.AST-SEQ-NBR-STS-CD          
                ,SYS_ACT_CD          = :DCLVFNDRGST.SYS-ACT-CD                  
                ,SYS_RJCT_RSN_CD     = :DCLVFNDRGST.SYS-RJCT-RSN-CD             
                ,MF_TRANS_TYPE_CD    = :DCLVFNDRGST.MF-TRANS-TYPE-CD            
                ,MF_TRAN_TYP_STS_CD  = :DCLVFNDRGST.MF-TRAN-TYP-STS-CD          
                ,RCRD_STTS_CD        = :DCLVFNDRGST.RCRD-STTS-CD                
                ,NRA_TAX_PCT         = :DCLVFNDRGST.NRA-TAX-PCT                 
                ,NRA_TAX_PCT_CD      = :DCLVFNDRGST.NRA-TAX-PCT-CD              
                ,DSBMT_ACCRL_CD      = :DCLVFNDRGST.DSBMT-ACCRL-CD              
                ,DSBMT_ACCRL_STS_CD  = :DCLVFNDRGST.DSBMT-ACCRL-STS-CD          
                ,DSBMT_FRCTN_CSH_CD  = :DCLVFNDRGST.DSBMT-FRCTN-CSH-CD          
                ,DSBMT_FRCTN_STS_CD  = :DCLVFNDRGST.DSBMT-FRCTN-STS-CD          
                ,BK_PHSCL_SHR_CD     = :DCLVFNDRGST.BK-PHSCL-SHR-CD             
                ,BK_PHSC_SHR_STS_CD  = :DCLVFNDRGST.BK-PHSC-SHR-STS-CD          
                ,FRCTN_CD            = :DCLVFNDRGST.FRCTN-CD                    
                ,FRCTN_STTS_CD       = :DCLVFNDRGST.FRCTN-STTS-CD               
                ,DLRVY_CD            = :DCLVFNDRGST.DLRVY-CD                    
                ,TPA_NBR             = :DCLVFNDRGST.TPA-NBR                     
                ,TPA_NBR_STTS_CD     = :DCLVFNDRGST.TPA-NBR-STTS-CD             
                ,CUST_NM             = :DCLVFNDRGST.CUST-NM                     
                ,CUST_NM_STTS_CD     = :DCLVFNDRGST.CUST-NM-STTS-CD             
                ,FUND_ACCT_CD        = :DCLVFNDRGST.FUND-ACCT-CD                
                ,FUND_ACCT_STTS_CD   = :DCLVFNDRGST.FUND-ACCT-STTS-CD           
                ,BRKR_EXCTG_NBR      = :DCLVFNDRGST.BRKR-EXCTG-NBR              
                ,BRKR_EXCTG_STTS_CD  = :DCLVFNDRGST.BRKR-EXCTG-STTS-CD          
                ,DSBMT_RSDL_CD       = :DCLVFNDRGST.DSBMT-RSDL-CD               
                ,DSBMT_RSDL_STS_CD   = :DCLVFNDRGST.DSBMT-RSDL-STS-CD           
                ,NTWRK_CNTL_CD       = :DCLVFNDRGST.NTWRK-CNTL-CD               
                ,NTWRK_CNTL_STTS_CD  = :DCLVFNDRGST.NTWRK-CNTL-STTS-CD          
                ,DVDND_CD            = :DCLVFNDRGST.DVDND-CD                    
                ,DVDND_STTS_CD       = :DCLVFNDRGST.DVDND-STTS-CD               
                ,FNBR                = :DCLVFNDRGST.FNBR                        
                ,FND_ACT_NBR_STS_CD  = :DCLVFNDRGST.FND-ACT-NBR-STS-CD          
                ,LTCG_CD             = :DCLVFNDRGST.LTCG-CD                     
                ,SS_TIN_CD           = :DCLVFNDRGST.SS-TIN-CD                   
                ,STCG_CD             = :DCLVFNDRGST.STCG-CD                     
                ,WTHLD_CD            = :DCLVFNDRGST.WTHLD-CD                    
                ,WTHLD_STTS_CD       = :DCLVFNDRGST.WTHLD-STTS-CD               
                ,PYBL_INFO_CD        = :DCLVFNDRGST.PYBL-INFO-CD                
                ,PYBL_INFO_STTS_CD   = :DCLVFNDRGST.PYBL-INFO-STTS-CD           
                ,ZIP5_CD             = :DCLVFNDRGST.ZIP5-CD                     
                ,ZIP5_STTS_CD        = :DCLVFNDRGST.ZIP5-STTS-CD                
                ,ZIP4_CD             = :DCLVFNDRGST.ZIP4-CD                     
                ,ZIP4_STTS_CD        = :DCLVFNDRGST.ZIP4-STTS-CD                
                ,SOC_CD              = :DCLVFNDRGST.SOC-CD                      
                ,SOC_STTS_CD         = :DCLVFNDRGST.SOC-STTS-CD                 
                ,NAV_ACCT_IND        = :DCLVFNDRGST.NAV-ACCT-IND                
                ,NAV_ACCT_STTS_CD    = :DCLVFNDRGST.NAV-ACCT-STTS-CD            
                ,MRGN_ACCT_IND       = :DCLVFNDRGST.MRGN-ACCT-IND               
                ,MRGN_ACCT_STTS_CD   = :DCLVFNDRGST.MRGN-ACCT-STTS-CD           
                ,CHCK_WRTNG_IND      = :DCLVFNDRGST.CHCK-WRTNG-IND              
                ,CHCK_WRTNG_STTS_CD  = :DCLVFNDRGST.CHCK-WRTNG-STTS-CD          
                ,SL_ST_CD            = :DCLVFNDRGST.SL-ST-CD                    
                ,SL_ST_STTS_CD       = :DCLVFNDRGST.SL-ST-STTS-CD               
                ,CNTRY_ORGN_CD       = :DCLVFNDRGST.CNTRY-ORGN-CD               
                ,CNTRY_ORGN_STTS_CD  = :DCLVFNDRGST.CNTRY-ORGN-STTS-CD          
                ,ACCT_RR_NM          = :DCLVFNDRGST.ACCT-RR-NM                  
                ,ACCT_RR_NM_STTS_CD  = :DCLVFNDRGST.ACCT-RR-NM-STTS-CD          
                ,ACCT_RR_CD          = :DCLVFNDRGST.ACCT-RR-CD                  
                ,ACCT_RR_STTS_CD     = :DCLVFNDRGST.ACCT-RR-STTS-CD             
                ,BRCH_NBR            = :DCLVFNDRGST.BRCH-NBR                    
                ,BRCH_NBR_STTS_CD    = :DCLVFNDRGST.BRCH-NBR-STTS-CD            
                ,PYBL_QTY            = :DCLVFNDRGST.PYBL-QTY                    
                ,PYBL_QTY_STTS_CD    = :DCLVFNDRGST.PYBL-QTY-STTS-CD            
                ,MEMO_TXT            = :DCLVFNDRGST.MEMO-TXT                    
                ,MEMO_STTS_CD        = :DCLVFNDRGST.MEMO-STTS-CD                
                ,ACH_IND             = :DCLVFNDRGST.ACH-IND                     
                ,ACH_STTS_CD         = :DCLVFNDRGST.ACH-STTS-CD                 
                ,PAC_IND             = :DCLVFNDRGST.PAC-IND                     
                ,PAC_STTS_CD         = :DCLVFNDRGST.PAC-STTS-CD                 
                ,SWP_IND             = :DCLVFNDRGST.SWP-IND                     
                ,SWP_STTS_CD         = :DCLVFNDRGST.SWP-STTS-CD                 
                ,ROA_LOI_AMT         = :DCLVFNDRGST.ROA-LOI-AMT                 
                ,ROA_LOI_STTS_CD     = :DCLVFNDRGST.ROA-LOI-STTS-CD             
                ,LOI_DT              = :DCLVFNDRGST.LOI-DT                      
                ,LOI_STTS_CD         = :DCLVFNDRGST.LOI-STTS-CD                 
                ,TRD_RLTD_IND        = :DCLVFNDRGST.TRD-RLTD-IND                
                ,TRD_RLTD_STTS_CD    = :DCLVFNDRGST.TRD-RLTD-STTS-CD            
                ,ACCT_RLTD_NBR       = :DCLVFNDRGST.ACCT-RLTD-NBR               
                ,ACCT_RLTD_STTS_CD   = :DCLVFNDRGST.ACCT-RLTD-STTS-CD           
                ,ACCT_RLTD_CD        = :DCLVFNDRGST.ACCT-RLTD-CD                
                ,ACCT_RLT_IN_STS_CD  = :DCLVFNDRGST.ACCT-RLT-IN-STS-CD          
                ,SWP_PAC_EFFCT_DT    = :DCLVFNDRGST.SWP-PAC-EFFCT-DT            
                ,SWP_PAC_DT_STTS_CD  = :DCLVFNDRGST.SWP-PAC-DT-STTS-CD          
                ,CDSC_PYMNT_CD       = :DCLVFNDRGST.CDSC-PYMNT-CD               
                ,CDSC_PYMNT_STTS_CD  = :DCLVFNDRGST.CDSC-PYMNT-STTS-CD          
                ,DSBMT_OPTN_CD       = :DCLVFNDRGST.DSBMT-OPTN-CD               
                ,DSBMT_OPTN_STTS_CD  = :DCLVFNDRGST.DSBMT-OPTN-STTS-CD          
                ,DSBMT_AMT           = :DCLVFNDRGST.DSBMT-AMT                   
                ,DSBMT_AMT_STTS_CD   = :DCLVFNDRGST.DSBMT-AMT-STTS-CD           
                ,PYMNT_JAN_IND       = :DCLVFNDRGST.PYMNT-JAN-IND               
                ,PYMNT_FEB_IND       = :DCLVFNDRGST.PYMNT-FEB-IND               
                ,PYMNT_MAR_IND       = :DCLVFNDRGST.PYMNT-MAR-IND               
                ,PYMNT_APR_IND       = :DCLVFNDRGST.PYMNT-APR-IND               
                ,PYMNT_MAY_IND       = :DCLVFNDRGST.PYMNT-MAY-IND               
                ,PYMNT_JUN_IND       = :DCLVFNDRGST.PYMNT-JUN-IND               
                ,PYMNT_JUL_IND       = :DCLVFNDRGST.PYMNT-JUL-IND               
                ,PYMNT_AUG_IND       = :DCLVFNDRGST.PYMNT-AUG-IND               
                ,PYMNT_SEP_IND       = :DCLVFNDRGST.PYMNT-SEP-IND               
                ,PYMNT_OCT_IND       = :DCLVFNDRGST.PYMNT-OCT-IND               
                ,PYMNT_NOV_IND       = :DCLVFNDRGST.PYMNT-NOV-IND               
                ,PYMNT_DEC_IND       = :DCLVFNDRGST.PYMNT-DEC-IND               
                ,PYMNT_MO_STTS_CD    = :DCLVFNDRGST.PYMNT-MO-STTS-CD            
                ,PYMNT_DT_CD         = :DCLVFNDRGST.PYMNT-DT-CD                 
                ,PYMNT_DT_STTS_CD    = :DCLVFNDRGST.PYMNT-DT-STTS-CD            
                ,RTRMT_TAX_CD        = :DCLVFNDRGST.RTRMT-TAX-CD                
                ,RTRMT_TAX_STTS_CD   = :DCLVFNDRGST.RTRMT-TAX-STTS-CD           
                ,SHRHR_BNK_ACCT_NBR  = :DCLVFNDRGST.SHRHR-BNK-ACCT-NBR          
                ,SHR_BNK_ACT_STS_CD  = :DCLVFNDRGST.SHR-BNK-ACT-STS-CD          
                ,SHRHR_BNK_TYPE_CD   = :DCLVFNDRGST.SHRHR-BNK-TYPE-CD           
                ,SHR_BNK_TYP_STS_CD  = :DCLVFNDRGST.SHR-BNK-TYP-STS-CD          
                ,CHCK_FRST_DT        = :DCLVFNDRGST.CHCK-FRST-DT                
                ,CHCK_FRS_DT_STS_CD  = :DCLVFNDRGST.CHCK-FRS-DT-STS-CD          
                ,ABA_ROUTING_NBR     = :DCLVFNDRGST.ABA-ROUTING-NBR             
                ,ABA_ROTNG_STTS_CD   = :DCLVFNDRGST.ABA-ROTNG-STTS-CD           
                ,COST_BSS_CD         = :DCLVFNDRGST.COST-BSS-CD                 
                ,COST_BS_OPT_STS_CD  = :DCLVFNDRGST.COST-BS-OPT-STS-CD          
                ,RCRD_LNGTH_STTS_CD  = :DCLVFNDRGST.RCRD-LNGTH-STTS-CD          
                ,SS_TIN_NBR          = :DCLVFNDRGST.SS-TIN-NBR                  
                ,LGCL_SEQ_NR_STS_CD  = :DCLVFNDRGST.LGCL-SEQ-NR-STS-CD          
                ,TRANS_TYPE_STTS_CD  = :DCLVFNDRGST.TRANS-TYPE-STTS-CD          
                ,TRNFR_TYPE_CD       = :DCLVFNDRGST.TRNFR-TYPE-CD               
                ,TRNFR_TYPE_STTS_CD  = :DCLVFNDRGST.TRNFR-TYPE-STTS-CD          
                ,RCV_NBR_STTS_CD     = :DCLVFNDRGST.RCV-NBR-STTS-CD             
                ,DLVR_NBR_STS_CD     = :DCLVFNDRGST.DLVR-NBR-STS-CD             
                ,ISIN_CNTRY_CD       = :DCLVFNDRGST.ISIN-CNTRY-CD               
                ,ISIN_CNTRY_STTS_CD  = :DCLVFNDRGST.ISIN-CNTRY-STTS-CD          
                ,ISIN_SEC_ISSUE_CD   = :DCLVFNDRGST.ISIN-SEC-ISSUE-CD           
                ,ISIN_SEC_IS_STS_CD  = :DCLVFNDRGST.ISIN-SEC-IS-STS-CD          
                ,ISIN_SEC_CDG_CD     = :DCLVFNDRGST.ISIN-SEC-CDG-CD             
                ,ISIN_SEC_CD_STS_CD  = :DCLVFNDRGST.ISIN-SEC-CD-STS-CD          
                ,PI_DLRVY_CD         = :DCLVFNDRGST.PI-DLRVY-CD                 
                ,PI_DLVRY_STTS_CD    = :DCLVFNDRGST.PI-DLVRY-STTS-CD            
                ,AST_PRC_CTG_STS_CD  = :DCLVFNDRGST.AST-PRC-CTG-STS-CD          
                ,SS_TIN_STTS_CD      = :DCLVFNDRGST.SS-TIN-STTS-CD              
                ,SS_TIN_NBR_STTS_CD  = :DCLVFNDRGST.SS-TIN-NBR-STTS-CD          
                ,CUST_NM_LN_STTS_CD  = :DCLVFNDRGST.CUST-NM-LN-STTS-CD          
                ,NM_END_LN_QTY       = :DCLVFNDRGST.NM-END-LN-QTY               
                ,NM_END_LN_STTS_CD   = :DCLVFNDRGST.NM-END-LN-STTS-CD           
                ,PHSCL_SEQ_STTS_CD   = :DCLVFNDRGST.PHSCL-SEQ-STTS-CD           
                ,DSTBN_SIDE_CD       = :DCLVFNDRGST.DSTBN-SIDE-CD               
                ,PRCS_DT             = :DCLVFNDRGST.PRCS-DT                     
                ,ACTION_TYPE_CD      = :DCLVFNDRGST.ACTION-TYPE-CD              
                ,FND_SERV_CNTL_NBR   = :DCLVFNDRGST.FND-SERV-CNTL-NBR           
                ,CUST_FUND_NM        = :DCLVFNDRGST.CUST-FUND-NM                
                ,CERT_NBR            = :DCLVFNDRGST.CERT-NBR                    
                ,ASSET_QTY           = :DCLVFNDRGST.ASSET-QTY                   
                ,ASSET_ORGNL_QTY     = :DCLVFNDRGST.ASSET-ORGNL-QTY             
                ,ISO_CRNCY_CD        = :DCLVFNDRGST.ISO-CRNCY-CD                
                ,ASSET_AMT           = :DCLVFNDRGST.ASSET-AMT                   
                ,DB_CR_CD            = :DCLVFNDRGST.DB-CR-CD                    
                ,ASSET_DESC_TXT      = :DCLVFNDRGST.ASSET-DESC-TXT              
                ,CERT_DT             = :DCLVFNDRGST.CERT-DT                     
                ,STTLM_ASCTD_DT      = :DCLVFNDRGST.STTLM-ASCTD-DT              
                ,STTLM_DT            = :DCLVFNDRGST.STTLM-DT                    
                ,RJCT_CD             = :DCLVFNDRGST.RJCT-CD                     
                ,NSCC_NON_ADP_IND    = :DCLVFNDRGST.NSCC-NON-ADP-IND            
                ,NSCC_PEND_CD        = :DCLVFNDRGST.NSCC-PEND-CD                
                ,NSCC_ACK_IND        = :DCLVFNDRGST.NSCC-ACK-IND                
                ,CICS_TERM_ID_CD     = :DCLVFNDRGST.CICS-TERM-ID-CD             
                ,PRGM_NM             = :DCLVFNDRGST.PRGM-NM                     
                ,CRT_TMSTP           = :DCLVFNDRGST.CRT-TMSTP                   
                ,UPDT_TMSTP          = :DCLVFNDRGST.UPDT-TMSTP                  
                ,SECURITY_ADP_NBR    = :DCLVFNDRGST.SECURITY-ADP-NBR            
                ,DLVR_NBR            = :DCLVFNDRGST.DLVR-NBR                    
                ,ROA_LOI_CD          = :DCLVFNDRGST.ROA-LOI-CD                  
                ,FUND_BK_CD          = :DCLVFNDRGST.FUND-BK-CD                  
                ,W8_WTHLD_CD         = :DCLVFNDRGST.W8-WTHLD-CD                 
                ,W8_CERT_DT          = :DCLVFNDRGST.W8-CERT-DT                  
                ,W8_EXPTN_DT         = :DCLVFNDRGST.W8-EXPTN-DT                 
                ,W8_OVRD_NRA_SPC_RT = :DCLVFNDRGST.W8-OVRD-NRA-SPC-RT           
                ,W8_QULFD_INTRM_IND = :DCLVFNDRGST.W8-QULFD-INTRM-IND           
                ,W8_OVRD_CNTRY_CD   = :DCLVFNDRGST.W8-OVRD-CNTRY-CD             
                ,W8_WTHLD_STTS_CD   = :DCLVFNDRGST.W8-WTHLD-STTS-CD             
                ,W8_CERT_DT_STTS_CD = :DCLVFNDRGST.W8-CERT-DT-STTS-CD           
                ,W8_EXPTN_DT_STS_CD = :DCLVFNDRGST.W8-EXPTN-DT-STS-CD           
                ,W8_SPCL_RT_STTS_CD = :DCLVFNDRGST.W8-SPCL-RT-STTS-CD           
                ,W8_QLFD_INT_STS_CD = :DCLVFNDRGST.W8-QLFD-INT-STS-CD           
                ,W8_ORD_CTRY_STS_CD = :DCLVFNDRGST.W8-ORD-CTRY-STS-CD           
LRM015          ,FND_AGNT_CD        = :DCLVFNDRGST.FND-AGNT-CD                  
LRM017          ,SENT_BNWTRAN_IND   = :DCLVFNDRGST.SENT-BNWTRAN-IND             
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVFNDRGST.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVFNDRGST.ACAT-CONTROL-NBR AND                            
                    ASSET_SEQ_NBR  =                                            
                   :DCLVFNDRGST.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDRGST-COUNT-REPL                             
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDRGST UPDATE'                      
                    MOVE 1910 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1950-CREATE-VFNDSRVS-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVFNDSRVS.                                   
           EXEC SQL                                                             
               INSERT INTO VFNDSRVS                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,ACCT_TYPE_CD                                               
                    ,ACTION_TYPE_CD                                             
                    ,PRCS_DT                                                    
                    ,DSTBN_SIDE_CD                                              
                    ,FNBR                                                       
                    ,NTWRK_CNTL_CD                                              
                    ,PI_DLRVY_CD                                                
                    ,FND_SERV_CNTL_NBR                                          
                    ,RCV_ACCT_TYPE_CD                                           
                    ,RCV_CUST_NM                                                
                    ,CERT_NBR                                                   
                    ,ASSET_QTY                                                  
                    ,ASSET_ORGNL_QTY                                            
                    ,ISO_CRNCY_CD                                               
                    ,ASSET_AMT                                                  
                    ,DB_CR_CD                                                   
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_CDG_CD                                            
                    ,ASSET_DESC_TXT                                             
                    ,CERT_DT                                                    
                    ,STTLM_ORGNL_DT                                             
                    ,STTLM_DT                                                   
                    ,RJCT_CD                                                    
                    ,DSBMT_ACCRL_CD                                             
                    ,DSBMT_FRCTN_CSH_CD                                         
                    ,DSBMT_RSDL_CD                                              
                    ,DVDND_CD                                                   
                    ,CUST_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,SECURITY_ADP_NBR                                           
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVFNDSRVS.CLIENT-NBR                                      
                  ,:DCLVFNDSRVS.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDSRVS.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDSRVS.ACCT-TYPE-CD                                    
                  ,:DCLVFNDSRVS.ACTION-TYPE-CD                                  
                  ,:DCLVFNDSRVS.PRCS-DT                                         
                  ,:DCLVFNDSRVS.DSTBN-SIDE-CD                                   
                  ,:DCLVFNDSRVS.FNBR                                            
                  ,:DCLVFNDSRVS.NTWRK-CNTL-CD                                   
                  ,:DCLVFNDSRVS.PI-DLRVY-CD                                     
                  ,:DCLVFNDSRVS.FND-SERV-CNTL-NBR                               
                  ,:DCLVFNDSRVS.RCV-ACCT-TYPE-CD                                
                  ,:DCLVFNDSRVS.RCV-CUST-NM                                     
                  ,:DCLVFNDSRVS.CERT-NBR                                        
                  ,:DCLVFNDSRVS.ASSET-QTY                                       
                  ,:DCLVFNDSRVS.ASSET-ORGNL-QTY                                 
                  ,:DCLVFNDSRVS.ISO-CRNCY-CD                                    
                  ,:DCLVFNDSRVS.ASSET-AMT                                       
                  ,:DCLVFNDSRVS.DB-CR-CD                                        
                  ,:DCLVFNDSRVS.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDSRVS.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDSRVS.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDSRVS.ASSET-DESC-TXT                                  
                  ,:DCLVFNDSRVS.CERT-DT                                         
                  ,:DCLVFNDSRVS.STTLM-ORGNL-DT                                  
                  ,:DCLVFNDSRVS.STTLM-DT                                        
                  ,:DCLVFNDSRVS.RJCT-CD                                         
                  ,:DCLVFNDSRVS.DSBMT-ACCRL-CD                                  
                  ,:DCLVFNDSRVS.DSBMT-FRCTN-CSH-CD                              
                  ,:DCLVFNDSRVS.DSBMT-RSDL-CD                                   
                  ,:DCLVFNDSRVS.DVDND-CD                                        
                  ,:DCLVFNDSRVS.CUST-NM                                         
                  ,:DCLVFNDSRVS.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDSRVS.PRGM-NM                                         
                  ,:DCLVFNDSRVS.CRT-TMSTP                                       
                  ,:DCLVFNDSRVS.UPDT-TMSTP                                      
                  ,:DCLVFNDSRVS.SECURITY-ADP-NBR                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1960-UPDATE-VFNDSRVS-RTN                             
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDSRVS-COUNT                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDSRVS INSERT'                      
                    MOVE 1950 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1960-UPDATE-VFNDSRVS-RTN.                                                
           EXEC SQL                                                             
               UPDATE VFNDSRVS                                                  
                 SET                                                            
                 ACCT_TYPE_CD        = :DCLVFNDSRVS.ACCT-TYPE-CD                
                ,ACTION_TYPE_CD      = :DCLVFNDSRVS.ACTION-TYPE-CD              
                ,PRCS_DT             = :DCLVFNDSRVS.PRCS-DT                     
                ,DSTBN_SIDE_CD       = :DCLVFNDSRVS.DSTBN-SIDE-CD               
                ,FNBR                = :DCLVFNDSRVS.FNBR                        
                ,NTWRK_CNTL_CD       = :DCLVFNDSRVS.NTWRK-CNTL-CD               
                ,PI_DLRVY_CD         = :DCLVFNDSRVS.PI-DLRVY-CD                 
                ,FND_SERV_CNTL_NBR   = :DCLVFNDSRVS.FND-SERV-CNTL-NBR           
                ,RCV_ACCT_TYPE_CD    = :DCLVFNDSRVS.RCV-ACCT-TYPE-CD            
                ,RCV_CUST_NM         = :DCLVFNDSRVS.RCV-CUST-NM                 
                ,CERT_NBR            = :DCLVFNDSRVS.CERT-NBR                    
                ,ASSET_QTY           = :DCLVFNDSRVS.ASSET-QTY                   
                ,ASSET_ORGNL_QTY     = :DCLVFNDSRVS.ASSET-ORGNL-QTY             
                ,ISO_CRNCY_CD        = :DCLVFNDSRVS.ISO-CRNCY-CD                
                ,ASSET_AMT           = :DCLVFNDSRVS.ASSET-AMT                   
                ,DB_CR_CD            = :DCLVFNDSRVS.DB-CR-CD                    
                ,ISIN_CNTRY_CD       = :DCLVFNDSRVS.ISIN-CNTRY-CD               
                ,ISIN_SEC_ISSUE_CD   = :DCLVFNDSRVS.ISIN-SEC-ISSUE-CD           
                ,ISIN_SEC_CDG_CD     = :DCLVFNDSRVS.ISIN-SEC-CDG-CD             
                ,ASSET_DESC_TXT      = :DCLVFNDSRVS.ASSET-DESC-TXT              
                ,CERT_DT             = :DCLVFNDSRVS.CERT-DT                     
                ,STTLM_ORGNL_DT      = :DCLVFNDSRVS.STTLM-ORGNL-DT              
                ,STTLM_DT            = :DCLVFNDSRVS.STTLM-DT                    
                ,RJCT_CD             = :DCLVFNDSRVS.RJCT-CD                     
                ,DSBMT_ACCRL_CD      = :DCLVFNDSRVS.DSBMT-ACCRL-CD              
                ,DSBMT_FRCTN_CSH_CD  = :DCLVFNDSRVS.DSBMT-FRCTN-CSH-CD          
                ,DSBMT_RSDL_CD       = :DCLVFNDSRVS.DSBMT-RSDL-CD               
                ,DVDND_CD            = :DCLVFNDSRVS.DVDND-CD                    
                ,CUST_NM             = :DCLVFNDSRVS.CUST-NM                     
                ,CICS_TERM_ID_CD     = :DCLVFNDSRVS.CICS-TERM-ID-CD             
                ,PRGM_NM             = :DCLVFNDSRVS.PRGM-NM                     
                ,CRT_TMSTP           = :DCLVFNDSRVS.CRT-TMSTP                   
                ,UPDT_TMSTP          = :DCLVFNDSRVS.UPDT-TMSTP                  
                ,SECURITY_ADP_NBR    = :DCLVFNDSRVS.SECURITY-ADP-NBR            
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVFNDSRVS.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVFNDSRVS.ACAT-CONTROL-NBR AND                            
                    ASSET_SEQ_NBR  =                                            
                   :DCLVFNDSRVS.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDSRVS-COUNT-REPL                             
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDSRVS UPDATE'                      
                    MOVE 1960 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1970-CREATE-VFNDPYBL-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVFNDPYBL.                                   
           EXEC SQL                                                             
               INSERT INTO VFNDPYBL                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,PYBL_NBR                                                   
                    ,ACCT_NBR                                                   
                    ,ACCT_NBR_STTS_CD                                           
                    ,ZIP5_CD                                                    
                    ,ZIP5_STTS_CD                                               
                    ,ZIP4_CD                                                    
                    ,ZIP4_STTS_CD                                               
                    ,ADDRS_DVDND_IND                                            
                    ,ADDRS_SYSWL_IND                                            
                    ,ADDRS_ATMDF_IND                                            
                    ,CRSS_FND_RNVST_IND                                         
                    ,ALTNT_PYBL_IND                                             
                    ,ADDRS_OPTN_STTS_CD                                         
                    ,ACCT_PYBL_CD                                               
                    ,ACCT_PYBL_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,PYBL_ALTNT_CD                                              
                    ,PYBL_ALTNT_STTS_CD                                         
                    ,PYBL_ALTNT_RSN_TXT                                         
                    ,PYBL_ALT_RS_STS_CD                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,NA_END_LINE_IND                                            
                    ,NA_END_IND_STTS_CD                                         
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVFNDPYBL.CLIENT-NBR                                      
                  ,:DCLVFNDPYBL.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDPYBL.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDPYBL.PYBL-NBR                                        
                  ,:DCLVFNDPYBL.ACCT-NBR                                        
                  ,:DCLVFNDPYBL.ACCT-NBR-STTS-CD                                
                  ,:DCLVFNDPYBL.ZIP5-CD                                         
                  ,:DCLVFNDPYBL.ZIP5-STTS-CD                                    
                  ,:DCLVFNDPYBL.ZIP4-CD                                         
                  ,:DCLVFNDPYBL.ZIP4-STTS-CD                                    
                  ,:DCLVFNDPYBL.ADDRS-DVDND-IND                                 
                  ,:DCLVFNDPYBL.ADDRS-SYSWL-IND                                 
                  ,:DCLVFNDPYBL.ADDRS-ATMDF-IND                                 
                  ,:DCLVFNDPYBL.CRSS-FND-RNVST-IND                              
                  ,:DCLVFNDPYBL.ALTNT-PYBL-IND                                  
                  ,:DCLVFNDPYBL.ADDRS-OPTN-STTS-CD                              
                  ,:DCLVFNDPYBL.ACCT-PYBL-CD                                    
                  ,:DCLVFNDPYBL.ACCT-PYBL-STTS-CD                               
                  ,:DCLVFNDPYBL.ISIN-CNTRY-CD                                   
                  ,:DCLVFNDPYBL.ISIN-CNTRY-STTS-CD                              
                  ,:DCLVFNDPYBL.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVFNDPYBL.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVFNDPYBL.ISIN-SEC-CDG-CD                                 
                  ,:DCLVFNDPYBL.ISIN-SEC-CD-STS-CD                              
                  ,:DCLVFNDPYBL.PYBL-ALTNT-CD                                   
                  ,:DCLVFNDPYBL.PYBL-ALTNT-STTS-CD                              
                  ,:DCLVFNDPYBL.PYBL-ALTNT-RSN-TXT                              
                  ,:DCLVFNDPYBL.PYBL-ALT-RS-STS-CD                              
                  ,:DCLVFNDPYBL.CRT-TMSTP                                       
                  ,:DCLVFNDPYBL.UPDT-TMSTP                                      
                  ,:DCLVFNDPYBL.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDPYBL.PRGM-NM                                         
                  ,:DCLVFNDPYBL.SECURITY-ADP-NBR                                
                  ,:DCLVFNDPYBL.NA-END-LINE-IND                                 
                  ,:DCLVFNDPYBL.NA-END-IND-STTS-CD                              
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1975-UPDATE-VFNDPYBL-RTN                             
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDPYBL-COUNT                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDPYBP INSERT'                      
                    MOVE 1970 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1975-UPDATE-VFNDPYBL-RTN.                                                
           EXEC SQL                                                             
               UPDATE VFNDPYBL                                                  
                 SET                                                            
             PYBL_NBR                = :DCLVFNDPYBL.PYBL-NBR                    
            ,ACCT_NBR                = :DCLVFNDPYBL.ACCT-NBR                    
            ,ACCT_NBR_STTS_CD        = :DCLVFNDPYBL.ACCT-NBR-STTS-CD            
            ,ZIP5_CD                 = :DCLVFNDPYBL.ZIP5-CD                     
            ,ZIP5_STTS_CD            = :DCLVFNDPYBL.ZIP5-STTS-CD                
            ,ZIP4_CD                 = :DCLVFNDPYBL.ZIP4-CD                     
            ,ZIP4_STTS_CD            = :DCLVFNDPYBL.ZIP4-STTS-CD                
            ,ADDRS_DVDND_IND         = :DCLVFNDPYBL.ADDRS-DVDND-IND             
            ,ADDRS_SYSWL_IND         = :DCLVFNDPYBL.ADDRS-SYSWL-IND             
            ,ADDRS_ATMDF_IND         = :DCLVFNDPYBL.ADDRS-ATMDF-IND             
            ,CRSS_FND_RNVST_IND      = :DCLVFNDPYBL.CRSS-FND-RNVST-IND          
            ,ALTNT_PYBL_IND          = :DCLVFNDPYBL.ALTNT-PYBL-IND              
            ,ADDRS_OPTN_STTS_CD      = :DCLVFNDPYBL.ADDRS-OPTN-STTS-CD          
            ,ACCT_PYBL_CD            = :DCLVFNDPYBL.ACCT-PYBL-CD                
            ,ACCT_PYBL_STTS_CD       = :DCLVFNDPYBL.ACCT-PYBL-STTS-CD           
            ,ISIN_CNTRY_CD           = :DCLVFNDPYBL.ISIN-CNTRY-CD               
            ,ISIN_CNTRY_STTS_CD      = :DCLVFNDPYBL.ISIN-CNTRY-STTS-CD          
            ,ISIN_SEC_ISSUE_CD       = :DCLVFNDPYBL.ISIN-SEC-ISSUE-CD           
            ,ISIN_SEC_IS_STS_CD      = :DCLVFNDPYBL.ISIN-SEC-IS-STS-CD          
            ,ISIN_SEC_CDG_CD         = :DCLVFNDPYBL.ISIN-SEC-CDG-CD             
            ,ISIN_SEC_CD_STS_CD      = :DCLVFNDPYBL.ISIN-SEC-CD-STS-CD          
            ,PYBL_ALTNT_CD           = :DCLVFNDPYBL.PYBL-ALTNT-CD               
            ,PYBL_ALTNT_STTS_CD      = :DCLVFNDPYBL.PYBL-ALTNT-STTS-CD          
            ,PYBL_ALTNT_RSN_TXT      = :DCLVFNDPYBL.PYBL-ALTNT-RSN-TXT          
            ,PYBL_ALT_RS_STS_CD      = :DCLVFNDPYBL.PYBL-ALT-RS-STS-CD          
            ,CRT_TMSTP               = :DCLVFNDPYBL.CRT-TMSTP                   
            ,UPDT_TMSTP              = :DCLVFNDPYBL.UPDT-TMSTP                  
            ,CICS_TERM_ID_CD         = :DCLVFNDPYBL.CICS-TERM-ID-CD             
            ,PRGM_NM                 = :DCLVFNDPYBL.PRGM-NM                     
            ,SECURITY_ADP_NBR        = :DCLVFNDPYBL.SECURITY-ADP-NBR            
            ,NA_END_LINE_IND         = :DCLVFNDPYBL.NA-END-LINE-IND             
            ,NA_END_IND_STTS_CD      = :DCLVFNDPYBL.NA-END-IND-STTS-CD          
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVFNDPYBL.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVFNDPYBL.ACAT-CONTROL-NBR AND                            
                    ASSET_SEQ_NBR  =                                            
                   :DCLVFNDPYBL.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDPYBL-COUNT-REPL                             
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDPYBP UPDATE'                      
                    MOVE 1975 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1980-CREATE-VFNDPYNA-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVFNDPYNA.                                   
           EXEC SQL                                                             
               INSERT INTO VFNDPYNA                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,PYBL_NBR                                                   
                    ,NA_LINE_NBR                                                
                    ,PYBL_NA_LINE_TXT                                           
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PYBL_NA_LN_STTS_CD                                         
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVFNDPYNA.CLIENT-NBR                                      
                  ,:DCLVFNDPYNA.ACAT-CONTROL-NBR                                
                  ,:DCLVFNDPYNA.ASSET-SEQ-NBR                                   
                  ,:DCLVFNDPYNA.PYBL-NBR                                        
                  ,:DCLVFNDPYNA.NA-LINE-NBR                                     
                  ,:DCLVFNDPYNA.PYBL-NA-LINE-TXT                                
                  ,:DCLVFNDPYNA.CRT-TMSTP                                       
                  ,:DCLVFNDPYNA.UPDT-TMSTP                                      
                  ,:DCLVFNDPYNA.PYBL-NA-LN-STTS-CD                              
                  ,:DCLVFNDPYNA.CICS-TERM-ID-CD                                 
                  ,:DCLVFNDPYNA.PRGM-NM                                         
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1985-UPDATE-VFNDPYNA-RTN                             
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDPYNA-COUNT                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDPYNA INSERT'                      
                    MOVE 1980 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1985-UPDATE-VFNDPYNA-RTN.                                                
           EXEC SQL                                                             
               UPDATE VFNDPYNA                                                  
                 SET                                                            
             PYBL_NBR                = :DCLVFNDPYBL.PYBL-NBR                    
            ,NA_LINE_NBR             = :DCLVFNDPYNA.NA-LINE-NBR                 
            ,PYBL_NA_LINE_TXT        = :DCLVFNDPYNA.PYBL-NA-LINE-TXT            
            ,CRT_TMSTP               = :DCLVFNDPYNA.CRT-TMSTP                   
            ,UPDT_TMSTP              = :DCLVFNDPYNA.UPDT-TMSTP                  
            ,PYBL_NA_LN_STTS_CD      = :DCLVFNDPYNA.PYBL-NA-LN-STTS-CD          
            ,CICS_TERM_ID_CD         = :DCLVFNDPYNA.CICS-TERM-ID-CD             
            ,PRGM_NM                 = :DCLVFNDPYNA.PRGM-NM                     
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVFNDPYNA.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVFNDPYNA.ACAT-CONTROL-NBR AND                            
                    ASSET_SEQ_NBR  =                                            
                   :DCLVFNDPYNA.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDPYNA-COUNT-REPL                             
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDPYNA UPDATE'                      
                    MOVE 1985 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1990-CREATE-VFNDNA-RTN.                                                  
                                                                                
           MOVE RECORD-DETAIL TO DCLVFNDNA.                                     
           EXEC SQL                                                             
               INSERT INTO VFNDNA                                               
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,NA_LINE_NBR                                                
                    ,CUST_NA_LINE_TXT                                           
                    ,CUST_NA_STTS_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVFNDNA.CLIENT-NBR                                        
                  ,:DCLVFNDNA.ACAT-CONTROL-NBR                                  
                  ,:DCLVFNDNA.ASSET-SEQ-NBR                                     
                  ,:DCLVFNDNA.NA-LINE-NBR                                       
                  ,:DCLVFNDNA.CUST-NA-LINE-TXT                                  
                  ,:DCLVFNDNA.CUST-NA-STTS-CD                                   
                  ,:DCLVFNDNA.CRT-TMSTP                                         
                  ,:DCLVFNDNA.UPDT-TMSTP                                        
                  ,:DCLVFNDNA.CICS-TERM-ID-CD                                   
                  ,:DCLVFNDNA.PRGM-NM                                           
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 1995-UPDATE-VFNDNA-RTN                               
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDNA-COUNT                                    
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDNA INSERT'                        
                      CLIENT-NBR       OF DCLVFNDNA                             
                      ACAT-CONTROL-NBR OF DCLVFNDNA                             
                      ASSET-SEQ-NBR    OF DCLVFNDNA                             
                    MOVE 1990 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       1995-UPDATE-VFNDNA-RTN.                                                  
           EXEC SQL                                                             
               UPDATE VFNDNA                                                    
                 SET                                                            
             CUST_NA_LINE_TXT        = :DCLVFNDNA.CUST-NA-LINE-TXT              
            ,CUST_NA_STTS_CD         = :DCLVFNDNA.CUST-NA-STTS-CD               
            ,CRT_TMSTP               = :DCLVFNDNA.CRT-TMSTP                     
            ,UPDT_TMSTP              = :DCLVFNDNA.UPDT-TMSTP                    
            ,CICS_TERM_ID_CD         = :DCLVFNDNA.CICS-TERM-ID-CD               
            ,PRGM_NM                 = :DCLVFNDNA.PRGM-NM                       
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVFNDNA.CLIENT-NBR AND                                    
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVFNDNA.ACAT-CONTROL-NBR AND                              
                    ASSET_SEQ_NBR  =                                            
                   :DCLVFNDNA.ASSET-SEQ-NBR AND                                 
                    NA_LINE_NBR    =                                            
                   :DCLVFNDNA.NA-LINE-NBR                                       
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                    ADD 1 TO WS-VFNDNA-COUNT-REPL                               
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VFNDNA UPDATE'                        
                    MOVE 1995 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       2000-CREATE-VTRNHSTY-RTN.                                                
           MOVE RECORD-DETAIL TO DCLVTRNHSTY.                                   
           EXEC SQL                                                             
               INSERT INTO VTRNHSTY                                             
                    (                                                           
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR                                                    
                   ,DLVR_NBR_STTS_CD                                            
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_DLVR_STTS_CD                                           
                   ,RCV_NBR                                                     
                   ,RCV_NBR_STTS_CD                                             
                   ,ACCT_RCV_NBR                                                
                   ,ACCT_RCV_STTS_CD                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,RCV_CUST_NM                                                 
                   ,RCV_CUST_NM_STS_CD                                          
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_PRIM_STS_CD                                          
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_SS_SCDY_STS_CD                                          
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_ACT_TYP_STS_CD                                          
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_OCC_STTS_CD                                             
                   ,RCV_CRSPN_NBR                                               
                   ,RCV_CRSPN_STTS_CD                                           
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,CNTL_ASTD_STTS_CD                                           
                   ,CMNT_TXT                                                    
                   ,CMNT_STTS_CD                                                
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRN_TYP_RJC_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,RR_CD                                                       
                   ,BRANCH_CD                                                   
                   ,DVDND_NAA_CD                                                
                   ,SELL_INSTN_NAA_CD                                           
                   ,CASH_SWEEP_NAA_CD                                           
                   ,PRTCP_CONTRA_CD                                             
                   ,ACM_HOLDER_NAA_CD                                           
                   ,ACCT_ACTIVITY_IND                                           
                   ,ACCT_ORDERS_IND                                             
                   ,ACCT_RJCT_RSBM_IND                                          
                   ,ACCT_DB_BAL_T1_IND                                          
                   ,ACCT_MRGN_DB_IND                                            
                   ,ACCT_SHRT_PSTN_IND                                          
                   ,ACCT_SEC_RSTRD_IND                                          
                   ,ACCT_AST_EXCS_IND                                           
                   ,ACCT_OPTN_PSTN_IND                                          
                   ,ACCT_LTD_PRTNR_IND                                          
                   ,ACCT_TIN_MSMTH_IND                                          
                   ,ACCT_DPLCT_TRN_IND                                          
                   ,ACCT_CUST_70_IND                                            
                   ,ACCT_QULFD_PLN_IND                                          
                   ,ACCT_MNGD_IND                                               
                   ,ACCT_PRVT_RNG_IND                                           
                   ,ACCT_BRKR_TIF_IND                                           
                   ,NSCC_NON_ADP_IND                                            
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,STTLM_DT                                                    
                   ,ACCT_NA_UPDT_IND                                            
                   ,ACCT_TRNFR_FEE_AMT                                  L,      
                   ,ACCT_IRA_TRMNT_AMT                                  L,      
                   ,ACCT_IRA_MAINT_AMT                                  L,      
                   ,ACCT_DLRV_PRGR_IND                                          
                   ,ACCT_CD                                                     
                   ,STTLM_ASCTD_DT                                              
                   ,STTLM_ASCTD_STS_CD                                          
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ACCT_EQUITY_AMT                                             
LRM003             ,ACCT_FRZN_IND                                               
LRM004             ,BRANCH_ALTNT_CD                                             
LRM004             ,GIFT_IND                                                    
LRM004             ,RSTR_TRD_90_DY_IND                                          
LRM004             ,REG_T_IND                                                   
LRM004             ,ADOPT_AGRMT_IND                                             
LRM004             ,RR_ORGNL_CD                                                 
LRM007             ,CVRSN_ACCT_NBR                                              
DJ0002             ,AUCTION_RT_IND                                              
LRM009             ,PENNY_STK_IND                                               
LRM010             ,GEO_CD                                                      
LRM011             ,FOREIGN_FEE_IND                                             
LRM011             ,FOREIGN_FEE_AMT                                             
LRM012             ,PEND_DVDND_DB_AMT                                           
LRM012             ,NTWRK_LVL4_FND_IND                                          
LRM016             ,PAPER_FEE_AMT                                               
                    )                                                           
                    VALUES                                                      
                    (                                                           
                      :DCLVTRNHSTY.CLIENT-NBR                                   
                     ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                             
                     ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                              
                     ,:DCLVTRNHSTY.SBMT-PRT-NR-STS-CD                           
                     ,:DCLVTRNHSTY.CONTROL-NBR-STS-CD                           
                     ,:DCLVTRNHSTY.DLVR-NBR                                     
                     ,:DCLVTRNHSTY.DLVR-NBR-STTS-CD                             
                     ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                
                     ,:DCLVTRNHSTY.ACCT-DLVR-STTS-CD                            
                     ,:DCLVTRNHSTY.RCV-NBR                                      
                     ,:DCLVTRNHSTY.RCV-NBR-STTS-CD                              
                     ,:DCLVTRNHSTY.ACCT-RCV-NBR                                 
                     ,:DCLVTRNHSTY.ACCT-RCV-STTS-CD                             
                     ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                
                     ,:DCLVTRNHSTY.TRNFR-TYPE-STTS-CD                           
                     ,:DCLVTRNHSTY.TRANS-TYPE-CD                                
                     ,:DCLVTRNHSTY.TRANS-TYPE-STTS-CD                           
                     ,:DCLVTRNHSTY.RCV-CUST-NM                                  
                     ,:DCLVTRNHSTY.RCV-CUST-NM-STS-CD                           
                     ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                              
                     ,:DCLVTRNHSTY.RCV-SS-PRIM-STS-CD                           
                     ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                             
                     ,:DCLVTRNHSTY.RCV-SS-SCDY-STS-CD                           
                     ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                             
                     ,:DCLVTRNHSTY.RCV-ACT-TYP-STS-CD                           
                     ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                             
                     ,:DCLVTRNHSTY.RCV-OCC-STTS-CD                              
                     ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                
                     ,:DCLVTRNHSTY.RCV-CRSPN-STTS-CD                            
                     ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                           
                     ,:DCLVTRNHSTY.CNTL-ASTD-STTS-CD                            
                     ,:DCLVTRNHSTY.CMNT-TXT                                     
                     ,:DCLVTRNHSTY.CMNT-STTS-CD                                 
                     ,:DCLVTRNHSTY.PRCS-DT                                      
                     ,:DCLVTRNHSTY.STTS-CD                                      
                     ,:DCLVTRNHSTY.STTLM-TM-CD                                  
                     ,:DCLVTRNHSTY.VAL-FREE-CD                                  
                     ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                             
                     ,:DCLVTRNHSTY.TRANS-RFRN-STTS-CD                           
                     ,:DCLVTRNHSTY.DB-CR-CD                                     
                     ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                
                     ,:DCLVTRNHSTY.SYS-ACT-CD                                   
                     ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                              
                     ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                           
                     ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                           
                     ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                           
                     ,:DCLVTRNHSTY.TRN-TYP-RJC-STS-CD                           
                     ,:DCLVTRNHSTY.PHSCL-SEQ-NBR                                
                     ,:DCLVTRNHSTY.PHSCL-SEQ-STTS-CD                            
                     ,:DCLVTRNHSTY.LGCL-SEQ-NBR                                 
                     ,:DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD                           
                     ,:DCLVTRNHSTY.RR-CD                                        
                     ,:DCLVTRNHSTY.BRANCH-CD                                    
                     ,:DCLVTRNHSTY.DVDND-NAA-CD                                 
                     ,:DCLVTRNHSTY.SELL-INSTN-NAA-CD                            
                     ,:DCLVTRNHSTY.CASH-SWEEP-NAA-CD                            
                     ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                              
                     ,:DCLVTRNHSTY.ACM-HOLDER-NAA-CD                            
                     ,:DCLVTRNHSTY.ACCT-ACTIVITY-IND                            
                     ,:DCLVTRNHSTY.ACCT-ORDERS-IND                              
                     ,:DCLVTRNHSTY.ACCT-RJCT-RSBM-IND                           
                     ,:DCLVTRNHSTY.ACCT-DB-BAL-T1-IND                           
                     ,:DCLVTRNHSTY.ACCT-MRGN-DB-IND                             
                     ,:DCLVTRNHSTY.ACCT-SHRT-PSTN-IND                           
                     ,:DCLVTRNHSTY.ACCT-SEC-RSTRD-IND                           
                     ,:DCLVTRNHSTY.ACCT-AST-EXCS-IND                            
                     ,:DCLVTRNHSTY.ACCT-OPTN-PSTN-IND                           
                     ,:DCLVTRNHSTY.ACCT-LTD-PRTNR-IND                           
                     ,:DCLVTRNHSTY.ACCT-TIN-MSMTH-IND                           
                     ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                           
                     ,:DCLVTRNHSTY.ACCT-CUST-70-IND                             
                     ,:DCLVTRNHSTY.ACCT-QULFD-PLN-IND                           
                     ,:DCLVTRNHSTY.ACCT-MNGD-IND                                
                     ,:DCLVTRNHSTY.ACCT-PRVT-RNG-IND                            
                     ,:DCLVTRNHSTY.ACCT-BRKR-TIF-IND                            
                     ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                             
                     ,:DCLVTRNHSTY.CYCLE-CD                                     
                     ,:DCLVTRNHSTY.DAYS-STTS-QTY                                
                     ,:DCLVTRNHSTY.STTLM-DT                                     
                     ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                             
                     ,:DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT                   -3.     
                     ,:DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT                   -3.     
                     ,:DCLVTRNHSTY.ACCT-IRA-MAINT-AMT                   -3.     
                     ,:DCLVTRNHSTY.ACCT-DLRV-PRGR-IND                           
                     ,:DCLVTRNHSTY.ACCT-CD                                      
                     ,:DCLVTRNHSTY.STTLM-ASCTD-DT                               
                     ,:DCLVTRNHSTY.STTLM-ASCTD-STS-CD                           
                     ,:DCLVTRNHSTY.RCRD-LNGTH-STTS-CD                           
                     ,:DCLVTRNHSTY.RCRD-STTS-CD                                 
                     ,:DCLVTRNHSTY.NSCC-PEND-CD                                 
                     ,:DCLVTRNHSTY.NSCC-ACK-IND                                 
                     ,:DCLVTRNHSTY.CICS-TERM-ID-CD                              
                     ,:DCLVTRNHSTY.PRGM-NM                                      
                     ,:DCLVTRNHSTY.CRT-TMSTP                                    
                     ,:DCLVTRNHSTY.UPDT-TMSTP                                   
                     ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                              
LRM003               ,:DCLVTRNHSTY.ACCT-FRZN-IND                                
LRM004               ,:DCLVTRNHSTY.BRANCH-ALTNT-CD                              
LRM004               ,:DCLVTRNHSTY.GIFT-IND                                     
LRM004               ,:DCLVTRNHSTY.RSTR-TRD-90-DY-IND                           
LRM004               ,:DCLVTRNHSTY.REG-T-IND                                    
LRM004               ,:DCLVTRNHSTY.ADOPT-AGRMT-IND                              
LRM004               ,:DCLVTRNHSTY.RR-ORGNL-CD                                  
LRM007               ,:DCLVTRNHSTY.CVRSN-ACCT-NBR                               
DJ0002               ,:DCLVTRNHSTY.AUCTION-RT-IND                               
LRM009               ,:DCLVTRNHSTY.PENNY-STK-IND                                
LRM010               ,:DCLVTRNHSTY.GEO-CD                                       
LRM011               ,:DCLVTRNHSTY.FOREIGN-FEE-IND                              
LRM011               ,:DCLVTRNHSTY.FOREIGN-FEE-AMT                              
LRM012               ,:DCLVTRNHSTY.PEND-DVDND-DB-AMT                            
LRM012               ,:DCLVTRNHSTY.NTWRK-LVL4-FND-IND                           
LRM016               ,:DCLVTRNHSTY.PAPER-FEE-AMT                                
                   )                                                            
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VTRNHSTY-COUNT                                     
              WHEN -803                                                         
                 PERFORM 2010-UPDATE-VTRNHSTY                                   
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VTRNHSTY INSERT'                      
                 MOVE 2000 TO ABORT-CODE                                        
                 PERFORM SQL-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
                                                                                
       2010-UPDATE-VTRNHSTY.                                                    
           EXEC SQL                                                             
               UPDATE VTRNHSTY                                                  
                 SET                                                            
              SBMTG_PRTCP_NBR     =  :DCLVTRNHSTY.SBMTG-PRTCP-NBR               
             ,SBMT_PRT_NR_STS_CD  =  :DCLVTRNHSTY.SBMT-PRT-NR-STS-CD            
             ,CONTROL_NBR_STS_CD  =  :DCLVTRNHSTY.CONTROL-NBR-STS-CD            
             ,DLVR_NBR            =  :DCLVTRNHSTY.DLVR-NBR                      
             ,DLVR_NBR_STTS_CD    =  :DCLVTRNHSTY.DLVR-NBR-STTS-CD              
             ,ACCT_DLVR_NBR       =  :DCLVTRNHSTY.ACCT-DLVR-NBR                 
             ,ACCT_DLVR_STTS_CD   =  :DCLVTRNHSTY.ACCT-DLVR-STTS-CD             
             ,RCV_NBR             =  :DCLVTRNHSTY.RCV-NBR                       
             ,RCV_NBR_STTS_CD     =  :DCLVTRNHSTY.RCV-NBR-STTS-CD               
             ,ACCT_RCV_NBR        =  :DCLVTRNHSTY.ACCT-RCV-NBR                  
             ,ACCT_RCV_STTS_CD    =  :DCLVTRNHSTY.ACCT-RCV-STTS-CD              
             ,TRNFR_TYPE_CD       =  :DCLVTRNHSTY.TRNFR-TYPE-CD                 
             ,TRNFR_TYPE_STTS_CD  =  :DCLVTRNHSTY.TRNFR-TYPE-STTS-CD            
             ,TRANS_TYPE_CD       =  :DCLVTRNHSTY.TRANS-TYPE-CD                 
             ,TRANS_TYPE_STTS_CD  =  :DCLVTRNHSTY.TRANS-TYPE-STTS-CD            
             ,RCV_CUST_NM         =  :DCLVTRNHSTY.RCV-CUST-NM                   
             ,RCV_CUST_NM_STS_CD  =  :DCLVTRNHSTY.RCV-CUST-NM-STS-CD            
             ,RCV_SS_PRIM_NBR     =  :DCLVTRNHSTY.RCV-SS-PRIM-NBR               
             ,RCV_SS_PRIM_STS_CD  =  :DCLVTRNHSTY.RCV-SS-PRIM-STS-CD            
             ,RCV_SS_SCNDY_NBR    =  :DCLVTRNHSTY.RCV-SS-SCNDY-NBR              
             ,RCV_SS_SCDY_STS_CD  =  :DCLVTRNHSTY.RCV-SS-SCDY-STS-CD            
             ,RCV_ACCT_TYPE_CD    =  :DCLVTRNHSTY.RCV-ACCT-TYPE-CD              
             ,RCV_ACT_TYP_STS_CD  =  :DCLVTRNHSTY.RCV-ACT-TYP-STS-CD            
             ,RCV_OCC_BRKR_NBR    =  :DCLVTRNHSTY.RCV-OCC-BRKR-NBR              
             ,RCV_OCC_STTS_CD     =  :DCLVTRNHSTY.RCV-OCC-STTS-CD               
             ,RCV_CRSPN_NBR       =  :DCLVTRNHSTY.RCV-CRSPN-NBR                 
             ,RCV_CRSPN_STTS_CD   =  :DCLVTRNHSTY.RCV-CRSPN-STTS-CD             
             ,ACAT_CNTL_ASTD_NBR  =  :DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR            
             ,CNTL_ASTD_STTS_CD   =  :DCLVTRNHSTY.CNTL-ASTD-STTS-CD             
             ,CMNT_TXT            =  :DCLVTRNHSTY.CMNT-TXT                      
             ,CMNT_STTS_CD        =  :DCLVTRNHSTY.CMNT-STTS-CD                  
             ,PRCS_DT             =  :DCLVTRNHSTY.PRCS-DT                       
             ,STTS_CD             =  :DCLVTRNHSTY.STTS-CD                       
             ,STTLM_TM_CD         =  :DCLVTRNHSTY.STTLM-TM-CD                   
             ,VAL_FREE_CD         =  :DCLVTRNHSTY.VAL-FREE-CD                   
             ,TRANS_RFRN_ID_CD    =  :DCLVTRNHSTY.TRANS-RFRN-ID-CD              
             ,TRANS_RFRN_STTS_CD  =  :DCLVTRNHSTY.TRANS-RFRN-STTS-CD            
             ,DB_CR_CD            =  :DCLVTRNHSTY.DB-CR-CD                      
             ,DSTBN_SIDE_CD       =  :DCLVTRNHSTY.DSTBN-SIDE-CD                 
             ,SYS_ACT_CD          =  :DCLVTRNHSTY.SYS-ACT-CD                    
             ,SYS_RJCT_RSN_CD     =  :DCLVTRNHSTY.SYS-RJCT-RSN-CD               
             ,TRNFR_TYPE_RJC1_CD  =  :DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD            
             ,TRNFR_TYPE_RJC2_CD  =  :DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD            
             ,TRNFR_TYPE_RJCT_CD  =  :DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD            
             ,TRN_TYP_RJC_STS_CD  =  :DCLVTRNHSTY.TRN-TYP-RJC-STS-CD            
             ,PHSCL_SEQ_NBR       =  :DCLVTRNHSTY.PHSCL-SEQ-NBR                 
             ,PHSCL_SEQ_STTS_CD   =  :DCLVTRNHSTY.PHSCL-SEQ-STTS-CD             
             ,LGCL_SEQ_NBR        =  :DCLVTRNHSTY.LGCL-SEQ-NBR                  
             ,LGCL_SEQ_NR_STS_CD  =  :DCLVTRNHSTY.LGCL-SEQ-NR-STS-CD            
             ,RR_CD               =  :DCLVTRNHSTY.RR-CD                         
             ,BRANCH_CD           =  :DCLVTRNHSTY.BRANCH-CD                     
             ,DVDND_NAA_CD        =  :DCLVTRNHSTY.DVDND-NAA-CD                  
             ,SELL_INSTN_NAA_CD   =  :DCLVTRNHSTY.SELL-INSTN-NAA-CD             
             ,CASH_SWEEP_NAA_CD   =  :DCLVTRNHSTY.CASH-SWEEP-NAA-CD             
             ,PRTCP_CONTRA_CD     =  :DCLVTRNHSTY.PRTCP-CONTRA-CD               
             ,ACM_HOLDER_NAA_CD   =  :DCLVTRNHSTY.ACM-HOLDER-NAA-CD             
             ,ACCT_ACTIVITY_IND   =  :DCLVTRNHSTY.ACCT-ACTIVITY-IND             
             ,ACCT_ORDERS_IND     =  :DCLVTRNHSTY.ACCT-ORDERS-IND               
             ,ACCT_RJCT_RSBM_IND  =  :DCLVTRNHSTY.ACCT-RJCT-RSBM-IND            
             ,ACCT_DB_BAL_T1_IND  =  :DCLVTRNHSTY.ACCT-DB-BAL-T1-IND            
             ,ACCT_MRGN_DB_IND    =  :DCLVTRNHSTY.ACCT-MRGN-DB-IND              
             ,ACCT_SHRT_PSTN_IND  =  :DCLVTRNHSTY.ACCT-SHRT-PSTN-IND            
             ,ACCT_SEC_RSTRD_IND  =  :DCLVTRNHSTY.ACCT-SEC-RSTRD-IND            
             ,ACCT_AST_EXCS_IND   =  :DCLVTRNHSTY.ACCT-AST-EXCS-IND             
             ,ACCT_OPTN_PSTN_IND  =  :DCLVTRNHSTY.ACCT-OPTN-PSTN-IND            
             ,ACCT_LTD_PRTNR_IND  =  :DCLVTRNHSTY.ACCT-LTD-PRTNR-IND            
             ,ACCT_TIN_MSMTH_IND  =  :DCLVTRNHSTY.ACCT-TIN-MSMTH-IND            
             ,ACCT_DPLCT_TRN_IND  =  :DCLVTRNHSTY.ACCT-DPLCT-TRN-IND            
             ,ACCT_CUST_70_IND    =  :DCLVTRNHSTY.ACCT-CUST-70-IND              
             ,ACCT_QULFD_PLN_IND  =  :DCLVTRNHSTY.ACCT-QULFD-PLN-IND            
             ,ACCT_MNGD_IND       =  :DCLVTRNHSTY.ACCT-MNGD-IND                 
             ,ACCT_PRVT_RNG_IND   =  :DCLVTRNHSTY.ACCT-PRVT-RNG-IND             
             ,ACCT_BRKR_TIF_IND   =  :DCLVTRNHSTY.ACCT-BRKR-TIF-IND             
             ,NSCC_NON_ADP_IND    =  :DCLVTRNHSTY.NSCC-NON-ADP-IND              
             ,CYCLE_CD            =  :DCLVTRNHSTY.CYCLE-CD                      
             ,DAYS_STTS_QTY       =  :DCLVTRNHSTY.DAYS-STTS-QTY                 
             ,STTLM_DT            =  :DCLVTRNHSTY.STTLM-DT                      
             ,ACCT_NA_UPDT_IND    =  :DCLVTRNHSTY.ACCT-NA-UPDT-IND              
             ,ACCT_TRNFR_FEE_AMT  =  :DCLVTRNHSTY.ACCT-TRNFR-FEE-AMT            
             ,ACCT_IRA_TRMNT_AMT  =  :DCLVTRNHSTY.ACCT-IRA-TRMNT-AMT            
             ,ACCT_IRA_MAINT_AMT  =  :DCLVTRNHSTY.ACCT-IRA-MAINT-AMT            
             ,ACCT_DLRV_PRGR_IND  =  :DCLVTRNHSTY.ACCT-DLRV-PRGR-IND            
             ,ACCT_CD             =  :DCLVTRNHSTY.ACCT-CD                       
             ,STTLM_ASCTD_DT      =  :DCLVTRNHSTY.STTLM-ASCTD-DT                
             ,STTLM_ASCTD_STS_CD  =  :DCLVTRNHSTY.STTLM-ASCTD-STS-CD            
             ,RCRD_LNGTH_STTS_CD  =  :DCLVTRNHSTY.RCRD-LNGTH-STTS-CD            
             ,RCRD_STTS_CD        =  :DCLVTRNHSTY.RCRD-STTS-CD                  
             ,NSCC_PEND_CD        =  :DCLVTRNHSTY.NSCC-PEND-CD                  
             ,NSCC_ACK_IND        =  :DCLVTRNHSTY.NSCC-ACK-IND                  
             ,CICS_TERM_ID_CD     =  :DCLVTRNHSTY.CICS-TERM-ID-CD               
             ,PRGM_NM             =  :DCLVTRNHSTY.PRGM-NM                       
             ,CRT_TMSTP           =  :DCLVTRNHSTY.CRT-TMSTP                     
             ,UPDT_TMSTP          =  :DCLVTRNHSTY.UPDT-TMSTP                    
             ,ACCT_EQUITY_AMT     =  :DCLVTRNHSTY.ACCT-EQUITY-AMT               
LRM003       ,ACCT_FRZN_IND       =  :DCLVTRNHSTY.ACCT-FRZN-IND                 
LRM004       ,BRANCH_ALTNT_CD     =  :DCLVTRNHSTY.BRANCH-ALTNT-CD               
LRM004       ,GIFT_IND            =  :DCLVTRNHSTY.GIFT-IND                      
LRM004       ,RSTR_TRD_90_DY_IND  =  :DCLVTRNHSTY.RSTR-TRD-90-DY-IND            
LRM004       ,REG_T_IND           =  :DCLVTRNHSTY.REG-T-IND                     
LRM004       ,ADOPT_AGRMT_IND     =  :DCLVTRNHSTY.ADOPT-AGRMT-IND               
LRM004       ,RR_ORGNL_CD         =  :DCLVTRNHSTY.RR-ORGNL-CD                   
LRM007       ,CVRSN_ACCT_NBR      =  :DCLVTRNHSTY.CVRSN-ACCT-NBR                
DJ0002       ,AUCTION_RT_IND      =  :DCLVTRNHSTY.AUCTION-RT-IND                
LRM009       ,PENNY_STK_IND       =  :DCLVTRNHSTY.PENNY-STK-IND                 
LRM010       ,GEO_CD              =  :DCLVTRNHSTY.GEO-CD                        
LRM011       ,FOREIGN_FEE_IND     =  :DCLVTRNHSTY.FOREIGN-FEE-IND               
LRM011       ,FOREIGN_FEE_AMT     =  :DCLVTRNHSTY.FOREIGN-FEE-AMT               
LRM012       ,PEND_DVDND_DB_AMT   =  :DCLVTRNHSTY.PEND-DVDND-DB-AMT             
LRM012       ,NTWRK_LVL4_FND_IND  =  :DCLVTRNHSTY.NTWRK-LVL4-FND-IND            
LRM016       ,PAPER_FEE_AMT       =  :DCLVTRNHSTY.PAPER-FEE-AMT                 
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVTRNHSTY.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVTRNHSTY.ACAT-CONTROL-NBR                                
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VTRNHSTY-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VTRNHSTY UPDATE'                      
                    MOVE 2010 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
      ******************                                                        
       2200-CREATE-VASTHSTY-RTN.                                                
      ******************                                                        
                                                                                
           MOVE RECORD-DETAIL TO DCLVASTHSTY.                                   
           EXEC SQL                                                             
               INSERT INTO VASTHSTY                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,CONTROL_NBR_STS_CD                                         
                    ,DLVR_NBR_STTS_CD                                           
                    ,RCV_NBR_STTS_CD                                            
                    ,SBMTG_PRTCP_NBR                                            
                    ,SBMT_PRT_NR_STS_CD                                         
                    ,AST_SEQ_NBR_STS_CD                                         
                    ,SYS_ACT_CD                                                 
                    ,SYS_RJCT_RSN_CD                                            
                    ,TRANS_TYPE_CD                                              
                    ,TRANS_TYPE_STTS_CD                                         
                    ,PHSCL_SEQ_NBR                                              
                    ,PHSCL_SEQ_STTS_CD                                          
                    ,LGCL_SEQ_NBR                                               
                    ,LGCL_SEQ_NR_STS_CD                                         
                    ,ASSET_PRC_CTGY_CD                                          
                    ,AST_PRC_CTG_STS_CD                                         
                    ,STTLM_LCTN_CD                                              
                    ,STTLM_LCTN_STTS_CD                                         
                    ,STTLM_RSN_CD                                               
                    ,STTLM_RSN_STTS_CD                                          
                    ,ISIN_CNTRY_CD                                              
                    ,ISIN_CNTRY_STTS_CD                                         
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,ISIN_SEC_IS_STS_CD                                         
                    ,ISIN_SEC_CDG_CD                                            
                    ,ISIN_SEC_CD_STS_CD                                         
                    ,ASSET_DESC_TXT                                             
                    ,ASSET_DESC_STTS_CD                                         
                    ,ASSET_RQST_QTY_CD                                          
                    ,ASSET_RQST_STS_CD                                          
                    ,AST_RQST_TRANS_CD                                          
                    ,AST_RQ_TRAN_STS_CD                                         
                    ,ASSET_QTY                                                  
                    ,ASSET_QTY_STTS_CD                                          
                    ,ASSET_PCT                                                  
                    ,ASSET_PCT_STTS_CD                                          
                    ,PSTN_CD                                                    
                    ,PSTN_CD_STTS_CD                                            
                    ,ISO_CRNCY_CD                                               
                    ,ISO_CRNCY_STTS_CD                                          
                    ,ASSET_AMT                                                  
                    ,ASSET_AMT_STTS_CD                                          
                    ,BEARER_BOND_CD                                             
                    ,BEARER_BND_STTS_CD                                         
                    ,CSH_MGN_SHRT_CD                                            
                    ,CSH_MRG_SHT_STS_CD                                         
                    ,WHI_CD                                                     
                    ,WHI_STTS_CD                                                
                    ,TRNFR_TYPE_RSN_CD                                          
                    ,TRN_TYP_RSN_STS_CD                                         
                    ,MBS_SERIAL_NBR                                             
                    ,MBS_SERIAL_STTS_CD                                         
                    ,ASSET_CMNT_TXT                                             
                    ,ASSET_CMNT_STTS_CD                                         
                    ,NSCC_ACK_IND                                               
                    ,NSCC_PEND_CD                                               
                    ,FAIL_SENT_CAGE_IND                                         
                    ,FAIL_OPEN_CAGE_IND                                         
                    ,NSCC_NON_ADP_IND                                           
                    ,TRANS_RFRN_ID_CD                                           
                    ,TRANS_RFRN_STTS_CD                                         
                    ,OPTN_CTGY_CD                                               
                    ,OPTN_CTGY_STTS_CD                                          
                    ,RCRD_LNGTH_STTS_CD                                         
                    ,RCRD_STTS_CD                                               
                    ,ISIN_SEC_EXCPT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
                    ,RCL_SENT_NSCC_IND                                          
                    ,FRV_SENT_NSCC_IND                                          
                    ,TRNFR_TYPE_CD                                              
                    ,CAGE_TAG_NBR                                               
                    ,ENTERED_TAG_NBR                                            
                    ,NTWK_CNTL_CD                                               
                    ,FUND_PROC_CD                                               
                    ,FUND_RGSTN_STTS                                            
LRM002              ,SCRTY_866_NBR                                              
LRM002              ,ASSET_866_QTY                                              
DJ0002              ,AUCTION_RT_IND                                             
LRM011              ,FOREIGN_FEE_IND                                            
LRM013              ,CRNCY_CD                                                   
LRM014              ,MEMO_ORG_RVRSL_QTY                                         
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVASTHSTY.CLIENT-NBR                                      
                  ,:DCLVASTHSTY.ACAT-CONTROL-NBR                                
                  ,:DCLVASTHSTY.ASSET-SEQ-NBR                                   
                  ,:DCLVASTHSTY.CONTROL-NBR-STS-CD                              
                  ,:DCLVASTHSTY.DLVR-NBR-STTS-CD                                
                  ,:DCLVASTHSTY.RCV-NBR-STTS-CD                                 
                  ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                                 
                  ,:DCLVASTHSTY.SBMT-PRT-NR-STS-CD                              
                  ,:DCLVASTHSTY.AST-SEQ-NBR-STS-CD                              
                  ,:DCLVASTHSTY.SYS-ACT-CD                                      
                  ,:DCLVASTHSTY.SYS-RJCT-RSN-CD                                 
                  ,:DCLVASTHSTY.TRANS-TYPE-CD                                   
                  ,:DCLVASTHSTY.TRANS-TYPE-STTS-CD                              
                  ,:DCLVASTHSTY.PHSCL-SEQ-NBR                                   
                  ,:DCLVASTHSTY.PHSCL-SEQ-STTS-CD                               
                  ,:DCLVASTHSTY.LGCL-SEQ-NBR                                    
                  ,:DCLVASTHSTY.LGCL-SEQ-NR-STS-CD                              
                  ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                               
                  ,:DCLVASTHSTY.AST-PRC-CTG-STS-CD                              
                  ,:DCLVASTHSTY.STTLM-LCTN-CD                                   
                  ,:DCLVASTHSTY.STTLM-LCTN-STTS-CD                              
                  ,:DCLVASTHSTY.STTLM-RSN-CD                                    
                  ,:DCLVASTHSTY.STTLM-RSN-STTS-CD                               
                  ,:DCLVASTHSTY.ISIN-CNTRY-CD                                   
                  ,:DCLVASTHSTY.ISIN-CNTRY-STTS-CD                              
                  ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVASTHSTY.ISIN-SEC-IS-STS-CD                              
                  ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                                 
                  ,:DCLVASTHSTY.ISIN-SEC-CD-STS-CD                              
                  ,:DCLVASTHSTY.ASSET-DESC-TXT                                  
                  ,:DCLVASTHSTY.ASSET-DESC-STTS-CD                              
                  ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                               
                  ,:DCLVASTHSTY.ASSET-RQST-STS-CD                               
                  ,:DCLVASTHSTY.AST-RQST-TRANS-CD                               
                  ,:DCLVASTHSTY.AST-RQ-TRAN-STS-CD                              
                  ,:DCLVASTHSTY.ASSET-QTY                                       
                  ,:DCLVASTHSTY.ASSET-QTY-STTS-CD                               
                  ,:DCLVASTHSTY.ASSET-PCT                                       
                  ,:DCLVASTHSTY.ASSET-PCT-STTS-CD                               
                  ,:DCLVASTHSTY.PSTN-CD                                         
                  ,:DCLVASTHSTY.PSTN-CD-STTS-CD                                 
                  ,:DCLVASTHSTY.ISO-CRNCY-CD                                    
                  ,:DCLVASTHSTY.ISO-CRNCY-STTS-CD                               
                  ,:DCLVASTHSTY.ASSET-AMT                                       
                  ,:DCLVASTHSTY.ASSET-AMT-STTS-CD                               
                  ,:DCLVASTHSTY.BEARER-BOND-CD                                  
                  ,:DCLVASTHSTY.BEARER-BND-STTS-CD                              
                  ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                 
                  ,:DCLVASTHSTY.CSH-MRG-SHT-STS-CD                              
                  ,:DCLVASTHSTY.WHI-CD                                          
                  ,:DCLVASTHSTY.WHI-STTS-CD                                     
                  ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                               
                  ,:DCLVASTHSTY.TRN-TYP-RSN-STS-CD                              
                  ,:DCLVASTHSTY.MBS-SERIAL-NBR                                  
                  ,:DCLVASTHSTY.MBS-SERIAL-STTS-CD                              
                  ,:DCLVASTHSTY.ASSET-CMNT-TXT                                  
                  ,:DCLVASTHSTY.ASSET-CMNT-STTS-CD                              
                  ,:DCLVASTHSTY.NSCC-ACK-IND                                    
                  ,:DCLVASTHSTY.NSCC-PEND-CD                                    
                  ,:DCLVASTHSTY.FAIL-SENT-CAGE-IND                              
                  ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                              
                  ,:DCLVASTHSTY.NSCC-NON-ADP-IND                                
                  ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                                
                  ,:DCLVASTHSTY.TRANS-RFRN-STTS-CD                              
                  ,:DCLVASTHSTY.OPTN-CTGY-CD                                    
                  ,:DCLVASTHSTY.OPTN-CTGY-STTS-CD                               
                  ,:DCLVASTHSTY.RCRD-LNGTH-STTS-CD                              
                  ,:DCLVASTHSTY.RCRD-STTS-CD                                    
                  ,:DCLVASTHSTY.ISIN-SEC-EXCPT-IND                              
                  ,:DCLVASTHSTY.CRT-TMSTP                                       
                  ,:DCLVASTHSTY.UPDT-TMSTP                                      
                  ,:DCLVASTHSTY.CICS-TERM-ID-CD                                 
                  ,:DCLVASTHSTY.PRGM-NM                                         
                  ,:DCLVASTHSTY.SECURITY-ADP-NBR                                
                  ,:DCLVASTHSTY.RCL-SENT-NSCC-IND                               
                  ,:DCLVASTHSTY.FRV-SENT-NSCC-IND                               
                  ,:DCLVASTHSTY.TRNFR-TYPE-CD                                   
                  ,:DCLVASTHSTY.CAGE-TAG-NBR                                    
                  ,:DCLVASTHSTY.ENTERED-TAG-NBR                                 
                  ,:DCLVASTHSTY.NTWK-CNTL-CD                                    
                  ,:DCLVASTHSTY.FUND-PROC-CD                                    
                  ,:DCLVASTHSTY.FUND-RGSTN-STTS                                 
LRM002            ,:DCLVASTHSTY.SCRTY-866-NBR                                   
LRM002            ,:DCLVASTHSTY.ASSET-866-QTY                                   
DJ0002            ,:DCLVASTHSTY.AUCTION-RT-IND                                  
LRM011            ,:DCLVASTHSTY.FOREIGN-FEE-IND                                 
LRM013            ,:DCLVASTHSTY.CRNCY-CD                                        
LRM014            ,:DCLVASTHSTY.MEMO-ORG-RVRSL-QTY                              
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2210-UPDATE-VASTHSTY-RTN                             
              WHEN +0                                                           
                 ADD 1 TO WS-VASTHSTY-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VASTHSTY INSERT'                      
                    MOVE 2200 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       2210-UPDATE-VASTHSTY-RTN.                                                
           EXEC SQL                                                             
               UPDATE VASTHSTY                                                  
                 SET                                                            
             CONTROL_NBR_STS_CD  = :DCLVASTHSTY.CONTROL-NBR-STS-CD              
            ,DLVR_NBR_STTS_CD    = :DCLVASTHSTY.DLVR-NBR-STTS-CD                
            ,RCV_NBR_STTS_CD     = :DCLVASTHSTY.RCV-NBR-STTS-CD                 
            ,SBMTG_PRTCP_NBR     = :DCLVASTHSTY.SBMTG-PRTCP-NBR                 
            ,SBMT_PRT_NR_STS_CD  = :DCLVASTHSTY.SBMT-PRT-NR-STS-CD              
            ,AST_SEQ_NBR_STS_CD  = :DCLVASTHSTY.AST-SEQ-NBR-STS-CD              
            ,SYS_ACT_CD          = :DCLVASTHSTY.SYS-ACT-CD                      
            ,SYS_RJCT_RSN_CD     = :DCLVASTHSTY.SYS-RJCT-RSN-CD                 
            ,TRANS_TYPE_CD       = :DCLVASTHSTY.TRANS-TYPE-CD                   
            ,TRANS_TYPE_STTS_CD  = :DCLVASTHSTY.TRANS-TYPE-STTS-CD              
            ,PHSCL_SEQ_NBR       = :DCLVASTHSTY.PHSCL-SEQ-NBR                   
            ,PHSCL_SEQ_STTS_CD   = :DCLVASTHSTY.PHSCL-SEQ-STTS-CD               
            ,LGCL_SEQ_NBR        = :DCLVASTHSTY.LGCL-SEQ-NBR                    
            ,LGCL_SEQ_NR_STS_CD  = :DCLVASTHSTY.LGCL-SEQ-NR-STS-CD              
            ,ASSET_PRC_CTGY_CD   = :DCLVASTHSTY.ASSET-PRC-CTGY-CD               
            ,AST_PRC_CTG_STS_CD  = :DCLVASTHSTY.AST-PRC-CTG-STS-CD              
            ,STTLM_LCTN_CD       = :DCLVASTHSTY.STTLM-LCTN-CD                   
            ,STTLM_LCTN_STTS_CD  = :DCLVASTHSTY.STTLM-LCTN-STTS-CD              
            ,STTLM_RSN_CD        = :DCLVASTHSTY.STTLM-RSN-CD                    
            ,STTLM_RSN_STTS_CD   = :DCLVASTHSTY.STTLM-RSN-STTS-CD               
            ,ISIN_CNTRY_CD       = :DCLVASTHSTY.ISIN-CNTRY-CD                   
            ,ISIN_CNTRY_STTS_CD  = :DCLVASTHSTY.ISIN-CNTRY-STTS-CD              
            ,ISIN_SEC_ISSUE_CD   = :DCLVASTHSTY.ISIN-SEC-ISSUE-CD               
            ,ISIN_SEC_IS_STS_CD  = :DCLVASTHSTY.ISIN-SEC-IS-STS-CD              
            ,ISIN_SEC_CDG_CD     = :DCLVASTHSTY.ISIN-SEC-CDG-CD                 
            ,ISIN_SEC_CD_STS_CD  = :DCLVASTHSTY.ISIN-SEC-CD-STS-CD              
            ,ASSET_DESC_TXT      = :DCLVASTHSTY.ASSET-DESC-TXT                  
            ,ASSET_DESC_STTS_CD  = :DCLVASTHSTY.ASSET-DESC-STTS-CD              
            ,ASSET_RQST_QTY_CD   = :DCLVASTHSTY.ASSET-RQST-QTY-CD               
            ,ASSET_RQST_STS_CD   = :DCLVASTHSTY.ASSET-RQST-STS-CD               
            ,AST_RQST_TRANS_CD   = :DCLVASTHSTY.AST-RQST-TRANS-CD               
            ,AST_RQ_TRAN_STS_CD  = :DCLVASTHSTY.AST-RQ-TRAN-STS-CD              
            ,ASSET_QTY           = :DCLVASTHSTY.ASSET-QTY                       
            ,ASSET_QTY_STTS_CD   = :DCLVASTHSTY.ASSET-QTY-STTS-CD               
            ,ASSET_PCT           = :DCLVASTHSTY.ASSET-PCT                       
            ,ASSET_PCT_STTS_CD   = :DCLVASTHSTY.ASSET-PCT-STTS-CD               
            ,PSTN_CD             = :DCLVASTHSTY.PSTN-CD                         
            ,PSTN_CD_STTS_CD     = :DCLVASTHSTY.PSTN-CD-STTS-CD                 
            ,ISO_CRNCY_CD        = :DCLVASTHSTY.ISO-CRNCY-CD                    
            ,ISO_CRNCY_STTS_CD   = :DCLVASTHSTY.ISO-CRNCY-STTS-CD               
            ,ASSET_AMT           = :DCLVASTHSTY.ASSET-AMT                       
            ,ASSET_AMT_STTS_CD   = :DCLVASTHSTY.ASSET-AMT-STTS-CD               
            ,BEARER_BOND_CD      = :DCLVASTHSTY.BEARER-BOND-CD                  
            ,BEARER_BND_STTS_CD  = :DCLVASTHSTY.BEARER-BND-STTS-CD              
            ,CSH_MGN_SHRT_CD     = :DCLVASTHSTY.CSH-MGN-SHRT-CD                 
            ,CSH_MRG_SHT_STS_CD  = :DCLVASTHSTY.CSH-MRG-SHT-STS-CD              
            ,WHI_CD              = :DCLVASTHSTY.WHI-CD                          
            ,WHI_STTS_CD         = :DCLVASTHSTY.WHI-STTS-CD                     
            ,TRNFR_TYPE_RSN_CD   = :DCLVASTHSTY.TRNFR-TYPE-RSN-CD               
            ,TRN_TYP_RSN_STS_CD  = :DCLVASTHSTY.TRN-TYP-RSN-STS-CD              
            ,MBS_SERIAL_NBR      = :DCLVASTHSTY.MBS-SERIAL-NBR                  
            ,MBS_SERIAL_STTS_CD  = :DCLVASTHSTY.MBS-SERIAL-STTS-CD              
            ,ASSET_CMNT_TXT      = :DCLVASTHSTY.ASSET-CMNT-TXT                  
            ,ASSET_CMNT_STTS_CD  = :DCLVASTHSTY.ASSET-CMNT-STTS-CD              
            ,NSCC_ACK_IND        = :DCLVASTHSTY.NSCC-ACK-IND                    
            ,NSCC_PEND_CD        = :DCLVASTHSTY.NSCC-PEND-CD                    
            ,FAIL_SENT_CAGE_IND  = :DCLVASTHSTY.FAIL-SENT-CAGE-IND              
            ,FAIL_OPEN_CAGE_IND  = :DCLVASTHSTY.FAIL-OPEN-CAGE-IND              
            ,NSCC_NON_ADP_IND    = :DCLVASTHSTY.NSCC-NON-ADP-IND                
            ,TRANS_RFRN_ID_CD    = :DCLVASTHSTY.TRANS-RFRN-ID-CD                
            ,TRANS_RFRN_STTS_CD  = :DCLVASTHSTY.TRANS-RFRN-STTS-CD              
            ,OPTN_CTGY_CD        = :DCLVASTHSTY.OPTN-CTGY-CD                    
            ,OPTN_CTGY_STTS_CD   = :DCLVASTHSTY.OPTN-CTGY-STTS-CD               
            ,RCRD_LNGTH_STTS_CD  = :DCLVASTHSTY.RCRD-LNGTH-STTS-CD              
            ,RCRD_STTS_CD        = :DCLVASTHSTY.RCRD-STTS-CD                    
            ,ISIN_SEC_EXCPT_IND  = :DCLVASTHSTY.ISIN-SEC-EXCPT-IND              
            ,CRT_TMSTP           = :DCLVASTHSTY.CRT-TMSTP                       
            ,UPDT_TMSTP          = :DCLVASTHSTY.UPDT-TMSTP                      
            ,CICS_TERM_ID_CD     = :DCLVASTHSTY.CICS-TERM-ID-CD                 
            ,PRGM_NM             = :DCLVASTHSTY.PRGM-NM                         
            ,SECURITY_ADP_NBR    = :DCLVASTHSTY.SECURITY-ADP-NBR                
            ,RCL_SENT_NSCC_IND   = :DCLVASTHSTY.RCL-SENT-NSCC-IND               
            ,FRV_SENT_NSCC_IND   = :DCLVASTHSTY.FRV-SENT-NSCC-IND               
            ,TRNFR_TYPE_CD       = :DCLVASTHSTY.TRNFR-TYPE-CD                   
            ,CAGE_TAG_NBR        = :DCLVASTHSTY.CAGE-TAG-NBR                    
            ,ENTERED_TAG_NBR     = :DCLVASTHSTY.ENTERED-TAG-NBR                 
            ,NTWK_CNTL_CD        = :DCLVASTHSTY.NTWK-CNTL-CD                    
            ,FUND_PROC_CD        = :DCLVASTHSTY.FUND-PROC-CD                    
            ,FUND_RGSTN_STTS     = :DCLVASTHSTY.FUND-RGSTN-STTS                 
LRM002      ,SCRTY_866_NBR       = :DCLVASTHSTY.SCRTY-866-NBR                   
LRM002      ,ASSET_866_QTY       = :DCLVASTHSTY.ASSET-866-QTY                   
LRM002      ,AUCTION_RT_IND      = :DCLVASTHSTY.AUCTION-RT-IND                  
LRM011      ,FOREIGN_FEE_IND     = :DCLVASTHSTY.FOREIGN-FEE-IND                 
LRM013      ,CRNCY_CD            = :DCLVASTHSTY.CRNCY-CD                        
LRM014      ,MEMO_ORG_RVRSL_QTY  = :DCLVASTHSTY.MEMO-ORG-RVRSL-QTY              
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVASTHSTY.CLIENT-NBR   AND                                
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVASTHSTY.ACAT-CONTROL-NBR  AND                           
                    ASSET_SEQ_NBR  =                                            
                   :DCLVASTHSTY.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VASTHSTY-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VASTHSTY UPDATE'                      
                    MOVE 2210 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2300-CREATE-VMFHSTY-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVMFHSTY.                                    
           EXEC SQL                                                             
               INSERT INTO VMFHSTY                                              
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,ACCT_TYPE_CD                                               
                    ,ACCT_TYPE_STTS_CD                                          
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,DVDND_PAYEE_CD                                             
                    ,DVDND_PYE_STTS_CD                                          
                    ,LTCG_CD                                                    
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,STCG_CD                                                    
                    ,MF_FULL_PRTL_CD                                            
                    ,MF_FUL_PRTL_STS_CD                                         
                    ,RGSTN_CD                                                   
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVMFHSTY.CLIENT-NBR                                       
                  ,:DCLVMFHSTY.ACAT-CONTROL-NBR                                 
                  ,:DCLVMFHSTY.ASSET-SEQ-NBR                                    
                  ,:DCLVMFHSTY.BK-PHSCL-SHR-CD                                  
                  ,:DCLVMFHSTY.BK-PHSC-SHR-STS-CD                               
                  ,:DCLVMFHSTY.NTWRK-CNTL-CD                                    
                  ,:DCLVMFHSTY.NTWRK-CNTL-STTS-CD                               
                  ,:DCLVMFHSTY.ACCT-TYPE-CD                                     
                  ,:DCLVMFHSTY.ACCT-TYPE-STTS-CD                                
                  ,:DCLVMFHSTY.DVDND-CD                                         
                  ,:DCLVMFHSTY.DVDND-STTS-CD                                    
                  ,:DCLVMFHSTY.DVDND-PAYEE-CD                                   
                  ,:DCLVMFHSTY.DVDND-PYE-STTS-CD                                
                  ,:DCLVMFHSTY.LTCG-CD                                          
                  ,:DCLVMFHSTY.BRKR-EXCTG-NBR                                   
                  ,:DCLVMFHSTY.BRKR-EXCTG-STTS-CD                               
                  ,:DCLVMFHSTY.STCG-CD                                          
                  ,:DCLVMFHSTY.MF-FULL-PRTL-CD                                  
                  ,:DCLVMFHSTY.MF-FUL-PRTL-STS-CD                               
                  ,:DCLVMFHSTY.RGSTN-CD                                         
                  ,:DCLVMFHSTY.FNBR                                             
                  ,:DCLVMFHSTY.FND-ACT-NBR-STS-CD                               
                  ,:DCLVMFHSTY.DSTBN-SIDE-CD                                    
                  ,:DCLVMFHSTY.PRCS-DT                                          
                  ,:DCLVMFHSTY.CRT-TMSTP                                        
                  ,:DCLVMFHSTY.UPDT-TMSTP                                       
                  ,:DCLVMFHSTY.CICS-TERM-ID-CD                                  
                  ,:DCLVMFHSTY.PRGM-NM                                          
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2310-UPDATE-VMFHSTY-RTN                              
              WHEN +0                                                           
                 ADD 1 TO WS-VMFHSTY-COUNT                                      
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VMFHSTY INSERT'                       
                    MOVE 2300 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       2310-UPDATE-VMFHSTY-RTN.                                                 
           EXEC SQL                                                             
               UPDATE VMFHSTY                                                   
                 SET                                                            
                 BK_PHSCL_SHR_CD     = :DCLVMFHSTY.BK-PHSCL-SHR-CD              
                ,BK_PHSC_SHR_STS_CD  = :DCLVMFHSTY.BK-PHSC-SHR-STS-CD           
                ,NTWRK_CNTL_CD       = :DCLVMFHSTY.NTWRK-CNTL-CD                
                ,NTWRK_CNTL_STTS_CD  = :DCLVMFHSTY.NTWRK-CNTL-STTS-CD           
                ,ACCT_TYPE_CD        = :DCLVMFHSTY.ACCT-TYPE-CD                 
                ,ACCT_TYPE_STTS_CD   = :DCLVMFHSTY.ACCT-TYPE-STTS-CD            
                ,DVDND_CD            = :DCLVMFHSTY.DVDND-CD                     
                ,DVDND_STTS_CD       = :DCLVMFHSTY.DVDND-STTS-CD                
                ,DVDND_PAYEE_CD      = :DCLVMFHSTY.DVDND-PAYEE-CD               
                ,DVDND_PYE_STTS_CD   = :DCLVMFHSTY.DVDND-PYE-STTS-CD            
                ,LTCG_CD             = :DCLVMFHSTY.LTCG-CD                      
                ,BRKR_EXCTG_NBR      = :DCLVMFHSTY.BRKR-EXCTG-NBR               
                ,BRKR_EXCTG_STTS_CD  = :DCLVMFHSTY.BRKR-EXCTG-STTS-CD           
                ,STCG_CD             = :DCLVMFHSTY.STCG-CD                      
                ,MF_FULL_PRTL_CD     = :DCLVMFHSTY.MF-FULL-PRTL-CD              
                ,MF_FUL_PRTL_STS_CD  = :DCLVMFHSTY.MF-FUL-PRTL-STS-CD           
                ,RGSTN_CD            = :DCLVMFHSTY.RGSTN-CD                     
                ,FNBR                = :DCLVMFHSTY.FNBR                         
                ,FND_ACT_NBR_STS_CD  = :DCLVMFHSTY.FND-ACT-NBR-STS-CD           
                ,DSTBN_SIDE_CD       = :DCLVMFHSTY.DSTBN-SIDE-CD                
                ,PRCS_DT             = :DCLVMFHSTY.PRCS-DT                      
                ,CRT_TMSTP           = :DCLVMFHSTY.CRT-TMSTP                    
                ,UPDT_TMSTP          = :DCLVMFHSTY.UPDT-TMSTP                   
                ,CICS_TERM_ID_CD     = :DCLVMFHSTY.CICS-TERM-ID-CD              
                ,PRGM_NM             = :DCLVMFHSTY.PRGM-NM                      
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVMFHSTY.CLIENT-NBR AND                                   
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVMFHSTY.ACAT-CONTROL-NBR AND                             
                    ASSET_SEQ_NBR  =                                            
                   :DCLVMFHSTY.ASSET-SEQ-NBR                                    
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VMFHSTY-COUNT-REPL                                 
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VMFHSTY UPDATE'                       
                    MOVE 2310 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2400-CREATE-VOPTHSTY-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVOPTHSTY.                                   
           EXEC SQL                                                             
               INSERT INTO VOPTHSTY                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_STS_CD                                         
                    ,SYM_CD                                                     
                    ,SYM_STTS_CD                                                
                    ,EXPTN_DT                                                   
                    ,STPRC_INTEGER_AMT                                          
                    ,STPRC_INTR_STTS_CD                                         
                    ,STPRC_FRCTN_AMT                                            
                    ,STPRC_FRCT_STTS_CD                                         
                    ,DLVR_OCC_NBR                                               
                    ,OPTN_ACCT_TYPE_CD                                          
                    ,OPT_ACT_TYP_STS_CD                                         
                    ,ACCT_SUB_CD                                                
                    ,ACCT_SUB_STTS_CD                                           
                    ,OPTN_CMNT_TXT                                              
                    ,OPTN_CMNT_STTS_CD                                          
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,ACCT_TYPE_MSMT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
LRM009              ,STPRC_INTEGER2_AMT                                         
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVOPTHSTY.CLIENT-NBR                                      
                  ,:DCLVOPTHSTY.ACAT-CONTROL-NBR                                
                  ,:DCLVOPTHSTY.ASSET-SEQ-NBR                                   
                  ,:DCLVOPTHSTY.BS-CD                                           
                  ,:DCLVOPTHSTY.BS-STTS-CD                                      
                  ,:DCLVOPTHSTY.PTCL-CD                                         
                  ,:DCLVOPTHSTY.PTCL-STTS-CD                                    
                  ,:DCLVOPTHSTY.OPTN-OPN-CLSD-CD                                
                  ,:DCLVOPTHSTY.OPT-OPN-CLS-STS-CD                              
                  ,:DCLVOPTHSTY.SYM-CD                                          
                  ,:DCLVOPTHSTY.SYM-STTS-CD                                     
                  ,:DCLVOPTHSTY.EXPTN-DT                                        
                  ,:DCLVOPTHSTY.STPRC-INTEGER-AMT                               
                  ,:DCLVOPTHSTY.STPRC-INTR-STTS-CD                              
                  ,:DCLVOPTHSTY.STPRC-FRCTN-AMT                                 
                  ,:DCLVOPTHSTY.STPRC-FRCT-STTS-CD                              
                  ,:DCLVOPTHSTY.DLVR-OCC-NBR                                    
                  ,:DCLVOPTHSTY.OPTN-ACCT-TYPE-CD                               
                  ,:DCLVOPTHSTY.OPT-ACT-TYP-STS-CD                              
                  ,:DCLVOPTHSTY.ACCT-SUB-CD                                     
                  ,:DCLVOPTHSTY.ACCT-SUB-STTS-CD                                
                  ,:DCLVOPTHSTY.OPTN-CMNT-TXT                                   
                  ,:DCLVOPTHSTY.OPTN-CMNT-STTS-CD                               
                  ,:DCLVOPTHSTY.OPTN-EXPTN-DT-CD                                
                  ,:DCLVOPTHSTY.OPT-OCC-DLV-STS-CD                              
                  ,:DCLVOPTHSTY.ACCT-TYPE-MSMT-IND                              
                  ,:DCLVOPTHSTY.CRT-TMSTP                                       
                  ,:DCLVOPTHSTY.UPDT-TMSTP                                      
                  ,:DCLVOPTHSTY.PRGM-NM                                         
                  ,:DCLVOPTHSTY.CICS-TERM-ID-CD                                 
LRM009            ,:DCLVOPTHSTY.STPRC-INTEGER2-AMT                              
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2410-UPDATE-VOPTHSTY-RTN                             
              WHEN +0                                                           
                 ADD 1 TO WS-VOPTHSTY-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VOPTHSTY INSERT'                      
                    MOVE 2400 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
           EJECT                                                                
       2410-UPDATE-VOPTHSTY-RTN.                                                
           EXEC SQL                                                             
               UPDATE VOPTHSTY                                                  
                 SET                                                            
                 BS_CD              = :DCLVOPTHSTY.BS-CD                        
                ,BS_STTS_CD         = :DCLVOPTHSTY.BS-STTS-CD                   
                ,PTCL_CD            = :DCLVOPTHSTY.PTCL-CD                      
                ,PTCL_STTS_CD       = :DCLVOPTHSTY.PTCL-STTS-CD                 
                ,OPTN_OPN_CLSD_CD = :DCLVOPTHSTY.OPTN-OPN-CLSD-CD               
                ,OPT_OPN_CLS_STS_CD = :DCLVOPTHSTY.OPT-OPN-CLS-STS-CD           
                ,SYM_CD             = :DCLVOPTHSTY.SYM-CD                       
                ,SYM_STTS_CD        = :DCLVOPTHSTY.SYM-STTS-CD                  
                ,EXPTN_DT           = :DCLVOPTHSTY.EXPTN-DT                     
                ,STPRC_INTEGER_AMT  = :DCLVOPTHSTY.STPRC-INTEGER-AMT            
                ,STPRC_INTR_STTS_CD = :DCLVOPTHSTY.STPRC-INTR-STTS-CD           
                ,STPRC_FRCTN_AMT    = :DCLVOPTHSTY.STPRC-FRCTN-AMT              
                ,STPRC_FRCT_STTS_CD = :DCLVOPTHSTY.STPRC-FRCT-STTS-CD           
                ,DLVR_OCC_NBR       = :DCLVOPTHSTY.DLVR-OCC-NBR                 
                ,OPTN_ACCT_TYPE_CD  = :DCLVOPTHSTY.OPTN-ACCT-TYPE-CD            
                ,OPT_ACT_TYP_STS_CD = :DCLVOPTHSTY.OPT-ACT-TYP-STS-CD           
                ,ACCT_SUB_CD        = :DCLVOPTHSTY.ACCT-SUB-CD                  
                ,ACCT_SUB_STTS_CD   = :DCLVOPTHSTY.ACCT-SUB-STTS-CD             
                ,OPTN_CMNT_TXT      = :DCLVOPTHSTY.OPTN-CMNT-TXT                
                ,OPTN_CMNT_STTS_CD  = :DCLVOPTHSTY.OPTN-CMNT-STTS-CD            
                ,OPTN_EXPTN_DT_CD   = :DCLVOPTHSTY.OPTN-EXPTN-DT-CD             
                ,OPT_OCC_DLV_STS_CD = :DCLVOPTHSTY.OPT-OCC-DLV-STS-CD           
                ,ACCT_TYPE_MSMT_IND = :DCLVOPTHSTY.ACCT-TYPE-MSMT-IND           
                ,CRT_TMSTP          = :DCLVOPTHSTY.CRT-TMSTP                    
                ,UPDT_TMSTP         = :DCLVOPTHSTY.UPDT-TMSTP                   
                ,PRGM_NM            = :DCLVOPTHSTY.PRGM-NM                      
                ,CICS_TERM_ID_CD    = :DCLVOPTHSTY.CICS-TERM-ID-CD              
LRM009          ,STPRC_INTEGER2_AMT = :DCLVOPTHSTY.STPRC-INTEGER2-AMT           
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVOPTHSTY.CLIENT-NBR AND                                  
                    ACAT_CONTROL_NBR    =                                       
                   :DCLVOPTHSTY.ACAT-CONTROL-NBR AND                            
                    ASSET_SEQ_NBR  =                                            
                   :DCLVOPTHSTY.ASSET-SEQ-NBR                                   
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VOPTHSTY-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VOPTHSTY UPDATE'                      
                    MOVE 2410 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
       2500-CREATE-VRSTBRKR-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSTBRKR.                                   
           EXEC SQL                                                             
               INSERT INTO VRSTBRKR                                             
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,BRKR_CONTRA_NBR                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,SECURITY_ADP_NBR                                           
LRM008              ,EXPTN_DT                                                   
LRM008              ,COMMENT_TXT                                                
LRM008              ,CICS_SGNON_ID                                              
LRM008              ,TPSCRT_USR_NM                                              
LRM008              ,TPSCRT_USR_ID                                              
LRM008              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVRSTBRKR.CLIENT-NBR                                      
                  ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                               
                  ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                 
                  ,:DCLVRSTBRKR.CRT-TMSTP                                       
                  ,:DCLVRSTBRKR.UPDT-TMSTP                                      
                  ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                 
                  ,:DCLVRSTBRKR.PRGM-NM                                         
                  ,:DCLVRSTBRKR.SECURITY-ADP-NBR                                
LRM008            ,:DCLVRSTBRKR.EXPTN-DT                                        
LRM008            ,:DCLVRSTBRKR.COMMENT-TXT                                     
LRM008            ,:DCLVRSTBRKR.CICS-SGNON-ID                                   
LRM008            ,:DCLVRSTBRKR.TPSCRT-USR-NM                                   
LRM008            ,:DCLVRSTBRKR.TPSCRT-USR-ID                                   
LRM008            ,:DCLVRSTBRKR.CICS-NET-NM                                     
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2510-UPDATE-VRSTBRKR-RTN                             
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTBRKR-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSTBRKR INSERT'                      
                    MOVE 2500 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2510-UPDATE-VRSTBRKR-RTN.                                                
           EXEC SQL                                                             
               UPDATE VRSTBRKR                                                  
                 SET                                                            
                 CRT_TMSTP          = :DCLVRSTBRKR.CRT-TMSTP                    
                ,UPDT_TMSTP         = :DCLVRSTBRKR.UPDT-TMSTP                   
                ,CICS_TERM_ID_CD    = :DCLVRSTBRKR.CICS-TERM-ID-CD              
                ,PRGM_NM            = :DCLVRSTBRKR.PRGM-NM                      
                ,SECURITY_ADP_NBR   = :DCLVRSTBRKR.CLIENT-NBR                   
LRM008          ,EXPTN_DT           = :DCLVRSTBRKR.EXPTN-DT                     
LRM008          ,COMMENT_TXT        = :DCLVRSTBRKR.COMMENT-TXT                  
LRM008          ,CICS_SGNON_ID      = :DCLVRSTBRKR.CICS-SGNON-ID                
LRM008          ,TPSCRT_USR_NM      = :DCLVRSTBRKR.TPSCRT-USR-NM                
LRM008          ,TPSCRT_USR_ID      = :DCLVRSTBRKR.TPSCRT-USR-ID                
LRM008          ,CICS_NET_NM        = :DCLVRSTBRKR.CICS-NET-NM                  
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTBRKR.CLIENT-NBR AND                                  
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTBRKR.ISIN-SEC-ISSUE-CD AND                           
                   BRKR_CONTRA_NBR    =                                         
                   :DCLVRSTBRKR.BRKR-CONTRA-NBR                                 
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTBRKR-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSTBRKR UPDATE'                      
                    MOVE 2510 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2600-CREATE-VRSTSEC-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSTSEC.                                    
           EXEC SQL                                                             
               INSERT INTO VRSTSEC                                              
                 (                                                              
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
LRM008              ,EXPTN_DT                                                   
LRM008              ,COMMENT_TXT                                                
LRM008              ,CICS_SGNON_ID                                              
LRM008              ,TPSCRT_USR_NM                                              
LRM008              ,TPSCRT_USR_ID                                              
LRM008              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
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
LRM008            ,:DCLVRSTSEC.EXPTN-DT                                         
LRM008            ,:DCLVRSTSEC.COMMENT-TXT                                      
LRM008            ,:DCLVRSTSEC.CICS-SGNON-ID                                    
LRM008            ,:DCLVRSTSEC.TPSCRT-USR-NM                                    
LRM008            ,:DCLVRSTSEC.TPSCRT-USR-ID                                    
LRM008            ,:DCLVRSTSEC.CICS-NET-NM                                      
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2610-UPDATE-VRSTSEC-RTN                              
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTSEC-COUNT                                      
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSTSEC  INSERT'                      
                    MOVE 2600 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2610-UPDATE-VRSTSEC-RTN.                                                 
           EXEC SQL                                                             
               UPDATE VRSTSEC                                                   
                 SET                                                            
                 TRNFR_MEMO_IND     = :DCLVRSTSEC.TRNFR-MEMO-IND                
                ,TRNFR_BRKR_TYPE_CD = :DCLVRSTSEC.TRNFR-BRKR-TYPE-CD            
                ,RSTRD_MSG_TXT      = :DCLVRSTSEC.RSTRD-MSG-TXT                 
                ,PRGM_NM            = :DCLVRSTSEC.PRGM-NM                       
                ,CICS_TERM_ID_CD    = :DCLVRSTSEC.CICS-TERM-ID-CD               
                ,CRT_TMSTP          = :DCLVRSTSEC.CRT-TMSTP                     
                ,UPDT_TMSTP         = :DCLVRSTSEC.UPDT-TMSTP                    
                ,SECURITY_ADP_NBR   = :DCLVRSTSEC.SECURITY-ADP-NBR              
LRM008          ,EXPTN_DT           = :DCLVRSTSEC.EXPTN-DT                      
LRM008          ,COMMENT_TXT        = :DCLVRSTSEC.COMMENT-TXT                   
LRM008          ,CICS_SGNON_ID      = :DCLVRSTSEC.CICS-SGNON-ID                 
LRM008          ,TPSCRT_USR_NM      = :DCLVRSTSEC.TPSCRT-USR-NM                 
LRM008          ,TPSCRT_USR_ID      = :DCLVRSTSEC.TPSCRT-USR-ID                 
LRM008          ,CICS_NET_NM        = :DCLVRSTSEC.CICS-NET-NM                   
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSTSEC.CLIENT-NBR AND                                   
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSTSEC-COUNT-REPL                                 
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSTSEC  UPDATE'                      
                    MOVE 2610 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2700-CREATE-VRSDSEC-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSDSEC.                                    
           EXEC SQL                                                             
               INSERT INTO VRSDSEC                                              
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,ISIN_SEC_ISSUE_CD                                          
                    ,SECURITY_ADP_NBR                                           
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
LRM006              ,EXPTN_DT                                                   
LRM006              ,COMMENT_TXT                                                
LRM006              ,CICS_SGNON_ID                                              
LRM006              ,TPSCRT_USR_NM                                              
LRM006              ,TPSCRT_USR_ID                                              
LRM006              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVRSDSEC.CLIENT-NBR                                       
                  ,:DCLVRSDSEC.ACCT-CD                                          
                  ,:DCLVRSDSEC.BRANCH-CD                                        
                  ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                                
                  ,:DCLVRSDSEC.SECURITY-ADP-NBR                                 
                  ,:DCLVRSDSEC.PRGM-NM                                          
                  ,:DCLVRSDSEC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSDSEC.CRT-TMSTP                                        
                  ,:DCLVRSDSEC.UPDT-TMSTP                                       
LRM006            ,:DCLVRSDSEC.EXPTN-DT                                         
LRM006            ,:DCLVRSDSEC.COMMENT-TXT                                      
LRM006            ,:DCLVRSDSEC.CICS-SGNON-ID                                    
LRM006            ,:DCLVRSDSEC.TPSCRT-USR-NM                                    
LRM006            ,:DCLVRSDSEC.TPSCRT-USR-ID                                    
LRM006            ,:DCLVRSDSEC.CICS-NET-NM                                      
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2710-UPDATE-VRSDSEC-RTN                              
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDSEC-COUNT                                      
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDSEC  INSERT'                      
                    MOVE 2700 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2710-UPDATE-VRSDSEC-RTN.                                                 
           EXEC SQL                                                             
               UPDATE VRSDSEC                                                   
                 SET                                                            
                 SECURITY_ADP_NBR   = :DCLVRSDSEC.SECURITY-ADP-NBR              
                ,PRGM_NM            = :DCLVRSDSEC.PRGM-NM                       
                ,CICS_TERM_ID_CD    = :DCLVRSDSEC.CICS-TERM-ID-CD               
                ,CRT_TMSTP          = :DCLVRSDSEC.CRT-TMSTP                     
                ,UPDT_TMSTP         = :DCLVRSDSEC.UPDT-TMSTP                    
LRM006          ,EXPTN_DT           = :DCLVRSDSEC.EXPTN-DT                      
LRM006          ,COMMENT_TXT        = :DCLVRSDSEC.COMMENT-TXT                   
LRM006          ,CICS_SGNON_ID      = :DCLVRSDSEC.CICS-SGNON-ID                 
LRM006          ,TPSCRT_USR_NM      = :DCLVRSDSEC.TPSCRT-USR-NM                 
LRM006          ,TPSCRT_USR_ID      = :DCLVRSDSEC.TPSCRT-USR-ID                 
LRM006          ,CICS_NET_NM        = :DCLVRSDSEC.CICS-NET-NM                   
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSDSEC.CLIENT-NBR AND                                   
                    ACCT_CD    =                                                
                   :DCLVRSDSEC.ACCT-CD  AND                                     
                    BRANCH_CD  =                                                
                   :DCLVRSDSEC.BRANCH-CD AND                                    
                   ISIN_SEC_ISSUE_CD  =                                         
                   :DCLVRSDSEC.ISIN-SEC-ISSUE-CD                                
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDSEC-COUNT-REPL                                 
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDSEC  UPDATE'                      
                    MOVE 2710 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2800-CREATE-VRSDACC-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSDACC.                                    
           EXEC SQL                                                             
               INSERT INTO VRSDACC                                              
                 (                                                              
                     CLIENT_NBR                                                 
                    ,ACCT_CD                                                    
                    ,BRANCH_CD                                                  
                    ,BRANCH_ORGNL_CD                                            
                    ,ACCT_ORGNL_CD                                              
                    ,RR_CD                                                      
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
LRM006              ,EXPTN_DT                                                   
LRM006              ,COMMENT_TXT                                                
LRM006              ,CICS_SGNON_ID                                              
LRM006              ,TPSCRT_USR_NM                                              
LRM006              ,TPSCRT_USR_ID                                              
LRM006              ,CICS_NET_NM                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                   :DCLVRSDACC.CLIENT-NBR                                       
                  ,:DCLVRSDACC.ACCT-CD                                          
                  ,:DCLVRSDACC.BRANCH-CD                                        
                  ,:DCLVRSDACC.BRANCH-ORGNL-CD                                  
                  ,:DCLVRSDACC.ACCT-ORGNL-CD                                    
                  ,:DCLVRSDACC.RR-CD                                            
                  ,:DCLVRSDACC.CRT-TMSTP                                        
                  ,:DCLVRSDACC.UPDT-TMSTP                                       
                  ,:DCLVRSDACC.CICS-TERM-ID-CD                                  
                  ,:DCLVRSDACC.PRGM-NM                                          
LRM006            ,:DCLVRSDACC.EXPTN-DT                                         
LRM006            ,:DCLVRSDACC.COMMENT-TXT                                      
LRM006            ,:DCLVRSDACC.CICS-SGNON-ID                                    
LRM006            ,:DCLVRSDACC.TPSCRT-USR-NM                                    
LRM006            ,:DCLVRSDACC.TPSCRT-USR-ID                                    
LRM006            ,:DCLVRSDACC.CICS-NET-NM                                      
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2810-UPDATE-VRSDACC-RTN                              
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDACC-COUNT                                      
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDACC  INSERT'                      
                    MOVE 2800 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2810-UPDATE-VRSDACC-RTN.                                                 
           EXEC SQL                                                             
               UPDATE VRSDACC                                                   
                 SET                                                            
                 BRANCH_ORGNL_CD    = :DCLVRSDACC.BRANCH-ORGNL-CD               
                ,ACCT_ORGNL_CD      = :DCLVRSDACC.ACCT-ORGNL-CD                 
                ,RR_CD              = :DCLVRSDACC.RR-CD                         
                ,CRT_TMSTP          = :DCLVRSDACC.CRT-TMSTP                     
                ,UPDT_TMSTP         = :DCLVRSDACC.UPDT-TMSTP                    
                ,CICS_TERM_ID_CD    = :DCLVRSDACC.CICS-TERM-ID-CD               
                ,PRGM_NM            = :DCLVRSDACC.CLIENT-NBR                    
LRM006          ,EXPTN_DT           = :DCLVRSDACC.EXPTN-DT                      
LRM006          ,COMMENT_TXT        = :DCLVRSDACC.COMMENT-TXT                   
LRM006          ,CICS_SGNON_ID      = :DCLVRSDACC.CICS-SGNON-ID                 
LRM006          ,TPSCRT_USR_NM      = :DCLVRSDACC.TPSCRT-USR-NM                 
LRM006          ,TPSCRT_USR_ID      = :DCLVRSDACC.TPSCRT-USR-ID                 
LRM006          ,CICS_NET_NM        = :DCLVRSDACC.CICS-NET-NM                   
              WHERE                                                             
                   (CLIENT_NBR    =                                             
                   :DCLVRSDACC.CLIENT-NBR AND                                   
                    ACCT_CD    =                                                
                   :DCLVRSDACC.ACCT-CD  AND                                     
                    BRANCH_CD  =                                                
                   :DCLVRSDACC.BRANCH-CD                                        
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDSEC-COUNT-REPL                                 
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDACC  UPDATE'                      
                    MOVE 2810 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2900-CREATE-VPRTCPPF-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVPRTCPPF.                                   
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
                    :DCLVPRTCPPF.PRTCP-NBR                                      
                   ,:DCLVPRTCPPF.BRKR-TIF-IND                                   
                   ,:DCLVPRTCPPF.PRTCP-TYPE-CD                                  
                   ,:DCLVPRTCPPF.PRTCP-NM                                       
                   ,:DCLVPRTCPPF.FUND-SRV-ELGBL-IND                             
                   ,:DCLVPRTCPPF.CRT-TMSTP                                      
                   ,:DCLVPRTCPPF.UPDT-TMSTP                                     
                   ,:DCLVPRTCPPF.CICS-TERM-ID-CD                                
                   ,:DCLVPRTCPPF.PRGM-NM                                        
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 2910-UPDATE-VPRTCPPF-RTN                             
              WHEN +0                                                           
                 ADD 1 TO WS-VPRTCPPF-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VPRTCPPF INSERT'                      
                    MOVE 2900 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       2910-UPDATE-VPRTCPPF-RTN.                                                
           EXEC SQL                                                             
               UPDATE VPRTCPPF                                                  
                 SET                                                            
                BRKR_TIF_IND        = :DCLVPRTCPPF.BRKR-TIF-IND                 
               ,PRTCP_TYPE_CD       = :DCLVPRTCPPF.PRTCP-TYPE-CD                
               ,PRTCP_NM            = :DCLVPRTCPPF.PRTCP-NM                     
               ,FUND_SRV_ELGBL_IND  = :DCLVPRTCPPF.FUND-SRV-ELGBL-IND           
               ,CRT_TMSTP           = :DCLVPRTCPPF.CRT-TMSTP                    
               ,UPDT_TMSTP          = :DCLVPRTCPPF.UPDT-TMSTP                   
               ,CICS_TERM_ID_CD     = :DCLVPRTCPPF.CICS-TERM-ID-CD              
               ,PRGM_NM             = :DCLVPRTCPPF.PRGM-NM                      
              WHERE                                                             
                   (PRTCP_NBR    =                                              
                    :DCLVPRTCPPF.PRTCP-NBR                                      
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VPRTCPPF-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VPRTCPPF UPDATE'                      
                    MOVE 2910 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3000-CREATE-VALERT-RTN.                                                  
                                                                                
           MOVE RECORD-DETAIL TO DCLVALERT.                                     
           EXEC SQL                                                             
               INSERT INTO VALERT                                               
                 (                                                              
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,ACCT_MSG_TXT                                                
                   ,RR_CD                                                       
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                 )                                                              
                  VALUES                                                        
                 (                                                              
                    :DCLVALERT.CLIENT-NBR                                       
                   ,:DCLVALERT.BRANCH-CD                                        
                   ,:DCLVALERT.ACCT-CD                                          
                   ,:DCLVALERT.ACCT-MSG-TXT                                     
                   ,:DCLVALERT.RR-CD                                            
                   ,:DCLVALERT.CRT-TMSTP                                        
                   ,:DCLVALERT.UPDT-TMSTP                                       
                   ,:DCLVALERT.CICS-TERM-ID-CD                                  
                   ,:DCLVALERT.PRGM-NM                                          
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 3010-UPDATE-VALERT-RTN                               
              WHEN +0                                                           
                 ADD 1 TO WS-VALERT-COUNT                                       
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VALERT   INSERT'                      
                    MOVE 3000 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3010-UPDATE-VALERT-RTN.                                                  
           EXEC SQL                                                             
               UPDATE VALERT                                                    
                 SET                                                            
                ACCT_MSG_TXT         =  :DCLVALERT.ACCT-MSG-TXT                 
               ,RR_CD                =  :DCLVALERT.RR-CD                        
               ,CRT_TMSTP            =  :DCLVALERT.CRT-TMSTP                    
               ,UPDT_TMSTP           =  :DCLVALERT.UPDT-TMSTP                   
               ,CICS_TERM_ID_CD      =  :DCLVALERT.CICS-TERM-ID-CD              
               ,PRGM_NM              =  :DCLVALERT.PRGM-NM                      
              WHERE                                                             
                   (                                                            
                CLIENT_NBR     =  :DCLVALERT.CLIENT-NBR  AND                    
                BRANCH_CD      =  :DCLVALERT.BRANCH-CD   AND                    
                ACCT_CD        =  :DCLVALERT.ACCT-CD                            
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VALERT-COUNT-REPL                                  
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VALERT   UPDATE'                      
                    MOVE 3010 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3100-CREATE-VRSDBLK-RTN.                                                 
                                                                                
           MOVE RECORD-DETAIL TO DCLVRSDBLK.                                    
           EXEC SQL                                                             
               INSERT INTO VRSDBLK                                              
                 (                                                              
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
                   ,PRGM_NM                                                     
                   ,RCV_NBR                                                     
                   ,DLVR_NBR                                                    
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,SECURITY_ADP_NBR                                            
                   ,EXPIRE_DT                                                   
                   ,ACTION_CD                                                   
                   ,CICS_SNON_ID                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BRANCH-CD                                       
                   ,:DCLVRSDBLK.ACCT-CD                                         
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.CMNT-TXT                                        
                   ,:DCLVRSDBLK.PRGM-NM                                         
                   ,:DCLVRSDBLK.RCV-NBR                                         
                   ,:DCLVRSDBLK.DLVR-NBR                                        
                   ,:DCLVRSDBLK.CICS-TERM-ID-CD                                 
                   ,:DCLVRSDBLK.CRT-TMSTP                                       
                   ,:DCLVRSDBLK.UPDT-TMSTP                                      
                   ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
                   ,:DCLVRSDBLK.EXPIRE-DT                                       
                   ,:DCLVRSDBLK.ACTION-CD                                       
                   ,:DCLVRSDBLK.CICS-SNON-ID                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 3110-UPDATE-VRSDBLK-RTN                              
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDBLK-COUNT                                      
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDBLK  INSERT'                      
                    MOVE 3100 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3110-UPDATE-VRSDBLK-RTN.                                                 
           EXEC SQL                                                             
               UPDATE VRSDBLK                                                   
                 SET                                                            
                CMNT_TXT             =  :DCLVRSDBLK.CMNT-TXT                    
               ,DLVR_NBR             =  :DCLVRSDBLK.DLVR-NBR                    
               ,CRT_TMSTP            =  :DCLVRSDBLK.CRT-TMSTP                   
               ,UPDT_TMSTP           =  :DCLVRSDBLK.UPDT-TMSTP                  
               ,CICS_TERM_ID_CD      =  :DCLVRSDBLK.CICS-TERM-ID-CD             
               ,PRGM_NM              =  :DCLVRSDBLK.PRGM-NM                     
               ,SECURITY_ADP_NBR     =  :DCLVRSDBLK.SECURITY-ADP-NBR            
               ,EXPIRE_DT            =  :DCLVRSDBLK.EXPIRE-DT                   
               ,ACTION_CD            =  :DCLVRSDBLK.ACTION-CD                   
               ,CICS_SNON_ID         =  :DCLVRSDBLK.CICS-SNON-ID                
              WHERE                                                             
                   (                                                            
                CLIENT_NBR     =  :DCLVRSDBLK.CLIENT-NBR AND                    
                BRANCH_CD      =  :DCLVRSDBLK.BRANCH-CD  AND                    
                ACCT_CD        =  :DCLVRSDBLK.ACCT-CD    AND                    
                BLOCK_CD       =  :DCLVRSDBLK.BLOCK-CD   AND                    
                RCV_NBR        =  :DCLVRSDBLK.RCV-NBR    AND                    
                ISIN_SEC_ISSUE_CD = :DCLVRSDBLK.ISIN-SEC-ISSUE-CD               
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VRSDBLK-COUNT-REPL                                 
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VRSDBLK  UPDATE'                      
                    MOVE 3110 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3200-CREATE-VACTRBHY-RTN.                                                
                                                                                
           MOVE RECORD-DETAIL TO DCLVACTRBHY.                                   
           EXEC SQL                                                             
               INSERT INTO VACTRBHY                                             
                 (                                                              
                    CLIENT_NBR                                                  
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
                   ,PRGM_NM                                                     
                   ,RCV_NBR                                                     
                   ,DLVR_NBR                                                    
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,HSTRY_SEQ_NBR                                               
                   ,SECURITY_ADP_NBR                                            
                   ,EXPIRE_DT                                                   
                   ,ACTION_CD                                                   
                   ,CICS_SNON_ID                                                
                 )                                                              
                  VALUES                                                        
                 (                                                              
                    :DCLVACTRBHY.CLIENT-NBR                                     
                   ,:DCLVACTRBHY.BRANCH-CD                                      
                   ,:DCLVACTRBHY.ACCT-CD                                        
                   ,:DCLVACTRBHY.BLOCK-CD                                       
                   ,:DCLVACTRBHY.CMNT-TXT                                       
                   ,:DCLVACTRBHY.PRGM-NM                                        
                   ,:DCLVACTRBHY.RCV-NBR                                        
                   ,:DCLVACTRBHY.DLVR-NBR                                       
                   ,:DCLVACTRBHY.CICS-TERM-ID-CD                                
                   ,:DCLVACTRBHY.CRT-TMSTP                                      
                   ,:DCLVACTRBHY.UPDT-TMSTP                                     
                   ,:DCLVACTRBHY.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVACTRBHY.HSTRY-SEQ-NBR                                  
                   ,:DCLVACTRBHY.SECURITY-ADP-NBR                               
                   ,:DCLVACTRBHY.EXPIRE-DT                                      
                   ,:DCLVACTRBHY.ACTION-CD                                      
                   ,:DCLVACTRBHY.CICS-SNON-ID                                   
                 )                                                              
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN -803                                                         
                   PERFORM 3210-UPDATE-VACTRBHY-RTN                             
              WHEN +0                                                           
                 ADD 1 TO WS-VACTRBHY-COUNT                                     
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VACTRBHY INSERT'                      
                    MOVE 3200 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
       3210-UPDATE-VACTRBHY-RTN.                                                
           EXEC SQL                                                             
               UPDATE VACTRBHY                                                  
                 SET                                                            
                CMNT_TXT             =  :DCLVACTRBHY.CMNT-TXT                   
               ,DLVR_NBR             =  :DCLVACTRBHY.DLVR-NBR                   
               ,CRT_TMSTP            =  :DCLVACTRBHY.CRT-TMSTP                  
               ,UPDT_TMSTP           =  :DCLVACTRBHY.UPDT-TMSTP                 
               ,CICS_TERM_ID_CD      =  :DCLVACTRBHY.CICS-TERM-ID-CD            
               ,PRGM_NM              =  :DCLVACTRBHY.PRGM-NM                    
               ,SECURITY_ADP_NBR     =  :DCLVACTRBHY.SECURITY-ADP-NBR           
               ,EXPIRE_DT            =  :DCLVACTRBHY.EXPIRE-DT                  
               ,ACTION_CD            =  :DCLVACTRBHY.ACTION-CD                  
               ,CICS_SNON_ID         =  :DCLVACTRBHY.CICS-SNON-ID               
              WHERE                                                             
                   (                                                            
                CLIENT_NBR     =  :DCLVACTRBHY.CLIENT-NBR AND                   
                BRANCH_CD      =  :DCLVACTRBHY.BRANCH-CD AND                    
                ACCT_CD        =  :DCLVACTRBHY.ACCT-CD   AND                    
                BLOCK_CD       =  :DCLVACTRBHY.BLOCK-CD  AND                    
                RCV_NBR        =  :DCLVACTRBHY.RCV-NBR   AND                    
                HSTRY_SEQ_NBR  =  :DCLVACTRBHY.HSTRY-SEQ-NBR AND                
                ISIN_SEC_ISSUE_CD = :DCLVACTRBHY.ISIN-SEC-ISSUE-CD              
                    )                                                           
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 ADD 1 TO WS-VACTRBHY-COUNT-REPL                                
              WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON VACTRBHY UPDATE'                      
                    MOVE 3210 TO ABORT-CODE                                     
                    PERFORM SQL-ERROR-ROUTINE                                   
           END-EVALUATE.                                                        
                                                                                
DJ0001 3300-CREATE-ACTRBSC-RTN.                                                 
DJ0001                                                                          
DJ0001     MOVE RECORD-DETAIL TO DCLACTRBSC.                                    
DJ0001     EXEC SQL                                                             
DJ0001         INSERT INTO ACTRBSC                                              
DJ0001           (                                                              
DJ0001              CLIENT_NBR                                                  
DJ0001             ,BRANCH_CD                                                   
DJ0001             ,ACCT_CD                                                     
DJ0001             ,BLOCK_CD                                                    
DJ0001             ,RCV_NBR                                                     
DJ0001             ,ISIN_SEC_ISSUE_CD                                           
DJ0001             ,HSTRY_SEQ_NBR                                               
DJ0001             ,SECURITY_ADP_NBR                                            
DJ0001             ,CRT_TMSTP                                                   
DJ0001             ,UPDT_TMSTP                                                  
DJ0001             ,CICS_TERM_ID_CD                                             
DJ0001             ,PRGM_NM                                                     
DJ0001             ,TPSCRT_USR_NM                                               
DJ0001             ,TPSCRT_USR_ID                                               
DJ0001             ,CICS_NET_NM                                                 
DJ0001             ,CICS_SNON_ID                                                
DJ0001             ,ACTION_CD                                                   
DJ0001           )                                                              
DJ0001            VALUES                                                        
DJ0001           (                                                              
DJ0001              :DCLACTRBSC.CLIENT-NBR                                      
DJ0001             ,:DCLACTRBSC.BRANCH-CD                                       
DJ0001             ,:DCLACTRBSC.ACCT-CD                                         
DJ0001             ,:DCLACTRBSC.BLOCK-CD                                        
DJ0001             ,:DCLACTRBSC.RCV-NBR                                         
DJ0001             ,:DCLACTRBSC.ISIN-SEC-ISSUE-CD                               
DJ0001             ,:DCLACTRBSC.HSTRY-SEQ-NBR                                   
DJ0001             ,:DCLACTRBSC.SECURITY-ADP-NBR                                
DJ0001             ,:DCLACTRBSC.CRT-TMSTP                                       
DJ0001             ,:DCLACTRBSC.UPDT-TMSTP                                      
DJ0001             ,:DCLACTRBSC.CICS-TERM-ID-CD                                 
DJ0001             ,:DCLACTRBSC.PRGM-NM                                         
DJ0001             ,:DCLACTRBSC.TPSCRT-USR-NM                                   
DJ0001             ,:DCLACTRBSC.TPSCRT-USR-ID                                   
DJ0001             ,:DCLACTRBSC.CICS-NET-NM                                     
DJ0001             ,:DCLACTRBSC.CICS-SNON-ID                                    
DJ0001             ,:DCLACTRBSC.ACTION-CD                                       
DJ0001           )                                                              
DJ0001     END-EXEC.                                                            
DJ0001                                                                          
DJ0001     EVALUATE SQLCODE                                                     
DJ0001        WHEN -803                                                         
DJ0001             PERFORM 3310-UPDATE-ACTRBSC-RTN                              
DJ0001        WHEN +0                                                           
DJ0001           ADD 1 TO WS-ACTRBSC-COUNT                                      
DJ0001        WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTRBSC  INSERT'                      
DJ0001              MOVE 3300 TO ABORT-CODE                                     
DJ0001              PERFORM SQL-ERROR-ROUTINE                                   
DJ0001     END-EVALUATE.                                                        
DJ0001                                                                          
DJ0001 3310-UPDATE-ACTRBSC-RTN.                                                 
DJ0001     EXEC SQL                                                             
DJ0001         UPDATE ACTRBSC                                                   
DJ0001           SET                                                            
DJ0001          CRT_TMSTP         =  :DCLACTRBSC.CRT-TMSTP                      
DJ0001         ,UPDT_TMSTP        =  :DCLACTRBSC.UPDT-TMSTP                     
DJ0001         ,CICS_TERM_ID_CD   =  :DCLACTRBSC.CICS-TERM-ID-CD                
DJ0001         ,PRGM_NM           =  :DCLACTRBSC.PRGM-NM                        
DJ0001         ,TPSCRT_USR_NM     =  :DCLACTRBSC.TPSCRT-USR-NM                  
DJ0001         ,TPSCRT_USR_ID     =  :DCLACTRBSC.TPSCRT-USR-ID                  
DJ0001         ,CICS_NET_NM       =  :DCLACTRBSC.CICS-NET-NM                    
DJ0001         ,CICS_SNON_ID      =  :DCLACTRBSC.CICS-SNON-ID                   
DJ0001         ,ACTION_CD         =  :DCLACTRBSC.ACTION-CD                      
DJ0001        WHERE                                                             
DJ0001             (                                                            
DJ0001          CLIENT_NBR        = :DCLACTRBSC.CLIENT-NBR        AND           
DJ0001          BRANCH_CD         = :DCLACTRBSC.BRANCH-CD         AND           
DJ0001          ACCT_CD           = :DCLACTRBSC.ACCT-CD           AND           
DJ0001          BLOCK_CD          = :DCLACTRBSC.BLOCK-CD          AND           
DJ0001          RCV_NBR           = :DCLACTRBSC.RCV-NBR           AND           
DJ0001          ISIN_SEC_ISSUE_CD = :DCLACTRBSC.ISIN-SEC-ISSUE-CD AND           
DJ0001          HSTRY_SEQ_NBR     = :DCLACTRBSC.HSTRY-SEQ-NBR     AND           
DJ0001          SECURITY_ADP_NBR  = :DCLACTRBSC.SECURITY-ADP-NBR                
DJ0001              )                                                           
DJ0001     END-EXEC.                                                            
DJ0001                                                                          
DJ0001     EVALUATE SQLCODE                                                     
DJ0001        WHEN +0                                                           
DJ0001           ADD 1 TO WS-ACTRBSC-COUNT-REPL                                 
DJ0001        WHEN OTHER                                                        
                    DISPLAY 'DB2 ERROR ON ACTRBSC  UPDATE'                      
DJ0001              MOVE 3310 TO ABORT-CODE                                     
DJ0001              PERFORM SQL-ERROR-ROUTINE                                   
DJ0001     END-EVALUATE.                                                        
                                                                                
       8100-SQL-COMMIT.                                                 CAT519  
                                                                        CAT519  
           EXEC SQL COMMIT                                              CAT519  
           END-EXEC                                                     CAT519  
                                                                        CAT519  
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                 MOVE ZERO TO W-COMMIT-CTR                                      
                 ADD +1 TO WS-COMMITS-PERFORMED                                 
              WHEN OTHER                                                        
                    MOVE 8100 TO ABORT-CODE                                     
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
CHRIS1     DISPLAY 'CATUPLD DB2 PROBLEM'.                                       
CHRIS1     DISPLAY 'SQL CODE = ' SQLCODE.                                       
CHRIS1     DISPLAY 'SQLQA = ' SQLCA.                                            
CHRIS1     DISPLAY 'PROGRAM ABORTED'.                                           
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
                                                                                
           PERFORM 9999-ABEND.                                                  
       9999-ABEND.                                                              
           CALL  ABEND  USING ABORT-CODE.                                       
