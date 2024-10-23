000001* PDX    - ACATCPDB C0109165 05/20/98 08:44:15 TBTIKUO            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACATCPDB.                                         00020000
       AUTHOR.        TINA KUO.                                         00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE HANDLES DB2 FUNCTION OF        * 00070000
      *   THE CLIENT PROFILE TABLE.                                   * 00070000
      *---------------------------------------------------------------* 00060000
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACATCPDB WORKING STORAGE BEGINS HERE'.                00480000
                                                                        00490000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACATCPDB ABENDED ====> '.                                         
           05  WS-ABCODE                   PIC X(04) VALUE SPACES.              
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-SEC-DESC                 PIC X(30).                           
           05  SUB                         PIC S9(04) COMP.                     
      /                                                                         
           EXEC SQL                                                             
                INCLUDE SQLCA                                                   
           END-EXEC                                                             
      /                                                                         
      *====> DCLGEN FOR  ACAT CLIENT PROFILE TABLE                              
014700     EXEC SQL                                                     01400000
PC             INCLUDE VCLNTPRO                                         01410000
014900     END-EXEC.                                                    01420000
015000/                                                                 01430000
       01  ACATCPIO-COMM-AREA.                                                  
      ***  COPY ACATCPIO REPLACING ==:ACATCIPO:== BY ==WS==.            01510000
           COPY ACATCPIO.                                               01510000
      *                                                                         
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA                          PIC X(110).             01490000
      /                                                                         
      **********************************************************        01590000
      *****   P R O C E D U R E   D I V I S I O N           *****       01600000
      **********************************************************        01610000
       PROCEDURE DIVISION.                                              01620000
           MOVE DFHCOMMAREA       TO  ACATCPIO-FIELDS.                          
           IF ACATCPIO-READ                                                     
               PERFORM 0100-GET-ACLIENTP                                09130000
           ELSE                                                                 
               SET ACATCPIO-NOT-FOUND TO TRUE.                                  
                                                                                
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
092500 0100-GET-ACLIENTP.                                               09130000
092600      EXEC SQL                                                    09140000
092700           SELECT                                                 09150000
092700                  RCV_STD_TRNFR_QTY                               09150000
                      , RCV_NSTD_TRNFR_QTY                              09160000
                      , RCV_RJCT_BRKR_QTY                               09160000
                      , RCV_RJCT_SYS_QTY                                09160000
                      , DLVR_STD_TRNFR_QTY                              09160000
                      , DLVR_NSTD_TRNR_QTY                              09160000
                      , DLVR_RJCT_BRKR_QTY                              09160000
                      , DLVR_RJCT_SYS_QTY                               09160000
                  INTO                                                          
092700                  :ACATCPIO-RCV-STD-TRNFR-QTY                     09150000
                      , :ACATCPIO-RCV-NSTD-TRNFR-QTY                    09160000
                      , :ACATCPIO-RCV-RJCT-BRKR-QTY                     09160000
                      , :ACATCPIO-RCV-RJCT-SYS-QTY                      09160000
                      , :ACATCPIO-DLVR-STD-TRNFR-QTY                    09160000
                      , :ACATCPIO-DLVR-NSTD-TRNR-QTY                    09160000
                      , :ACATCPIO-DLVR-RJCT-BRKR-QTY                    09160000
                      , :ACATCPIO-DLVR-RJCT-SYS-QTY                     09160000
092900               FROM VCLNTPRO                                      09170000
093000             WHERE (CLIENT_NBR                                    09180000
093100                    = :ACATCPIO-CLIENT-NBR)                       09190000
                    AND  (CICS_TERM_ID_CD                                       
                          = :ACATCPIO-TERM-ID)                                  
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093500          WHEN +0                                                 09230000
                     SET ACATCPIO-FOUND TO TRUE                                 
                     CONTINUE                                                   
      ***            PERFORM 0200-MOVE-FIELDS                                   
093800          WHEN +100                                               09260000
                     SET ACATCPIO-NOT-FOUND TO TRUE                             
093900               MOVE SPACES       TO ACATCPIO-FIELDS               09270000
094000          WHEN OTHER                                              09280000
                     SET ACATCPIO-NOT-FOUND TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
094400 0100-EXIT.                                                       09320000
094500     EXIT.                                                        09330000
      /                                                                         
      *0200-MOVE-FIELDS.                                                        
      *    MOVE WS-RCV-STD-TRNFR-QTY   TO   ACATCPIO-RCV-STD-TRNFR-QTY.         
      *    MOVE WS-RCV-NSTD-TRNFR-QTY  TO   ACATCPIO-RCV-NSTD-TRNFR-QTY.        
      *    MOVE WS-RCV-RJCT-BRKR-QTY   TO   ACATCPIO-RCV-RJCT-BRKR-QTY.         
      *    MOVE WS-RCV-RJCT-SYS-QTY    TO   ACATCPIO-RCV-RJCT-SYS-QTY.          
      *    MOVE WS-DLVR-STD-TRNFR-QTY  TO   ACATCPIO-DLVR-STD-TRNFR-QTY.        
      *    MOVE WS-DLVR-NSTD-TRNR-QTY  TO   ACATCPIO-DLVR-NSTD-TRNR-QTY.        
      *    MOVE WS-DLVR-RJCT-BRKR-QTY  TO   ACATCPIO-DLVR-RJCT-BRKR-QTY.        
      *    MOVE WS-DLVR-RJCT-SYS-QTY   TO   ACATCPIO-DLVR-RJCT-SYS-QTYY.        
                                                                                
      /                                                                         
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
               MOVE 'ACATCPDB'         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA)                            
                     NOHANDLE                                                   
               END-EXEC                                                         
           END-IF.                                                              
           EXEC CICS RETURN END-EXEC.                                   06220000
094600*---------------------------------------------------------------* 09340000
