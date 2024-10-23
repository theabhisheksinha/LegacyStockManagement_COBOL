000001* PDX    - ACATPPDB C0157168 05/30/01 14:17:56 TBLAMUR            00001000
000001* PDX    - ACATPPDB C0122052 02/19/99 20:41:47 TBLAMUR            00001000
000001* PDX    - ACATPPDB C0109165 06/29/98 10:09:06 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACATPPDB.                                         00020000
       AUTHOR.        LARRY MUREY.                                      00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS       * 00070000
      *   OF THE PARTICIPANT PROFILE TABLE.                           * 00070000
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACATPPDB WORKING STORAGE BEGINS HERE'.                00480000
                                                                        00490000
           SKIP3                                                        00540000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACATPPDB DETECTED ABEND'.                                         
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.              
                                                                                
       01  WS-COMMAREA.                                                         
           COPY ACATPPIO.                                               01510000
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-SEC-DESC                 PIC X(30).                           
           05  SUB                         PIC S9(04) COMP.                     
           EJECT                                                                
           EXEC SQL                                                             
           INCLUDE SQLCA                                                        
           END-EXEC                                                             
      *DCLGEN FOR INITIAL ACAT PARTICIPANT PROFILE                              
014700     EXEC SQL                                                     01400000
PC             INCLUDE VPRTCPPF                                         01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
           EJECT                                                                
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA.                                                 01490000
           05  FILLER                PIC X(500).                                
                                                                                
       EJECT                                                                    
      **********************************************************        01590000
      *****   P R O C E D U R E   D I V I S I O N           *****       01600000
      **********************************************************        01610000
       PROCEDURE DIVISION.                                              01620000
           IF EIBCALEN NOT > ZERO                                               
              EXEC CICS RETURN END-EXEC.                                        
                                                                                
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA.                       
                                                                                
           IF ACATPPIO-READ                                                     
               PERFORM 0100-GET-VPRTCPPF                                09130000
           ELSE                                                                 
               SET ACATPPIO-NOT-FOUND TO TRUE.                                  
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : EIBCALEN).                       
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
092500 0100-GET-VPRTCPPF.                                               09130000
092600      EXEC SQL                                                    09140000
092700           SELECT PRTCP_NM                                        09150000
                       ,BRKR_TIF_IND                                    09160000
                       ,PRTCP_TYPE_CD                                   09160000
                       ,FUND_SRV_ELGBL_IND                              09160000
                  INTO :PRTCP-NM                                        09150000
                       ,:BRKR-TIF-IND                                   09160000
                       ,:PRTCP-TYPE-CD                                  09160000
                       ,:FUND-SRV-ELGBL-IND                             09160000
092900               FROM VPRTCPPF                                      09170000
093000             WHERE PRTCP_NBR                                      09180000
093100                    = :ACATPPIO-BRKR                              09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093500          WHEN +0                                                 09230000
                     SET ACATPPIO-FOUND TO TRUE                                 
                     MOVE PRTCP-NM OF DCLVPRTCPPF                       09240000
                               TO ACATPPIO-NAME                         09250000
                     MOVE BRKR-TIF-IND OF DCLVPRTCPPF                           
                               TO ACATPPIO-BRKR-TIF-IND                 09250000
                     MOVE PRTCP-TYPE-CD OF DCLVPRTCPPF                          
                               TO ACATPPIO-PRTCP-TYPE-CD                09250000
                     MOVE FUND-SRV-ELGBL-IND OF DCLVPRTCPPF                     
                               TO ACATPPIO-FUND-SRV-ELGBL-IND           09250000
093800          WHEN +100                                               09260000
093900               MOVE SPACES       TO ACATPPIO-NAME                 09270000
                     SET ACATPPIO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     SET ACATPPIO-DB-ERROR TO TRUE                              
                     MOVE SQLCAID TO ACATPPIO-SQLCAID                           
                     MOVE SQLCODE TO ACATPPIO-SQLCODE                           
                     MOVE SQLERRM TO ACATPPIO-SQLERRM                           
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
094400 0100-EXIT.                                                       09320000
094500     EXIT.                                                        09330000
                                                                                
       ABENDED.                                                                 
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                         
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                               
     ***   MOVE '9999' TO BHST-RETURN-CODE.                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : EIBCALEN).                       
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
               MOVE 'ACATPPDB'         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE                   
               END-EXEC                                                         
           END-IF.                                                              
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : EIBCALEN).                       
           EXEC CICS RETURN END-EXEC.                                   06220000
094600*---------------------------------------------------------------* 09340000
