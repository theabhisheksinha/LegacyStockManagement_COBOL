000001* PDX    - ACAT24AA C0318727 01/11/12 13:40:55 TBLAMUR            00001000
000001* PDX    - ACAT24AA C0270299 09/15/08 16:32:23 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT24AA C0250441 06/25/07 14:46:13 TBLAMUR            00001000
000001* LRM001 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT24AA C0179784 09/26/02 14:40:06 TBEDTAK            00001000
000001* PDX    - ACAT24AA C0160324 06/25/01 08:37:37 TBLAMUR            00001000
000001* PDX    - ACAT24AA C0123136 03/23/99 12:06:38 TBEDTAK            00001000
000001* PDX    - ACAT24AA C0121426 02/07/99 16:40:16 TBEDTAK            00001000
000001* PDX    - ACAT24AA C0120330 01/26/99 11:52:29 TBCHLUO            00001000
000001* PDX    - ACAT24AA C0117817 12/10/98 09:21:14 TBEDTAK            00001000
000001* PDX    - ACAT24AA C0114558 10/23/98 16:55:55 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT24AA.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *           ACAT INQUIRY / ACCOUNTS WITH ACTIVITY               *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *   - VTRNFR (ACTIVE TRANSFER)                                  *         
      *  PURPOSE:                                                     *         
      *   - THE PROGRAM DISPLAYS A LIST OF ALL ACCOUNTS WITH ACTIVITY *         
      *     IN A FULL DELIVER STATUS WHERE OPEN STATUS IS PRESENT.    *         
      *     (STTS_CD = '200' THRU '400', AND ACCT_ACTIVITY_IND = 'Y') *         
      *   - THE USER CAN VIEW THE ACCOUNT DATA BY TYPING 'S' AT       *         
      *     ACTION FIELD AND PRESSING PF1 KEY WHICH WILL PROMPT THE   *         
      *     PROGRAM TO LINK CONTROL TO THE MARGIN TRANSACTION.        *         
      *     THE PROGRAM MUST TAKE CONTROL BACK FROM MARGIN'S PROGRAM  *         
      *     WHEN THE USER PRESSES PF11 KEY TO RETURN FROM MARGIN.     *         
      *   - PF7 & PF8 KEYS ARE USED TO PAGING FOWRWARD AND BACKWARD.  *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
       77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD'.    00140002
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TWA-TSQ.                                                         
               09  TSQ-NAME.                                                    
                   11 TERM-ID             PIC X(04).                            
                   11 TRAN-ID             PIC X(04).                            
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.             
      *                                                                         
       01  WS-DATE-AREA.                                                        
           05  WSABSTIME           PIC S9(08) COMP.                             
           05  WSMMDDYY.                                                        
               09 WS-CUR-MM        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-DD        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-YY        PIC XX.                                      
           05  WSDATESEP           PIC X(01) VALUE '/'.                         
           05  WSTIME.                                                          
               09  WS-TIME-HH      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-MM      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-SS      PIC XX.                                      
           05  WSTIMESEP           PIC X(01) VALUE ':'.                         
           05  WS-DB2-FORM-DATE.                                                
               09  WS-DATE-CC      PIC X(02).                                   
               09  WS-DATE-YY      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-MM      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-DD      PIC X(02).                                   
           05  WS-EDITED-DATE.                                                  
               09  WS-EDITED-MM    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-DD    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-YY    PIC X(02).                                   
      *                                                                         
       01  B1-RECORD.                                                           
           05  B1-REC-ID.                                                       
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.                      
               09  B1-CARD-NO            PIC 9(07) COMP-3.                      
               09  B1-CLIENT             PIC 9(03) COMP-3.                      
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.              
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.                   
           05  B1-COUNTRY                PIC X(03).                             
           05  FILLER                    PIC X(07).                             
      *--------------------------------------------------------------*  00300002
      *      EDITMOD WORK AREA                                          00310002
      *--------------------------------------------------------------*  00300002
       01  EDIT-AMT-AREA.                                                       
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.          
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.          
           05  WK-AMT-IN                  PIC X(19) VALUE LOW-VALUE.            
           05  WK-AMT-OUT                 PIC S9(15)V99.                        
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.           
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
       01  WK-FORMATTED-AMT.                                                    
           05  WK-AMT-COMMAS-3      PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-2      PIC ZZZZZZZ,ZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-1      PIC ZZZZZZZZZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-0      PIC ZZZZZZZZZZZZZZZ.99-.                    
                                                                                
       01  EDIT-QTY-AREA.                                                       
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.          
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.          
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.            
           05  WK-QTY-OUT.                                                      
               07  WK-QTY-OUT-WHOLE       PIC 9(17).                            
               07  WK-QTY-OUT-FRACTION    PIC SV9(04).                          
           05  WK-QTY-OUT-D1X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X.                                
               07  WK-QTY-OUT-D1          PIC S9(16)V9.                         
               07  FILLER                 PIC X(03).                            
           05  WK-QTY-OUT-D2X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(02).                            
               07  WK-QTY-OUT-D2          PIC S9(15)V99.                        
               07  FILLER                 PIC X(02).                            
           05  WK-QTY-OUT-D3X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(03).                            
               07  WK-QTY-OUT-D3          PIC S9(14)V999.                       
               07  FILLER                 PIC X.                                
           05  WK-QTY-OUT-D4X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(04).                            
               07  WK-QTY-OUT-D4          PIC S9(13)V9999.                      
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.           
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
       01  WS-MQTY-AREA.                                                        
           05  WS-MQTY-ED-D4           PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.              
           05  WS-MQTY-ED-D3 REDEFINES WS-MQTY-ED-D4                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ.999-.              
           05  WS-MQTY-ED-D2 REDEFINES WS-MQTY-ED-D3                            
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.              
           05  WS-MQTY-ED-D1 REDEFINES WS-MQTY-ED-D2                            
                                       PIC ZZZZZZZ,ZZZ,ZZZ,ZZZ.9-.              
           05  WS-MQTY-ED-D0 REDEFINES WS-MQTY-ED-D1                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ,ZZZ-.              
       01  WS-QTY                      USAGE COMP-2.                            
       EJECT                                                            00230002
      *                                                                         
       01  WS-SWITCH-AREA.                                                      
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.                
               88  WK-ERROR                         VALUE 'Y'.                  
           05  WK-MSG-ON-SW               PIC X(01) VALUE SPACE.                
               88  WK-MSG-ON                        VALUE 'Y'.                  
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-DATA                  VALUE 'Y'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-VALID-QTY-SW            PIC X(01).                            
               88  WS-VALID-QTY                     VALUE 'Y'.                  
           05  LENGTH-DETERMINED-SW       PIC X(01).                            
               88  LENGTH-DETERMINED                VALUE 'Y'.                  
       01  ACAT-WORK-AREA.                                                      
           05  WS-PASS-DLVR-ACCT.                                               
               07  WS-PASS-DLVR-BR        PIC X(03).                            
               07  WS-PASS-DLVR-AC        PIC X(05).                            
               07  WS-MASK                PIC X(12).                            
           05  CURRENCY-NUM               PIC 9(03).                            
           05  CURRENCY-X REDEFINES CURRENCY-NUM                                
                                          PIC X(03).                            
           05  WORK-AUTH-BRANCH           PIC X(03).                            
           05  WORK-AUTH-AE               PIC X(03).                            
           05  CALLED-PROGRAM-NAME        PIC X(08).                            
           05  WORK-QTY-X                 PIC X(20).                            
           05  FILLER REDEFINES WORK-QTY-X.                                     
               09 WORK-QTY                PIC 9(12)V9(05).                      
               09 FILLER                  PIC X(03).                            
           05  WORK-DATE-X.                                                     
               09 WORK-DATE-X-MM          PIC X(02).                            
               09 FILLER                  PIC X(01).                            
               09 WORK-DATE-X-YY          PIC X(02).                            
           05  WORK-DATE.                                                       
               09 WORK-DATE-MM            PIC X(02).                            
               09 WORK-DATE-YY            PIC X(02).                            
           05  TWA-CLIENT-NO-X.                                                 
               09 TWA-CLIENT-NO-9         PIC 9(03).                            
           05  WK-CLT.                                                          
               09 FILLER                  PIC X(01) VALUE '0'.                  
               09 WK-CLT-NBR              PIC X(03).                            
           05  WK-BRW-KEY.                                                      
               09 WK-BRW-CLIENT           PIC X(03).                            
               09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.               
               09 WK-BRW-CUR-BR-AC.                                             
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
           05  WS-STATUS.                                                       
               07  WS-STATUS-STAT         PIC X(03).                            
               07  FILLER                 PIC X(01) VALUE '-'.                  
               07  WS-STATUS-DAYS         PIC X(02).                            
               07  WS-STATUS-DAYS-N  REDEFINES WS-STATUS-DAYS                   
                                          PIC 9(02).                            
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.           
           05  WS-TFR-KEY.                                                      
               07  WS-BRCH-KEY            PIC X(03).                            
               07  WS-ACCT-KEY            PIC X(05).                            
               07  WS-ACAT-KEY            PIC X(14).                            
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.                  
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                            
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                            
           05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.                 
               88  ALARM-NEEDED           VALUE  'Y'.                           
           05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.                 
               88  END-OF-DATA            VALUE  'Y'.                           
           05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.                 
               88  INPUT-ERROR            VALUE  'Y'.                           
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.                 
               88  FIRST-TIME             VALUE  'Y'.                           
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.                 
               88  ERROR-THIS-LINE        VALUE  'Y'.                           
           05  WK-TS-READ-FLAG            PIC X(01).                    15960000
               88 WK-TS-READ-OK           VALUE 'Y'.                    15960000
               88 WK-TS-READ-ERROR        VALUE 'N'.                    15960000
           05  WS-SCROLL-KEY-FOUND-SW     PIC X(01).                            
               88  WS-SCROLL-KEY-FOUND              VALUE 'Y'.                  
           05  WS-KEY-FOUND-SW            PIC X(01).                            
               88  WS-KEY-FOUND                     VALUE 'Y'.                  
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.           
           05  FILLER REDEFINES ERASE-KEY-VALUE.                                
               09  FILLER                 PIC X(01).                            
               09  ERASE-KEY              PIC X(01).                            
           05  REFORMAT-TIME              PIC 9(07).                            
           05  FILLER REDEFINES REFORMAT-TIME.                                  
               09  FILLER                 PIC X(01).                            
               09  REFORMAT-HH            PIC X(02).                            
               09  REFORMAT-MM            PIC X(02).                            
               09  FILLER                 PIC X(02).                            
           05  WORK-TIME.                                                       
               09  WORK-HH                PIC X(02).                            
               09  FILLER                 PIC X(01) VALUE ':'.                  
               09  WORK-MM                PIC X(02).                            
           05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.                 
               88  INPUT-OPT-SPACE        VALUE  'Y'.                           
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.                 
               88  DATA-ONLY              VALUE  'Y'.                           
           05  WK-CURSOR                  PIC S9(04) COMP.                      
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.               
           05  WK-DB2-ERROR-MSG.                                                
               09  WK-DB2-ERROR           PIC X(60).                            
               09  FILLER                 PIC X(13) VALUE                       
                   ' => SQLCODE: '.                                             
               09  WK-ERR-SQLCODE         PIC -999.                             
           05  ABEND-LINE.                                                      
               09  ABEND-MSG              PIC X(30).                            
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='.         
               09  ABEND-EIBRESP          PIC 99.                               
           05  UNAUTH-SEL-MESSAGE         PIC X(79)                             
               VALUE 'USER NOT AUTHORIZED TO USE NEXT SELECTION.'.      AEISAC07
           05  UNAUTH-MESSAGE             PIC X(79)                             
               VALUE 'UNAUTHORIZED USER.'.                                      
           05  SEC-MESSAGE                PIC X(79)                             
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.              
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
           05  DB2IO-ERR-MSG              PIC X(54).                            
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-DIVIDED                 PIC 9(09).                            
           05  WS-REMAIN                  PIC 9(02).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-ACTION-CNT              PIC S9(03) COMP-3.                    
           05  SUB                        PIC S9(09) COMP-3.                    
           05  SUB2                       PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
           EJECT                                                                
       01  ACATMSD-CALL-AREA.                                                   
           COPY ACATMSDI.                                                       
           EJECT                                                                
       01  ACAT24IO-COMMAREA.                                                   
           COPY ACAT24IO.                                                       
           EJECT                                                                
       01  WS-POP-UP-WORKAREA.                                                  
           COPY ACAT90TS.                                                       
           EJECT                                                        01660002
       01  ACATNAIO-CALL-AREA.                                                  
           COPY ACATNAIO.                                                       
           EJECT                                                                
       COPY ACATCOM.                                                            
           EJECT                                                                
       COPY ACATSRCH.                                                           
           EJECT                                                                
       COPY SECLINKC.                                                           
           EJECT                                                                
       COPY ATTR.                                                               
           EJECT                                                                
       COPY DFHAID.                                                             
           EJECT                                                                
       COPY ACAT00M.                                                            
       COPY ACAT24M.                                                            
       01  ACAT24MR REDEFINES ACAT24MI.                                         
           02  FILLER                          PIC X(12).                       
           02  OPEN-ORDER-TFR  OCCURS 4 TIMES.                                  
               03  ACTION-L                    PIC S9(4) COMP.                  
               03  ACTION-A                    PIC X(01).                       
               03  ACTION-O                    PIC X(01).                       
               03  BRANCH-L                    PIC S9(4) COMP.                  
               03  BRANCH-A                    PIC X(01).                       
               03  BRANCH-O                    PIC X(03).                       
               03  ACCT-L                      PIC S9(4) COMP.                  
               03  ACCT-A                      PIC X(01).                       
               03  ACCT-O                      PIC X(05).                       
               03  RR-L                        PIC S9(4) COMP.                  
               03  RR-A                        PIC X(01).                       
               03  RR-O                        PIC X(03).                       
               03  NAME1-L                     PIC S9(4) COMP.                  
               03  NAME1-A                     PIC X(01).                       
               03  NAME1-O                     PIC X(30).                       
               03  CBKR-L                      PIC S9(4) COMP.                  
               03  CBKR-A                      PIC X(01).                       
               03  CBKR-O                      PIC X(04).                       
               03  STAT-L                      PIC S9(4) COMP.                  
               03  STAT-A                      PIC X(01).                       
               03  STAT-O                      PIC X(06).                       
               03  NAME2-L                     PIC S9(4) COMP.                  
               03  NAME2-A                     PIC X(01).                       
               03  NAME2-O                     PIC X(30).                       
               03  ACAT-L                      PIC S9(4) COMP.                  
               03  ACAT-A                      PIC X(01).                       
               03  ACAT-O                      PIC X(14).                       
           02  FILLER                          PIC X(04).                       
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                          PIC X(2000).                     
                                                                                
       COPY TWACOMMN.                                                           
           03 TWA-ACAT-AREA.                                                    
              05 TWA-MAP-AREA.                                                  
                 07 TWA-MAP-ACCT-AREA    OCCURS 4 TIMES.                        
                    09 TWA-MAP-ACTION        PIC X(01).                         
                    09 TWA-MAP-BR            PIC X(03).                         
                    09 TWA-MAP-AC            PIC X(05).                         
                    09 TWA-MAP-RR            PIC X(03).                         
                    09 TWA-MAP-NAME1         PIC X(30).                         
                    09 TWA-MAP-CBKR          PIC X(04).                         
                    09 TWA-MAP-STAT          PIC X(06).                         
                    09 TWA-MAP-NAME2         PIC X(30).                         
                    09 TWA-MAP-ACAT          PIC X(14).                         
                 07 TWA-MAP-NEXT             PIC X(01).                         
              05 TWA-MAP-SAVE-AREA.                                             
                 07 TWA-TFR-SCR-LINE         PIC 9(03).                         
              05 TWA-MAP-KEY-AREA.                                              
                 07 TWA-MAP-KEY-FIRST.                                          
                    09  TWA-KEY-ACCT-FIRST.                                     
                        11  TWA-KEY-BR-FIRST PIC X(03).                         
                        11  TWA-KEY-AC-FIRST PIC X(05).                         
                    09  TWA-KEY-ACAT-FIRST   PIC X(14).                         
                 07 TWA-MAP-KEY-LAST.                                           
                    09  TWA-KEY-ACCT-LAST.                                      
                        11  TWA-KEY-BR-LAST  PIC X(03).                         
                        11  TWA-KEY-AC-LAST  PIC X(05).                         
                    09  TWA-KEY-ACAT-LAST    PIC X(14).                         
              05 TWA-MAP-SEARCH.                                                
                 07 TWA-MAP-MMBR             PIC X(3).                          
                 07 TWA-MAP-MMAC             PIC X(5).                          
                 07 TWA-MAP-MMRR             PIC X(3).                          
                 07 TWA-MAP-MMTFR            PIC X(3).                          
                 07 TWA-MAP-MMRD             PIC X(1).                          
                 07 TWA-MAP-MMBKR            PIC X(4).                          
                 07 TWA-MAP-MMSTAT           PIC X(3).                          
                 07 TWA-MAP-MMSD             PIC X(6).                          
              05 TWA-PREV-SEARCH.                                               
                 07 TWA-PREV-MMBR            PIC X(3).                          
                 07 TWA-PREV-MMAC            PIC X(5).                          
                 07 TWA-PREV-MMRR            PIC X(3).                          
                 07 TWA-PREV-MMTFR           PIC X(3).                          
                 07 TWA-PREV-MMRD            PIC X(1).                          
                 07 TWA-PREV-MMBKR           PIC X(4).                          
                 07 TWA-PREV-MMSTAT          PIC X(3).                          
                 07 TWA-PREV-MMSD            PIC X(6).                          
           EJECT                                                                
                                                                                
       PROCEDURE DIVISION.                                                      
       INITIALIZATION.                                                          
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
      *    EXEC CICS HANDLE CONDITION NOTOPEN (NOT-OPEN)                        
      *                              DISABLED (NOT-OPEN)                        
      *                              DSIDERR  (NOT-OPEN)                        
      *    END-EXEC.                                                            
                                                                                
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                                  
           END-EXEC.                                                            
           IF TWA-SIZE = 0                                                      
              MOVE LOW-VALUE TO ACAT24MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT24IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE '24AA'   TO TRAN-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT24MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT24-PASS-CLT.                           
                                                                                
      *    IF  ACAT-CALLING-PROG-NAME = 'ACAT24AA'                              
      *        PERFORM RETURN-FROM-DETAIL-RTN                                   
      *    END-IF.                                                              
                                                                                
      *    IF  EIBAID = DFHPF10                                                 
      *    AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
      *        MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
      *        PERFORM BROWSING-RTN                                             
      *    ELSE                                                                 
      *    MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           IF  ACAT-PROGRAM-NAME = 'ACAT24AA'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
           ELSE                                                                 
           IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
               MOVE 'ACAT24AA' TO ACAT-PROGRAM-NAME                             
               MOVE SPACES TO ACAT-BR-AC                                        
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 7000-READ-TSQ-RTN                                        
               PERFORM 7010-DELETE-TSQ-RTN                                      
               PERFORM 0110-RETURNED-FROM-MRGN                                  
           ELSE                                                                 
               MOVE 'ACAT24AA' TO ACAT-PROGRAM-NAME                             
               PERFORM 0200-FIRST-TIME-RTN.                                     
           EJECT                                                                
                                                                                
       0100-GET-DATE-AND-TIME.                                                  
           EXEC  CICS ASKTIME                                                   
                 ABSTIME(WSABSTIME)                                             
           END-EXEC.                                                            
           EXEC  CICS FORMATTIME                                                
                 ABSTIME(WSABSTIME)                                             
                 MMDDYY(WSMMDDYY)                                               
                 DATESEP(WSDATESEP)                                             
                 TIME(WSTIME)                                                   
                 TIMESEP(WSTIMESEP)                                             
           END-EXEC.                                                            
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *           RETURNED FROM MARGIN PROGRAM THRU RATT01           *          
      *--------------------------------------------------------------*          
       0110-RETURNED-FROM-MRGN.                                                 
           SET FIRST-TIME TO TRUE.                                              
           PERFORM 0610-SETUP-SCREEN                                            
             VARYING SUB FROM 1 BY 1 UNTIL SUB > 4.                             
           PERFORM 0620-SETUP-SRCH-FLD.                                         
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           FIRST TIME ROUTINE                                 *          
      *--------------------------------------------------------------*          
       0200-FIRST-TIME-RTN.                                                     
           SET FIRST-TIME TO TRUE.                                              
           MOVE 'V' TO ACAT-NEXT.                                               
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           INITIALIZE TWA-ACAT-AREA.                                            
                                                                                
           PERFORM 0210-MOVE-SRCH-TO-TWA.                               10350002
           MOVE  'V'   TO  ACAT-INP-SEL.                                        
           PERFORM 1640-VALIDATE-SRCH-ENGINE.                                   
           IF NOT WK-ERROR                                                      
              MOVE ZERO  TO TWA-TFR-SCR-LINE                                    
              MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
              PERFORM 0400-REFRESH-WITH-NEW-TFR.                                
           MOVE -1 TO MNEXTL.                                                   
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
      *                                                                         
      *--------------------------------------------------------------*          
      *           PASS SEARCH CRITERIA TO TWA COMM AREA              *          
      *--------------------------------------------------------------*          
       0210-MOVE-SRCH-TO-TWA.                                           10350002
           IF ACAT-INP-BRANCH  > SPACE AND                                      
              ACAT-INP-ACCOUNT > SPACE                                          
               MOVE SPACE TO ACAT-INP-RR      ACAT-INP-TFR-TYP                  
                             ACAT-INP-RCV-DEL ACAT-INP-CONTRA-BKR               
                             ACAT-INP-STATUS  ACAT-INP-STTL-DT.                 
           MOVE ACAT-INP-BRANCH     TO MMBRO   TWA-MAP-MMBR.                    
           MOVE ACAT-INP-ACCOUNT    TO MMACO   TWA-MAP-MMAC.                    
           MOVE ACAT-INP-RR         TO MMRRO   TWA-MAP-MMRR.                    
           MOVE ACAT-INP-TFR-TYP    TO MMTFRO  TWA-MAP-MMTFR.                   
           MOVE ACAT-INP-RCV-DEL    TO MMRDO   TWA-MAP-MMRD.                    
           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO  TWA-MAP-MMBKR.                   
           MOVE ACAT-INP-STATUS     TO MMSTATO TWA-MAP-MMSTAT.                  
           MOVE ACAT-INP-STTL-DT    TO MMSDO   TWA-MAP-MMSD.                    
           MOVE TWA-MAP-SEARCH      TO TWA-PREV-SEARCH.                         
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           DISPLAY HISTORY TRANSFERS                          *          
      *--------------------------------------------------------------*          
       0400-REFRESH-WITH-NEW-TFR.                                               
           PERFORM VARYING SUB FROM 1 BY 1  UNTIL SUB > 4                       
              MOVE ATT-ASKIP TO ACTION-A (SUB)                                  
           END-PERFORM.                                                         
                                                                                
           INITIALIZE TWA-MAP-AREA.                                             
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM 0500-OPEN-TFR-CURSOR-TBL.                                    
           PERFORM VARYING SUB FROM 1 BY 1                                      
                       UNTIL WS-NO-MORE-DATA  OR  SUB > 4                       
              PERFORM 0510-FETCH-TFR-CURSOR-TBL                                 
              IF WS-NO-MORE-DATA                                                
                 IF SUB = 1                                                     
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'NO ACCOUNTS SELECTED FOR THIS REQUEST'                
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
                 IF SRCH-SIGNON-SECR-CHECK-PASS                                 
                    PERFORM 0600-SETUP-SCREEN                                   
                 ELSE                                                           
                    SUBTRACT 1      FROM SUB                                    
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-TFR-CURSOR-TBL.                                   
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       0500-OPEN-TFR-CURSOR-TBL.                                                
           IF TWA-MAP-MMBR > SPACE                                              
              IF TWA-MAP-MMAC > SPACE                                           
                  MOVE TWA-MAP-MMBR  TO WS-PASS-DLVR-BR                         
                  MOVE TWA-MAP-MMAC  TO WS-PASS-DLVR-AC                         
                  MOVE SPACES        TO WS-MASK                                 
                  MOVE WS-PASS-DLVR-ACCT TO ACAT24-PASS-DLVR-ACCT               
              ELSE                                                              
                  MOVE TWA-MAP-MMBR  TO WS-PASS-DLVR-BR                         
                  MOVE SPACES        TO WS-PASS-DLVR-AC                         
                  MOVE SPACES        TO WS-MASK                                 
                  MOVE WS-PASS-DLVR-ACCT TO ACAT24-PASS-DLVR-ACCT               
              END-IF                                                            
           ELSE                                                                 
              MOVE SPACES   TO ACAT24-PASS-DLVR-ACCT.                           
                                                                                
           IF TWA-MAP-MMRR > SPACE                                              
              MOVE TWA-MAP-MMRR   TO ACAT24-PASS-RR                             
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-RR.                            
           IF TWA-MAP-MMTFR > SPACE                                             
              IF TWA-MAP-MMTFR = 'STD'                                          
                 MOVE 'FUL'          TO ACAT24-PASS-TFR                         
              ELSE                                                              
                 MOVE TWA-MAP-MMTFR  TO ACAT24-PASS-TFR                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-TFR.                           
           IF TWA-MAP-MMBKR > SPACE                                             
              MOVE TWA-MAP-MMBKR  TO ACAT24-PASS-CBRKR                          
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-CBRKR.                         
           EVALUATE  TWA-MAP-MMSTAT                                             
              WHEN 'REQ'  MOVE '100' TO ACAT24-PASS-STAT-FR                     
                          MOVE '100' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQA'  MOVE '110' TO ACAT24-PASS-STAT-FR                     
                          MOVE '110' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RAP'  MOVE '120' TO ACAT24-PASS-STAT-FR                     
                          MOVE '120' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQP'  MOVE '130' TO ACAT24-PASS-STAT-FR                     
                          MOVE '130' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQR'  MOVE '140' TO ACAT24-PASS-STAT-FR                     
                          MOVE '140' TO ACAT24-PASS-STAT-TO                     
              WHEN 'REV'  MOVE '200' TO ACAT24-PASS-STAT-FR                     
                          MOVE '200' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVA'  MOVE '210' TO ACAT24-PASS-STAT-FR                     
                          MOVE '210' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVE'  MOVE '220' TO ACAT24-PASS-STAT-FR                     
                          MOVE '220' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVX'  MOVE '230' TO ACAT24-PASS-STAT-FR                     
                          MOVE '230' TO ACAT24-PASS-STAT-TO                     
              WHEN 'STP'  MOVE '300' TO ACAT24-PASS-STAT-FR                     
                          MOVE '300' TO ACAT24-PASS-STAT-TO                     
              WHEN 'STC'  MOVE '310' TO ACAT24-PASS-STAT-FR                     
                          MOVE '310' TO ACAT24-PASS-STAT-TO                     
              WHEN 'CLP'  MOVE '400' TO ACAT24-PASS-STAT-FR                     
                          MOVE '400' TO ACAT24-PASS-STAT-TO                     
              WHEN 'REJ'  MOVE '600' TO ACAT24-PASS-STAT-FR                     
                          MOVE '600' TO ACAT24-PASS-STAT-TO                     
              WHEN OTHER  MOVE '100' TO ACAT24-PASS-STAT-FR                     
                          MOVE '400' TO ACAT24-PASS-STAT-TO                     
           END-EVALUATE.                                                        
                                                                                
           SET ACAT24-OPN-TFRCSR  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 OPEN ERROR ON TRANSFER TABLE TBL - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       0510-FETCH-TFR-CURSOR-TBL.                                               
           SET ACAT24-FET-TFRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT24-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0520-CLOSE-TFR-CURSOR-TBL                                 
LRM001        MOVE 'DB2 FETCH ERROR ON TRANSFER TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
                OR                                                              
               ACAT-SUPER-SIGN-ON-BROWSE                                        
               SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                          
           ELSE                                                                 
               IF NOT WS-NO-MORE-DATA                                           
                  PERFORM 5000-BR-AE-SECURITY.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE TRANSFER CURSOR TABLE                          *          
      *--------------------------------------------------------------*          
       0520-CLOSE-TFR-CURSOR-TBL.                                               
           SET ACAT24-CLO-TFRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-ERROR                                                      
LRM001        MOVE 'DB2 CLOSE ERROR ON TRANSFER TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN TRANSFER CURSOR TBL IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       0550-OPEN-TFR-CUR-DESCEND.                                               
           IF TWA-MAP-MMBR > SPACE                                              
              IF TWA-MAP-MMAC > SPACE                                           
                  MOVE TWA-MAP-MMBR  TO WS-PASS-DLVR-BR                         
                  MOVE TWA-MAP-MMAC  TO WS-PASS-DLVR-AC                         
                  MOVE SPACES        TO WS-MASK                                 
                  MOVE WS-PASS-DLVR-ACCT TO ACAT24-PASS-DLVR-ACCT               
              ELSE                                                              
                  MOVE TWA-MAP-MMBR  TO WS-PASS-DLVR-BR                         
                  MOVE SPACES        TO WS-PASS-DLVR-AC                         
                  MOVE SPACES        TO WS-MASK                                 
                  MOVE WS-PASS-DLVR-ACCT TO ACAT24-PASS-DLVR-ACCT               
              END-IF                                                            
           ELSE                                                                 
              MOVE SPACES   TO ACAT24-PASS-DLVR-ACCT.                           
                                                                                
           IF TWA-MAP-MMRR > SPACE                                              
              MOVE TWA-MAP-MMRR   TO ACAT24-PASS-RR                             
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-RR.                            
           IF TWA-MAP-MMTFR > SPACE                                             
              IF TWA-MAP-MMTFR = 'STD'                                          
                 MOVE 'FUL'          TO ACAT24-PASS-TFR                         
              ELSE                                                              
                 MOVE TWA-MAP-MMTFR  TO ACAT24-PASS-TFR                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-TFR.                           
           IF TWA-MAP-MMBKR > SPACE                                             
              MOVE TWA-MAP-MMBKR  TO ACAT24-PASS-CBRKR                          
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT24-PASS-CBRKR.                         
           EVALUATE  TWA-MAP-MMSTAT                                             
              WHEN 'REQ'  MOVE '100' TO ACAT24-PASS-STAT-FR                     
                          MOVE '100' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQA'  MOVE '110' TO ACAT24-PASS-STAT-FR                     
                          MOVE '110' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RAP'  MOVE '120' TO ACAT24-PASS-STAT-FR                     
                          MOVE '120' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQP'  MOVE '130' TO ACAT24-PASS-STAT-FR                     
                          MOVE '130' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RQR'  MOVE '140' TO ACAT24-PASS-STAT-FR                     
                          MOVE '140' TO ACAT24-PASS-STAT-TO                     
              WHEN 'REV'  MOVE '200' TO ACAT24-PASS-STAT-FR                     
                          MOVE '200' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVA'  MOVE '210' TO ACAT24-PASS-STAT-FR                     
                          MOVE '210' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVE'  MOVE '220' TO ACAT24-PASS-STAT-FR                     
                          MOVE '220' TO ACAT24-PASS-STAT-TO                     
              WHEN 'RVX'  MOVE '230' TO ACAT24-PASS-STAT-FR                     
                          MOVE '230' TO ACAT24-PASS-STAT-TO                     
              WHEN 'STP'  MOVE '300' TO ACAT24-PASS-STAT-FR                     
                          MOVE '300' TO ACAT24-PASS-STAT-TO                     
              WHEN 'STC'  MOVE '310' TO ACAT24-PASS-STAT-FR                     
                          MOVE '310' TO ACAT24-PASS-STAT-TO                     
              WHEN 'CLP'  MOVE '400' TO ACAT24-PASS-STAT-FR                     
                          MOVE '400' TO ACAT24-PASS-STAT-TO                     
              WHEN 'REJ'  MOVE '600' TO ACAT24-PASS-STAT-FR                     
                          MOVE '600' TO ACAT24-PASS-STAT-TO                     
              WHEN OTHER  MOVE '100' TO ACAT24-PASS-STAT-FR                     
                          MOVE '400' TO ACAT24-PASS-STAT-TO                     
           END-EVALUATE.                                                        
                                                                                
           SET ACAT24-OPN-TFRCSR-D  TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-ERROR                                                      
LRM001        MOVE 'DB2 OPEN ERROR ON DESCEND TFR TBL - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH TRANSFER CURSOR TBL IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       0560-FETCH-TFR-CUR-DESCEND.                                              
           SET ACAT24-FET-TFRCSR-D TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT24-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0520-CLOSE-TFR-CURSOR-TBL                                 
LRM001        MOVE 'DB2 FETCH ERROR ON DESCEND TFR TBL - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
                OR                                                              
               ACAT-SUPER-SIGN-ON-BROWSE                                        
               SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                          
           ELSE                                                                 
               IF NOT WS-NO-MORE-DATA                                           
                  PERFORM 5000-BR-AE-SECURITY.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE TRANSFER CURSOR TBL IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       0570-CLOSE-TFR-CUR-DESCEND.                                              
           SET ACAT24-CLO-TFRCSR-D TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT24DB.                                       
           IF ACAT24-ERROR                                                      
LRM001        MOVE 'DB2 CLOSE ERROR ON DESCEND TFR TBL - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE DATA FROM DATABASE TO MAP                        *          
      *--------------------------------------------------------------*          
       0600-SETUP-SCREEN.                                                       
           MOVE  ATT-UNPROT   TO  ACTION-A (SUB).                               
           MOVE  ACAT24-TFR-BRANCH                                              
             TO  BRANCH-O (SUB)  TWA-MAP-BR (SUB).                              
           MOVE  ACAT24-TFR-ACCOUNT                                             
             TO  ACCT-O (SUB)  TWA-MAP-AC (SUB).                                
           MOVE  ACAT24-TFR-RR                                                  
             TO  RR-O (SUB)  TWA-MAP-RR (SUB).                                  
           MOVE  ACAT24-TFR-NM1                                                 
             TO  NAME1-O (SUB)  TWA-MAP-NAME1 (SUB).                            
           MOVE  ACAT24-TFR-RCV-NBR                                             
             TO  CBKR-O (SUB)  TWA-MAP-CBKR (SUB).                              
                                                                                
           EVALUATE  ACAT24-TFR-STTS                                            
              WHEN '100'    MOVE 'REQ' TO WS-STATUS-STAT                        
              WHEN '110'    MOVE 'RQA' TO WS-STATUS-STAT                        
              WHEN '120'    MOVE 'RAP' TO WS-STATUS-STAT                        
              WHEN '130'    MOVE 'RQP' TO WS-STATUS-STAT                        
              WHEN '140'    MOVE 'RQR' TO WS-STATUS-STAT                        
              WHEN '200'    MOVE 'REV' TO WS-STATUS-STAT                        
              WHEN '210'    MOVE 'RVA' TO WS-STATUS-STAT                        
              WHEN '220'    MOVE 'RVE' TO WS-STATUS-STAT                        
              WHEN '230'    MOVE 'RVX' TO WS-STATUS-STAT                        
              WHEN '300'    MOVE 'STP' TO WS-STATUS-STAT                        
              WHEN '310'    MOVE 'STC' TO WS-STATUS-STAT                        
              WHEN '400'    MOVE 'CLP' TO WS-STATUS-STAT                        
              WHEN '600'    MOVE 'REJ' TO WS-STATUS-STAT                        
           END-EVALUATE.                                                        
           MOVE  ACAT24-TFR-DAYS-STTS TO WS-STATUS-DAYS-N.                      
           MOVE  WS-STATUS                                                      
             TO  STAT-O (SUB)  TWA-MAP-STAT (SUB).                              
                                                                                
           MOVE  ACAT24-TFR-NM2                                                 
             TO  NAME2-O (SUB)  TWA-MAP-NAME2 (SUB).                            
           MOVE  ACAT24-TFR-ACAT                                                
             TO  ACAT-O  (SUB)  TWA-MAP-ACAT  (SUB).                            
                                                                                
           MOVE SUB TO TWA-TFR-SCR-LINE.                                        
           IF SUB = 1                                                           
              MOVE ACAT24-TFR-DLVR-ACCT TO TWA-KEY-ACCT-FIRST                   
                                           TWA-KEY-ACCT-LAST                    
              MOVE ACAT24-TFR-ACAT      TO TWA-KEY-ACAT-FIRST                   
                                           TWA-KEY-ACAT-LAST                    
           ELSE                                                                 
              MOVE ACAT24-TFR-DLVR-ACCT TO TWA-KEY-ACCT-LAST                    
              MOVE ACAT24-TFR-ACAT      TO TWA-KEY-ACAT-LAST.                   
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    MOVE DATA FROM COMMAREA UPON RETURNING FROM MARGIN        *          
      *--------------------------------------------------------------*          
       0610-SETUP-SCREEN.                                                       
           IF TWA-MAP-ACCT-AREA (SUB) > SPACE                                   
              MOVE ATT-UNPROT TO ACTION-A (SUB)                                 
              MOVE TWA-MAP-ACTION (SUB) TO ACTION-O (SUB)                       
              IF TWA-MAP-ACTION (SUB) = 'S'                                     
                 MOVE -1 TO ACTION-L (SUB)                                      
                 MOVE SPACE TO ACTION-O (SUB) TWA-MAP-ACTION (SUB)              
              END-IF                                                            
              MOVE TWA-MAP-BR    (SUB)  TO BRANCH-O (SUB)                       
              MOVE TWA-MAP-AC    (SUB)  TO ACCT-O   (SUB)                       
              MOVE TWA-MAP-RR    (SUB)  TO RR-O     (SUB)                       
              MOVE TWA-MAP-NAME1 (SUB)  TO NAME1-O  (SUB)                       
              MOVE TWA-MAP-CBKR  (SUB)  TO CBKR-O   (SUB)                       
              MOVE TWA-MAP-STAT  (SUB)  TO STAT-O   (SUB)                       
              MOVE TWA-MAP-NAME2 (SUB)  TO NAME2-O  (SUB)                       
              MOVE TWA-MAP-ACAT  (SUB)  TO ACAT-O   (SUB)                       
           ELSE                                                                 
              MOVE ATT-ASKIP TO ACTION-A (SUB)                                  
              MOVE SPACE     TO BRANCH-O (SUB)                                  
                                ACCT-O   (SUB)                                  
                                RR-O     (SUB)                                  
                                NAME1-O  (SUB)                                  
                                CBKR-O   (SUB)                                  
                                STAT-O   (SUB)                                  
                                NAME2-O  (SUB)                                  
                                ACAT-O   (SUB).                                 
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *    MOVE SRCH DATA FROM COMMAREA UPON RETURNING FROM MARGIN   *          
      *--------------------------------------------------------------*          
       0620-SETUP-SRCH-FLD.                                                     
           MOVE TWA-MAP-MMBR   TO MMBRO.                                        
           MOVE TWA-MAP-MMAC   TO MMACO.                                        
           MOVE TWA-MAP-MMRR   TO MMRRO.                                        
           MOVE TWA-MAP-MMTFR  TO MMTFRO.                                       
           MOVE TWA-MAP-MMRD   TO MMRDO.                                        
           MOVE TWA-MAP-MMBKR  TO MMBKRO.                                       
           MOVE TWA-MAP-MMSTAT TO MMSTATO.                                      
           MOVE TWA-MAP-MMSD   TO MMSDO.                                        
       EJECT                                                                    
       0800-SEND-DB2-ERROR-MSG.                                                 
           MOVE -1 TO MNEXTL.                                                   
           SET WK-ERROR TO TRUE.                                                
           MOVE  ACAT24-SQLCODE   TO WK-ERR-SQLCODE.                            
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                                
           PERFORM 9000-ERROR-RTN.                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *              SECOND TIME AND AFTER                           *          
      *--------------------------------------------------------------*          
       0900-CONTINUE-PROCESS.                                                   
           PERFORM 8500-RECEIVE-MAP.                                            
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET DATA-ONLY TO TRUE.                                               
           EVALUATE TRUE                                                        
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                               
                     PERFORM 8700-RETURN-CONTROL-RTN                            
                WHEN EIBAID = DFHPF10 OR DFHPF12                                
                     PERFORM 8800-RETURN-TO-CICS                                
                WHEN EIBAID = DFHENTER                                          
                     PERFORM 1000-ENTER-KEY                                     
                WHEN EIBAID = DFHPF3                                            
                     PERFORM 3000-JUMP-TO-MARGIN                                
                WHEN EIBAID = DFHPF7                                            
                     PERFORM 6000-PREV-PAGE-RTN                                 
                WHEN EIBAID = DFHPF8                                            
                     PERFORM 6100-NEXT-PAGE-RTN                                 
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT24MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *              ENTER KEY                                       *          
      *--------------------------------------------------------------*          
       1000-ENTER-KEY.                                                          
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW.                                         
                                                                                
           MOVE 0      TO WS-ACTION-CNT.                                        
           PERFORM 1100-VALIDATE-ACTION-FLDS VARYING SUB FROM 1 BY 1            
               UNTIL  SUB > 4  OR  SUB > TWA-TFR-SCR-LINE.                      
           IF NOT WK-ERROR                                                      
              IF WS-ACTION-CNT = 1                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'PRESS PF3 KEY TO VIEW THE ACCOUNT DATA'                  
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 PERFORM  1200-ACTION-COUNT-ERROR.                              
                                                                                
           PERFORM 1600-NEXT-SELECTION-RTN.                                     
                                                                                
           IF NOT WK-ERROR                                                      
              MOVE -1    TO MNEXTL                                              
              MOVE SPACE TO TRLMSGO.                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE ACTION FIELDS                              *        
      *----------------------------------------------------------------*        
       1100-VALIDATE-ACTION-FLDS.                                               
           IF ACTION-L (SUB) > 0                                                
              IF ACTION-O (SUB) = TWA-MAP-ACTION (SUB)                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ACTION-O (SUB) TO TWA-MAP-ACTION (SUB)                    
              END-IF                                                            
           ELSE                                                                 
           IF ACTION-A (SUB) = ERASE-KEY                                        
              MOVE SPACE TO TWA-MAP-ACTION (SUB).                               
           IF TWA-MAP-ACTION (SUB) = LOW-VALUE                                  
              MOVE SPACE TO TWA-MAP-ACTION (SUB).                               
           MOVE ATT-UNPROT TO ACTION-A (SUB).                                   
                                                                                
           IF TWA-MAP-ACTION (SUB) = SPACE                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-MAP-ACTION (SUB) = 'S'                                        
              ADD +1 TO WS-ACTION-CNT                                           
              MOVE TWA-MAP-BR (SUB) TO ACAT-BR                                  
              MOVE TWA-MAP-AC (SUB) TO ACAT-AC                                  
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO ACTION-A (SUB)                             
              MOVE -1 TO ACTION-L (SUB)                                         
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER "S" TO VIEW DETAILS' TO SYSTEM-MSG                 
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *          ONE SELECTION FOR THE ACTION FIELDS                   *        
      *----------------------------------------------------------------*        
       1200-ACTION-COUNT-ERROR.                                                 
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 4                        
              IF TWA-MAP-ACTION (SUB) = 'S'                                     
                 MOVE ATT-UNPROT-BRT TO ACTION-A (SUB)                          
                 MOVE -1 TO ACTION-L (SUB)                                      
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'MULTIPLE SELECTIONS ARE NOT PERMITTED'                   
                 TO    SYSTEM-MSG                                               
              END-IF                                                            
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  - JUMP TO NEXT SELECTION                                      *        
      *  - IF BOTH SEARCH AND ACCOUNT SEARCH FIELDS ARE ENTERED,       *        
      *    IGNORE OTHER SEARCH FIELDS.                                 *        
      *----------------------------------------------------------------*        
       1600-NEXT-SELECTION-RTN.                                                 
           IF MNEXTL > 0                                                        
              IF MNEXTI = TWA-MAP-NEXT                                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MNEXTI TO TWA-MAP-NEXT                                    
              END-IF                                                            
           ELSE                                                                 
              IF MNEXTA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-NEXT                                    
              END-IF.                                                           
           IF TWA-MAP-NEXT = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-NEXT.                                       
           IF TWA-MAP-NEXT = 'V'                                                
              MOVE SPACE TO MNEXTO                                              
                            TWA-MAP-NEXT.                                       
      *                                                                         
           IF MMBRL > 0                                                         
              IF MMBRI = TWA-MAP-MMBR                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBRI TO TWA-MAP-MMBR                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMBRA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMBR                                    
              END-IF.                                                           
           IF TWA-MAP-MMBR = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMBR.                                       
           MOVE ATT-UNPROT TO MMBRA.                                            
                                                                                
           IF MMACL > 0                                                         
              IF MMACI = TWA-MAP-MMAC                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMACI TO TWA-MAP-MMAC                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMACA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMAC                                    
              END-IF.                                                           
           IF TWA-MAP-MMAC = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMAC.                                       
           MOVE ATT-UNPROT TO MMACA.                                            
                                                                                
           IF TWA-MAP-MMBR > SPACE  AND  TWA-MAP-MMAC > SPACE                   
              MOVE SPACE                                                        
                TO MMRRI          MMTFRI          MMRDI                         
                   MMBKRI         MMSTATI         MMSDI                         
                   TWA-MAP-MMRR   TWA-MAP-MMTFR   TWA-MAP-MMRD                  
                   TWA-MAP-MMBKR  TWA-MAP-MMSTAT  TWA-MAP-MMSD                  
                   TWA-PREV-MMRR  TWA-PREV-MMTFR  TWA-PREV-MMRD                 
                   TWA-PREV-MMBKR TWA-PREV-MMSTAT TWA-PREV-MMSD                 
           ELSE                                                                 
              PERFORM 1604-SAVE-OTHER-SRCHS.                                    
                                                                                
           MOVE TWA-MAP-MMBR   TO ACAT-INP-BRANCH.                              
           MOVE TWA-MAP-MMAC   TO ACAT-INP-ACCOUNT.                             
           MOVE TWA-MAP-MMRR   TO ACAT-INP-RR.                                  
           MOVE TWA-MAP-MMTFR  TO ACAT-INP-TFR-TYP.                             
           MOVE TWA-MAP-MMRD   TO ACAT-INP-RCV-DEL.                             
           MOVE TWA-MAP-MMBKR  TO ACAT-INP-CONTRA-BKR.                          
           MOVE TWA-MAP-MMSTAT TO ACAT-INP-STATUS.                              
           MOVE TWA-MAP-MMSD   TO ACAT-INP-STTL-DT.                             
                                                                                
           IF TWA-MAP-NEXT = SPACE                                              
              PERFORM 1610-NEXT-SEL-SPACE-RTN                                   
           ELSE                                                                 
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                                 
              PERFORM 1620-NEXT-SEL-ENTERED-RTN.                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  IF BOTH BRANCH AND ACCOUNT ARE NOT ENTERED, SAVE OTHER        *        
      *  SEARCH FIELDS TO COMM AREA.                                   *        
      *----------------------------------------------------------------*        
       1604-SAVE-OTHER-SRCHS.                                                   
           IF MMRRL > 0                                                         
              IF MMRRI = TWA-MAP-MMRR                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMRRI TO TWA-MAP-MMRR                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMRRA = ERASE-KEY                                              
              MOVE SPACES TO TWA-MAP-MMRR                                       
           END-IF.                                                              
           IF TWA-MAP-MMRR = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMRR.                                       
           MOVE ATT-UNPROT TO MMRRA.                                            
                                                                                
           IF MMTFRL > 0                                                        
              IF MMTFRI = TWA-MAP-MMTFR                                         
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMTFRI TO TWA-MAP-MMTFR                                   
              END-IF                                                            
           ELSE                                                                 
              IF MMTFRA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-MMTFR                                   
              END-IF.                                                           
           IF TWA-MAP-MMTFR = LOW-VALUE                                         
              MOVE SPACE TO TWA-MAP-MMTFR.                                      
           MOVE ATT-UNPROT TO MMTFRA.                                           
                                                                                
           IF MMRDL > 0                                                         
              IF MMRDI = TWA-MAP-MMRD                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMRDI TO TWA-MAP-MMRD                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMRDA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMRD                                    
              END-IF.                                                           
           IF TWA-MAP-MMRD = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMRD.                                       
           MOVE ATT-UNPROT TO MMRDA.                                            
                                                                                
           IF MMBKRL > 0                                                        
              IF MMBKRI = TWA-MAP-MMBKR                                         
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBKRI TO TWA-MAP-MMBKR                                   
              END-IF                                                            
           ELSE                                                                 
              IF MMBKRA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-MMBKR                                   
              END-IF.                                                           
           IF TWA-MAP-MMBKR = LOW-VALUE                                         
              MOVE SPACE TO TWA-MAP-MMBKR.                                      
           MOVE ATT-UNPROT TO MMBKRA.                                           
                                                                                
           IF MMSTATL > 0                                                       
              IF MMSTATI = TWA-MAP-MMSTAT                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMSTATI TO TWA-MAP-MMSTAT                                 
              END-IF                                                            
           ELSE                                                                 
              IF MMSTATA = ERASE-KEY                                            
                 MOVE SPACES TO TWA-MAP-MMSTAT                                  
              END-IF.                                                           
           IF TWA-MAP-MMSTAT = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-MMSTAT.                                     
           MOVE ATT-UNPROT TO MMSTATA.                                          
                                                                                
           IF MMSDL > 0                                                         
              IF MMSDI = TWA-MAP-MMSD                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMSDI TO TWA-MAP-MMSD                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMSDA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMSD                                    
              END-IF.                                                           
           IF TWA-MAP-MMSD = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMSD.                                       
           MOVE ATT-UNPROT TO MMSDA.                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           NEXT SELECTION FIELD IS SPACE                        *        
      *----------------------------------------------------------------*        
       1610-NEXT-SEL-SPACE-RTN.                                                 
           MOVE  'V'   TO  ACAT-INP-SEL.                                        
           IF TWA-MAP-SEARCH > SPACE                                            
              PERFORM 1640-VALIDATE-SRCH-ENGINE                                 
              IF NOT WK-ERROR                                                   
                 PERFORM 1650-CHECK-IF-SRCH-CHANGED                             
                 IF WS-SEARCH-CHANGED                                           
                    PERFORM 2010-CLEAR-SCR                                      
                    PERFORM 0400-REFRESH-WITH-NEW-TFR                           
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              PERFORM 1650-CHECK-IF-SRCH-CHANGED                                
              IF WS-SEARCH-CHANGED                                              
                 PERFORM 2010-CLEAR-SCR                                         
                 PERFORM 0400-REFRESH-WITH-NEW-TFR                              
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *           NEXT SELECTION WAS ENTERED                           *        
      *----------------------------------------------------------------*        
       1620-NEXT-SEL-ENTERED-RTN.                                               
           MOVE TWA-MAP-NEXT   TO WS-ACAT-NEXT.                                 
       COPY ACATJUMP.                                                           
           IF CALLED-PROGRAM-NAME = SPACES                                      
              MOVE -1             TO MNEXTL                                     
              MOVE ATT-UNPROT-BRT TO MNEXTA                                     
              IF NOT WK-ERROR                                                   
                 SET  WK-ERROR   TO TRUE                                        
                 MOVE 'INVALID "NEXT" SELECTION'                                
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              MOVE 'ACAT24AA'    TO ACAT-CALLING-PROG-NAME                      
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                                   
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE THE SEARCH ENGINE                           *        
      *----------------------------------------------------------------*        
       1640-VALIDATE-SRCH-ENGINE.                                               
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SEARCH-AREA)                                 
                     LENGTH(LENGTH OF ACAT-SEARCH-AREA)                         
           END-EXEC.                                                            
           IF  ACAT-SRCH-MSG > SPACE                                            
               IF NOT WK-ERROR                                                  
                  SET WK-ERROR TO TRUE                                          
                  MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                              
               END-IF                                                           
               IF  ACAT-SRCH-BR = 'N'                                           
                   MOVE -1             TO MMBRL                                 
                   MOVE ATT-UNPROT-BRT TO MMBRA                                 
               END-IF                                                           
               IF  ACAT-SRCH-ACCT = 'N'                                         
                   MOVE -1             TO MMACL                                 
                   MOVE ATT-UNPROT-BRT TO MMACA                                 
               END-IF                                                           
               IF  ACAT-SRCH-RR = 'N'                                           
                   MOVE -1             TO MMRRL                                 
                   MOVE ATT-UNPROT-BRT TO MMRRA                                 
               END-IF                                                           
               IF  ACAT-SRCH-TFR = 'N'                                          
                   MOVE -1             TO MMTFRL                                
                   MOVE ATT-UNPROT-BRT TO MMTFRA                                
               END-IF                                                           
               IF  ACAT-SRCH-RD = 'N'                                           
                   MOVE -1             TO MMRDL                                 
                   MOVE ATT-UNPROT-BRT TO MMRDA                                 
               END-IF                                                           
               IF  ACAT-SRCH-CONTRA-BKR = 'N'                                   
                   MOVE -1             TO MMBKRL                                
                   MOVE ATT-UNPROT-BRT TO MMBKRA                                
               END-IF                                                           
               IF  ACAT-SRCH-STATUS = 'N'                                       
                   MOVE -1             TO MMSTATL                               
                   MOVE ATT-UNPROT-BRT TO MMSTATA                               
               END-IF                                                           
               IF  ACAT-SRCH-STTLDT = 'N'                                       
                   MOVE -1             TO MMSDL                                 
                   MOVE ATT-UNPROT-BRT TO MMSDA                                 
               END-IF                                                           
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             SEARCH ENGINE ENTRY CHANGED?                       *        
      *----------------------------------------------------------------*        
       1650-CHECK-IF-SRCH-CHANGED.                                              
           MOVE SPACE TO WS-SEARCH-CHANGED-SW.                                  
           IF TWA-MAP-MMBR NOT = TWA-PREV-MMBR                                  
              MOVE TWA-MAP-MMBR TO TWA-PREV-MMBR                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMAC NOT = TWA-PREV-MMAC                                  
              MOVE TWA-MAP-MMAC TO TWA-PREV-MMAC                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMRR NOT = TWA-PREV-MMRR                                  
              MOVE TWA-MAP-MMRR TO TWA-PREV-MMRR                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMTFR NOT = TWA-PREV-MMTFR                                
              MOVE TWA-MAP-MMTFR TO TWA-PREV-MMTFR                              
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMRD NOT = TWA-PREV-MMRD                                  
              MOVE TWA-MAP-MMRD TO TWA-PREV-MMRD                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMBKR NOT = TWA-PREV-MMBKR                                
              MOVE TWA-MAP-MMBKR TO TWA-PREV-MMBKR                              
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMSTAT NOT = TWA-PREV-MMSTAT                              
              MOVE TWA-MAP-MMSTAT TO TWA-PREV-MMSTAT                            
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMSD NOT = TWA-PREV-MMSD                                  
              MOVE TWA-MAP-MMSD TO TWA-PREV-MMSD                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SCREEN WITH SPACES                           *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           PERFORM  VARYING  SUB FROM 1 BY 1  UNTIL SUB > 4                     
              MOVE ATT-ASKIP TO ACTION-A (SUB)                                  
              MOVE SPACE     TO ACTION-O (SUB)                                  
                                BRANCH-O (SUB)                                  
                                ACCT-O   (SUB)                                  
                                RR-O     (SUB)                                  
                                NAME1-O  (SUB)                                  
                                CBKR-O   (SUB)                                  
                                STAT-O   (SUB)                                  
                                NAME2-O  (SUB)                                  
                                ACAT-O   (SUB)                                  
              MOVE SPACE TO TWA-MAP-ACTION (SUB)                                
           END-PERFORM.                                                         
           MOVE SPACE TO MNEXTO.                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF3:  JUMP TO MARGIN ROUTINE                         *         
      *---------------------------------------------------------------*         
       3000-JUMP-TO-MARGIN.                                                     
           MOVE 0  TO WS-ACTION-CNT.                                            
           PERFORM 1100-VALIDATE-ACTION-FLDS VARYING SUB FROM 1 BY 1            
               UNTIL  SUB > 4  OR  SUB > TWA-TFR-SCR-LINE.                      
           IF NOT WK-ERROR                                                      
              IF WS-ACTION-CNT = 1                                              
                 MOVE 'ACAT24AA' TO ACAT-CALLING-PROG-NAME                      
                 PERFORM 7020-WRITE-TSQ-RTN                                     
                 PERFORM 7510-XCTL-TO-CONTROL-PROG                              
              ELSE                                                              
              IF WS-ACTION-CNT = 0                                              
                 MOVE -1 TO MNEXTL                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'SELECT AN ACCOUNT FIRST TO VIEW THE MARGIN POSITI        
      -               'ON DETAILS'                                              
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 PERFORM 1200-ACTION-COUNT-ERROR.                               
       EJECT                                                            04785107
      *                                                                         
       5000-BR-AE-SECURITY.                                             04772510
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
           MOVE ACAT24-TFR-BRANCH     TO SRCH-INP-BRANCH.               04597609
           MOVE ACAT24-TFR-RR         TO SRCH-INP-RR.                   04597609
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
       EJECT                                                            04785107
                                                                        04777403
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREVIOUSE PAGE                                 *         
      *---------------------------------------------------------------*         
       6000-PREV-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           MOVE -1 TO MNEXTL.                                                   
                                                                                
           PERFORM 0550-OPEN-TFR-CUR-DESCEND.                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-KEY-FOUND-SW.                                       
           PERFORM  UNTIL WS-KEY-FOUND  OR  WS-NO-MORE-DATA                     
              PERFORM 0560-FETCH-TFR-CUR-DESCEND                                
              IF ACAT24-NORMAL   AND                                            
                  SRCH-SIGNON-SECR-CHECK-PASS                                   
                 MOVE ACAT24-TFR-BRANCH  TO WS-BRCH-KEY                         
                 MOVE ACAT24-TFR-ACCOUNT TO WS-ACCT-KEY                         
                 MOVE ACAT24-TFR-ACAT    TO WS-ACAT-KEY                         
                 IF WS-TFR-KEY < TWA-MAP-KEY-FIRST                              
                    SET WS-KEY-FOUND TO TRUE                                    
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
           IF WS-NO-MORE-DATA                                                   
              PERFORM 0570-CLOSE-TFR-CUR-DESCEND                                
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'FIRST PAGE' TO SYSTEM-MSG                                   
           ELSE                                                                 
              PERFORM 6010-SETUP-SCREEN-DESCEND                                 
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     SETUP SCREEN BOTTOM UP                                    *         
      *---------------------------------------------------------------*         
       6010-SETUP-SCREEN-DESCEND.                                               
           PERFORM 2010-CLEAR-SCR.                                              
           INITIALIZE TWA-MAP-AREA.                                             
           MOVE 4 TO SUB.                                                       
           PERFORM 0600-SETUP-SCREEN.                                           
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           MOVE SPACE TO SRCH-SECURITY.                                         
           PERFORM  UNTIL WS-NO-MORE-DATA  OR  SUB <= 1                         
              PERFORM 0560-FETCH-TFR-CUR-DESCEND                                
              IF ACAT24-NORMAL   AND                                            
                  SRCH-SIGNON-SECR-CHECK-PASS                                   
                 SUBTRACT 1 FROM SUB                                            
                 PERFORM 0600-SETUP-SCREEN                                      
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0570-CLOSE-TFR-CUR-DESCEND.                                  
           IF WS-NO-MORE-DATA                                                   
              IF SUB > 1                                                        
                 PERFORM 2010-CLEAR-SCR                                         
                 PERFORM 0400-REFRESH-WITH-NEW-TFR                              
              END-IF.                                                           
           PERFORM  VARYING SUB FROM 1 BY 1 UNTIL SUB > 4                       
              IF SUB = 1                                                        
                 MOVE TWA-MAP-BR   (SUB) TO TWA-KEY-BR-FIRST                    
                                            TWA-KEY-BR-LAST                     
                 MOVE TWA-MAP-AC   (SUB) TO TWA-KEY-AC-FIRST                    
                                            TWA-KEY-AC-LAST                     
                 MOVE TWA-MAP-ACAT (SUB) TO TWA-KEY-ACAT-FIRST                  
                                            TWA-KEY-ACAT-LAST                   
              ELSE                                                              
                 MOVE TWA-MAP-BR   (SUB) TO TWA-KEY-BR-LAST                     
                 MOVE TWA-MAP-AC   (SUB) TO TWA-KEY-AC-LAST                     
                 MOVE TWA-MAP-ACAT (SUB) TO TWA-KEY-ACAT-LAST                   
              END-IF                                                            
              MOVE SUB TO TWA-TFR-SCR-LINE                                      
           END-PERFORM.                                                         
      *                                                                         
      *---------------------------------------------------------------*         
      *           PF8:    NEXT PAGE                                   *         
      *---------------------------------------------------------------*         
       6100-NEXT-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           MOVE -1 TO MNEXTL.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-KEY-FOUND-SW.                                       
           PERFORM 0500-OPEN-TFR-CURSOR-TBL.                                    
           MOVE 0 TO SUB.                                                       
           PERFORM  UNTIL WS-KEY-FOUND  OR  WS-NO-MORE-DATA                     
              ADD 1 TO SUB                                                      
              PERFORM 0510-FETCH-TFR-CURSOR-TBL                                 
              IF ACAT24-NORMAL   AND                                            
                  SRCH-SIGNON-SECR-CHECK-PASS                                   
                 MOVE ACAT24-TFR-BRANCH  TO WS-BRCH-KEY                         
                 MOVE ACAT24-TFR-ACCOUNT TO WS-ACCT-KEY                         
                 MOVE ACAT24-TFR-ACAT    TO WS-ACAT-KEY                         
                 IF WS-TFR-KEY > TWA-MAP-KEY-LAST                               
                    SET WS-KEY-FOUND TO TRUE                                    
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
           IF WS-NO-MORE-DATA                                                   
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                                  
           ELSE                                                                 
              PERFORM 6200-RESET-MAP                                            
           END-IF.                                                              
           PERFORM 0520-CLOSE-TFR-CURSOR-TBL.                                   
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *             RESET MAP AREA                                  *           
      *-------------------------------------------------------------*           
       6200-RESET-MAP.                                                          
           PERFORM 2010-CLEAR-SCR.                                              
           INITIALIZE TWA-MAP-AREA.                                             
           MOVE 1 TO SUB.                                                       
           PERFORM 0600-SETUP-SCREEN.                                           
                                                                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           MOVE SPACE TO SRCH-SECURITY.                                         
           PERFORM VARYING SUB FROM 2 BY 1                                      
                       UNTIL WS-NO-MORE-DATA  OR  SUB > 4                       
              PERFORM 0510-FETCH-TFR-CURSOR-TBL                                 
              IF ACAT24-NORMAL    AND                                           
                  SRCH-SIGNON-SECR-CHECK-PASS                                   
                 PERFORM 0600-SETUP-SCREEN                                      
              ELSE                                                              
                 SUBTRACT 1     FROM SUB                                        
              END-IF                                                            
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE '24AA'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT24MO                                        
              MOVE 'ACAT24AA READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7010-DELETE-TSQ-RTN.                                                     
           MOVE '24AA'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE '24AA'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT24MO                                        
              MOVE 'ACAT24AA WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *               READ B1                                       *           
      *-------------------------------------------------------------*           
       7300-READ-B1-RTN.                                                        
           EXEC CICS READ                                                       
                     DATASET('B1PRINT')                                         
                     INTO(B1-RECORD)                                            
                     RIDFLD(B1-REC-ID)                                          
                     LENGTH(LENGTH OF B1-RECORD)                                
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *               XCTL TO OTHER PROGRAM                         *           
      *-------------------------------------------------------------*           
       7500-XCTL-TO-DETAIL-PROG.                                                
           PERFORM SCREEN-SECURITY-CHECK.                                       
           EXEC CICS XCTL                                                       
                  PROGRAM(CALLED-PROGRAM-NAME)                                  
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                        04777403
       SCREEN-SECURITY-CHECK.                                                   
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
                OR                                                              
               ACAT-SUPER-SIGN-ON-BROWSE                                        
                OR                                                              
               ACAT-JUMP-ANYWHERE                                               
                OR                                                              
               ACAT-NEXT = '$'                                                  
                CONTINUE                                                        
           ELSE                                                                 
                MOVE ACAT-NEXT TO ACAT-SCREEN-IND                               
                SET ACAT-UPDATE-MODE TO TRUE                                    
                MOVE SPACES    TO SECLINK-LIST                          AEISAC07
                MOVE '2'       TO SECLINK-ACTION-CODE                   AEISAC07
                MOVE 'SCON'    TO SECLINK-TYPE                                  
                MOVE ACAT-SEC-LIT TO SECLINK-ITEM                               
                PERFORM CALL-SECLINK-RTN                                AEISAC07
                IF SECLINK-RETURN-CODE = '00' OR '20'                   AEISAC07
                   SET ACAT-SIGN-ON-UPDATE TO TRUE                              
                   MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                      
                ELSE                                                            
                   SET ACAT-BROWSE-MODE TO TRUE                                 
                   MOVE SPACES    TO SECLINK-LIST                       AEISAC07
                   MOVE '2'       TO SECLINK-ACTION-CODE                AEISAC07
                   MOVE 'SCON'    TO SECLINK-TYPE                               
                   MOVE ACAT-SEC-LIT TO SECLINK-ITEM                            
                   PERFORM CALL-SECLINK-RTN                             AEISAC07
                   IF SECLINK-RETURN-CODE = '00' OR '20'                AEISAC07
                      MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                       
                   ELSE                                                         
                      MOVE UNAUTH-SEL-MESSAGE                           AEISAC07
                              TO SYSTEM-MSG                             AEISAC07
                      MOVE ACAT-NEXT                                    AEISAC07
                              TO SYSTEM-MSG(44 : 1)                     AEISAC07
                      MOVE -1                TO MNEXTL                          
                      MOVE ATT-UNPROT-BRT    TO MNEXTA                          
                      SET WK-MSG-ON          TO TRUE                            
                      MOVE 'ACAT24AA' TO ACAT-PROGRAM-NAME                      
                      MOVE 'V'        TO ACAT-NEXT                              
                      MOVE  SPACES    TO ACAT-CALLING-PROG-NAME                 
                      PERFORM 9000-ERROR-RTN                                    
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
      *                                                                 04777403
      *                                                                 04777403
       CALL-SECLINK-RTN.                                                AEISAC07
           EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
                LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *                                                                         
      *-------------------------------------------------------------*           
      *               XCTL TO CONTROL PROGRAM                       *           
      *-------------------------------------------------------------*           
       7510-XCTL-TO-CONTROL-PROG.                                               
           EXEC CICS XCTL                                                       
                  PROGRAM('ACAT01CP')                                           
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *            CALL DB2 I/O MODULE ACAT24DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT24DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT24DB')                                        
                     COMMAREA(ACAT24IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT24IO-COMMAREA)                        
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *     CALL DB2 I/O MODULE - PARTICIPANT BROKER NAME SEARCH    *           
      *-------------------------------------------------------------*           
       7700-LINK-TO-ACATPPIO.                                                   
           EXEC CICS LINK PROGRAM ('ACATPPDB')                          02890002
                COMMAREA(ACATPPIO-CALL-AREA)                            02900002
                LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
       EJECT                                                            02920002
      *                                                                         
      *-------------------------------------------------------------*           
      *       CALL NUMERIC EDIT MODULE                              *           
      *-------------------------------------------------------------*           
       7800-LINK-TO-EDITMOD.                                                    
           EXEC CICS LINK PROGRAM(WS-EDITMOD)                                   
                       COMMAREA(EDIT-QTY-AREA)                                  
                       LENGTH(LENGTH OF EDIT-QTY-AREA)                          
           END-EXEC.                                                    02920002
      *                                                                         
      *-------------------------------------------------------------*           
      *       CALL NUMERIC EDIT MODULE                              *           
      *-------------------------------------------------------------*           
       7900-LINK-TO-ACATMSD.                                                    
           EXEC CICS LINK PROGRAM (WS-ACATMSD)                          02890002
                COMMAREA(ACATMSD-CALL-AREA)                             02900002
                LENGTH(LENGTH OF ACATMSD-CALL-AREA)                     02910002
           END-EXEC.                                                    02920002
       EJECT                                                            02920002
      *                                                                         
      *-------------------------------------------------------------*           
      *            SEND MAP ERASE FOR THE FIRST TIME                *           
      *-------------------------------------------------------------*           
       8000-SEND-MAP-ERASE.                                                     
           IF WK-ERROR OR WK-MSG-ON                                             
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE  TO TRLMSGO                                            
           END-IF.                                                              
           MOVE 'ACAX'    TO MTRANSO.                                           
           MOVE WSTIME    TO MTIMEO.                                            
           MOVE WSMMDDYY  TO MDATEO.                                            
           MOVE WK-CLT    TO MCLINBO.                                           
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(HDRMAPO)                                              
                     ACCUM                                                      
                     CURSOR                                                     
                     ERASE                                                      
           END-EXEC.                                                            
           EXEC CICS SEND MAP('ACAT24M')                                        
                     MAPSET('ACAT24M')                                          
                     FROM(ACAT24MO)                                             
                     ACCUM                                                      
                     CURSOR                                                     
           END-EXEC.                                                            
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
                     CURSOR                                                     
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
                                                                                
       8100-SEND-MAP-DATA-ONLY.                                                 
           IF WK-ERROR OR WK-MSG-ON                                             
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE  TO TRLMSGO                                            
           END-IF.                                                              
      *                                                                         
           MOVE 'ACAX'    TO MTRANSO.                                           
           MOVE WSTIME    TO MTIMEO.                                            
           MOVE WSMMDDYY  TO MDATEO.                                            
           MOVE WK-CLT    TO MCLINBO.                                           
      *    IF FIRST-TIME                                                        
      *    AND (WK-CURSOR NOT = 0)                                              
              EXEC CICS SEND MAP('HDRMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(HDRMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
               END-EXEC                                                         
               EXEC CICS SEND MAP('ACAT24M')                                    
                         MAPSET('ACAT24M')                                      
                         FROM(ACAT24MO)                                         
                         CURSOR                                                 
                         DATAONLY                                               
                         ACCUM                                                  
               END-EXEC                                                         
               EXEC CICS SEND MAP('TRLMAP')                                     
                         MAPSET('ACAT00M')                                      
                         FROM(TRLMAPO)                                          
                         CURSOR                                                 
                         DATAONLY                                               
                         ACCUM                                                  
               END-EXEC                                                         
               EXEC CICS SEND PAGE                                              
               END-EXEC.                                                        
       EJECT                                                                    
                                                                                
       8500-RECEIVE-MAP.                                                        
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                             MAPSET('ACAT00M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
           EXEC CICS RECEIVE MAP('ACAT24M')                                     
                             MAPSET('ACAT24M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT24MI)                                     
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                             MAPSET('ACAT00M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(TRLMAPI)                                      
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       8700-RETURN-CONTROL-RTN.                                                 
           EXEC CICS SEND CONTROL                                               
                            ERASE                                               
                           FREEKB                                               
           END-EXEC.                                                            
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       8800-RETURN-TO-CICS.                                                     
           EXEC CICS RETURN                                                     
                     TRANSID('ACAX')                                            
                     COMMAREA(ACATCOMM-COMMAREA)                                
           END-EXEC.                                                            
       EJECT                                                                    
       9000-ERROR-RTN.                                                          
           MOVE WSTIME         TO  MTIMEO.                                      
           MOVE WSMMDDYY       TO  MDATEO.                                      
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
                                                                                
