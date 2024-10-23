000001* PDX    - CAT610   C0336307 06/05/14 10:52:02 TBLAMUR            00001000
      * LRM027 SSR 89329 FOR ASCENDIS CLIENT, WIPE OUT ACAT-CD = D ON           
      *  SETTLE-PREP OR SETTLE-CLOSE FOR FUL,PTR RECEIVE.                       
      *  ALSO SSR 91356 PASS SPACES NOT US TO BPDATES-CALENDAR-TYPE.            
000001* PDX    - CAT610   C0348882 01/27/14 09:22:06 TBCHKOP            00001000
      * CSG001 SSR 91356  MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 
000001* PDX    - CAT610   C0347389 10/25/13 11:18:47 TBLAMUR            00001000
      * LRM026 SSR 95476 N/A UPDATE SHOULD ALWAYS PASS TRID=B.                  
000001* PDX    - CAT610   C0335742 03/04/13 12:26:15 TBLAMUR            00001000
      * LRM025 SSR 90718 INIT VENDOR NUMBER ON N/A WHEN CHANGING                
      * LRM025   ACAT-CD TO D.                                                  
000001* PDX    - CAT610   C0326739 06/05/12 14:37:51 TBLAMUR            00001000
      * LRM024 SSR 84419 UPDATE N/A RESTRICT CODE BASED ON B1 434762.           
000001* PDX    - CAT610   C0324918 04/03/12 13:40:11 TBLAMUR            00001000
      * LRM023 SSR 83069 REMOVE QA LOGIC FOR PROCESSING TDY MINUS 1.            
000001* PDX    - CAT610   C0317310 11/21/11 09:21:44 TBLAMUR            00001000
      * LRM022 - SSR 79958 QUALIFY ACCOUNT CLOSE UPDATE ON NEW B1               
      * LRM022    434749=0 (DEFAULT) OR 2, ALSO WIPE ACH/DDA.                   
      * LRM022    WHEN 434749=1 DO NOT UPDATE ACCOUNT CLOSE OR ACH/DDA.         
      * LRM022    434688=2 ALSO CLEAR ACH/DDA FIELDS ON N/A.                    
000001* PDX    - CAT610   C0315645 08/19/11 10:21:41 TBLAMUR            00001000
      * LRM021 - SSR 78742 DONT PASS N/A REVERSAL UPDATE WHEN NOTFND            
      *          WHEN APPLYING THE HISTORY PURGE.  SSR 76049 WAS ONLY           
      *          CHANGED FOR THE REJECTED TRANSFER RTN.                         
000001* PDX    - CAT610   C0309005 04/20/11 15:50:40 TBLAMUR            00001000
      * LRM020 - SSR 76049 DONT PASS N/A REVERSAL UPDATE WHEN NOTFND.           
      * LRM020 - SSR 76308 CREATE MULITLPE WIRES FOR SAME CL/BR/AC IN           
      * LRM020 - THE SAME CYCLE; BREAK OUT BY CONTROL NUMBER.                   
000001* PDX    - CAT610   C0297953 10/14/10 14:33:38 TBLAMUR            00001000
      * LRM019 - SSR 68176 DELAY TURNING OFF CASH SWEEP UNTIL THE               
      * LRM019   NIGHT OF BANK HOLIDAY/DONT DO THIS ON NIGHT BEFORE.            
000001* PDX    - CAT610   C0282464 06/16/09 14:52:10 TBLAMUR            00001000
      * LRM018 - SSR 61947 UPDATE ACCOUNT CLOSED IND ON N/A TO "A"              
      * LRM018 - BASED ON FUL DLVY TRANS AGED OFF HSTY FROM CAT714 FEED.        
000001* PDX    - CAT610   C0274656 01/12/09 10:06:57 TBDOJUN            00001000
      * DJ0002 - SSR 60356 IF A SUCCESSFUL FULL DELIVERY IS ON VTRNHSTY,        
      * DJ0002 - BYPASS REVERSAL OF NAPPA-ACAT-CODE.                            
000001* PDX    - CAT610   C0271988 10/20/08 10:56:14 TBLAMUR            00001000
      * LRM017 - TASK 61222 ADDITIONAL CHANGE TO RIGHT JUST ALT-RR              
      * LRM017 - AND CONDITIONALLY FILL WITH LEADING ZEROS.                     
      * LRM017 - RESTORE ALT-RR FROM PREV-ALT-RR.                               
000001* PDX    - CAT610   C0266294 08/27/08 08:59:16 TBLAMUR            00001000
      * LRM016 - SSR 57396 USE NEW N/ FIELD ALT-RR TO RETAIN                    
      * LRM016 - RR AND USE PREV-ALT-RR TO REVERSE RR WHEN DLVY REJECTED        
000001* PDX    - CAT610   C0263663 05/28/08 15:03:20 TBLAMUR            00001000
      * LRM015 - SSR 57230 CREATE WACAT026 INTRA-DAY.                           
000001* PDX    - CAT610   C0256032 10/23/07 15:34:20 TBLAMUR            00001000
      * LRM014 - TASK 54909 MOVE UP BANK HOLIDAY TO ONE DAY PRIOR.              
000001* PDX    - CAT610   C0251821 08/03/07 14:51:15 TBLAMUR            00001000
      * LRM013 - TASK 53557 CORRECT DUPE WIRE CREATION BY USING CNTL            
      *        - NBR = YESTERDAY JULIAN DATE NOR CRT DATE.                      
000001* PDX    - CAT610   C0248821 06/13/07 09:16:08 TBLAMUR            00001000
      * LRM012 - SSR 52182 ADD ORG ALTBR AND ACCT NBR TO WIRES FIXED.           
000001* PDX    - CAT610   C0248782 05/25/07 14:37:08 TBLAMUR            00001000
      * LRM011 - SSR 47212 AMENDMENT - USE BPDATES TRADE-DAY-ONLY TO            
      * LRM011 - IDENTIFY BANK HOLIDAY AND REINSTATE LOGIC.                     
000001* PDX    - CAT610   C0248714 05/14/07 10:48:28 TBLAMUR            00001000
      * LRM011 - REMOVE SSR 47212 POSTPONE UPDATE ACAT-CD = D.                  
000001* PDX    - CAT610   C0246568 04/25/07 08:20:13 TBLAMUR            00001000
      * LRM010 - SSR 47212 POSTPONE UPDATE ACAT-CD = D ON BANK HOLIDAY          
      * LRM010   UNTIL NEXT PROC NIGHT BY WRITING OUT TO WRAP FILE.             
      * LRM009 - SSR 49202 UPDATE 90 DAY TRADE RESTRICTION ON N/A FOR           
000001* PDX    - CAT610   C0245386 04/16/07 10:12:04 TBLAMUR            00001000
000001* PDX    - CAT610   C0244848 02/12/07 11:34:02 TBLAMUR            00001000
      * LRM008 - SSR 45063 AMENDMENT. CLIENT 6 ISSUE WHERE RR# DOES NOT         
      *          BACKOUT ON REJECT WHEN ALT BRANCH NOT CHANGED DUE TO           
      *          ALTBR TABLE SETTING ALTBR=ALTBR WITH REP CHANGE.               
000001* PDX    - CAT610   C0240170 02/01/07 15:20:33 TBLAMUR            00001000
      * LRM007 - SSR 46059 AUTO WIRES.                                          
000001* PDX    - CAT610   C0237874 10/16/06 08:06:24 TBLAMUR                    
      * LRM006 - SSR 45063 CONTINUED.  READ NAME&ADDR ACTIVITY FILE             
      * LRM006   TO OBTAIN ONLINE ACCOUNT CHANGES FIRST, WHEN NOTFND            
      * LRM006   ISSUE REGULAR N/A READ.  ISSUE FOUND WHERE NNAD UPDATES        
      * LRM006   ARE NOT RETURN VIA STANDARD CALL, AS INITIAL INTRA DAY         
      * LRM006   UPDATE OCCURRED FIRST, 2ND ONLINE RELA UPD, THEN REJECT        
      * LRM006   REVERSAL LOGIC DID NOT SEE ONLINE USER CHANGE.                 
000001* PDX    - CAT610   C0236781 07/28/06 11:13:41 TBLAMUR                    
000001* PDX    - CAT610   C0230019 06/12/06 11:43:59 TBEDTAK                    
      * ET0005 - NON-SSR  FIX BUG - DUPLICATE FULL REQUESTS WITH REJECT         
      * ET0005   STTS-CD (600) AND REQ STT-CD (100) ARE CAUSING TO SKIP         
      * ET0005   PROJECTED DAYS FOR MARGIN INTEREST PROCESS.                    
      * ET0004 - SSR 45063 UPDATE ALTERNATE BRANCH #, RR #, AND 2ND RR#         
      * ET0004   ON N&A FOR A FULL DELIVERY BASED ON ALT-BRANCH & RR #          
      * ET0004   TABLE/FILE (S*.***.CAT610.ACATAB).                             
      * ET0004   UPDATE RR# OF VTRNFR DB TABLE.                                 
      * ET0004   REVERSE TO ORIGINAL ALT-BR# & RR# IF TRNFR IS REJECTED.        
000001* PDX    - CAT610   C0224529 08/17/05 11:49:41 TBEDTAK                    
      * ET0003 - SSR 40221 DO NOT GENERATE N&A UPDATE FOR TIFS THAT ARE         
      *          REJECTED AT DAY 1.                                             
000001* PDX    - CAT610   C0210373 12/09/04 08:41:29 TBLAMUR                    
      * LRM004 - SSR 0029647 READ DELETED (AGED) ACCOUNTS FILE                  
      * LRM004   TO PURGE N/A INDICATOR BASED ON B1 434688, AND WHEN            
      * LRM004   N/A CURRENTLY HAS "D", WRITE TO NA DELETE FILE.                
      * LRM003 - SSR 0037159 UBS CL 235 (WM) WEALTH MNGT ACCOUNTS:              
      *   BYPASS ALL PROCESSING.                                                
000001* PDX    - CAT610   C0192776 02/03/04 15:21:01 TBEDTAK                    
      * ET0002 - ADDITIONAL VALUE '3' FOR B1 434589 TO UPDATE                   
      *          NAUPI0-BUS-STOP-DATE FIELD.                                    
000001* LRM002 - SSR 0024984 AUTO-REFRESH ON ANY REQUEST STATUS.                
000001* LRM002 - REQUEST OLMI PROJECED INTEREST ON REQ-2,3                      
000001* PDX    - CAT610   C0184886 01/09/03 15:34:12 TBLAMUR                    
000001* PDX    - CAT610   C0176235 06/12/02 14:07:14 TBEDTAK                    
000001* PDX    - CAT610   C0169388 03/13/02 15:01:58 TBEDTAK                    
000001* PDX    - CAT610   C0158537 06/25/01 16:24:14 TBDOJUN                    
      * DJ0001 - SSR#R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS(DELETES)         
      *        - ADD STATUS 240 TO PROCESSING                                   
000001* PDX    - CAT610   C0157132 04/10/01 09:02:22 TBLAMUR                    
000001* PDX    - CAT610   C0155408 03/09/01 07:35:16 TBLAMUR                    
000001* PDX    - CAT610   C0131049 09/09/99 12:37:46 TBLAMUR                    
000001* PDX    - CAT610   C0129194 07/29/99 10:35:36 TBEDTAK                    
000001* PDX    - CAT610   C0127147 06/22/99 15:43:04 TBEDTAK                    
000001* PDX    - CAT610   C0124379 05/21/99 15:25:04 TBEDTAK                    
000001* PDX    - CAT610   C0122783 03/10/99 14:42:01 TBEDTAK                    
000001* PDX    - CAT610   C0121655 02/14/99 15:53:19 TBYOHON                    
000001* PDX    - CAT610   C0121510 02/08/99 20:04:05 TBYOHON                    
000001* PDX    - CAT610   C0121105 01/30/99 17:13:10 TBYOHON                    
000001* PDX    - CAT610   C0120606 01/27/99 14:20:51 TBYOHON                    
000001* PDX    - CAT610   C0117779 11/25/98 11:24:47 TBEDTAK                    
000001* PDX    - CAT610   C0116404 10/29/98 10:26:45 TBEDTAK                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT610.                                                      
      *                                                                         
       DATE-WRITTEN. AUGUST 1998.                                               
      *---------------------------------------------------------------*         
      *REMARKS.                                                       *         
      *                                                               *         
      *  CAT610       - CAT610 IS A MODIFIED VERSION OF CAT25.        *         
      *                 CAT610 READS ACAT-TRNFR DB2 TABLE INSTEAD OF  *         
      *                 SIAC103 FILE AS IN CAT25 PROGRAM.             *         
      *                 THERE ARE 2 ADDITIONAL OUTPUT FILES - MARGIN  *         
      *                 INTEREST FILE AND PERIODIC PAYMENT FILE.      *         
      *---------------------------------------------------------------*         
      *  CAT25        - CREATES UPDATES TO THE NAME AND ADDRESS       *         
      *                 FILE. INPUTS ARE THE SIAC103 AND NAME AND     *         
      *                 ADDRESS UPDATE RECORDS. B1 CARDS ARE ALSO     *         
      *                 READ TO DETERMINE IF UPDATE RECORDS SHOULD    *         
      *                 BE CREATED.                                   *         
      *                                                               *         
      *---------------------------------------------------------------*         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
      **   SELECT  ACAT-FILE           ASSIGN  TO  UT-S-ACATFL.                 
                                                                                
ET0004     SELECT  ALTBR-FILE          ASSIGN  TO  ALTBR                        
ET0004                                 ORGANIZATION    INDEXED                  
ET0004                                 ACCESS MODE     DYNAMIC                  
ET0004                                 RECORD KEY   IS ALTBREC-KEY              
ET0004                                 FILE STATUS  IS ALTBR-LOG-STATUS.        
                                                                                
LRM004     SELECT  ACCTDEL-FILE        ASSIGN  TO  UT-S-ACCTDEL.                
                                                                                
           SELECT  NA-UPDATE-FILE      ASSIGN  TO  UT-S-NAUPDTE.                
                                                                                
           SELECT  DB-SAVE-FILE        ASSIGN  TO  UT-S-DBSAVE.                 
                                                                                
           SELECT  MGN-INT-FILE        ASSIGN  TO  UT-S-MGNINT.                 
                                                                                
           SELECT  PAYMENT-FILE        ASSIGN  TO  UT-S-PPMNT.                  
                                                                                
LRM004     SELECT  NACCTDEL-FILE       ASSIGN  TO  UT-S-NACCTDEL.               
                                                                                
           SELECT  REPORT-FILE         ASSIGN  TO  UT-S-REPORT.                 
                                                                                
           SELECT  REPORT-FILE-2       ASSIGN  TO  UT-S-REPORT2.                
                                                                                
ET0004     SELECT  ALTBR-REPT-FILE     ASSIGN  TO  UT-S-ALTBREP.                
                                                                                
LRM007     SELECT  AUTOWIRE-FILE       ASSIGN  TO  UT-S-WIRES.                  
                                                                                
LRM010     SELECT  NAUP-WRAP-FILE-IN   ASSIGN  TO  UT-S-NAWRAP.                 
LRM010     SELECT  NAUP-WRAP-FILE-OUT  ASSIGN  TO  UT-S-NAWRAPO.                
                                                                                
           SELECT  TEMP-FILE           ASSIGN  TO  UT-S-TEMP.                   
                                                                                
           SELECT  SORT-FILE           ASSIGN  TO  SORTWK01.                    
                                                                                
           SELECT  SORT-FILE-2         ASSIGN  TO  SORTWK01.                    
                                                                                
           EJECT                                                                
       DATA DIVISION.                                                           
                                                                                
       FILE SECTION.                                                            
                                                                                
      *FD  ACAT-FILE                                                            
      *    RECORDING MODE F                                                     
      *    BLOCK CONTAINS 0 RECORDS                                             
      *    LABEL RECORDS ARE STANDARD                                           
      *    RECORD CONTAINS 133 CHARACTERS.                                      
      *                                                                         
      *01  ACAT-REC-IN.                                                         
      *    05  ACAT-REC-IN-TYPE        PIC X.                                   
      *    05  ACAT-REC-IN-SEQ         PIC X(7).                                
      *    05  FILLER                  PIC X(125).                              
                                                                                
ET0004 FD  ALTBR-FILE.                                                          
ET0004 COPY ACATAB.                                                             
                                                                                
LRM004***INPUT FROM CAT714 LRECL=30                                             
LRM004 FD  ACCTDEL-FILE                                                         
LRM004     LABEL RECORDS STANDARD                                               
LRM004     RECORDING MODE IS F                                                  
LRM004     BLOCK CONTAINS 0 RECORDS.                                            
LRM004 01  ACCTDEL-RECORD.                                                      
LRM004   03  ACCTDEL-REC.                                                       
LRM004     05  ACCTDEL-KEY.                                                     
LRM004         10  ACCTDEL-CLT-NBR       PIC X(04).                             
LRM004         10  ACCTDEL-BRANCH-NBR    PIC X(03).                             
LRM004         10  ACCTDEL-ACCT-NBR      PIC X(05).                             
LRM004     05  ACCTDEL-DATA              PIC X(18).                             
LRM004   03  ACCTDEL-DATE-REC REDEFINES ACCTDEL-REC.                            
LRM004     05  ACCTDEL-DATE-KEY          PIC X(12).                             
LRM004         88  ACCTDEL-DATEREC       VALUE LOW-VALUES.                      
LRM004     05  ACCTDEL-DATE-LIT          PIC X(05).                             
LRM004         88  ACCTDEL-DATELIT       VALUE 'DATE='.                         
LRM004     05  ACCTDEL-DATE-CYMD         PIC X(08).                             
LRM004     05  FILLER                    PIC X(05).                             
LRM004   03  ACCTDEL-TRLR-REC REDEFINES ACCTDEL-DATE-REC.                       
LRM004     05  ACCTDEL-TRLR-KEY          PIC X(12).                             
LRM004         88  ACCTDEL-TRLRREC       VALUE HIGH-VALUES.                     
LRM004     05  ACCTDEL-TRLR-LIT          PIC X(06).                             
LRM004         88  ACCTDEL-TRLRLIT       VALUE 'COUNT='.                        
LRM004     05  ACCTDEL-TRLR-COUNT        PIC 9(11).                             
LRM004     05  FILLER                    PIC X(01).                             
                                                                                
       FD  NA-UPDATE-FILE                                                       
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  NA-UPDATE-REC               PIC X(255).                              
                                                                                
       FD  DB-SAVE-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  DB-SAVE-RECORD              PIC X(30).                               
                                                                                
       FD  MGN-INT-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  MGN-INT-REC                 PIC X(30).                               
                                                                                
       FD  PAYMENT-FILE                                                         
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  PAYMENT-REC                 PIC X(80).                               
                                                                                
LRM004***OUTPUT TO CAT675 LRECL=30                                              
LRM004 FD  NACCTDEL-FILE                                                        
LRM004     LABEL RECORDS STANDARD                                               
LRM004     RECORDING MODE IS F                                                  
LRM004     BLOCK CONTAINS 0 RECORDS.                                            
LRM004 01  NACCTDEL-RECORD.                                                     
LRM004   03  NACCTDEL-REC.                                                      
LRM004     05  NACCTDEL-KEY.                                                    
LRM004         10  NACCTDEL-CLT-NBR      PIC X(04).                             
LRM004         10  NACCTDEL-BRANCH-NBR   PIC X(03).                             
LRM004         10  NACCTDEL-ACCT-NBR     PIC X(05).                             
LRM004     05  NACCTDEL-DATA             PIC X(18).                             
LRM004   03  NACCTDEL-DATE-REC REDEFINES NACCTDEL-REC.                          
LRM004     05  NACCTDEL-DATE-KEY         PIC X(12).                             
LRM004         88  NACCTDEL-DATEREC      VALUE LOW-VALUES.                      
LRM004     05  NACCTDEL-DATE-LIT         PIC X(05).                             
LRM004         88  NACCTDEL-DATELIT      VALUE 'DATE='.                         
LRM004     05  NACCTDEL-DATE-CYMD        PIC X(08).                             
LRM004     05  FILLER                    PIC X(05).                             
LRM004   03  NACCTDEL-TRLR-REC REDEFINES NACCTDEL-DATE-REC.                     
LRM004     05  NACCTDEL-TRLR-KEY         PIC X(12).                             
LRM004         88  NACCTDEL-TRLRREC      VALUE HIGH-VALUES.                     
LRM004     05  NACCTDEL-TRLR-LIT         PIC X(06).                             
LRM004         88  NACCTDEL-TRLRLIT      VALUE 'COUNT='.                        
LRM004     05  NACCTDEL-TRLR-COUNT       PIC 9(11).                             
LRM004     05  FILLER                    PIC X(01).                             
                                                                                
       FD  REPORT-FILE                                                          
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC                  PIC X(143).                              
                                                                                
       FD  REPORT-FILE-2                                                        
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC-2                PIC X(143).                              
                                                                                
ET0004 FD  ALTBR-REPT-FILE                                                      
ET0004     LABEL RECORDS STANDARD                                               
ET0004     RECORDING MODE IS F                                                  
ET0004     BLOCK CONTAINS 0 RECORDS                                             
ET0004     RECORD CONTAINS 143 CHARACTERS.                                      
ET0004 01  ALTBR-REPT-REC              PIC X(143).                              
                                                                                
LRM007 FD  AUTOWIRE-FILE                                                        
LRM007     LABEL RECORDS STANDARD                                               
LRM007     RECORDING MODE IS F                                                  
LRM007     BLOCK CONTAINS 0 RECORDS                                             
LRM007     RECORD CONTAINS 700 CHARACTERS.                                      
LRM007 01  AUTOWIRE-REC                PIC X(700).                              
                                                                                
LRM010 FD  NAUP-WRAP-FILE-IN                                                    
LRM010     LABEL RECORDS STANDARD                                               
LRM010     RECORDING MODE IS F                                                  
LRM010     BLOCK CONTAINS 0 RECORDS                                             
LRM010     RECORD CONTAINS 40 CHARACTERS.                                       
LRM010 01  NAUP-WRAP-RECORD-IN         PIC X(40).                               
                                                                                
LRM010 FD  NAUP-WRAP-FILE-OUT                                                   
LRM010     LABEL RECORDS STANDARD                                               
LRM010     RECORDING MODE IS F                                                  
LRM010     BLOCK CONTAINS 0 RECORDS                                             
LRM010     RECORD CONTAINS 40 CHARACTERS.                                       
LRM010 01  NAUP-WRAP-RECORD-OUT        PIC X(40).                               
                                                                                
       FD  TEMP-FILE                                                            
           LABEL RECORDS STANDARD                                               
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 80 CHARACTERS.                                       
       01  TEMP-RECORD                 PIC X(80).                               
                                                                                
       SD  SORT-FILE.                                                           
       01  SORT-REC.                                                            
           05  S-CLIENT                PIC X(3).                                
           05  S-CONTROLLER            PIC 9(3).                                
           05  S-BRANCH                PIC X(3).                                
           05  S-ACCOUNT               PIC X(5).                                
           05  S-CLIENT-NAME           PIC X(30).                               
           05  S-ACCT-TITLE            PIC X(90).                               
           05  S-DATA-OPENED           PIC X(8).                                
           05  FILLER                  PIC X(8).                                
                                                                                
       SD  SORT-FILE-2.                                                         
       01  SORT-REC-2.                                                          
           05  S-CLIENT-2              PIC X(3).                                
           05  S-BRANCH-2              PIC X(3).                                
           05  S-ACCOUNT-2             PIC X(5).                                
           05  S-CLIENT-NAME-2         PIC X(30).                               
           05  S-DIV-CODE-2            PIC X(1).                                
           05  S-SELL-CODE-2           PIC X(2).                                
C05759     05  S-CASH-SWEEP-2          PIC X(1).                                
           05  S-REJ-IND-2             PIC X(1).                                
C05759     05                          PIC X(34).                               
           EJECT                                                                
      *****************************************************************         
       WORKING-STORAGE  SECTION.                                                
      *****************************************************************         
       77  PGM-NAME                         PIC X(06)  VALUE 'CAT610'.          
                                                                                
       77  ACAT-PROC-DATE                   PIC X(06)  VALUE ' '.               
                                                                                
       77  WS-DATE                          PIC 9(06)  VALUE 0.                 
ET0004 77  ALTBR-LOG-STATUS                 PIC X(02)  VALUE '00'.              
                                                                                
ET0004 77  ABEND-CODE-1010      COMP        PIC S9(4)  VALUE +1010.             
ET0004                                                                          
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.             
       77  ABEND-CODE-2020      COMP        PIC S9(4)  VALUE +2020.             
       77  ABEND-CODE-2024      COMP        PIC S9(4)  VALUE +2024.             
       77  ABEND-CODE-2028      COMP        PIC S9(4)  VALUE +2028.             
                                                                                
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.             
       77  ABEND-CODE-4008      COMP        PIC S9(4)  VALUE +4008.             
       77  ABEND-CODE-4012      COMP        PIC S9(4)  VALUE +4012.             
       77  ABEND-CODE-4016      COMP        PIC S9(4)  VALUE +4016.             
       77  ABEND-CODE-4020      COMP        PIC S9(4)  VALUE +4020.             
       77  ABEND-CODE-4024      COMP        PIC S9(4)  VALUE +4024.             
       77  ABEND-CODE-4028      COMP        PIC S9(4)  VALUE +4028.             
       77  ABEND-CODE-4900      COMP        PIC S9(4)  VALUE +4900.             
                                                                                
       77  ABEND-CODE-5000      COMP        PIC S9(4)  VALUE +5000.             
       77  ABEND-CODE-5010      COMP        PIC S9(4)  VALUE +5010.             
       77  ABEND-CODE-5020      COMP        PIC S9(4)  VALUE +5020.             
       77  ABEND-CODE-5100      COMP        PIC S9(4)  VALUE +5020.             
       77  ABEND-CODE-6000      COMP        PIC S9(4)  VALUE +6000.             
                                                                                
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.             
                                                                                
       77  REPORT-2-BREAK-SW                PIC X(01) VALUE ' '.                
ET0004 77  REPORT-3-BREAK-SW                PIC X(01) VALUE ' '.                
                                                                                
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.                
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.                
                                                                                
       77  B1-SUB                           PIC 9(4)    VALUE 0.                
       77  WS-CLIENT-NBR                    PIC X(4)    VALUE '0000'.           
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.                
       77  B1-SUB1                          PIC 9(4)    VALUE 0.                
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.                
       77  B1-SUB2                          PIC 9(4)    VALUE 0.                
       77  B3-SUB                           PIC 9(4)    VALUE 0.                
       77  B4-SUB                           PIC 9(4)    VALUE 0.                
       77  T-SUB1                           PIC 9(4)    VALUE 0.                
       77  T-SUB2                           PIC 9(4)    VALUE 0.                
       77  LINECNT                          PIC 9(4)    VALUE 99.               
       77  PAGECNT                          PIC 9(4)    VALUE 0.                
       77  LINECNT-2                        PIC 9(4)    VALUE 99.               
ET0004 77  LINECNT-3                        PIC 9(4)    VALUE 99.               
       77  PAGECNT-2                        PIC 9(4)    VALUE 0.                
ET0004 77  PAGECNT-3                        PIC 9(4)    VALUE 0.                
       77  WORK-DATE-OPEN                   PIC 9(8)   VALUE 0.                 
       77  MSGNO                            PIC 9(3)    VALUE 0.                
       77  UPD-SEQ                          PIC 99      VALUE 0.                
       77  ROW-CNT                          PIC S9(8)   VALUE 0.                
       77  MGN-INT-REC-CNT                  PIC S9(8)   VALUE 0.                
       77  PMNT-REC-CNT                     PIC S9(8)   VALUE 0.                
       77  WK-TIMESTAMP                     PIC X(26).                          
                                                                                
       77  ACAT-1ST-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-1ST-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-1ST-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-2ND-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-2ND-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-2ND-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-3RD-RECORD-SWITCH           PIC X(01)  VALUE ' '.               
           88  ACAT-3RD-RECORD-FOUND                   VALUE 'Y'.               
           88  ACAT-3RD-RECORD-NOT-FOUND               VALUE 'N'.               
                                                                                
       77  ACAT-TYPE-WRITE                  PIC X(01)  VALUE ' '.               
           88  WRITE-HDR                               VALUE 'H'.               
           88  WRITE-DATA                              VALUE 'D'.               
           88  WRITE-TRLR                              VALUE 'T'.               
                                                                                
       77  CURRENT-ACAT-REC-TYPE            PIC X(01)  VALUE ' '.               
           88  ACAT-HEADER-REC                         VALUE 'H'.               
           88  ACAT-TRAILER-REC                        VALUE 'T'.               
           88  ACAT-DATA-RECS                          VALUE 'D'.               
                                                                                
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-ENTRY-FOUND                          VALUE 'Y'.               
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-SEARCH-END                           VALUE 'Y'.               
                                                                                
       77  B1-RANGE-SEARCH-STATUS           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-FOUND                          VALUE 'Y'.               
           88  B1-RANGE-NOT-FOUND                      VALUE 'N'.               
                                                                                
       77  B1-RANGE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.               
           88  B1-RANGE-SEARCH-END                     VALUE 'Y'.               
                                                                                
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-TIME                         VALUE 'Y'.               
                                                                                
       77  ACAT-FIRST-WRITE-SW              PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-WRITE                        VALUE 'Y'.               
                                                                                
       77  ACAT-HDR-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-HDR                                VALUE 'Y'.               
                                                                                
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-EOF                                VALUE 'Y'.               
                                                                                
LRM004 77  ACCTDEL-EOF-SW                   PIC X(01)  VALUE ' '.               
LRM004     88  ACCTDEL-EOF                             VALUE 'Y'.               
                                                                                
       77  ACAT-BYPASS-SW                   PIC X(01)  VALUE ' '.               
           88  ACAT-BYPASS                             VALUE 'Y'.               
                                                                                
       77  ADR-ACCT-TEST                    PIC X(02)  VALUE '  '.              
           88  ADR-IRA                                 VALUE '03' '04'          
                                                             '05'.              
       77  ACAT-DELIVER-SW                  PIC X      VALUE 'Y'.               
           88  ACAT-FIRST-DELIVER                      VALUE 'Y'.               
                                                                                
       77  ACAT-CLI-TOT-SW                  PIC X      VALUE ' '.               
           88  ACAT-CLIENT-TOTAL                       VALUE 'Y'.               
                                                                                
       77  WK-TFR-EOF-SW                    PIC X      VALUE ' '.               
           88  WK-TFR-EOF                              VALUE 'Y'.               
                                                                                
LRM010 77  WK-NAWRAP-EOF-SW                 PIC X      VALUE ' '.               
LRM010     88  NAWRAP-EOF                              VALUE 'Y'.               
                                                                                
       77  WK-CLNT-DEL-REC-IND              PIC X      VALUE ' '.               
           88  WK-CLNT-IS-DELIVERER                    VALUE 'D'.               
           88  WK-CLNT-IS-RECEIVER                     VALUE 'R'.               
                                                                                
       77  WK-ACAT-TFR-UPDATED-SW           PIC X      VALUE ' '.               
       77  WK-DB2-TBL-UPDT-SW               PIC X      VALUE ' '.               
           88  WK-DB2-TBL-UPDT-TO-Y                    VALUE 'Y'.               
           88  WK-DB2-TBL-UPDT-TO-N                    VALUE 'N'.               
       77  WK-TRNFR-SETTLED-SW              PIC X      VALUE ' '.               
           88  WK-TRNFR-SETTLED                        VALUE 'Y'.               
           88  WK-TRNFR-NOT-SETTLED                    VALUE 'N'.               
                                                                                
DJ0002 77  WK-VTRNHSTY-SW                   PIC X(01)  VALUE ' '.               
DJ0002     88  WK-VTRNHSTY-FOUND                       VALUE 'Y'.               
DJ0002     88  WK-VTRNHSTY-NOT-FOUND                   VALUE 'N'.               
                                                                                
LRM020 77  DUPE-WIRE-LOOKUP-SW              PIC X(01).                          
LRM020     88  DUPE-WIRE-LOOKUP                        VALUE 'Y'.               
                                                                                
       01  SPIE-KEY                     PIC S9(08) COMP    VALUE +133.          
       01  SPIE-GRP                     PIC X(04)          VALUE 'ACAT'.        
                                                                                
       01  WORK-DATE-AREA.                                                      
           05  WDA-CC                   PIC X(2).                               
           05  WDA-YY                   PIC X(2).                               
           05  WDA-MM                   PIC X(2).                               
           05  WDA-DD                   PIC X(2).                               
ET0003     05  WK-TODAY-JULIAN-DT.                                              
ET0003         07  WK-TODAY-JUL-YEAR    PIC X(04).                              
ET0003         07  WK-TODAY-JUL-DAYS    PIC X(03).                              
LRM013     05  WS-TODAY-CCYYMMDD        PIC X(08).                              
LRM013     05  WS-YEST-JULIAN-DT        PIC X(07) VALUE SPACES.                 
LRM013     05  DAY-SUB                  PIC  S9(04) COMP.                       
                                                                                
       01  WORK-EDIT-TIMESTAMP-AREA.                                            
           05  WK-CRT-TMSTP.                                                    
               07  WK-CRT-TMSTP-CC      PIC X(02).                              
               07  WK-CRT-TMSTP-YY      PIC X(02).                              
               07  WK-CRT-TMSTP-MM      PIC X(02).                              
               07  WK-CRT-TMSTP-DD      PIC X(02).                              
           05  WK-UPD-TMSTP.                                                    
               07  WK-UPD-TMSTP-CC      PIC X(02).                              
               07  WK-UPD-TMSTP-YY      PIC X(02).                              
               07  WK-UPD-TMSTP-MM      PIC X(02).                              
               07  WK-UPD-TMSTP-DD      PIC X(02).                              
                                                                                
       01  WK-AREA.                                                             
           05  WK-DAYS-SUBMIT-ASSETS    PIC X(01).                              
           05  WK-DAYS-SUBMIT-ASSETS-N REDEFINES WK-DAYS-SUBMIT-ASSETS          
                                        PIC 9(01).                              
           05  WK-DAYS-STTS-QTY         PIC 9(7).                               
           05  WK-CLT-NBR               PIC X(04).                              
ET0004     05  WK-CLT-NBR-R       REDEFINES WK-CLT-NBR.                         
ET0004         07  FILLER               PIC X(01).                              
ET0004         07  WK-CLT-NBR-3         PIC X(03).                              
           05  WK-ACAT-CNTRL-NBR        PIC X(14).                              
ET0003     05  WK-ACAT-CNTRL-NBR-R   REDEFINES WK-ACAT-CNTRL-NBR.               
ET0003         07  WK-ACAT-CNTRL-JUL-DT PIC X(07).                              
ET0003         07  WK-ACAT-CNTRL-SEQ    PIC X(07).                              
           05  WK-CURR-KEY.                                                     
               07  WK-CURR-CLT-NBR      PIC X(4).                               
               07  WK-CURR-BRCH-CD      PIC X(3).                               
               07  WK-CURR-ACCT-CD      PIC X(5).                               
LRM020         07  WK-CURR-CNTL-NBR     PIC X(14).                              
           05  WK-PREV-KEY.                                                     
               07  WK-PREV-CLT-NBR      PIC X(4).                               
               07  WK-PREV-BRCH-CD      PIC X(3).                               
               07  WK-PREV-ACCT-CD      PIC X(5).                               
LRM020         07  WK-PREV-CNTL-NBR     PIC X(14).                              
ET0004     05  WK-RR-NBR                PIC X(3).                               
                                                                                
LRM009 01  WS-90DR-DATE.                                                        
LRM009     05  WS-90DR-DATE-CC         PIC X(2).                                
LRM009     05  WS-90DR-DATE-YY         PIC X(2).                                
LRM009     05  WS-90DR-DATE-MM         PIC X(2).                                
LRM009     05  WS-90DR-DATE-DD         PIC X(2).                                
LRM009 01  FILLER REDEFINES WS-90DR-DATE.                                       
LRM009     05  WS-90DR-DATE-NUM        PIC 9(8).                                
LRM009 01  WS-NA-90DAY-END-DT-UNPK     PIC 9(09).                               
LRM009 01  FILLER REDEFINES WS-NA-90DAY-END-DT-UNPK.                            
LRM009     05  FILLER                  PIC X.                                   
LRM009     05  WS-NA-90DAY-END-DT      PIC X(08).                               
                                                                                
       01  WS-COUNTERS.                                                         
           05  ACAT-HDRS-READ           PIC 9(11) VALUE 0.                      
           05  ACAT-TRLR-READ           PIC 9(11) VALUE 0.                      
           05  ACAT-BYP-RECS            PIC 9(11) VALUE 0.                      
           05  ACAT-REJ-RECS            PIC 9(11) VALUE 0.                      
           05  ACAT-DTL-RECS            PIC 9(11) VALUE 0.                      
           05  ACAT-ACPT-RECS           PIC 9(11) VALUE 0.                      
           05  ACAT-BATCH-COUNT         PIC 9(11) VALUE 0.                      
           05  NA-UPDATE-RECS           PIC 9(11) VALUE 0.                      
           05  PPMNT-REC-CNT            PIC 9(11) VALUE 0.                      
           05  MGNINT-REC-CNT           PIC 9(11) VALUE 0.                      
           05  DBSAVE-REC-CNT           PIC 9(11) VALUE 0.                      
LRM004     05  W-ACCTDEL-READ-CNT       PIC 9(11) VALUE 0.                      
LRM004     05  W-NACCTDEL-WRITTEN-CNT   PIC 9(11) VALUE 0.                      
ET0004     05  NA-ALTBR-UPDT-CNT        PIC 9(11) VALUE 0.                      
ET0004     05  NA-ALTBR-REVERSED-CNT    PIC 9(11) VALUE 0.                      
DJ0002     05  NA-DLVR-REVERSED-CNT     PIC 9(11) VALUE 0.                      
LRM006     05  NA-FILE-FND-CNT          PIC 9(11) VALUE 0.                      
LRM006     05  NA-FILE-NOT-FND-CNT      PIC 9(11) VALUE 0.                      
LRM006     05  NA-ACTIVE-FILE-FND-CNT   PIC 9(11) VALUE 0.                      
LRM010     05  WS-NAUP-WRAP-WRITTEN     PIC 9(11) VALUE 0.                      
LRM010     05  WS-NAUP-WRAP-READ        PIC 9(11) VALUE 0.                      
LRM010     05  WS-NAUP-WRAP-UPD-CNT     PIC 9(11) VALUE 0.                      
LRM004***NAWRAP RECORD LAYOUT LRECL=40                                          
LRM010 01  NAUP-WRAP-RECORD.                                                    
LRM010     05  NAUP-WRAP-CL            PIC X(03) VALUE SPACES.                  
LRM010     05  NAUP-WRAP-BR            PIC X(03).                               
LRM010     05  NAUP-WRAP-ACCT          PIC X(05).                               
LRM010     05  NAUP-WRAP-CONTROL-NBR   PIC X(14).                               
LRM010     05  NAUP-WRAP-ACAT-CODE     PIC X.                                   
LRM010     05  NAUP-FILLER             PIC X(28) VALUE SPACES.                  
                                                                                
LRM004***ACCTDEL RECORD LAYOUT LRECL=30                                         
LRM004 01  W-ACCTDEL-RECORD.                                                    
LRM004   03  W-ACCTDEL-REC.                                                     
LRM004     05  W-ACCTDEL-KEY.                                                   
LRM004         10  W-ACCTDEL-CLT-NBR     PIC X(04).                             
LRM004         10  W-ACCTDEL-BRANCH-NBR  PIC X(03).                             
LRM004         10  W-ACCTDEL-ACCT-NBR    PIC X(05).                             
LRM004     05  W-ACCTDEL-DATA            PIC X(18).                             
LRM004   03  W-ACCTDEL-DATE-REC REDEFINES W-ACCTDEL-REC.                        
LRM004     05  W-ACCTDEL-DATE-KEY        PIC X(12).                             
LRM004         88  W-ACCTDEL-DATEREC     VALUE LOW-VALUES.                      
LRM004     05  W-ACCTDEL-DATE-LIT        PIC X(05).                             
LRM004         88  W-ACCTDEL-DATELIT     VALUE 'DATE='.                         
LRM004     05  W-ACCTDEL-DATE-CYMD       PIC X(08).                             
LRM004     05  FILLER                    PIC X(05).                             
LRM004   03  W-ACCTDEL-TRLR-REC REDEFINES W-ACCTDEL-DATE-REC.                   
LRM004     05  W-ACCTDEL-TRLR-KEY        PIC X(12).                             
LRM004         88  W-ACCTDEL-TRLRREC     VALUE HIGH-VALUES.                     
LRM004     05  W-ACCTDEL-TRLR-LIT        PIC X(06).                             
LRM004         88  W-ACCTDEL-TRLRLIT     VALUE 'COUNT='.                        
LRM004     05  W-ACCTDEL-TRLR-COUNT      PIC 9(11).                             
LRM004     05  FILLER                    PIC X(01).                             
LRM004***                                                                       
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
           COPY STUBCPY.                                                        
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.            
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC X(122).                            
           05  ROLLBACK-RETURN           PIC S9(9) COMP.                        
               88  ROLLBACK-OK               VALUE +0.                          
               88  ROLLBACK-AB               VALUE -999 THRU -1                 
                                                   +1   THRU +999.              
           05  COMMIT-SQLCA              PIC X(122).                            
           05  COMMIT-RETURN             PIC S9(9) COMP.                        
               88  COMMIT-OK                 VALUE +0.                          
               88  COMMIT-AB                 VALUE -999 THRU -1                 
                                                   +1   THRU +999.              
           05  W-COMMIT-CTR              PIC 9(9) COMP-3                        
                                             VALUE 0.                           
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
                                                                                
       01  W-DB2-ERR-MSG-OUT.                                                   
           05  FILLER                   PIC X(04) VALUE '**  '.                 
           05  W-ERR-MSG-OUT            PIC X(50).                              
           05  FILLER                   PIC X(12) VALUE '=> SQLCODE: '.         
           05  W-SQLCODE-OUT            PIC -999.                               
           EJECT                                                                
      *01  ACAT-REC-WS                  PIC X(12)  VALUE 'ACAT-REC-WS'.         
      *COPY SIAC103.                                                            
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
LRM009     EXEC SQL                                                             
LRM009         INCLUDE VASSET                                                   
LRM009     END-EXEC.                                                            
DJ0002     EXEC SQL                                                             
DJ0002        INCLUDE VTRNHSTY                                                  
DJ0002     END-EXEC.                                                            
           EJECT                                                                
           EXEC SQL                                                             
             DECLARE  TFRCRSR  CURSOR FOR                                       
               SELECT                                                           
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
                  ,ACCT_TRNFR_FEE_AMT                                           
                  ,ACCT_IRA_TRMNT_AMT                                           
                  ,ACCT_IRA_MAINT_AMT                                           
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
LRM007            ,ADOPT_AGRMT_IND                                              
LRM008            ,RR_ORGNL_CD                                                  
LRM010            ,BRANCH_ALTNT_CD                                              
               FROM                                                             
                   VTRNFR                                                       
               WHERE                                                            
                   CLIENT_NBR = :WS-CLIENT-NBR                                  
               ORDER BY                                                         
                   DSTBN_SIDE_CD                                                
                  ,BRANCH_CD                                                    
                  ,ACCT_CD                                                      
ET0005            ,STTS_CD                                                      
           END-EXEC.                                                            
           EJECT                                                                
                                                                                
           COPY BPDATESC.                                                       
           EJECT                                                                
           COPY BHINFO.                                                         
           EJECT                                                                
           COPY BHICS.                                                          
           EJECT                                                                
           COPY BHBTS2.                                                         
           EJECT                                                                
           COPY BHNA2.                                                          
           EJECT                                                                
           COPY BHACAT.                                                         
           EJECT                                                                
           COPY BHMISC2.                                                        
LRM007     COPY BHREQ.                                                          
                                                                                
           EJECT                                                                
      * NAME AND ADDRESS FILE AREAS                                             
       COPY GETNACOB.                                                           
       01  GETNA-SEGMENT-INCLUDES.                                              
       COPY NASEGHDR.                                                           
       COPY NASEGPPA.                                                           
       COPY NASEGPPB.                                                           
       COPY NNASGRPC.                                                           
ET0004 COPY NASEGPPI.                                                           
ET0004 COPY NNASGRPB.                                                           
ET0004 COPY NNASGRPE.                                                           
LRM007 COPY NNASGPPN.                                                           
       COPY NASEGEND.                                                           
           EJECT                                                                
      * NAME AND ADDRESS UPDATE AREAS                                           
       COPY NAUPDHDR.                                                           
       COPY NAUPDTLR.                                                           
       COPY NAUP10A0.                                                           
       COPY NAUP10A1.                                                           
       COPY NAUP10I0.                                                           
LRM022 COPY NAUP51A0.                                                           
ET0004 COPY NAUP51B0.                                                           
LRM025 COPY NAUP51C0.                                                           
LRM024 COPY NAUP51E0.                                                           
LRM018 COPY NAUP51E1.                                                           
           EJECT                                                                
LRM007 COPY  ESWWIRES.                                                          
LRM007 COPY  CATWIRE  REPLACING ==:WIRE:== BY ==WIRE==.                         
LRM007                                                                          
LRM007 01  WS-AUTOWIRE-HDR  PIC X(700).                                         
LRM007 01  WS-AUTOWIRE-TRL  PIC X(700).                                         
LRM007 01  WS-AUTOWIRE-REC-CNT            PIC 9(11) VALUE 0.                    
LRM007     COPY CP2WS.                                                          
LRM007     EJECT                                                                
      * DATABASE UPDATE KEY SAVE WORK AREA                                      
       01  DB-SAVE-WORK-REC.                                                    
           03  DB-SAVE-CLT-NBR            PIC X(04).                            
           03  DB-SAVE-ACAT-NBR           PIC X(14).                            
           03  DB-SAVE-NA-UPDATE-IND      PIC X(01).                            
           03  DB-SAVE-BRANCH             PIC X(03).                            
           03  DB-SAVE-ACCT               PIC X(05).                            
ET0004**   03  FILLER                     PIC X(03).                            
ET0004     03  DB-SAVE-RR-NBR             PIC X(03).                            
LRM006 EJECT                                                                    
LRM006 COPY GETNNACB REPLACING ==:PFX:== BY ==ACT-==.                           
LRM006 01  WS-GETNNA-CL-BRAC.                                                   
LRM006     05  WS-GETNNA-CLIENT   PIC X(3) VALUE LOW-VALUES.                    
LRM006     05  WS-GETNNA-BRAC     PIC X(8) VALUE LOW-VALUES.                    
LRM006 01  WS-SAVE-GETNA-SEGMENT-INCLUDES   PIC X(6000).                        
LRM006 01  WS-CUR-KEY.                                                          
LRM006     05  WS-CUR-CLIENT      PIC X(3).                                     
LRM006     05  WS-CUR-BRAC        PIC X(8).                                     
       EJECT                                                                    
      * MARGIN INTEREST REQUEST FILE UPDATE AREA                                
       COPY OLMIBKRQ  REPLACING ==:OLMIBKRQ:== BY ==MGNINT==.                   
           EJECT                                                                
      * PERIODIC PAYMENT FILE UPDATE AREA                                       
       COPY ACATPPS   REPLACING ==:ACATPPS:== BY ==PMNT==.                      
           EJECT                                                                
      * REPORT AREA                                                             
       01  HDR1.                                                                
           05  FILLER                  PIC X       VALUE SPACES.                
           05  FILLER                  PIC X(10)   VALUE ' CAT610 - '.          
           05  H1-CLIENT               PIC X(3).                                
           05  FILLER                  PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME          PIC X(30).                               
           05  FILLER                  PIC X(2)   VALUE SPACES.                 
           05  FILLER                  PIC X(75)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO                PIC ZZ9.                                 
                                                                                
       01  HDR2.                                                                
           05  FILLER                  PIC X(50) VALUE SPACES.                  
           05  FILLER                  PIC X(64) VALUE                          
               'PREMIER ACCOUNT TRANSFERS REPORT '.                             
           05  FILLER                  PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE.                                                    
               10  H2-MM               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-DD               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-YY               PIC X(2).                                
                                                                                
       01  HDR3.                                                                
           05  FILLER                  PIC X(55)  VALUE                         
               '       ACCOUNT           ACCOUNT TITLE '.                       
           05  FILLER                  PIC X(27)  VALUE                         
               'DATE OPENED '.                                                  
                                                                                
       01  DETAIL-LINE-1.                                                       
           05  FILLER                  PIC X(6)  VALUE SPACES.                  
           05  DL1-BRANCH              PIC X(3).                                
           05  DL1-DASH                PIC X     VALUE '-'.                     
           05  DL1-ACCOUNT             PIC X(5).                                
           05  FILLER                  PIC X(4)  VALUE SPACES.                  
           05  DL1-ACCT-TITLE          PIC X(30).                               
           05  FILLER                  PIC X(8)  VALUE SPACES.                  
           05  DL1-DATE-OPENED.                                                 
               10  DL1-DO-MM           PIC X(2).                                
               10  DL1-SL1             PIC X     VALUE '/'.                     
               10  DL1-DO-DD           PIC X(2).                                
               10  DL1-SL2             PIC X     VALUE '/'.                     
               10  DL1-DO-YY           PIC X(2).                                
                                                                                
       01  HDR1-2.                                                              
           05                          PIC X       VALUE SPACES.                
ET0001**   05                          PIC X(10)   VALUE ' CAT610 - '.          
ET0001     05  FILLER                  PIC X       VALUE SPACES.                
ET0001     05  H1-PGM-2                PIC X(6).                                
ET0001     05  FILLER                  PIC X(3)    VALUE ' - '.                 
           05  H1-CLIENT-2             PIC X(3).                                
           05                          PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME-2        PIC X(30).                               
           05                          PIC X(2)   VALUE SPACES.                 
           05                          PIC X(75)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05                          PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO-2              PIC ZZ9.                                 
                                                                                
       01  HDR2-2.                                                              
           05                          PIC X(50) VALUE SPACES.                  
           05                          PIC X(64) VALUE                          
               '    NAME & ADDRESS UPDATE REPORT '.                             
           05                          PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE-2.                                                  
               10  H2-MM-2             PIC X(2).                                
               10                      PIC X     VALUE '/'.                     
               10  H2-DD-2             PIC X(2).                                
               10                      PIC X     VALUE '/'.                     
               10  H2-YY-2             PIC X(2).                                
                                                                                
ET0004 01  HDR2-3.                                                              
ET0004     05                          PIC X(50) VALUE SPACES.                  
ET0004     05                          PIC X(64) VALUE                          
ET0004         'NAME & ADDRESS ALT BR & RR# UPDATE REPORT'.                     
ET0004     05                          PIC X(5)  VALUE 'DATE '.                 
ET0004     05  H2-PROC-DATE-3.                                                  
ET0004         10  H2-MM-3             PIC X(2).                                
ET0004         10                      PIC X     VALUE '/'.                     
ET0004         10  H2-DD-3             PIC X(2).                                
ET0004         10                      PIC X     VALUE '/'.                     
ET0004         10  H2-YY-3             PIC X(2).                                
ET0004                                                                          
       01  HDR3-2.                                                              
           05  PIC X(10) VALUE ' '.                                             
           05                          PIC X(52)  VALUE                         
               '       ACCOUNT       DIV CODE      SELL CODE'.                  
C05759     05                          PIC X(52)  VALUE                         
ET0002         'CASH SWEEP     REJECTED    BUSNES STOP DATE'.                   
                                                                                
ET0004 01  HDR3-3.                                                              
ET0004     05                          PIC X(21) VALUE ' '.                     
ET0004     05                          PIC X(44)  VALUE                         
ET0004         'ACCOUNT       REJECTED      ALT-BR CHANGED  '.                  
ET0004     05                          PIC X(60)  VALUE                         
ET0004         'FROM   TO         RR# CHANGED   FROM   TO'.                     
                                                                                
ET0004 01  HDR3-4.                                                              
ET0004     05                          PIC X(21) VALUE ' '.                     
ET0004     05                          PIC X(44)  VALUE                         
ET0004         'ACCOUNT       REJECTED      ALT-BR REVERSED '.                  
ET0004     05                          PIC X(60)  VALUE                         
ET0004         'TO                RR# REVERSED  TO'.                            
                                                                                
       01  DETAIL-LINE-2.                                                       
           05                          PIC X(16)  VALUE SPACES.                 
           05  DL2-BRANCH              PIC X(3).                                
           05  DL2-DASH                PIC X     VALUE '-'.                     
           05  DL2-ACCOUNT             PIC X(5).                                
           05                          PIC X(8)  VALUE SPACES.                  
           05  DL2-DIV-CODE            PIC X(1).                                
           05                          PIC X(15)  VALUE SPACES.                 
           05  DL2-SELL-CODE           PIC X(2).                                
           05                          PIC X(15)  VALUE SPACES.                 
C05759     05  DL2-CASH-SWEEP          PIC X(1).                                
C05759     05                          PIC X(15)  VALUE SPACES.                 
           05  DL2-REJ-IND             PIC X(1).                                
ET0002     05                          PIC X(8).                                
ET0002     05  DL2-BUS-STOP-DT         PIC X(10).                               
ET0004                                                                          
ET0004 01  DETAIL-LINE-3.                                                       
ET0004     05                          PIC X(20) VALUE ' '.                     
ET0004     05  DL3-BRANCH              PIC X(3).                                
ET0004     05  DL3-DASH                PIC X     VALUE '-'.                     
ET0004     05  DL3-ACCOUNT             PIC X(5).                                
ET0004     05                          PIC X(09) VALUE SPACE.                   
ET0004     05  DL3-REJ-IND             PIC X(1).                                
ET0004     05                          PIC X(19) VALUE SPACE.                   
ET0004     05  DL3-ALTBR-IND           PIC X(1).                                
ET0004     05                          PIC X(06) VALUE SPACE.                   
ET0004     05  DL3-ALTBR-FROM          PIC X(5).                                
ET0004     05                          PIC X(02) VALUE SPACE.                   
ET0004     05  DL3-ALTBR-TO            PIC X(5).                                
ET0004     05                          PIC X(11) VALUE SPACE.                   
ET0004     05  DL3-RR-IND              PIC X(1).                                
ET0004     05                          PIC X(08) VALUE SPACE.                   
ET0004     05  DL3-RR-FROM             PIC X(3).                                
ET0004     05                          PIC X(04) VALUE SPACE.                   
ET0004     05  DL3-RR-TO               PIC X(3).                                
                                                                                
ET0004 01  DETAIL-LINE-4.                                                       
ET0004     05                          PIC X(20) VALUE ' '.                     
ET0004     05  DL4-BRANCH              PIC X(3).                                
ET0004     05  DL4-DASH                PIC X     VALUE '-'.                     
ET0004     05  DL4-ACCOUNT             PIC X(5).                                
ET0004     05                          PIC X(09) VALUE SPACE.                   
ET0004     05  DL4-REJ-IND             PIC X(1).                                
ET0004     05                          PIC X(19) VALUE SPACE.                   
ET0004     05  DL4-ALTBR-REV           PIC X(1).                                
ET0004     05                          PIC X(6)  VALUE SPACE.                   
ET0004     05  DL4-ALTBR-REV-TO        PIC X(5).                                
ET0004     05                          PIC X(18) VALUE SPACE.                   
ET0004     05  DL4-RR-REV              PIC X(1).                                
ET0004     05                          PIC X(08) VALUE SPACE.                   
ET0004     05  DL4-RR-REV-TO           PIC X(3).                                
                                                                                
       01  MSG-LINE                    PIC X(133).                              
                                                                                
       01  NO-ACTV-LINE.                                                        
           05  FILLER                  PIC X(40)  VALUE SPACES.                 
           05  NAL-MSG                 PIC X(90).                               
                                                                                
       01  PRINTAREA.                                                           
           05  PRINTSPACE.                                                      
               10  CC                  PIC X.                                   
               10  PRINT-AREA          PIC X(132).                              
           05  TRACSPACE.                                                       
               10  TRAC-CLI            PIC 9(3) COMP-3.                         
               10  TRAC-CNTL           PIC 9(3) COMP-3.                         
               10  FILLER              PIC X(6) VALUE SPACES.                   
                                                                                
           EJECT                                                                
      *                                                                         
      *  REPORT DATA AREA                                                       
      *                                                                         
       01  ACAT-DATA-REC.                                                       
C11582*    05  ADR-CLIENT              PIC X(3).                                
C11582     05  ADR-CLIENT              PIC 9(3).                                
           05  ADR-CONTROLLER          PIC 9(3).                                
           05  ADR-BRANCH              PIC X(3).                                
           05  ADR-ACCOUNT             PIC X(5).                                
           05  ADR-CLIENT-NAME         PIC X(30).                               
           05  ADR-ACCT-TITLE          PIC X(90).                               
           05  ADR-DATE-OPENED         PIC X(8).                                
           05  FILLER                  PIC X(8).                                
                                                                                
       01  TEMP-DATA-REC.                                                       
C11582*    05  TEMP-CLIENT                PIC X(3).                             
C11582     05  TEMP-CLIENT                PIC 9(3).                             
           05  TEMP-BRANCH                PIC X(3).                             
           05  TEMP-ACCOUNT               PIC X(5).                             
           05  TEMP-CLIENT-NAME           PIC X(30).                            
           05  TEMP-DIV-CODE              PIC X(1).                             
           05  TEMP-SELL-CODE             PIC X(2).                             
C05759     05  TEMP-CASH-SWEEP            PIC X(1).                             
           05  TEMP-REJ-IND               PIC X(1).                             
ET0002     05  TEMP-BUS-STOP-DT           PIC X(10).                            
ET0004     05  TEMP-ALTBR-CHNG-IND        PIC X(01).                            
ET0004     05  TEMP-ALTBR-FROM            PIC X(05).                            
ET0004     05  TEMP-ALTBR-TO              PIC X(05).                            
ET0004     05  TEMP-RR-CHNG-IND           PIC X(01).                            
ET0004     05  TEMP-RR-FROM               PIC X(03).                            
ET0004     05  TEMP-RR-TO                 PIC X(03).                            
ET0004**   05                             PIC X(24).                            
ET0004     05                             PIC X(06).                            
                                                                                
LRM014 01  WS-TOMORROW-TYPE-OF-DAY     PIC X.                                   
LRM014     88  WS-TOMORROW-TRADE-DAY-ONLY   VALUE '1'.                          
                                                                                
       01  PROC-DATE.                                                           
           05  PD-CC                   PIC X(2).                                
           05  PD-YY                   PIC X(2).                                
           05  PD-MM                   PIC X(2).                                
           05  PD-DD                   PIC X(2).                                
                                                                                
       01  PROC-DATE-N  REDEFINES PROC-DATE  PIC 9(8).                          
                                                                                
ET0002 01  PROC-DATE-EDITED.                                                    
ET0002     05  PD-EDITED-CC            PIC X(02).                               
ET0002     05  PD-EDITED-YY            PIC X(02).                               
ET0002     05  FILLER                  PIC X(01) VALUE '/'.                     
ET0002     05  PD-EDITED-MM            PIC X(02).                               
ET0002     05  FILLER                  PIC X(01) VALUE '/'.                     
ET0002     05  PD-EDITED-DD            PIC X(02).                               
       01  CURRENT-DATE.                                                        
           05  CUR-YY                  PIC X(2).                                
           05  CUR-MM                  PIC X(2).                                
           05  CUR-DD                  PIC X(2).                                
                                                                                
       01  CURRENT-TIME.                                                        
           05  CUR-HR                  PIC X(2).                                
           05  CUR-MN                  PIC X(2).                                
           05  CUR-SS                  PIC X(2).                                
           05  CUR-HS                  PIC X(2).                                
                                                                                
       01  WORK-DATE.                                                           
           05  WK-CC                   PIC 9(2).                                
           05  WK-YY                   PIC 9(2).                                
           05  WK-MM                   PIC 9(2).                                
           05  WK-DD                   PIC 9(2).                                
                                                                                
       01  EDIT-CURRENT-DATE.                                                   
           05  EDIT-CUR-MM             PIC X(2).                                
           05  EDIT-CUR-DD             PIC X(2).                                
           05  EDIT-CUR-YY             PIC X(2).                                
                                                                                
       01  TODAYS-DATE.                                                         
           05  TODAYS-CC               PIC X(2).                                
           05  TODAYS-YYMMDD           PIC X(6).                                
                                                                                
       01  SETTLE-DATE.                                                         
           05  SETTLE-CCYY             PIC X(4).                                
           05  SETTLE-MM               PIC X(2).                                
           05  SETTLE-DD               PIC X(2).                                
                                                                                
       01  BR-ACCT-TEST-AREA.                                                   
           05  BR-ACCT-IN              PIC X(15).                               
           05  FILLER REDEFINES BR-ACCT-IN.                                     
               10  B-CHAR OCCURS 15 TIMES                                       
                                       PIC X.                                   
           05  BR-ACCT-CNV             PIC X(8).                                
           05  FILLER REDEFINES BR-ACCT-CNV.                                    
               10  C-CHAR OCCURS 8 TIMES                                        
                                       PIC X.                                   
           EJECT                                                                
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(03).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-NA-UPD-DELV           PIC X.                              
               05  B1-NA-UPD-RECV           PIC X.                              
               05  B1-NA-UPD-PREMIER        PIC X.                              
               05  B1-NA-UPD-BNK-AUTO       PIC X.                              
               05  B1-SUBMIT-ASSETS         PIC X.                              
               05  B1-CL-HIT                PIC X.                              
               05  B1-PERIODIC-PAYMENT      PIC X.                              
               05  B1-MARGIN-INT            PIC X.                              
LRM002**       05  B1-REFRESH-ASSETS        PIC X.                              
LRM003*********05  B1-WEALTH-MGMT-ACCT      PIC X(08).                          
LRM004         05  B1-NA-UPDATE-PURGE       PIC X.                              
ET0004         05  B1-UPD-RR-FROM-ALT-BR-TB PIC X.                              
LRM007         05  B1-REQ-AUTO-WIRES-PROC   PIC X.                              
LRM009         05  B1-ACAT-NA-UPD-90DR      PIC X.                              
LRM022         05  B1-ACCOUNT-CLOSE-UPDATE  PIC X.                              
LRM024         05  B1-NA-UPD-RSTRCT-CODE    PIC X.                              
LRM027         05  B1-ASCENDIS-USER         PIC X.                              
                                                                                
       01  B1-WRK-TABLE-AREA.                                                   
           03  B1-WRK-TABLE.                                                    
               05  B1-WRK-ADP-CL-NO         PIC 9(03).                          
               05  B1-WRK-BKR-CLR-NO        PIC X(04).                          
               05  B1-WRK-CLI-NAME          PIC X(30).                          
               05  B1-WRK-NA-UPD-DELV       PIC X.                              
               05  B1-WRK-NA-UPD-RECV       PIC X.                              
               05  B1-WRK-NA-UPD-PREMIER    PIC X.                              
               05  B1-WRK-NA-UPD-BNK-AUTO   PIC X.                              
               05  B1-WRK-SUBMIT-ASSETS     PIC 9.                              
               05  B1-WRK-CL-HIT            PIC X.                              
               05  B1-WRK-PERIODIC-PAYMENT  PIC X.                              
               05  B1-WRK-MARGIN-INT        PIC X.                              
LRM002**       05  B1-WRK-REFRESH-ASSETS    PIC X.                              
LRM003*********05  B1-WRK-WEALTH-MGMT-ACCT  PIC X(08).                          
LRM004         05  B1-WRK-NA-UPDATE-PURGE   PIC X.                              
ET0004         05  B1-WRK-ALTBR             PIC X.                              
LRM007         05  B1-WRK-AUTO-WIRES-PROC   PIC X.                              
LRM009         05  B1-WRK-ACAT-NA-UPD-90DR  PIC X.                              
LRM022         05  B1-WRK-ACCOUNT-CLOSE-UPDATE  PIC X.                          
LRM024         05  B1-WRK-NA-UPD-RSTRCT-CODE    PIC X.                          
LRM027         05  B1-WRK-ASCENDIS-USER         PIC X.                          
                                                                                
LRM003*01  WS-WEALTH-MNGT-WORKAREA.                                             
LRM003*****05  WS-WEALTH-MNGT-AC         PIC X(08) VALUE '00000000'.            
                                                                                
           EJECT                                                                
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
ET0001***      88  PARM-LENGTH-VALID                    VALUE +2.               
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID                VALUES ARE              
                       'A' THRU 'Z' '0' THRU '9'.                               
               10  PARM-ABEND               PIC X.                              
                   88  NO-ABEND                         VALUE 'N'.              
                   88  YES-ABEND                        VALUE 'Y'.              
ET0001         10  PARM-CYCLE-RUN           PIC X.                              
ET0004         10  PARM-CYCLE-NBR           PIC XX.                             
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
       MAINLINE SECTION.                                                        
           DISPLAY 'CAT610 - CREATE NAME/ADDRESS UPDATE CARD      '.            
           DISPLAY '         CREATE NAME/ADDRESS UPDATE REPORT    '.            
           DISPLAY '         CREATE MARGIN INTEREST FEED          '.            
           DISPLAY '         CREATE PERIODIC PAYMENT FEED         '.            
           DISPLAY '         CREATE N/A DELETE FILE               '.            
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM  100-HOUSEKEEPING THRU                                       
                    100-HOUSEKEEPING-EXIT.                                      
                                                                                
           PERFORM  200-INIT-B1-LOOP THRU                                       
                    200-INIT-B1-LOOP-EXIT.                                      
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT610: SORT INPUT PROCEDURE #1 PREMIER-REPORT'             
           SORT  SORT-FILE                                                      
                 ASCENDING KEY  S-CLIENT                                        
                                S-CONTROLLER                                    
                                S-BRANCH                                        
                                S-ACCOUNT                                       
                  INPUT PROCEDURE  300-PROCESS-ACAT-FILE THRU                   
                                   300-EXIT                                     
                 OUTPUT PROCEDURE  1400-PREMIER-REPORT THRU                     
                                   1400-PREMIER-REPORT-EXIT.                    
                                                                                
           IF SORT-RETURN NOT = ZERO                                            
             DISPLAY 'FIRST INTERNAL SORT FAILED, SORT RC = '                   
                     SORT-RETURN                                                
                     CALL ABEND USING ABEND-CODE-8000.                          
                                                                                
           CLOSE TEMP-FILE.                                                     
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT610: SORT INPUT PROCEDURE #2 NAUPDT-REPORT'              
           SORT  SORT-FILE-2                                                    
                 ASCENDING KEY  S-CLIENT-2                                      
                                S-REJ-IND-2                                     
                                S-BRANCH-2                                      
                                S-ACCOUNT-2                                     
                            USING  TEMP-FILE                                    
                 OUTPUT PROCEDURE  1500-NAUPDT-REPORT THRU                      
                                   1500-NAUPDT-REPORT-EXIT.                     
                                                                                
           IF SORT-RETURN NOT = ZERO                                            
             DISPLAY 'SECOND INTERNAL SORT FAILED, SORT RC = '                  
                     SORT-RETURN                                                
                     CALL ABEND USING ABEND-CODE-8000.                          
                                                                                
           PERFORM  1900-ENDJOB-ROUTINE                                         
              THRU  1900-ENDJOB-ROUTINE-EXIT.                                   
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       100-HOUSEKEEPING.                                                        
      ******************                                                        
                                                                                
ET0001     IF PARM-LENGTH NOT GREATER ZERO                                      
               DISPLAY 'PARM NOT RECEIVED - CAT610 ABENDED'                     
               CALL ABEND          USING ABEND-CODE-2000.                       
                                                                                
           DISPLAY 'PARM-STREAM    = ' PARM-STREAM                              
           DISPLAY 'PARM-ABEND     = ' PARM-ABEND                               
           DISPLAY 'PARM-CYCLE-RUN = ' PARM-CYCLE-RUN                           
ET0004     DISPLAY 'PARM-CYCLE-NBR = ' PARM-CYCLE-NBR.                          
                                                                                
           IF PARM-STREAM-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'                
             DISPLAY 'PROGRAM CAT610 ABENDED '                                  
             CALL ABEND          USING ABEND-CODE-2000.                         
                                                                                
           IF PARM-ABEND = 'N' OR 'Y'                                           
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM-ABEND INVALID MUST BE 1 CHAR N OR Y'                 
             DISPLAY 'PROGRAM CAT610 ABENDED '                                  
             CALL ABEND          USING ABEND-CODE-2000.                         
                                                                                
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.                
           MOVE  'C'                     TO BPDATES-REQ-TYPE.                   
C11582     CALL   BPDATES             USING BPDATES-PARAMETERS.                 
                                                                                
           MOVE  BPD-PROC-DATE           TO  PROC-DATE                          
LRM013                                       WS-TODAY-CCYYMMDD.                 
                                                                                
           DISPLAY 'PROCESS DATE   = ' BPD-PROC-DATE.                           
                                                                                
ET0002     MOVE PD-CC   TO  PD-EDITED-CC.                                       
ET0002     MOVE PD-YY   TO  PD-EDITED-YY.                                       
ET0002     MOVE PD-MM   TO  PD-EDITED-MM.                                       
ET0002     MOVE PD-DD   TO  PD-EDITED-DD.                                       
ET0003                                                                          
ET0003     MOVE BPD-JULIAN-PROC-DATE  TO WK-TODAY-JULIAN-DT.                    
                                                                                
LRM013     PERFORM 795-CALC-DATE-MINUS1-RTN.                                    
                                                                                
LRM014     PERFORM 796-CALC-DATE-PLUS1-RTN.                                     
LRM014     DISPLAY 'BPDATES TOMORROW TYPE OF DAY '                              
LRM014                         WS-TOMORROW-TYPE-OF-DAY                          
LRM014     IF WS-TOMORROW-TRADE-DAY-ONLY                                        
LRM011        DISPLAY 'TOMORROW IS BANK HOLIDAY / TRADE DAY ONLY'               
LRM011     ELSE                                                                 
LRM014        DISPLAY 'TOMORROW IS NON BANK HOLIDAY'                            
LRM011     END-IF.                                                              
LRM004     OPEN INPUT ACCTDEL-FILE                                              
LRM010                NAUP-WRAP-FILE-IN                                         
ET0004                ALTBR-FILE.                                               
                                                                                
LRM019     PERFORM 490-READ-NAWRAP-INPUT                                        
LRM019        THRU 490-EXIT.                                                    
                                                                                
           OPEN OUTPUT NA-UPDATE-FILE                                           
                       DB-SAVE-FILE                                             
                       MGN-INT-FILE                                             
                       PAYMENT-FILE                                             
                       TEMP-FILE                                                
                       REPORT-FILE-2                                            
                       REPORT-FILE                                              
ET0004                 ALTBR-REPT-FILE                                          
LRM007                 AUTOWIRE-FILE                                            
LRM010                 NAUP-WRAP-FILE-OUT                                       
LRM004                 NACCTDEL-FILE.                                           
                                                                                
LRM004     PERFORM 480-READ-ACCTDEL-FILE THRU 480-EXIT                          
LRM004     IF  NOT ACCTDEL-EOF                                                  
LRM004         IF  W-ACCTDEL-KEY = LOW-VALUES                                   
LRM004             DISPLAY 'W-ACCTDEL-DATE = ' W-ACCTDEL-DATE-CYMD              
LRM004             WRITE NACCTDEL-RECORD FROM W-ACCTDEL-REC                     
LRM004             PERFORM 480-READ-ACCTDEL-FILE THRU 480-EXIT                  
LRM004         END-IF                                                           
LRM004     END-IF.                                                              
                                                                                
           ACCEPT CURRENT-DATE FROM DATE.                                       
           MOVE CURRENT-DATE TO TODAYS-YYMMDD.                                  
           IF CUR-YY > '80' AND  <= '99'                                        
              MOVE '19' TO TODAYS-CC                                            
           ELSE                                                                 
              MOVE '20' TO TODAYS-CC.                                           
TEST****** MOVE BPD-PROC-DATE TO TODAYS-DATE.                                   
                                                                                
           ACCEPT CURRENT-TIME FROM TIME.                                       
                                                                                
           INITIALIZE B1-TABLE-AREA.                                            
                                                                                
      * SETUP NAME ADDRESS UPDATE HEADER RECORD                                 
                                                                                
           MOVE PD-YY      TO  NAUP-H-PROC-YY                                   
                               NAUP-T-PROC-YY                                   
ET0004                         H2-YY-3                                          
                               H2-YY  H2-YY-2.                                  
           MOVE PD-MM      TO  NAUP-H-PROC-MM                                   
                               NAUP-T-PROC-MM                                   
ET0004                         H2-MM-3                                          
                               H2-MM  H2-MM-2.                                  
           MOVE PD-DD      TO  NAUP-H-PROC-DD                                   
                               NAUP-T-PROC-DD                                   
ET0004                         H2-DD-3                                          
                               H2-DD  H2-DD-2.                                  
                                                                                
           MOVE CUR-YY     TO  NAUP-H-SYS-YY                                    
                               NAUP-T-SYS-YY                                    
                               EDIT-CUR-YY.                                     
           MOVE CUR-MM     TO  NAUP-H-SYS-MM                                    
                               NAUP-T-SYS-MM                                    
                               EDIT-CUR-MM.                                     
           MOVE CUR-DD     TO  NAUP-H-SYS-DD                                    
                               NAUP-T-SYS-DD                                    
                               EDIT-CUR-DD.                                     
                                                                                
           MOVE CUR-HR     TO  NAUP-H-SYS-HH                                    
                               NAUP-T-SYS-HH.                                   
           MOVE CUR-MN     TO  NAUP-H-SYS-MN                                    
                               NAUP-T-SYS-MN.                                   
           MOVE CUR-SS     TO  NAUP-H-SYS-SS                                    
                               NAUP-T-SYS-SS.                                   
                                                                                
           MOVE SPACES     TO  NAUP-H-DATA-SET-NAME.                            
ET0001**   MOVE 'CAT610'   TO  NAUP-H-PROGRAM-IO                                
ET0001**                       NAUP-T-PROGRAM-IO.                               
ET0001     IF PARM-CYCLE-RUN = 'Y'                                              
ET0001        MOVE 'CAT611' TO  NAUP-H-PROGRAM-IO                               
ET0001                          NAUP-T-PROGRAM-IO                               
ET0001     ELSE                                                                 
ET0001        MOVE 'CAT610' TO  NAUP-H-PROGRAM-IO                               
ET0001                          NAUP-T-PROGRAM-IO.                              
           MOVE 999        TO  NAUP-H-CLIENT-NUM                                
                               NAUP-T-CLIENT-NUM.                               
                                                                                
           WRITE NA-UPDATE-REC FROM NAUPDHDR-REC.                               
                                                                                
LRM006     IF PARM-CYCLE-RUN = 'Y'                                              
LRM006        INITIALIZE ACT-GETNA-PARAMETERS                                   
LRM006********MOVE  'CAT610'    TO   ACT-GETNA-PGM-NAME                         
LRM006        MOVE  'D'         TO   ACT-GETNNA-DEVICE-ID                       
LRM006        MOVE  'Q'         TO   ACT-GETNNA-FILE-TYPE                       
LRM006        MOVE  'S'         TO   ACT-GETNNA-ACCESS-IND                      
LRM006        MOVE  'A'         TO   ACT-GETNNA-REQ-FILE                        
LRM006        MOVE  'N'         TO   ACT-GETNNA-REQ-YEAREND                     
LRM006     END-IF.                                                              
                                                                                
LRM007     MOVE 'H'               TO CP2-REQUEST-CODE.                          
LRM007     MOVE 'CAT610'          TO CP2-PROGRAM-ID.                            
LRM007     MOVE 999               TO CP2-CLIENT-NUMBER.                         
LRM007     CALL P2HDTR   USING CP2-AREA AUTOWIRE-FILE                           
LRM007     MOVE CP2-RETURN-RECORD TO WS-AUTOWIRE-HDR                            
LRM007     WRITE AUTOWIRE-REC   FROM WS-AUTOWIRE-HDR.                           
LRM007     MOVE SPACES TO ESWWIRE-MSG WIRE-ACAT-RECORD.                         
       100-HOUSEKEEPING-EXIT. EXIT.                                             
           EJECT                                                                
      ***************                                                           
       200-INIT-B1-LOOP.                                                        
      ***************                                                           
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY  'B1 TABLE VALUES'.                                          
           MOVE 0                      TO  B1-TBL-CNT.                          
           ADD  1                      TO  B1-SUB.                              
           PERFORM  UNTIL  B1-SUB  >  500                                       
                                                                                
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO             
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N                
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE            
             MOVE  ' '                    TO  BH-B2-INFO-ID                     
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO             
             END-CALL                                                           
                                                                                
             IF  BH-BROKER-ACTIVE                                               
                                                                                
               IF  PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR                
                   MOVE  ' '                 TO  BH-ICS-INFO                    
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '501000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ICS-INFO                    
                   END-CALL                                                     
                                                                                
                   MOVE  ' '                 TO  BH-BTS2-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '434500'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-ACAT-INFO                   
                   END-CALL                                                     
                                                                                
                  IF  BH-ACAT-ACTIVE                                            
                                                                                
                   MOVE  ' '                 TO  BH-BTS2-INFO                   
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '511000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-BTS2-INFO                   
                   END-CALL                                                     
                                                                                
                   IF  BH-ACAT-SERVICE-STATUS > '0'              AND            
                       (BH-ACAT-NA-UPD-ENTRY-DELIVERS  NOT = '0' OR             
                        BH-ACAT-NA-UPD-ENTRY-RECEIVES  NOT = '0' OR             
                        (BH-ACAT-SUBMIT-ASSETS = '1' OR '2' OR '3'))            
                       ADD 1       TO B1-TBL-CNT                                
                       MOVE  B1-SUB                              TO             
                             B1-ADP-CL-NO               (B1-TBL-CNT)            
                       MOVE  BH-BROKER-NAME                      TO             
                             B1-CLI-NAME                (B1-TBL-CNT)            
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO             
                             B1-BKR-CLR-NO              (B1-TBL-CNT)            
                             BH-BROKER-OLD-CLEARING-HOUSE (2:4)                 
LRM009                 MOVE  BH-ACAT-NA-UPD-90DR                 TO             
LRM009                       B1-ACAT-NA-UPD-90DR        (B1-TBL-CNT)            
LRM027                 MOVE  BH-ACAT-ASCENDIS-USER               TO             
LRM027                       B1-ASCENDIS-USER           (B1-TBL-CNT)            
                                                                                
                   MOVE  ' '                 TO  BH-NA2-INFO                    
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         
                   MOVE  '581000'            TO  BH-B2-INFO-ID                  
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-NA2-INFO                    
                   END-CALL                                                     
                                                                                
                   MOVE  BH-ACAT-NA-UPD-ENTRY-DELIVERS       TO                 
                             B1-NA-UPD-DELV             (B1-TBL-CNT)            
                   MOVE  BH-ACAT-NA-UPD-ENTRY-RECEIVES       TO                 
                             B1-NA-UPD-RECV             (B1-TBL-CNT)            
                   MOVE  BH-ACAT-SUBMIT-ASSETS               TO                 
                             B1-SUBMIT-ASSETS           (B1-TBL-CNT)            
                   MOVE BH-ACAT-PERIODIC-PAYMENT            TO                  
                             B1-PERIODIC-PAYMENT        (B1-TBL-CNT)            
LRM004             MOVE BH-ACAT-NA-UPDATE-PURGE             TO                  
LRM004                       B1-NA-UPDATE-PURGE         (B1-TBL-CNT)            
ET0004             MOVE BH-ACAT-UPD-RR-FROM-ALT-BR-TB       TO                  
ET0004                       B1-UPD-RR-FROM-ALT-BR-TB   (B1-TBL-CNT)            
LRM022             MOVE BH-ACAT-ACCOUNT-CLOSE-UPDATE        TO                  
LRM022                       B1-ACCOUNT-CLOSE-UPDATE    (B1-TBL-CNT)            
LRM024             MOVE BH-ACAT-NA-UPD-RSTRCT-CODE          TO                  
LRM024                       B1-NA-UPD-RSTRCT-CODE      (B1-TBL-CNT)            
LRM002**           MOVE BH-ACAT-REFRESH-ASSETS              TO                  
LRM002**                     B1-REFRESH-ASSETS          (B1-TBL-CNT)            
      **           MOVE '0'   TO B1-MARGIN-INT      (B1-TBL-CNT)                
                                                                                
                   IF BH-NA2-ACTIVE                                             
                       MOVE  BH-NA2-BANK-SCREEN-AUTO-FLIP        TO             
                             B1-NA-UPD-BNK-AUTO         (B1-TBL-CNT)            
                   END-IF                                                       
                                                                                
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
                   MOVE  '017'               TO  BH-LOGICAL-RECORD-CODE         
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
                                                 BH-MISC-INFO-2                 
                   END-CALL                                                     
                   IF BH-MI-ACTIVE                                              
                      MOVE BH-MI-BOOK-INT-BASED-ON-ACAT       TO                
                           B1-MARGIN-INT              (B1-TBL-CNT)              
                   END-IF                                                       
LRM007             MOVE  ' '                 TO  BH-B2-INFO-ID                  
LRM007             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N             
LRM007             MOVE  '114'               TO  BH-LOGICAL-RECORD-CODE         
LRM007             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,         
LRM007                                           BH-REQ-INFO                    
LRM007             END-CALL                                                     
LRM007             IF BH-REQ-ACTIVE                                             
LRM007                MOVE BH-REQ-AUTO-WIRES-PROC TO                            
LRM007                        B1-REQ-AUTO-WIRES-PROC (B1-TBL-CNT)               
LRM007             ELSE                                                         
LRM007                MOVE '0'  TO  B1-REQ-AUTO-WIRES-PROC (B1-TBL-CNT)         
LRM007             END-IF                                                       
LRM007***** FORCE OFF WIRES CREATION WHEN ACATS B1 434696 SAYS NO:              
LRM007             IF BH-ACAT-DO-NOT-CRT-AUTO-WIRES = '1'                       
LRM007             AND B1-REQ-AUTO-WIRES-PROC (B1-TBL-CNT) = '1'                
LRM007                MOVE '0'  TO  B1-REQ-AUTO-WIRES-PROC (B1-TBL-CNT)         
LRM007                DISPLAY 'B1 434696=1 TURNS OFF 32960 AUTO WIRES'          
LRM007             END-IF                                                       
LRM004*************DISPLAY  B1-TABLE (B1-TBL-CNT)                               
LRM004             DISPLAY 'CLT=' B1-ADP-CL-NO      (B1-TBL-CNT)                
LRM004                       ' '  B1-BKR-CLR-NO     (B1-TBL-CNT)                
LRM004                       ' '  B1-CLI-NAME       (B1-TBL-CNT)                
LRM004             DISPLAY '        BH-ACAT-SUBMIT-ASSETS        '              
LRM004             '(434516) = ' B1-SUBMIT-ASSETS    (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-ACAT-NA-UPD-ENTRY-DELIVERS'              
LRM004             '(434589) = ' B1-NA-UPD-DELV      (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-ACAT-NA-UPD-ENTRY-RECEIVES'              
LRM004             '(434590) = ' B1-NA-UPD-RECV      (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-ACAT-NA-UPDATE-PURGE      '              
LRM004             '(434688) = ' B1-NA-UPDATE-PURGE  (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-ACAT-PERIODIC-PAYMENT     '              
LRM004             '(434511) = ' B1-PERIODIC-PAYMENT (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-MI-BOOK-INT-BASED-ON-ACAT '              
LRM004             '(020158) = ' B1-MARGIN-INT       (B1-TBL-CNT)               
LRM004*****        DISPLAY '        BH-REQ-WEALTH-MGMT-OMNI-ACCT '              
LRM004*****        '(032977) = ' B1-WEALTH-MGMT-ACCT (B1-TBL-CNT)               
LRM004             DISPLAY '        BH-NA2-BANK-SCREEN-AUTO-FLIP '              
LRM004             '(581211) = ' B1-NA-UPD-BNK-AUTO  (B1-TBL-CNT)               
ET0004             DISPLAY '        B1-UPD-RR-FROM-ALT-BR-TB     '              
ET0004             '(434695) = ' B1-UPD-RR-FROM-ALT-BR-TB (B1-TBL-CNT)          
LRM007             DISPLAY '        B1-REQ-AUTO-WIRES-PROC W/OVRD'              
LRM007             '(032960) = ' B1-REQ-AUTO-WIRES-PROC   (B1-TBL-CNT)          
                  END-IF                                                        
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
             ADD  1                      TO  B1-SUB                             
           END-PERFORM.                                                         
           DISPLAY ' '.                                                         
           IF  B1-TBL-CNT =  0                                                  
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'               
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'                      
           END-IF.                                                              
                                                                                
           DISPLAY  'B1 TABLE COUNT - ' B1-TBL-CNT.                             
       200-INIT-B1-LOOP-EXIT.   EXIT.                                           
           EJECT                                                                
      *                                                                         
                                                                                
      *****************                                                         
       300-PROCESS-ACAT-FILE  SECTION.                                          
      *****************                                                         
                                                                                
           PERFORM  1010-MRGN-INT-HEADER-RTN.                                   
           PERFORM  1110-PAYMENT-HEADER-RTN.                                    
                                                                                
           PERFORM VARYING B1-SUB1 FROM 1 BY 1                                  
                     UNTIL B1-SUB1 GREATER B1-TBL-CNT                           
              PERFORM 500-SET-B1-TABLE                                          
              DISPLAY 'B1-WRK-TABLE - ' B1-WRK-TABLE                            
              MOVE WS-CLIENT-NBR TO CLIENT-NBR OF DCLVTRNFR                     
              PERFORM 410-OPEN-TFR-CURSOR-TBL                                   
              MOVE SPACE TO WK-TFR-EOF-SW                                       
              PERFORM 400-PROCESS-ACAT-TFR-TBL THRU 400-EXIT                    
                      UNTIL WK-TFR-EOF                                          
              PERFORM 430-CLOSE-TFR-CURSOR-TBL                                  
              IF SQLCODE = 0                                                    
                   CONTINUE                                                     
              ELSE                                                              
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
                   MOVE 'DB2 CURSOR STATEMENT CLOSE ERROR' TO                   
                                W-ERR-MSG-OUT                                   
                   MOVE SQLCODE TO W-SQLCODE-OUT                                
                   DISPLAY ' '                                                  
                   DISPLAY W-DB2-ERR-MSG-OUT                                    
                   DISPLAY '** PROGRAM CAT610 ABENDED '                         
                   CALL ABEND USING ABEND-CODE-5020                             
              END-IF                                                            
LRM010        PERFORM 490-PROCESS-NAWRAP-INPUT THRU 490-EXIT                    
LRM010          UNTIL NAWRAP-EOF                                                
LRM010              OR NAUP-WRAP-CL      > WS-CLIENT-NBR (2:3)                  
           END-PERFORM.                                                         
                                                                                
           PERFORM 1020-MRGN-INT-TRLR-RTN.                                      
                                                                                
      * DETERMINE IF REPORT RECORDS CREATED FOR CLIENTS                         
                                                                                
           PERFORM 575-B1-NOT-RPTING THRU                                       
                   575-B1-NOT-RPTING-EXIT                                       
                     VARYING B4-SUB FROM 1 BY 1                                 
                      UNTIL B4-SUB > B1-TBL-CNT.                                
                                                                                
       300-EXIT.                    EXIT.                                       
       EJECT                                                                    
                                                                                
       400-PROCESS-ACAT-TFR-TBL.                                                
LRM004     PERFORM UNTIL ACCTDEL-EOF                                            
LRM004       OR W-ACCTDEL-CLT-NBR > WS-CLIENT-NBR                               
LRM004        IF W-ACCTDEL-CLT-NBR = WS-CLIENT-NBR                              
LRM004           PERFORM 470-PURGE-NA-RTN THRU 470-EXIT                         
LRM021           IF GETNA-RETURN-FOUND                                          
LRM022             IF (B1-WRK-ACCOUNT-CLOSE-UPDATE = '0' OR '2')                
LRM018                PERFORM 495-UPDATE-NA-ACCT-CLOSE-RTN THRU 495-EXIT        
LRM021             END-IF                                                       
LRM022             IF (B1-WRK-NA-UPDATE-PURGE = '2'                             
LRM022             OR B1-WRK-ACCOUNT-CLOSE-UPDATE = '2')                        
LRM022                PERFORM 497-UPDATE-NA-ACH-DDA-RTN                         
LRM022                   THRU 497-EXIT                                          
LRM022             END-IF                                                       
LRM022           END-IF                                                         
LRM004        END-IF                                                            
LRM004        PERFORM 480-READ-ACCTDEL-FILE THRU 480-EXIT                       
LRM004     END-PERFORM.                                                         
                                                                                
           PERFORM 420-FETCH-TFR-CURSOR-TBL.                                    
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET WK-TFR-EOF TO TRUE                                            
              GO TO 400-EXIT                                                    
           ELSE                                                                 
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                            
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT          
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                         
              DISPLAY '** PROGRAM CAT610 ABENDED '                              
              CALL ABEND USING ABEND-CODE-5010.                                 
                                                                                
LRM003*****IF CLIENT-NBR OF DCLVTRNFR = '0235'                                  
LRM003*****AND (ACCT-RCV-NBR OF DCLVTRNFR (1 : 8) =                             
LRM003*****                 B1-WRK-WEALTH-MGMT-ACCT                             
LRM003***** OR ACCT-DLVR-NBR OF DCLVTRNFR (1 : 8) =                             
LRM003*****                 B1-WRK-WEALTH-MGMT-ACCT)                            
LRM003*****   GO TO 400-EXIT                                                    
LRM003*****END-IF.                                                              
                                                                                
           MOVE CLIENT-NBR OF DCLVTRNFR TO WK-CURR-CLT-NBR.                     
           MOVE BRANCH-CD  OF DCLVTRNFR TO WK-CURR-BRCH-CD.                     
           MOVE ACCT-CD    OF DCLVTRNFR TO WK-CURR-ACCT-CD.                     
           MOVE CLIENT-NBR OF DCLVTRNFR TO WK-CLT-NBR.                          
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO WK-ACAT-CNTRL-NBR              
LRM020                                           WK-CURR-CNTL-NBR.              
LRM020     IF WK-CURR-KEY (1:12) = WK-PREV-KEY (1:12)                           
              IF WK-DB2-TBL-UPDT-TO-Y                                           
                 PERFORM 450-SAVE-UPDATE-TO-Y-IND                               
              ELSE                                                              
              IF WK-DB2-TBL-UPDT-TO-N                                           
                 PERFORM 460-SAVE-UPDATE-TO-N-IND                               
              END-IF END-IF                                                     
LRM020        SET DUPE-WIRE-LOOKUP TO TRUE                                      
LRM020        GO TO 400-WIRE-RTN.                                               
LRM020********GO TO 400-EXIT.                                                   
                                                                                
LRM020     MOVE 'N' TO DUPE-WIRE-LOOKUP-SW.                                     
           MOVE WK-CURR-KEY TO WK-PREV-KEY.                                     
                                                                                
           MOVE CRT-TMSTP OF DCLVTRNFR (1:2) TO WK-CRT-TMSTP.                   
           MOVE CRT-TMSTP OF DCLVTRNFR (3:2) TO WK-CRT-TMSTP-YY.                
           MOVE CRT-TMSTP OF DCLVTRNFR (6:2) TO WK-CRT-TMSTP-MM.                
           MOVE CRT-TMSTP OF DCLVTRNFR (9:2) TO WK-CRT-TMSTP-DD.                
           MOVE UPDT-TMSTP OF DCLVTRNFR (1:2) TO WK-UPD-TMSTP-CC.               
           MOVE UPDT-TMSTP OF DCLVTRNFR (3:2) TO WK-UPD-TMSTP-YY.               
           MOVE UPDT-TMSTP OF DCLVTRNFR (6:2) TO WK-UPD-TMSTP-MM.               
           MOVE UPDT-TMSTP OF DCLVTRNFR (9:2) TO WK-UPD-TMSTP-DD.               
                                                                                
      * GET NAME AND ADDRESS RECORD FOR THIS ACCOUNT                            
           INITIALIZE  GETNA-PARAMETERS.                                        
           MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
           MOVE  'R'                        TO  GETNA-REQ-FILE.                 
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
           MOVE  'CAT610'                   TO  GETNA-PGM-NAME.                 
           MOVE  B1-WRK-ADP-CL-NO           TO  GETNA-KEY-CLIENT                
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2             
           MOVE  BRANCH-CD OF DCLVTRNFR     TO  GETNA-KEY-BRANCH3-5             
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5            
           MOVE  ACCT-CD   OF DCLVTRNFR     TO  GETNA-KEY-ACCOUNT6-10           
LRM006*---------------------------------------------------------------*         
LRM006* THE GETNNA CALLS BELOW ARE USED TO READ THE N/A ACTIVITY FILE,*         
LRM006* WHICH IS ONLY AVAILABLE TO BE READ SEQUENTIALLY.  THIS IS     *         
LRM006* RETURNED INTO THE SAME COPYLIBS AS THE RANDOM READS DONE BY   *         
LRM006* GETNA.  THE KEY AND THE NA SEGMENTS ARE RETAINED FROM THE     *         
LRM006* FROM THE ACTIVITY FILE CALLS, AS THE RANDOM READS DONE BY     *         
LRM006* GETNA WILL OVERLAY THIS WHEN THE ACTIVITY CL/BR/AC IS SEVERAL *         
LRM006* RECORDS HIGHER IN VALUE THAN THE KEY BEING PROCESSED. THE     *         
LRM006* CL/BRAC IS PROCESSED SEQUENTIALLY DUE TO DB2 ORDER BY CLAUSE. *         
LRM006*---------------------------------------------------------------*         
LRM006     IF PARM-CYCLE-RUN = 'Y'                                              
LRM006     AND (B1-WRK-ADP-CL-NO = 005 OR 006)                                  
LRM006     AND B1-WRK-ALTBR = '1'                                               
LRM006     AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                               
LRM006     AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                                 
LRM006        MOVE  B1-WRK-ADP-CL-NO           TO  WS-CUR-CLIENT                
LRM006        MOVE BRANCH-CD OF DCLVTRNFR         TO WS-CUR-BRAC(1 : 3)         
LRM006        MOVE ACCT-CD   OF DCLVTRNFR         TO WS-CUR-BRAC(4 : 5)         
TEST          DISPLAY 'STARTING WITH NNAKEY ' WS-GETNNA-CL-BRAC                 
TEST                  ' CUR-KEY '  WS-CUR-KEY                                   
TEST            ' ACCT-DLVR '   ACCT-DLVR-NBR OF DCLVTRNFR (1 : 8)              
LRM006        PERFORM UNTIL ACT-GETNA-RETURN-CODE NOT = ' '                     
LRM006                 OR WS-GETNNA-CL-BRAC   NOT < WS-CUR-KEY                  
LRM006           CALL   GETNNA    USING  ACT-GETNA-PARAMETERS                   
LRM006                                   GETNA-SEGMENT-INCLUDES                 
LRM006           END-CALL                                                       
LRM006           IF ACT-GETNA-RETURN-FOUND                                      
LRM006              MOVE NAPPA-CL      TO WS-GETNNA-CLIENT                      
LRM006              MOVE NAPPA-BR-3    TO WS-GETNNA-BRAC (1 : 3)                
LRM006              MOVE NAPPA-ACCT-5B TO WS-GETNNA-BRAC (4 : 5)                
TEST                DISPLAY 'READ ACTIVITY ' WS-GETNNA-CL-BRAC                  
LRM006              MOVE GETNA-SEGMENT-INCLUDES TO                              
LRM006                   WS-SAVE-GETNA-SEGMENT-INCLUDES                         
LRM006           END-IF                                                         
LRM006        END-PERFORM                                                       
TEST          DISPLAY 'END WITH NNAKEY ' WS-GETNNA-CL-BRAC                      
TEST                  ' CUR-KEY '  WS-CUR-KEY                                   
LRM006        IF WS-GETNNA-CL-BRAC =  WS-CUR-KEY                                
LRM006           ADD 1 TO NA-ACTIVE-FILE-FND-CNT                                
LRM006           SET GETNA-RETURN-FOUND TO TRUE                                 
LRM006           MOVE WS-SAVE-GETNA-SEGMENT-INCLUDES TO                         
LRM006                   GETNA-SEGMENT-INCLUDES                                 
TEST             DISPLAY 'USING N/A ACTIVITY ' B1-WRK-ADP-CL-NO                 
TEST              ' ' BRANCH-CD OF DCLVTRNFR                                    
TEST              '-' ACCT-CD   OF DCLVTRNFR                                    
TEST              ' ALTBR ' NNARPB-ALT-BRANCH                                   
TEST              ' RR ' NAPPA-RR1-3  ' RR2=' NAPPI-RR-2                        
LRM006        ELSE                                                              
LRM006           CALL   GETNA            USING GETNA-PARAMETERS                 
LRM006                                         GETNA-SEGMENT-INCLUDES           
LRM006           END-CALL                                                       
LRM006           IF GETNA-RETURN-FOUND                                          
LRM006               ADD 1 TO NA-FILE-FND-CNT                                   
LRM006           ELSE                                                           
LRM006               ADD 1 TO NA-FILE-NOT-FND-CNT                               
LRM006           END-IF                                                         
LRM006        END-IF                                                            
LRM006     ELSE                                                                 
LRM006        CALL   GETNA               USING GETNA-PARAMETERS                 
LRM006                                         GETNA-SEGMENT-INCLUDES           
LRM006        END-CALL                                                          
LRM006        IF GETNA-RETURN-FOUND                                             
LRM006            ADD 1 TO NA-FILE-FND-CNT                                      
              ELSE                                                              
LRM006            ADD 1 TO NA-FILE-NOT-FND-CNT                                  
TEST              DISPLAY 'FOUND NA NOTFND ' B1-WRK-ADP-CL-NO                   
TEST                              ' ' BRANCH-CD OF DCLVTRNFR                    
TEST                              ' ' ACCT-CD   OF DCLVTRNFR                    
LRM006     END-IF.                                                              
                                                                                
           MOVE SPACE TO WK-DB2-TBL-UPDT-SW.                                    
           MOVE B1-WRK-SUBMIT-ASSETS TO WK-DAYS-SUBMIT-ASSETS.                  
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO WK-DAYS-STTS-QTY.                 
                                                                                
ET0001* MAKE N&A UPDATE AFTER CYCLE 1 FOR ACCTS DLVR                            
      * DELIVERER B1 CARD 434589 DOES NOT APPLY TO ALTBR UPDATING,              
      * DRIVEN VIA B1 434695 (ASSUMED TO BE REAL-TIME).                         
           IF PARM-CYCLE-RUN = 'Y'                                              
ET0004        IF WK-UPD-TMSTP = PROC-DATE   AND                                 
ET0004           B1-WRK-ALTBR = '1'         AND                                 
ET0004***        B1-WRK-NA-UPD-DELV = '2'   AND                                 
ET0004           DSTBN-SIDE-CD OF DCLVTRNFR = 'D'        AND                    
ET0004           TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL' AND                         
ET0004           CYCLE-CD      OF DCLVTRNFR = PARM-CYCLE-NBR                    
ET0004           IF (STTS-CD   OF DCLVTRNFR = '100' OR '110')                   
LRM007           AND NOT NNARPB-SEGMENT-MISSING                                 
ET0004              PERFORM 610-DELIVER-ALTBR-UPDATE                            
ET0004                 THRU 610-EXIT                                            
ET0004           ELSE                                                           
ET0004              IF (STTS-CD OF DCLVTRNFR = '140' OR '600')                  
LRM007              AND NOT NNARPB-SEGMENT-MISSING                              
ET0004                 PERFORM 628-DELIVER-ALTBR-REVERSAL                       
ET0004                    THRU 628-EXIT                                         
ET0004              END-IF                                                      
ET0004           END-IF                                                         
ET0004        END-IF                                                            
      * DELIVERER B1 CARD 434589 = 2 INTRA DAY (REAL-TIME) UPDATING:            
              IF WK-UPD-TMSTP = PROC-DATE   AND                                 
                 B1-WRK-NA-UPD-DELV = '2'   AND                                 
                 DSTBN-SIDE-CD OF DCLVTRNFR = 'D'        AND                    
                 TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'      AND                    
                 ACCT-NA-UPDT-IND OF DCLVTRNFR NOT = 'Y' AND                    
                 STTS-CD OF DCLVTRNFR = '200'            AND                    
                 WK-DAYS-STTS-QTY = 1                                           
                   PERFORM 600-DELIVER-UPDTE THRU                               
                           600-DELIVER-UPDTE-EXIT                               
                   PERFORM 650-PREMIER-UPDTE THRU                               
                           650-PREMIER-UPDTE-EXIT                               
                   PERFORM 450-SAVE-UPDATE-TO-Y-IND                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
LRM020 400-WIRE-RTN.                                                            
LRM007     IF PARM-CYCLE-RUN = 'Y'                                              
LRM007     AND B1-WRK-AUTO-WIRES-PROC = '1'                                     
LRM007     AND CYCLE-CD OF DCLVTRNFR = PARM-CYCLE-NBR                           
LRM023*****AND ((PARM-STREAM = 'Q'                                              
LRM023*****AND ACAT-CONTROL-NBR OF DCLVTRNFR (1 : 7)                            
LRM023*****                        = WS-YEST-JULIAN-DT)                         
LRM023*****OR (PARM-STREAM NOT = 'Q'                                            
LRM013     AND ACAT-CONTROL-NBR OF DCLVTRNFR (1 : 7)                            
LRM013                             = WK-TODAY-JULIAN-DT                         
LRM007        IF GETNA-RETURN-FOUND                                             
LRM007           PERFORM 0750-AUTO-WIRES-RTN THRU 0750-EXIT                     
LRM007        ELSE                                                              
LRM007           DISPLAY 'SKIP WIRE / NA NOTFND '                               
LRM007             CLIENT-NBR OF DCLVTRNFR                                      
LRM007             BRANCH-CD OF DCLVTRNFR                                       
LRM007             ACCT-CD   OF DCLVTRNFR                                       
LRM013             ACAT-CONTROL-NBR OF DCLVTRNFR                                
LRM007        END-IF                                                            
LRM007     END-IF.                                                              
                                                                                
LRM020 400-CONTINUE.                                                            
ET0005     IF PARM-CYCLE-RUN = 'Y'                                              
LRM020     OR DUPE-WIRE-LOOKUP                                                  
ET0005        GO TO 400-EXIT                                                    
ET0005     END-IF.                                                              
                                                                                
      * DETERMINE IF THE CLIENT IS DELIVERER OR RECEIVER                        
           IF B1-WRK-BKR-CLR-NO = DLVR-NBR OF DCLVTRNFR                         
              SET WK-CLNT-IS-DELIVERER TO TRUE                                  
           ELSE                                                                 
           IF B1-WRK-BKR-CLR-NO = RCV-NBR OF DCLVTRNFR                          
              SET WK-CLNT-IS-RECEIVER  TO TRUE.                                 
                                                                                
           PERFORM 401-ADJUST-REQ-DAY1                                          
                                                                                
ET0002* DELIVERER B1 434589 = 1, 2 OR 3, MAKE N&A UPDATE FOR ACCTS DLVR         
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'        AND                       
              TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL' AND                            
              ACCT-NA-UPDT-IND OF DCLVTRNFR NOT = 'Y' AND                       
ET0002       (B1-WRK-NA-UPD-DELV = '1' OR '2' OR '3')                           
              IF DAYS-STTS-QTY OF DCLVTRNFR = 1                                 
DJ0001          IF (STTS-CD OF DCLVTRNFR =                                      
                            '200' OR '210' OR '220' OR '230' OR '240')          
                    PERFORM 600-DELIVER-UPDTE THRU                              
                            600-DELIVER-UPDTE-EXIT                              
                    PERFORM 650-PREMIER-UPDTE THRU                              
                            650-PREMIER-UPDTE-EXIT                              
                    PERFORM 450-SAVE-UPDATE-TO-Y-IND                            
                 ELSE                                                           
                 IF (STTS-CD OF DCLVTRNFR = '100')                              
                    PERFORM 651-PREMIER-REPORT-ONLY THRU                        
                            651-EXIT.                                           
                                                                                
      * RECEIVER B1 CARD 434590 = 1, MAKE N&A UPDATE FOR ACCTS RCVR             
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'       AND                        
              DAYS-STTS-QTY OF DCLVTRNFR = 1         AND                        
              TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL' AND                            
              ACCT-NA-UPDT-IND OF DCLVTRNFR NOT = 'Y'  AND                      
              B1-WRK-NA-UPD-RECV = '1'  AND                                     
              (STTS-CD OF DCLVTRNFR =                                           
                         '100' OR '110'                                         
                      OR '200' OR '210'                                         
DJ0001                OR '220' OR '230' OR '240')                               
             PERFORM 700-RECEIVER-UPDTE THRU                                    
                     700-RECEIVER-UPDTE-EXIT                                    
             PERFORM 450-SAVE-UPDATE-TO-Y-IND.                                  
                                                                                
LRM027* RECEIVER B1 CARD 434589 = 1,2 FOR ASCENDIS CLIENT, IF                   
LRM027*    ACAT-CD = D, IF SO, CHANGE IT.                                       
LRM027     IF PARM-CYCLE-RUN NOT = 'Y' AND                                      
LRM027       DSTBN-SIDE-CD OF DCLVTRNFR = 'R' AND                               
LRM027           B1-WRK-ASCENDIS-USER  = '1'                                    
LRM027         MOVE STTLM-DT OF DCLVTRNFR (1:4) TO SETTLE-CCYY                  
LRM027         MOVE STTLM-DT OF DCLVTRNFR (6:2) TO SETTLE-MM                    
LRM027         MOVE STTLM-DT OF DCLVTRNFR (9:2) TO SETTLE-DD                    
LRM027        IF SETTLE-DATE = PROC-DATE    AND                                 
LRM027********IF WK-UPD-TMSTP = PROC-DATE   AND                                 
LRM027           NOT NAPPA-SEGMENT-MISSING   AND                                
LRM027           NAPPA-ACAT-CODE = 'D'       AND                                
LRM027          (B1-WRK-NA-UPD-DELV = '1' OR '2')  AND                          
LRM027          (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL' OR 'PTR') AND               
LRM027          (STTS-CD OF DCLVTRNFR = '300' OR '310')                         
TEST                DISPLAY 'SPCL RCVR SIDE ASCENDIS UPDATE'                    
TEST                   ACAT-CONTROL-NBR OF DCLVTRNFR                            
LRM027              PERFORM 700-RECEIVER-UPDTE THRU                             
LRM027                      700-RECEIVER-UPDTE-EXIT                             
TEST          ELSE                                                              
TEST             DISPLAY 'SKIP SPCL RCVR SIDE ASCENDIS UPDATE '                 
TEST             ACAT-CONTROL-NBR OF DCLVTRNFR                                  
TEST             ' ' TRNFR-TYPE-CD OF DCLVTRNFR                                 
TEST             ' ' STTS-CD OF DCLVTRNFR                                       
TEST             ' ' SETTLE-DATE ' = ' PROC-DATE                                
TEST             ' NA-UPD='  B1-WRK-NA-UPD-DELV                                 
TEST             ' ACAT-CD=' NAPPA-ACAT-CODE                                    
LRM027        END-IF                                                            
LRM027     END-IF.                                                              
                                                                                
                                                                                
DJ0002*---------------------------------------------------------------*         
      * REVERSE CHANGES TO NA FILE FROM EARLIER TRANSACTION                     
ET0002* DELIVERER B1 CARD 434589 = 1 OR 2 OR 3, STATUS - REJECT                 
DJ0002* WHEN A FULL DELIVERY IS REJECTED, REVERSE PREVIOUS UPDATE               
DJ0002* OF NAPPA-ACAT-CODE.                                                     
DJ0002*---------------------------------------------------------------*         
                                                                                
ET0003* THE FOLLOWING 4 LINES WILL ONLY CONSIDER N/A REVERSAL OF TIF            
ET0003* INITIATED TODAY, AND B1 = 2, MEANING REAL-TIME N/A UPDATE.              
ET0003     IF  (WK-ACAT-CNTRL-JUL-DT = WK-TODAY-JULIAN-DT)                      
ET0003     AND (B1-WRK-NA-UPD-DELV = '1' OR '3')                                
ET0003         CONTINUE                                                         
ET0003     ELSE                                                                 
            IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'        AND                      
               TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'      AND                      
               (STTS-CD OF DCLVTRNFR = '140' OR '600') AND                      
               DAYS-STTS-QTY OF DCLVTRNFR = 1          AND                      
               ACCT-NA-UPDT-IND OF DCLVTRNFR NOT = 'N' AND                      
ET0002         (B1-WRK-NA-UPD-DELV = '1' OR '2' OR '3') AND                     
LRM020          GETNA-RETURN-FOUND                                              
              IF (TRNFR-TYPE-RJCT-CD OF DCLVTRNFR = '04' OR '06')               
                 CONTINUE                                                       
              ELSE                                                              
DJ0002**--------CHECK HISTORY DATABASE, IF FULL FOUND, SKIP REVERSAL            
DJ0002          PERFORM 402-READ-VTRNHSTY-RTN                                   
DJ0002          IF WK-VTRNHSTY-NOT-FOUND                                        
DJ0002             DISPLAY 'PERFORM DELIVER-REVERSAL FOR FULL DELIVERY'         
DJ0002             ' ' CLIENT-NBR OF DCLVTRNFR                                  
DJ0002             ' ' BRANCH-CD  OF DCLVTRNFR                                  
DJ0002             ' ' ACCT-CD    OF DCLVTRNFR                                  
                   PERFORM 625-DELIVER-REVERSAL THRU                            
                           625-DELIVER-REVERSAL-EXIT                            
                   PERFORM 460-SAVE-UPDATE-TO-N-IND                             
DJ0002          ELSE                                                            
DJ0002             DISPLAY 'BYPASS  DELIVER-REVERSAL FOR FULL DELIVERY'         
DJ0002             ' ' CLIENT-NBR OF DCLVTRNFR                                  
DJ0002             ' ' BRANCH-CD  OF DCLVTRNFR                                  
DJ0002             ' ' ACCT-CD    OF DCLVTRNFR                                  
DJ0002          END-IF                                                          
DJ0002        END-IF                                                            
DJ0002      END-IF                                                              
           END-IF.                                                              
                                                                                
                                                                                
      * REVERSE CHANGES TO NA FILE FROM EARLIER TRANSACTION                     
      * RECEIVER B1 CARD 434590 = 1, STATUS IS REJECT                           
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'        AND                       
              TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'      AND                       
              (STTS-CD OF DCLVTRNFR = '140' OR '600') AND                       
              DAYS-STTS-QTY OF DCLVTRNFR = 1          AND                       
              ACCT-NA-UPDT-IND OF DCLVTRNFR NOT = 'N' AND                       
              B1-WRK-NA-UPD-RECV = '1'                AND                       
LRM020        GETNA-RETURN-FOUND                                                
             IF (TRNFR-TYPE-RJCT-CD OF DCLVTRNFR = '04' OR '06')                
                CONTINUE                                                        
             ELSE                                                               
                PERFORM 725-RECEIVER-REVERSAL THRU                              
                        725-RECEIVER-REVERSAL-EXIT                              
                PERFORM 460-SAVE-UPDATE-TO-N-IND                                
             END-IF.                                                            
                                                                                
      * B1 CARD 020158 = 1, PROCESS MRGN INTEREST BOOKING REQUEST.              
           IF B1-WRK-MARGIN-INT = '1'                                           
              IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                               
                 IF  (STTS-CD  OF DCLVTRNFR = '100' OR '110')                   
                 AND (B1-WRK-SUBMIT-ASSETS = '1' OR '2' OR '3')                 
                     IF WK-DAYS-STTS-QTY = 1                                    
LRM002**             OR B1-WRK-REFRESH-ASSETS = '1'                             
                        SET WK-TRNFR-NOT-SETTLED TO TRUE                        
                        PERFORM 1000-MRGN-INTEREST-FILE-RTN                     
                     END-IF                                                     
                 ELSE                                                           
                 IF  (STTS-CD       OF DCLVTRNFR = '300' OR '310')              
                 AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                       
                 AND (STTLM-DT      OF DCLVTRNFR > '0001-01-01')                
                     MOVE STTLM-DT OF DCLVTRNFR (1:4) TO SETTLE-CCYY            
                     MOVE STTLM-DT OF DCLVTRNFR (6:2) TO SETTLE-MM              
                     MOVE STTLM-DT OF DCLVTRNFR (9:2) TO SETTLE-DD              
                     IF SETTLE-DATE = PROC-DATE                                 
                        SET WK-TRNFR-SETTLED TO TRUE                            
                        PERFORM 1000-MRGN-INTEREST-FILE-RTN                     
                     END-IF.                                                    
                                                                                
      * B1 CARD 434511 = 1, PROCESS PERIODIC PAYMENT.                           
           IF B1-WRK-PERIODIC-PAYMENT = '1'                                     
              IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                             
              AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                          
DJ0001        AND (STTS-CD OF DCLVTRNFR =                                       
                             '200' OR '210' OR '220' OR '230' OR '240')         
                    PERFORM 1100-PAYMENT-DETAIL-RTN                             
           END-IF.                                                              
                                                                                
      * B1 CARD 434699 = 1, UPDATE N/A FOR 90 DAY TRADE RESTRICTION             
LRM009     IF DSTBN-SIDE-CD   OF DCLVTRNFR   = 'R'                              
LRM009     AND (STTS-CD       OF DCLVTRNFR   = '300' OR '310')                  
LRM009     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                             
LRM009     AND (STTLM-DT      OF DCLVTRNFR  > '0001-01-01')                     
LRM009     AND GETNA-RETURN-FOUND                                               
LRM009     AND B1-WRK-ACAT-NA-UPD-90DR = '1'                                    
LRM009         MOVE STTLM-DT OF DCLVTRNFR (1:4) TO SETTLE-CCYY                  
LRM009         MOVE STTLM-DT OF DCLVTRNFR (6:2) TO SETTLE-MM                    
LRM009         MOVE STTLM-DT OF DCLVTRNFR (9:2) TO SETTLE-DD                    
LRM009         IF SETTLE-DATE = PROC-DATE                                       
LRM009            PERFORM 770-SELECT-VASSET-90DR-RTN                            
LRM009            IF (SQLCODE = +0 OR -811)                                     
TEST                 DISPLAY '90DR FOUND MEMO '                                 
                          B1-WRK-ADP-CL-NO                                      
                        ' ' BRANCH-CD OF DCLVTRNFR                              
                        ' ' ACCT-CD   OF DCLVTRNFR                              
                        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                       
LRM009               PERFORM 780-UPD-90DAY-TRADE-RESTR-RTN                      
LRM009                  THRU 780-EXIT                                           
LRM009            END-IF                                                        
LRM009         END-IF                                                           
LRM009     END-IF.                                                              
       400-EXIT.                     EXIT.                                      
      *                                                                         
      *                                                                         
       401-ADJUST-REQ-DAY1.                                                     
           IF STTS-CD OF DCLVTRNFR = '100'                                      
              IF DAYS-STTS-QTY OF DCLVTRNFR = 1                                 
                 IF WK-CRT-TMSTP = TODAYS-DATE                                  
                    CONTINUE                                                    
                 ELSE                                                           
                    ADD 1 TO DAYS-STTS-QTY OF DCLVTRNFR                         
                                        GIVING WK-DAYS-STTS-QTY.                
DJ0002 401-EXIT.                     EXIT.                                      
                                                                                
DJ0002*---------------------------------------------------------------*         
DJ0002* LOOK FOR A SUCCESSFUL FULL DELIVERY ON THE HISTORY DATABASE             
DJ0002*---------------------------------------------------------------*         
DJ0002 402-READ-VTRNHSTY-RTN.                                                   
DJ0002     MOVE CLIENT-NBR OF DCLVTRNFR TO CLIENT-NBR OF DCLVTRNHSTY.           
DJ0002     MOVE BRANCH-CD  OF DCLVTRNFR TO BRANCH-CD  OF DCLVTRNHSTY.           
DJ0002     MOVE ACCT-CD    OF DCLVTRNFR TO ACCT-CD    OF DCLVTRNHSTY.           
DJ0002     MOVE ' ' TO WK-VTRNHSTY-SW                                           
DJ0002     EXEC SQL SELECT                                                      
DJ0002              TRNFR_TYPE_CD                                               
DJ0002             ,DSTBN_SIDE_CD                                               
DJ0002             ,STTS_CD                                                     
DJ0002              INTO                                                        
DJ0002             :DCLVTRNHSTY.TRNFR-TYPE-CD                                   
DJ0002            ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                   
DJ0002            ,:DCLVTRNHSTY.STTS-CD                                         
DJ0002              FROM VTRNHSTY                                               
DJ0002       WHERE  CLIENT_NBR    = :DCLVTRNHSTY.CLIENT-NBR                     
DJ0002         AND  BRANCH_CD     = :DCLVTRNHSTY.BRANCH-CD                      
DJ0002         AND  ACCT_CD       = :DCLVTRNHSTY.ACCT-CD                        
DJ0002         AND  TRNFR_TYPE_CD = 'FUL'                                       
DJ0002         AND  DSTBN_SIDE_CD = 'D'                                         
DJ0002         AND  STTS_CD = '310'                                             
DJ0002     END-EXEC.                                                            
DJ0002     EVALUATE SQLCODE                                                     
DJ0002         WHEN +0                                                          
DJ0002              MOVE 'Y' TO WK-VTRNHSTY-SW                                  
DJ0002              DISPLAY 'VTRNHSTY FOUND(+000):'                             
DJ0002              ' ' CLIENT-NBR OF DCLVTRNFR                                 
DJ0002              ' ' BRANCH-CD  OF DCLVTRNFR                                 
DJ0002              ' ' ACCT-CD    OF DCLVTRNFR                                 
DJ0002         WHEN -811                                                        
DJ0002              MOVE 'Y' TO WK-VTRNHSTY-SW                                  
DJ0002              DISPLAY 'VTRNHSTY FOUND(-811):'                             
DJ0002              ' ' CLIENT-NBR OF DCLVTRNFR                                 
DJ0002              ' ' BRANCH-CD  OF DCLVTRNFR                                 
DJ0002              ' ' ACCT-CD    OF DCLVTRNFR                                 
DJ0002         WHEN +100                                                        
DJ0002              MOVE 'N' TO WK-VTRNHSTY-SW                                  
DJ0002         WHEN OTHER                                                       
DJ0002              MOVE 'N' TO WK-VTRNHSTY-SW                                  
DJ0002     END-EVALUATE.                                                        
DJ0002 402-EXIT.                     EXIT.                                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            OPEN ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       410-OPEN-TFR-CURSOR-TBL.                                                 
           EXEC SQL                                                             
              OPEN TFRCRSR                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM  8000-SQL-ERROR THRU 8000-EXIT                            
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT           
              MOVE SQLCODE TO W-SQLCODE-OUT                                     
              DISPLAY ' '                                                       
              DISPLAY W-DB2-ERR-MSG-OUT                                         
              DISPLAY '** PROGRAM CAT610 ABENDED '                              
              CALL ABEND USING ABEND-CODE-5000.                                 
                                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *           FETCH ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       420-FETCH-TFR-CURSOR-TBL.                                                
           EXEC SQL                                                             
              FETCH                                                             
                 TFRCRSR                                                        
              INTO                                                              
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
               ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                   
               ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                   
               ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                   
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
LRM007         ,:DCLVTRNFR.ADOPT-AGRMT-IND                                      
LRM008         ,:DCLVTRNFR.RR-ORGNL-CD                                          
LRM010         ,:DCLVTRNFR.BRANCH-ALTNT-CD                                      
           END-EXEC.                                                            
      *                                                                         
      *----------------------------------------------------------------*        
      *           CLOSE ACTIVE TRANSFER CURSOR TABLE                   *        
      *----------------------------------------------------------------*        
       430-CLOSE-TFR-CURSOR-TBL.                                                
           EXEC SQL                                                             
              CLOSE TFRCRSR                                                     
           END-EXEC.                                                            
       EJECT                                                                    
                                                                                
      *                                                                         
      *----------------------------------------------------------------*        
      *  FOR NA UPDATE, SAVE DB2 KEY TO SET ACCT_NA_UPDT_IND TO 'Y'.   *        
      *  NOTE: DB2 UPDATE IS DONE AT CAT612 UPDATE PROGRAM.            *        
      *----------------------------------------------------------------*        
       450-SAVE-UPDATE-TO-Y-IND.                                                
           EXEC SQL                                                             
              SELECT  ACCT_NA_UPDT_IND                                          
                INTO :DCLVTRNFR.ACCT-NA-UPDT-IND                                
                FROM VTRNFR                                                     
               WHERE CLIENT_NBR = :WK-CLT-NBR  AND                              
                     ACAT_CONTROL_NBR = :WK-ACAT-CNTRL-NBR                      
           END-EXEC.                                                            
           IF ACCT-NA-UPDT-IND OF DCLVTRNFR = 'Y'                               
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SPACE TO DB-SAVE-WORK-REC                                    
              MOVE WK-CLT-NBR         TO DB-SAVE-CLT-NBR                        
              MOVE WK-ACAT-CNTRL-NBR  TO DB-SAVE-ACAT-NBR                       
              MOVE WK-CURR-BRCH-CD    TO DB-SAVE-BRANCH                         
              MOVE WK-CURR-ACCT-CD    TO DB-SAVE-ACCT                           
              MOVE 'Y'                TO DB-SAVE-NA-UPDATE-IND                  
              SET  WK-DB2-TBL-UPDT-TO-Y TO TRUE                                 
              WRITE DB-SAVE-RECORD FROM DB-SAVE-WORK-REC                        
              ADD 1 TO DBSAVE-REC-CNT.                                          
      *                                                                         
      *----------------------------------------------------------------*        
      *  FOR NA UPDATE REVERSAL, SAVE DB2 KEY TO SET ACCT_NA_UPDT_IND  *        
      *  TO 'N'.                                                       *        
      *  NOTE: DB2 UPDATE IS DONE AT CAT612 UPDATE PROGRAM.            *        
      *----------------------------------------------------------------*        
       460-SAVE-UPDATE-TO-N-IND.                                                
           EXEC SQL                                                             
              SELECT  ACCT_NA_UPDT_IND                                          
                INTO :DCLVTRNFR.ACCT-NA-UPDT-IND                                
                FROM VTRNFR                                                     
               WHERE CLIENT_NBR = :WK-CLT-NBR  AND                              
                     ACAT_CONTROL_NBR = :WK-ACAT-CNTRL-NBR                      
           END-EXEC.                                                            
           IF ACCT-NA-UPDT-IND OF DCLVTRNFR = 'N'                               
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SPACE TO DB-SAVE-WORK-REC                                    
              MOVE WK-CLT-NBR         TO DB-SAVE-CLT-NBR                        
              MOVE WK-ACAT-CNTRL-NBR  TO DB-SAVE-ACAT-NBR                       
              MOVE WK-CURR-BRCH-CD    TO DB-SAVE-BRANCH                         
              MOVE WK-CURR-ACCT-CD    TO DB-SAVE-ACCT                           
              MOVE 'N'                TO DB-SAVE-NA-UPDATE-IND                  
              SET  WK-DB2-TBL-UPDT-TO-N TO TRUE                                 
              WRITE DB-SAVE-RECORD FROM DB-SAVE-WORK-REC                        
              ADD 1 TO DBSAVE-REC-CNT.                                          
       EJECT                                                                    
LRM004 470-PURGE-NA-RTN.                                                        
LRM004                                                                          
LRM004* GET NAME AND ADDRESS RECORD FOR THIS ACCOUNT                            
LRM004                                                                          
LRM004     INITIALIZE  GETNA-PARAMETERS.                                        
LRM004     MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
LRM004     MOVE  'R'                        TO  GETNA-REQ-FILE.                 
LRM004     MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
LRM004     MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
LRM004     MOVE  'CAT610'                   TO  GETNA-PGM-NAME.                 
LRM004     MOVE  B1-WRK-ADP-CL-NO           TO  GETNA-KEY-CLIENT.               
LRM004     MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.            
LRM004     MOVE  W-ACCTDEL-BRANCH-NBR       TO  GETNA-KEY-BRANCH3-5.            
LRM004     MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.           
LRM004     MOVE  W-ACCTDEL-ACCT-NBR         TO  GETNA-KEY-ACCOUNT6-10.          
LRM004     CALL   GETNA                   USING GETNA-PARAMETERS                
LRM004                                          GETNA-SEGMENT-INCLUDES          
LRM004     END-CALL.                                                            
LRM004                                                                          
LRM021     IF NOT GETNA-RETURN-FOUND                                            
TEST          DISPLAY 'SKIP HSTY N/A UPD ' B1-WRK-ADP-CL-NO                     
TEST             ' ' W-ACCTDEL-BRANCH-NBR '-' W-ACCTDEL-ACCT-NBR                
LRM021     END-IF.                                                              
LRM021     IF GETNA-RETURN-FOUND                                                
LRM004     AND B1-WRK-NA-UPD-DELV > '0'                                         
LRM022     AND (B1-WRK-NA-UPDATE-PURGE  = '1' OR '2')                           
LRM004     AND NAPPA-ACAT-CODE = 'D'                                            
LRM004        MOVE W-ACCTDEL-BRANCH-NBR TO BRANCH-CD OF DCLVTRNFR               
LRM004        MOVE W-ACCTDEL-ACCT-NBR  TO  ACCT-CD   OF DCLVTRNFR               
LRM004        PERFORM 625-DELIVER-REVERSAL THRU                                 
LRM004                625-DELIVER-REVERSAL-EXIT                                 
LRM004        WRITE NACCTDEL-RECORD FROM W-ACCTDEL-REC                          
LRM004        ADD 1 TO W-NACCTDEL-WRITTEN-CNT                                   
LRM004     END-IF.                                                              
LRM004 470-EXIT. EXIT.                                                          
                                                                                
LRM004 480-READ-ACCTDEL-FILE.                                                   
LRM004     READ ACCTDEL-FILE INTO W-ACCTDEL-REC                                 
LRM004        AT END                                                            
LRM004           SET ACCTDEL-EOF TO TRUE                                        
LRM004           DISPLAY 'ACCTDEL END OF FILE REACHED.'                         
LRM004                  ' COUNT = ' W-ACCTDEL-READ-CNT                          
LRM004     END-READ.                                                            
LRM004     IF NOT ACCTDEL-EOF                                                   
LRM004        ADD 1 TO W-ACCTDEL-READ-CNT                                       
LRM004        IF W-ACCTDEL-KEY = HIGH-VALUES                                    
LRM004           DISPLAY 'W-ACCTDEL-TRLR-COUNT = ' W-ACCTDEL-TRLR-COUNT         
LRM004           GO TO 480-READ-ACCTDEL-FILE                                    
LRM004        END-IF                                                            
LRM004     END-IF.                                                              
LRM004 480-EXIT. EXIT.                                                          
                                                                                
LRM010 490-PROCESS-NAWRAP-INPUT.                                                
LRM010     MOVE '0'                   TO WK-CLT-NBR                             
LRM010     MOVE NAUP-WRAP-CL          TO WK-CLT-NBR (2:3)                       
LRM010     MOVE NAUP-WRAP-CONTROL-NBR TO WK-ACAT-CNTRL-NBR.                     
LRM010     EXEC SQL                                                             
LRM019        SELECT   RCV_NBR                                                  
LRM019                ,DLVR_NBR                                                 
LRM019                ,DSTBN_SIDE_CD                                            
LRM019                ,BRANCH_CD                                                
LRM019                ,ACCT_CD                                                  
LRM019                ,STTS_CD                                                  
LRM019          INTO :DCLVTRNFR.RCV-NBR                                         
LRM019              ,:DCLVTRNFR.DLVR-NBR                                        
LRM019              ,:DCLVTRNFR.DSTBN-SIDE-CD                                   
LRM019              ,:DCLVTRNFR.BRANCH-CD                                       
LRM019              ,:DCLVTRNFR.ACCT-CD                                         
LRM019              ,:DCLVTRNFR.STTS-CD                                         
LRM010          FROM VTRNFR                                                     
LRM010         WHERE CLIENT_NBR = :WK-CLT-NBR  AND                              
LRM010              ACAT_CONTROL_NBR = :WK-ACAT-CNTRL-NBR                       
LRM010     END-EXEC.                                                            
LRM010     IF SQLCODE = +100                                                    
LRM010          DISPLAY 'VTRNFR NOTFND IN NAUPT '                               
LRM010          NAUP-WRAP-CL ' ' NAUP-WRAP-BR ' ' NAUP-WRAP-ACCT                
LRM010             ' ' NAUP-WRAP-CONTROL-NBR                                    
LRM010             GO TO 490-READ-NAWRAP-INPUT                                  
LRM010     END-IF.                                                              
LRM010     IF SQLCODE NOT = 0                                                   
LRM010          PERFORM  8000-SQL-ERROR THRU 8000-EXIT                          
LRM010          MOVE 'DB2 SELECT STATEMENT IN PARA 490- ERROR' TO               
LRM010                       W-ERR-MSG-OUT                                      
LRM010          MOVE SQLCODE TO W-SQLCODE-OUT                                   
LRM010          DISPLAY ' '                                                     
LRM010          DISPLAY W-DB2-ERR-MSG-OUT                                       
LRM010          DISPLAY '** PROGRAM CAT610 ABENDED '                            
LRM010          CALL ABEND USING ABEND-CODE-4900                                
LRM010     END-IF.                                                              
TEST       DISPLAY 'AFTER VTRNFR SELECT ' WK-CLT-NBR                            
TEST               ' ' WK-ACAT-CNTRL-NBR                                        
                   ' '          DSTBN-SIDE-CD OF DCLVTRNFR                      
LRM019             ' '          BRANCH-CD     OF DCLVTRNFR                      
LRM019             ' '          ACCT-CD       OF DCLVTRNFR                      
LRM019             ' '          STTS-CD       OF DCLVTRNFR                      
LRM019* GET NAME AND ADDRESS RECORD FOR THIS ACCOUNT                            
LRM019     INITIALIZE  GETNA-PARAMETERS.                                        
LRM019     MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
LRM019     MOVE  'R'                        TO  GETNA-REQ-FILE.                 
LRM019     MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
LRM019     MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
LRM019     MOVE  'CAT610'                   TO  GETNA-PGM-NAME.                 
LRM019     MOVE  B1-WRK-ADP-CL-NO           TO  GETNA-KEY-CLIENT                
LRM019     MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2             
LRM019     MOVE  BRANCH-CD OF DCLVTRNFR     TO  GETNA-KEY-BRANCH3-5             
LRM019     MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5            
LRM019     MOVE  ACCT-CD   OF DCLVTRNFR     TO  GETNA-KEY-ACCOUNT6-10           
LRM019     CALL   GETNA               USING GETNA-PARAMETERS                    
LRM019                                      GETNA-SEGMENT-INCLUDES              
LRM019     END-CALL                                                             
LRM019     IF GETNA-RETURN-FOUND                                                
LRM019         ADD 1 TO NA-FILE-FND-CNT                                         
LRM019     ELSE                                                                 
LRM019         ADD 1 TO NA-FILE-NOT-FND-CNT                                     
LRM019         DISPLAY '490-NAWRAP NA NOTFND ' B1-WRK-ADP-CL-NO                 
LRM019                            ' ' BRANCH-CD OF DCLVTRNFR                    
LRM019                            ' ' ACCT-CD   OF DCLVTRNFR                    
LRM019         GO TO 490-READ-NAWRAP-INPUT                                      
LRM019     END-IF.                                                              
                                                                                
LRM010     IF (STTS-CD OF DCLVTRNFR = '200' OR '210' OR '220' OR '230'          
DJ0001                            OR  '240' OR '300' OR '310')                  
LRM019        PERFORM 600-DELIVER-UPDTE THRU                                    
LRM019                600-DELIVER-UPDTE-EXIT                                    
LRM019        PERFORM 450-SAVE-UPDATE-TO-Y-IND                                  
LRM010        ADD 1 TO WS-NAUP-WRAP-UPD-CNT                                     
LRM010     END-IF.                                                              
LRM019 490-READ-NAWRAP-INPUT.                                                   
LRM010     READ NAUP-WRAP-FILE-IN INTO  NAUP-WRAP-RECORD                        
LRM010         AT END SET NAWRAP-EOF TO TRUE                                    
LRM010             GO TO 490-EXIT                                               
LRM010     END-READ.                                                            
LRM010     ADD 1 TO WS-NAUP-WRAP-READ.                                          
LRM010 490-EXIT. EXIT.                                                          
                                                                                
LRM018 495-UPDATE-NA-ACCT-CLOSE-RTN.                                            
                                                                                
LRM018     MOVE SPACES  TO  NAUP-5100E01-REC.                                   
LRM018     MOVE B1-WRK-ADP-CL-NO   TO  NAUP-51E1-CL.                            
LRM018     MOVE ACCTDEL-BRANCH-NBR TO  NAUP-51E1-BR                             
LRM018     MOVE ACCTDEL-ACCT-NBR   TO  NAUP-51E1-ACCT                           
LRM018     MOVE '51'    TO NAUP-51E1-RECORD-ID.                                 
LRM018     MOVE '00'    TO NAUP-51E1-RECORD-ID2.                                
LRM018     MOVE 'E'     TO NAUP-51E1-SEG-ID.                                    
LRM018     MOVE '01'    TO NAUP-51E1-SEG-UPDT-SEQ.                              
LRM018     MOVE  1      TO NAUP-51E1-ACCT-TYPE.                                 
LRM018     MOVE 'X'     TO NAUP-51E1-CHECK-DIGIT.                               
LRM018     MOVE 'B'     TO NAUP-51E1-TRID-CODE.                                 
LRM018     MOVE '3'     TO NAUP-51E1-ACTION-CD.                                 
LRM018     MOVE SPACES  TO NAUP-51E1-SOURCE-SEQ.                                
LRM018     MOVE SPACES  TO NAUP-51E1-SYS-GEN-FLDS.                              
LRM018                                                                          
LRM018     MOVE 'A'     TO  NAUP-51E1-ACCT-CLOSED                               
                                                                                
LRM018     MOVE NAUP-5100E01-REC   TO NA-UPDATE-REC.                            
LRM018     PERFORM 900-WRITE-NA-UPDATE                                          
LRM018        THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
LRM018 495-EXIT. EXIT.                                                          
                                                                                
LRM022 497-UPDATE-NA-ACH-DDA-RTN.                                               
LRM022     MOVE SPACES       TO NAUP-5100A00-REC                                
LRM022     MOVE B1-WRK-ADP-CL-NO   TO  NAUP-51A0-CL                             
LRM022     MOVE ACCTDEL-BRANCH-NBR TO  NAUP-51A0-BR                             
LRM022     MOVE ACCTDEL-ACCT-NBR   TO  NAUP-51A0-ACCT                           
LRM022     MOVE '51'         TO NAUP-51A0-RECORD-ID                             
LRM022     MOVE '00'         TO NAUP-51A0-RECORD-ID2                            
LRM022     MOVE 'A'          TO NAUP-51A0-SEG-ID                                
LRM022     MOVE  00          TO NAUP-51A0-SEG-UPDT-SEQ                          
LRM022     MOVE  1           TO NAUP-51A0-ACCT-TYPE                             
LRM022     MOVE 'X'          TO NAUP-51A0-CHECK-DIGIT                           
LRM022     MOVE 'B'          TO NAUP-51A0-TRID-CODE                             
LRM022     MOVE '3'          TO NAUP-51A0-ACTION-CD                             
LRM022     MOVE '-'          TO NAUP51-ACH                                      
LRM022                          NAUP51-DDA                                      
LRM022     MOVE NAUP-5100A00-REC   TO NA-UPDATE-REC                             
LRM022     PERFORM 900-WRITE-NA-UPDATE                                          
LRM022        THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
LRM022 497-EXIT. EXIT.                                                          
                                                                                
LRM024 498-UPDATE-NA-RSTRCT-CD-RTN.                                             
LRM024     MOVE SPACES       TO NAUP-5100E00-REC                                
LRM024     MOVE B1-WRK-ADP-CL-NO        TO  NAUP-51E0-CL                        
LRM024     MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-51E0-BR                        
LRM024     MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-51E0-ACCT                      
LRM024     MOVE '51'         TO NAUP-51E0-RECORD-ID                             
LRM024     MOVE '00'         TO NAUP-51E0-RECORD-ID2                            
LRM024     MOVE 'E'          TO NAUP-51E0-SEG-ID                                
LRM024     MOVE  00          TO NAUP-51E0-SEG-UPDT-SEQ                          
LRM024     MOVE  1           TO NAUP-51E0-ACCT-TYPE                             
LRM024     MOVE 'X'          TO NAUP-51E0-CHECK-DIGIT                           
LRM024     MOVE 'B'          TO NAUP-51E0-TRID-CODE                             
LRM024     MOVE '3'          TO NAUP-51E0-ACTION-CD                             
LRM024     MOVE B1-WRK-NA-UPD-RSTRCT-CODE                                       
LRM024                       TO NAUP-51E0-RESTRICTION-CD                        
LRM024     MOVE NAUP-5100E00-REC   TO NA-UPDATE-REC                             
LRM024     PERFORM 900-WRITE-NA-UPDATE                                          
LRM024        THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
LRM024 498-EXIT. EXIT.                                                          
                                                                                
LRM025 499-UPDATE-NA-VENDOR-NO-RTN.                                             
LRM025     MOVE SPACES       TO NAUP-5100C00-REC                                
LRM025     MOVE B1-WRK-ADP-CL-NO        TO  NAUP-51C0-CL                        
LRM025     MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-51C0-BR                        
LRM025     MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-51C0-ACCT                      
LRM025     MOVE '51'         TO NAUP-51C0-RECORD-ID                             
LRM025     MOVE '00'         TO NAUP-51C0-RECORD-ID2                            
LRM025     MOVE 'C'          TO NAUP-51C0-SEG-ID                                
LRM025     MOVE  00          TO NAUP-51C0-SEG-UPDT-SEQ                          
LRM025     MOVE  1           TO NAUP-51C0-ACCT-TYPE                             
LRM025     MOVE 'X'          TO NAUP-51C0-CHECK-DIGIT                           
LRM025     MOVE 'B'          TO NAUP-51C0-TRID-CODE                             
LRM025     MOVE '3'          TO NAUP-51C0-ACTION-CD                             
LRM025     MOVE ALL '-'      TO NAUP51C0-VENDOR-NO                              
LRM025     MOVE NAUP-5100C00-REC   TO NA-UPDATE-REC                             
LRM025     PERFORM 900-WRITE-NA-UPDATE                                          
LRM025        THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
LRM025 499-EXIT. EXIT.                                                          
       500-SET-B1-TABLE.                                                        
           MOVE '0'                    TO WS-CLIENT-NBR                         
           MOVE B1-ADP-CL-NO (B1-SUB1) TO WS-CLIENT-NBR (2:3)                   
           DISPLAY 'CLIENT =  '            B1-ADP-CL-NO (B1-SUB1)               
                  ' ACAT-BROKER-CLR-NO = ' B1-BKR-CLR-NO (B1-SUB1)              
           MOVE B1-TABLE (B1-SUB1) TO B1-WRK-TABLE                              
           MOVE B1-SUB1  TO  B1-SUB1-SVE                                        
           MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                                 
           MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH.                                
       EJECT                                                                    
                                                                                
       575-B1-NOT-RPTING.                                                       
                                                                                
           IF B1-CL-HIT (B4-SUB) NOT = 'Y'                                      
             INITIALIZE ACAT-DATA-REC                                           
             MOVE B1-ADP-CL-NO (B4-SUB) TO ADR-CLIENT                           
             MOVE B1-CLI-NAME  (B4-SUB) TO ADR-CLIENT-NAME                      
             MOVE ZERO                  TO ADR-CONTROLLER                       
             MOVE LOW-VALUES            TO ADR-BRANCH                           
                                           ADR-ACCOUNT                          
             RELEASE SORT-REC FROM ACAT-DATA-REC.                               
                                                                                
       575-B1-NOT-RPTING-EXIT.  EXIT.                                           
           EJECT                                                                
                                                                                
       600-DELIVER-UPDTE.                                                       
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD OF DCLVTRNFR TO NAUP-10A0-BR                          
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD   OF DCLVTRNFR TO  NAUP-10A0-ACCT                       
                                        NAUP-10I0-ACCT.                         
                                                                                
LRM011***  IF PROC-DATE = WS-BPD-SETTLE-DATE                                    
LRM014     IF NOT WS-TOMORROW-TRADE-DAY-ONLY                                    
              MOVE  'D'    TO  NAUPA0-ACAT-CODE                                 
LRM011     ELSE                                                                 
LRM011        MOVE B1-WRK-ADP-CL-NO    TO  NAUP-WRAP-CL                         
LRM011        MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-WRAP-BR                     
LRM011        MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-WRAP-ACCT                   
LRM011        MOVE WK-ACAT-CNTRL-NBR   TO  NAUP-WRAP-CONTROL-NBR                
LRM011        MOVE  'D'                TO  NAUP-WRAP-ACAT-CODE                  
LRM011        WRITE NAUP-WRAP-RECORD-OUT FROM NAUP-WRAP-RECORD                  
LRM011        ADD 1 TO WS-NAUP-WRAP-WRITTEN                                     
LRM019        GO TO 600-DELIVER-UPDTE-EXIT                                      
LRM011     END-IF.                                                              
                                                                                
           MOVE  '07'   TO  NAUPA0-SELL-CODE.                                   
           MOVE  '0'    TO  NAUPA0-AUTO-FUND-XFER2.                             
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE  '2'    TO  NAUPI0-DIVIDEND-PAY-CD.                             
           MOVE 'Y'     TO  NAUPI0-NMB-CASH-ACCT                                
                            NAUPI0-NMB-MRGN-ACCT.                               
           IF DSTBN-SIDE-CD OF DCLVTRNFR  = 'D'                                 
              MOVE RCV-NBR  OF DCLVTRNFR TO  NAUPI0-ACAT-DELIV-BROKER-NO        
           ELSE                                                                 
           IF DSTBN-SIDE-CD OF DCLVTRNFR  = 'R'                                 
              MOVE DLVR-NBR OF DCLVTRNFR TO  NAUPI0-ACAT-DELIV-BROKER-NO        
           END-IF.                                                              
ET0002                                                                          
ET0002     IF B1-WRK-NA-UPD-DELV = '3'                                          
ET0002        MOVE PROC-DATE TO NAUPI0-BUS-STOP-DATE                            
ET0002     END-IF.                                                              
ET0002                                                                          
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
LRM025     IF NNARPC-VENDOR-NO > SPACES                                         
LRM025     AND   NOT  NNARPC-SEGMENT-MISSING                                    
LRM025        PERFORM 499-UPDATE-NA-VENDOR-NO-RTN                               
LRM025           THRU 499-EXIT                                                  
LRM025     END-IF.                                                              
                                                                                
LRM024     IF NOT WS-TOMORROW-TRADE-DAY-ONLY                                    
LRM024       IF B1-WRK-NA-UPD-RSTRCT-CODE > ' '                                 
LRM024          PERFORM 498-UPDATE-NA-RSTRCT-CD-RTN                             
LRM024             THRU 498-EXIT                                                
LRM024     END-IF.                                                              
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
           MOVE B1-WRK-ADP-CL-NO    TO  TEMP-CLIENT.                            
           MOVE BRANCH-CD OF DCLVTRNFR   TO  TEMP-BRANCH.                       
           MOVE ACCT-CD   OF DCLVTRNFR   TO  TEMP-ACCOUNT.                      
           MOVE B1-WRK-CLI-NAME     TO  TEMP-CLIENT-NAME.                       
           MOVE NAPPA-DIV-CODE      TO  TEMP-DIV-CODE.                          
           MOVE NAPPA-SELL-CODE     TO  TEMP-SELL-CODE.                         
           MOVE NAPPA-FUND-TRNSFR   TO  TEMP-CASH-SWEEP.                        
           MOVE ' '                 TO  TEMP-REJ-IND.                           
ET0002     IF B1-WRK-NA-UPD-DELV = '3'                                          
ET0002        MOVE PROC-DATE-EDITED    TO  TEMP-BUS-STOP-DT                     
ET0002     END-IF.                                                              
           WRITE  TEMP-RECORD     FROM  TEMP-DATA-REC.                          
       600-DELIVER-UPDTE-EXIT.   EXIT.                                          
       EJECT                                                                    
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*   UPDATE ALTERNATE BRANCH AND RR# ON N&A FILE                           
ET0004*----------------------------------------------------------------*        
ET0004 610-DELIVER-ALTBR-UPDATE.                                                
           MOVE LOW-VALUE          TO ALTBREC.                                  
           MOVE WK-CLT-NBR-3       TO ALTBREC-CLIENT.                           
           MOVE NNARPB-ALT-BRANCH  TO ALTBREC-ALT-BR.                           
                                                                                
           READ ALTBR-FILE.                                                     
                                                                                
           EVALUATE ALTBR-LOG-STATUS                                            
              WHEN '00'                                                         
                 CONTINUE                                                       
              WHEN '23'                                                         
                 DISPLAY 'ALTBR NOTFND ' ALTBREC-CLIENT                         
                   ' ' ALTBREC-ALT-BR ' ' BRANCH-CD OF DCLVTRNFR                
                                          ACCT-CD   OF DCLVTRNFR                
                   ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                            
                 GO TO 610-EXIT                                                 
              WHEN OTHER                                                        
                 DISPLAY 'UNABLE TO READ ALT BRANCH VSAM FILE - STATUS'         
                         ' = ' ALTBR-LOG-STATUS                                 
                 CALL ABEND  USING ABEND-CODE-1010                              
           END-EVALUATE.                                                        
                                                                                
           MOVE SPACE   TO  NAUP-5100B00-REC.                                   
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'               TO  NAUP-10A0-RECORD-ID.                     
           MOVE '00'               TO  NAUP-10A0-RECORD-ID2.                    
           MOVE 'A'                TO  NAUP-10A0-SEG-ID.                        
           MOVE ZERO               TO  NAUP-10A0-ACCT-TYPE.                     
           MOVE 00                 TO  NAUP-10A0-SEG-UPDT-SEQ.                  
           MOVE 'X'                TO  NAUP-10A0-CHECK-DIGIT.                   
LRM026*****MOVE 'A'                TO  NAUP-10A0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-10A0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-10A0-ACTION-CD.                     
                                                                                
           MOVE '10'               TO  NAUP-10I0-RECORD-ID.                     
           MOVE '00'               TO  NAUP-10I0-RECORD-ID2.                    
           MOVE 'I'                TO  NAUP-10I0-SEG-ID.                        
           MOVE ZERO               TO  NAUP-10I0-ACCT-TYPE.                     
           MOVE 00                 TO  NAUP-10I0-SEG-UPDT-SEQ.                  
           MOVE 'X'                TO  NAUP-10I0-CHECK-DIGIT.                   
LRM026*****MOVE 'A'                TO  NAUP-10I0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-10I0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-10I0-ACTION-CD.                     
                                                                                
           MOVE '51'               TO  NAUP-51B0-RECORD-ID                      
           MOVE '00'               TO  NAUP-51B0-RECORD-ID2.                    
           MOVE 'B'                TO  NAUP-51B0-SEG-ID.                        
           MOVE  ZERO              TO  NAUP-51B0-SEG-UPDT-SEQ.                  
           MOVE  ZERO              TO  NAUP-51B0-ACCT-TYPE.                     
           MOVE 'X'                TO  NAUP-51B0-CHECK-DIGIT.                   
LRM026*****MOVE 'A'                TO  NAUP-51B0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-51B0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-51B0-ACTION-CD.                     
                                                                                
           MOVE B1-WRK-ADP-CL-NO   TO  NAUP-51B0-CL                             
                                       NAUP-10A0-CL                             
                                       NAUP-10I0-CL.                            
           MOVE BRANCH-CD OF DCLVTRNFR TO  NAUP-51B0-BR                         
                                       NAUP-10A0-BR                             
                                       NAUP-10I0-BR.                            
           MOVE ACCT-CD   OF DCLVTRNFR TO  NAUP-51B0-ACCT                       
                                       NAUP-10A0-ACCT                           
                                       NAUP-10I0-ACCT.                          
                                                                                
                                                                                
           IF ALTBREC-RR > SPACE                                                
              MOVE ALTBREC-RR      TO NAUPA0-RR                                 
           ELSE                                                                 
              MOVE '---'           TO NAUPA0-RR                                 
           END-IF.                                                              
           MOVE NAUP-1000A00-REC   TO NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE                                          
              THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE ALTBREC-RR   TO  WK-RR-NBR.                                     
           PERFORM 612-SAVE-RR-FOR-UPDATE                                       
              THRU 612-EXIT.                                                    
                                                                                
           IF NAPPA-RR1-3 > SPACE                                               
              MOVE NAPPA-RR1-3    TO NAUPI0-2ND-RR                              
           ELSE                                                                 
              MOVE '---'          TO NAUPI0-2ND-RR                              
           END-IF.                                                              
           MOVE NAUP-1000I00-REC  TO NA-UPDATE-REC.                             
           PERFORM 900-WRITE-NA-UPDATE                                          
              THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           IF ALTBREC-ALT-BR-TO > SPACE                                         
              MOVE ALTBREC-ALT-BR-TO  TO NAUP51B0-ALT-BRANCH                    
           ELSE                                                                 
              MOVE '-----'            TO NAUP51B0-ALT-BRANCH                    
           END-IF.                                                              
LRM016     IF ALTBREC-RR > SPACE                                                
LRM017        IF (BRANCH-CD OF DCLVTRNFR  (1 : 1) < '7'                         
LRM017        OR  BRANCH-CD OF DCLVTRNFR = '999')                               
LRM017           MOVE '000'                TO NAUP51B0-ALT-RR(1 : 3)            
LRM017        ELSE                                                              
LRM017           MOVE NNARPB-ALT-RR(1 : 3) TO NAUP51B0-ALT-RR(1 : 3)            
LRM017        END-IF                                                            
LRM016        MOVE ALTBREC-RR              TO NAUP51B0-ALT-RR(4 : 3)            
LRM016     ELSE                                                                 
LRM017        MOVE '------'        TO NAUP51B0-ALT-RR                           
LRM016     END-IF.                                                              
           MOVE NAUP-5100B00-REC   TO NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE                                          
              THRU 900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           ADD 1 TO NA-ALTBR-UPDT-CNT.                                          
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
           MOVE B1-WRK-ADP-CL-NO    TO  TEMP-CLIENT.                            
           MOVE BRANCH-CD OF DCLVTRNFR  TO  TEMP-BRANCH.                        
           MOVE ACCT-CD   OF DCLVTRNFR  TO  TEMP-ACCOUNT.                       
           MOVE B1-WRK-CLI-NAME     TO  TEMP-CLIENT-NAME.                       
           MOVE ' '                 TO  TEMP-REJ-IND.                           
                                                                                
           MOVE 'Y'                 TO  TEMP-ALTBR-CHNG-IND.                    
           MOVE NNARPB-ALT-BRANCH   TO  TEMP-ALTBR-FROM.                        
           MOVE ALTBREC-ALT-BR-TO   TO  TEMP-ALTBR-TO.                          
           MOVE 'Y'                 TO  TEMP-RR-CHNG-IND.                       
           MOVE NAPPA-RR1-3         TO  TEMP-RR-FROM.                           
           MOVE ALTBREC-RR          TO  TEMP-RR-TO.                             
           WRITE  TEMP-RECORD     FROM  TEMP-DATA-REC.                          
                                                                                
       610-EXIT.  EXIT.                                                         
       EJECT                                                                    
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*  SAVE RR # IN DB-SAVE-RECORD AREA.                                      
ET0004*  NOTE: DB2 UPDATE IS DONE AT CAT612 UPDATE PROGRAM.                     
ET0004*----------------------------------------------------------------*        
ET0004 612-SAVE-RR-FOR-UPDATE.                                                  
           MOVE SPACE              TO DB-SAVE-WORK-REC.                         
           MOVE WK-CLT-NBR         TO DB-SAVE-CLT-NBR.                          
           MOVE WK-ACAT-CNTRL-NBR  TO DB-SAVE-ACAT-NBR.                         
ET0005     MOVE 'R'                TO DB-SAVE-NA-UPDATE-IND.                    
           MOVE WK-CURR-BRCH-CD    TO DB-SAVE-BRANCH.                           
           MOVE WK-CURR-ACCT-CD    TO DB-SAVE-ACCT.                             
           MOVE WK-RR-NBR          TO DB-SAVE-RR-NBR.                           
           WRITE DB-SAVE-RECORD FROM DB-SAVE-WORK-REC.                          
           ADD 1 TO DBSAVE-REC-CNT.                                             
       612-EXIT.  EXIT.                                                         
       EJECT                                                                    
       625-DELIVER-REVERSAL.                                                    
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-10A0-BR                        
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-10A0-ACCT                      
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE '-'     TO  NAUPI0-NMB-CASH-ACCT                                
                            NAUPI0-NMB-MRGN-ACCT.                               
           MOVE '----'            TO  NAUPI0-ACAT-DELIV-BROKER-NO.              
                                                                                
ET0002                                                                          
ET0002     IF B1-WRK-NA-UPD-DELV = '3'                                          
ET0002        MOVE ALL '-'   TO NAUPI0-BUS-STOP-DATE                            
ET0002     END-IF.                                                              
ET0002                                                                          
                                                                                
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
           MOVE B1-WRK-ADP-CL-NO    TO  TEMP-CLIENT.                            
           MOVE BRANCH-CD OF DCLVTRNFR  TO  TEMP-BRANCH.                        
           MOVE ACCT-CD   OF DCLVTRNFR  TO  TEMP-ACCOUNT.                       
           MOVE B1-WRK-CLI-NAME     TO  TEMP-CLIENT-NAME.                       
           MOVE ' '                 TO  TEMP-DIV-CODE.                          
           MOVE ' '                 TO  TEMP-SELL-CODE.                         
           MOVE ' '                 TO  TEMP-CASH-SWEEP.                        
           MOVE 'Y'                 TO  TEMP-REJ-IND.                           
ET0002     MOVE ' '                 TO  TEMP-BUS-STOP-DT.                       
           WRITE  TEMP-RECORD     FROM  TEMP-DATA-REC.                          
DJ0002     ADD  1  TO NA-DLVR-REVERSED-CNT.                                     
       625-DELIVER-REVERSAL-EXIT.   EXIT.                                       
       EJECT                                                                    
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*      REVERSE ALTERNATE BRANCH AND RR# UPDATE                            
ET0004*----------------------------------------------------------------*        
ET0004 628-DELIVER-ALTBR-REVERSAL.                                              
           MOVE LOW-VALUE               TO ALTBREC.                             
           MOVE WK-CLT-NBR-3            TO ALTBREC-CLIENT.                      
LRM010     MOVE BRANCH-ALTNT-CD OF DCLVTRNFR                                    
                                        TO ALTBREC-ALT-BR.                      
                                                                                
           READ ALTBR-FILE.                                                     
                                                                                
           EVALUATE ALTBR-LOG-STATUS                                            
              WHEN '00'                                                         
                 CONTINUE                                                       
              WHEN '23'                                                         
                 DISPLAY 'ALTBR REVERSAL NOTFND ' ALTBREC-CLIENT                
                   ' ' ALTBREC-ALT-BR ' ' BRANCH-CD OF DCLVTRNFR                
                                          ACCT-CD   OF DCLVTRNFR                
                   ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                            
                 GO TO 628-EXIT                                                 
              WHEN OTHER                                                        
                 DISPLAY 'UNABLE TO READ ALT BRANCH VSAM FILE - STATUS'         
                         ' = ' ALTBR-LOG-STATUS                                 
                 CALL ABEND       USING ABEND-CODE-1010                         
           END-EVALUATE.                                                        
                                                                                
LRM011     IF ALTBREC-ALT-BR-TO = ALTBREC-ALT-BR                                
LRM016     AND (RR-ORGNL-CD OF DCLVTRNFR = NNARPE-PREV-ALT-RR(4 :3)             
LRM016       OR RR-ORGNL-CD OF DCLVTRNFR = NNARPB-ALT-RR(4 : 3))                
LRM011        CONTINUE                                                          
LRM011     ELSE                                                                 
           IF ALTBREC-ALT-BR-TO = NNARPB-ALT-BRANCH                             
LRM016     AND (RR-ORGNL-CD OF DCLVTRNFR = NNARPE-PREV-ALT-RR(4 :3)             
LRM016       OR RR-ORGNL-CD OF DCLVTRNFR = NNARPB-ALT-RR(4 : 3))                
              CONTINUE                                                          
           ELSE                                                                 
TEST          DISPLAY 'ALTBR VSAM REV FIELDS MISMATCHED'                        
TEST          DISPLAY '  ' ALTBREC-ALT-BR-TO  ' ' NNARPB-ALT-BRANCH             
TEST          ' ORGNL-CD ' RR-ORGNL-CD OF DCLVTRNFR                             
LRM016        ' PREV-ALT-RR ' NNARPE-PREV-ALT-RR                                
LRM016        ' NA-ALT-RR ' NNARPB-ALT-RR                                       
              GO TO 628-EXIT                                                    
           END-IF.                                                              
                                                                                
           MOVE SPACE   TO  NAUP-5100B00-REC.                                   
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE SPACES  TO  TEMP-DATA-REC.                                      
                                                                                
           MOVE '10'               TO  NAUP-10A0-RECORD-ID.                     
           MOVE '00'               TO  NAUP-10A0-RECORD-ID2.                    
           MOVE 'A'                TO  NAUP-10A0-SEG-ID.                        
           MOVE ZERO               TO  NAUP-10A0-ACCT-TYPE.                     
           MOVE 00                 TO  NAUP-10A0-SEG-UPDT-SEQ.                  
           MOVE 'X'                TO  NAUP-10A0-CHECK-DIGIT.                   
LRM026**** MOVE 'A'                TO  NAUP-10A0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-10A0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-10A0-ACTION-CD.                     
                                                                                
           MOVE '10'               TO  NAUP-10I0-RECORD-ID.                     
           MOVE '00'               TO  NAUP-10I0-RECORD-ID2.                    
           MOVE 'I'                TO  NAUP-10I0-SEG-ID.                        
           MOVE ZERO               TO  NAUP-10I0-ACCT-TYPE.                     
           MOVE 00                 TO  NAUP-10I0-SEG-UPDT-SEQ.                  
           MOVE 'X'                TO  NAUP-10I0-CHECK-DIGIT.                   
LRM026*****MOVE 'A'                TO  NAUP-10I0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-10I0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-10I0-ACTION-CD.                     
                                                                                
           MOVE '51'               TO  NAUP-51B0-RECORD-ID                      
           MOVE '00'               TO  NAUP-51B0-RECORD-ID2.                    
           MOVE 'B'                TO  NAUP-51B0-SEG-ID.                        
           MOVE  ZERO              TO  NAUP-51B0-SEG-UPDT-SEQ.                  
           MOVE  ZERO              TO  NAUP-51B0-ACCT-TYPE.                     
           MOVE 'X'                TO  NAUP-51B0-CHECK-DIGIT.                   
LRM026*****MOVE 'A'                TO  NAUP-51B0-TRID-CODE.                     
LRM026     MOVE 'B'                TO  NAUP-51B0-TRID-CODE.                     
           MOVE '3'                TO  NAUP-51B0-ACTION-CD.                     
                                                                                
           MOVE B1-WRK-ADP-CL-NO   TO  NAUP-51B0-CL                             
                                       NAUP-10A0-CL                             
                                       NAUP-10I0-CL.                            
           MOVE BRANCH-CD OF DCLVTRNFR TO  NAUP-51B0-BR                         
                                       NAUP-10A0-BR                             
                                       NAUP-10I0-BR.                            
           MOVE ACCT-CD   OF DCLVTRNFR TO  NAUP-51B0-ACCT                       
                                       NAUP-10A0-ACCT                           
                                       NAUP-10I0-ACCT.                          
                                                                                
LRM016     IF RR-ORGNL-CD OF DCLVTRNFR > SPACES                                 
LRM016        MOVE RR-ORGNL-CD OF DCLVTRNFR TO NAUPA0-RR                        
LRM016                            TEMP-RR-TO                                    
LRM016        DISPLAY 'RR REVERSAL UPDATE CREATED '                             
LRM016          ' ' BRANCH-CD        OF DCLVTRNFR                               
LRM016              ACCT-CD          OF DCLVTRNFR                               
LRM016          ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                               
LRM016          ' NEW RR ' RR-ORGNL-CD OF DCLVTRNFR                             
           ELSE                                                                 
LRM016         MOVE '---'       TO NAUPA0-RR                                    
               MOVE SPACE       TO TEMP-RR-TO                                   
           END-IF.                                                              
LRM017     IF NNARPE-PREV-ALT-RR > SPACES                                       
LRM017        MOVE NNARPE-PREV-ALT-RR    TO NAUP51B0-ALT-RR                     
LRM017        DISPLAY  '     PREV-ALT-RR ' NNARPE-PREV-ALT-RR                   
LRM017          ' REPLACES ALT-RR ' NNARPB-ALT-RR                               
LRM017     ELSE                                                                 
LRM017        MOVE SPACE                 TO NAUP51B0-ALT-RR                     
LRM017        DISPLAY  '     PREV-ALT-RR MISSING / NO ALT-RR REVERSAL'          
LRM017     END-IF.                                                              
           MOVE NAUP-1000A00-REC   TO NA-UPDATE-REC                             
           PERFORM 900-WRITE-NA-UPDATE                                          
              THRU 900-WRITE-NA-UPDATE-EXIT                                     
           MOVE RR-ORGNL-CD OF DCLVTRNFR TO WK-RR-NBR                           
           PERFORM 612-SAVE-RR-FOR-UPDATE                                       
              THRU 612-EXIT.                                                    
                                                                                
LRM008     IF NNARPE-PREV-ALT-BRANCH NOT > SPACES                               
LRM016        MOVE NAUP-5100B00-REC   TO NA-UPDATE-REC                          
LRM016        PERFORM 900-WRITE-NA-UPDATE                                       
LRM016           THRU 900-WRITE-NA-UPDATE-EXIT                                  
LRM008        GO TO 628-EXIT                                                    
LRM008     END-IF.                                                              
                                                                                
LRM010     IF NNARPB-ALT-BRANCH = BRANCH-ALTNT-CD OF DCLVTRNFR                  
LRM010        DISPLAY 'N/A ALTBR CURRENT = ORIG ACAT '                          
LRM010                               BRANCH-ALTNT-CD OF DCLVTRNFR               
LRM010                                 ' ' BRANCH-CD OF DCLVTRNFR               
LRM010                                     ACCT-CD   OF DCLVTRNFR               
LRM010                          ' ' ACAT-CONTROL-NBR OF DCLVTRNFR               
LRM010     ELSE                                                                 
           IF ALTBREC-ALT-BR-TO = NNARPB-ALT-BRANCH                             
              IF NNARPE-PREV-ALT-BRANCH = BRANCH-ALTNT-CD OF DCLVTRNFR          
                 MOVE NNARPE-PREV-ALT-BRANCH  TO NAUP51B0-ALT-BRANCH            
                                                 TEMP-ALTBR-TO                  
              ELSE                                                              
                 MOVE '-----' TO NAUP51B0-ALT-BRANCH                            
                 MOVE SPACE   TO TEMP-ALTBR-TO                                  
              END-IF                                                            
              MOVE NAUP-5100B00-REC   TO NA-UPDATE-REC                          
              PERFORM 900-WRITE-NA-UPDATE                                       
                 THRU 900-WRITE-NA-UPDATE-EXIT                                  
              ADD  1  TO NA-ALTBR-REVERSED-CNT                                  
           END-IF.                                                              
                                                                                
                                                                                
           MOVE 'N'                  TO  TEMP-ALTBR-CHNG-IND.                   
           MOVE B1-WRK-ADP-CL-NO     TO  TEMP-CLIENT.                           
           MOVE BRANCH-CD OF DCLVTRNFR   TO  TEMP-BRANCH.                       
           MOVE ACCT-CD   OF DCLVTRNFR   TO  TEMP-ACCOUNT.                      
           MOVE B1-WRK-CLI-NAME      TO  TEMP-CLIENT-NAME.                      
           MOVE 'Y'                  TO  TEMP-REJ-IND.                          
           WRITE  TEMP-RECORD      FROM  TEMP-DATA-REC.                         
       628-EXIT.    EXIT.                                                       
       EJECT                                                                    
                                                                                
       650-PREMIER-UPDTE.                                                       
                                                                                
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPA-SEGMENT-MISSING                                       
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 650-PREMIER-UPDTE-EXIT.                                      
                                                                                
      * DETERMINE IF PREMIERE ACCOUNT                                           
                                                                                
           IF NAPPA-CASH-MNGMNT = 'A' OR 'P' OR 'M'                             
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 650-PREMIER-UPDTE-EXIT.                                      
                                                                                
      * PREMIERE ACCOUNT PROCESSING                                             
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000A01-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10A1-CL.                           
           MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-10A0-BR                        
                                        NAUP-10A1-BR.                           
           MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-10A0-ACCT                      
                                        NAUP-10A1-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-AUTO-CASH-MNGMNT2.                           
           MOVE  '--'   TO  NAUPA0-99FUNDS-SLOT.                                
                                                                                
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           MOVE '10'                TO  NAUP-10A1-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A1-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A1-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A1-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A1-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A1-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A1-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A1-SEG-ID.                       
           MOVE 01                  TO  NAUP-10A1-SEG-UPDT-SEQ.                 
                                                                                
           MOVE '03'    TO  NAUPA1-ACM-CANCEL-CODE.                             
                                                                                
           MOVE NAUP-1000A01-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
                                                                                
           PERFORM 800-FORMAT-REPORT-REC THRU                                   
                   800-FORMAT-REPORT-REC-EXIT.                                  
                                                                                
       650-PREMIER-UPDTE-EXIT.  EXIT.                                           
      *                                                                         
      *                                                                         
       651-PREMIER-REPORT-ONLY.                                                 
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPA-SEGMENT-MISSING                                       
             CONTINUE                                                           
           ELSE                                                                 
             GO TO 651-EXIT.                                                    
                                                                                
           IF NAPPA-CASH-MNGMNT = 'A' OR 'P' OR 'M'                             
                 PERFORM 800-FORMAT-REPORT-REC                                  
                 THRU    800-FORMAT-REPORT-REC-EXIT                             
           END-IF.                                                              
                                                                                
       651-EXIT.       EXIT.                                                    
       EJECT                                                                    
                                                                                
       700-RECEIVER-UPDTE.                                                      
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                TO  NAUP-10A0-SEG-UPDT-SEQ.                   
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-10A0-BR                        
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-10A0-ACCT                      
                                        NAUP-10I0-ACCT.                         
                                                                                
LRM027     IF TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                                
              MOVE  'R'    TO  NAUPA0-ACAT-CODE                                 
LRM027     ELSE                                                                 
LRM027     IF NAPPA-ACAT-CODE = 'D'                                             
LRM027        MOVE  '-'    TO  NAUPA0-ACAT-CODE                                 
LRM027     END-IF.                                                              
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC                             
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT                                     
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
LRM027     IF TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                                
             IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                                
               MOVE RCV-NBR  OF DCLVTRNFR TO  NAUPI0-ACAT-RECV-BROKER-NO        
             ELSE                                                               
             IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                                
               MOVE DLVR-NBR OF DCLVTRNFR TO  NAUPI0-ACAT-RECV-BROKER-NO        
LRM027       END-IF END-IF                                                      
LRM027     ELSE                                                                 
LRM027     IF NAPPA-ACAT-CODE = 'D'                                             
              MOVE ALL '-'                TO  NAUPI0-ACAT-RECV-BROKER-NO        
LRM027     END-IF.                                                              
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
       700-RECEIVER-UPDTE-EXIT.  EXIT.                                          
       EJECT                                                                    
                                                                                
       725-RECEIVER-REVERSAL.                                                   
                                                                                
           MOVE SPACES  TO  NAUP-1000A00-REC.                                   
           MOVE SPACES  TO  NAUP-1000I00-REC.                                   
                                                                                
           MOVE '10'                TO  NAUP-10A0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10A0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE.                    
           MOVE '3'                 TO  NAUP-10A0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10A0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10A0-TRID-CODE.                    
           MOVE 'A'                 TO  NAUP-10A0-SEG-ID.                       
           MOVE 00                  TO  NAUP-10A0-SEG-UPDT-SEQ.                 
                                                                                
           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                            
                                        NAUP-10I0-CL.                           
           MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-10A0-BR                        
                                        NAUP-10I0-BR.                           
           MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-10A0-ACCT                      
                                        NAUP-10I0-ACCT.                         
                                                                                
           MOVE  '-'    TO  NAUPA0-ACAT-CODE.                                   
           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC                             
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT                                     
                                                                                
           MOVE '10'                TO  NAUP-10I0-RECORD-ID.                    
           MOVE '00'                TO  NAUP-10I0-RECORD-ID2.                   
           MOVE 'X'                 TO  NAUP-10I0-CHECK-DIGIT.                  
           MOVE ZERO                TO  NAUP-10I0-ACCT-TYPE.                    
           MOVE 00                  TO  NAUP-10I0-SEG-UPDT-SEQ.                 
           MOVE '3'                 TO  NAUP-10I0-ACTION-CD.                    
LRM026*****MOVE 'A'                 TO  NAUP-10I0-TRID-CODE.                    
LRM026     MOVE 'B'                 TO  NAUP-10I0-TRID-CODE.                    
           MOVE 'I'                 TO  NAUP-10I0-SEG-ID.                       
                                                                                
           MOVE '----'            TO  NAUPI0-ACAT-RECV-BROKER-NO.               
           MOVE NAUP-1000I00-REC  TO  NA-UPDATE-REC.                            
           PERFORM 900-WRITE-NA-UPDATE THRU                                     
                   900-WRITE-NA-UPDATE-EXIT.                                    
       725-RECEIVER-REVERSAL-EXIT.  EXIT.                                       
                                                                                
       EJECT                                                                    
LRM007 0750-AUTO-WIRES-RTN.                                                     
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '100' OR '110')                    
LRM007        MOVE 'WACAT016' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'OUTGOING ACAT NOTIFICATION' TO                              
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTD')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '200')                             
LRM007        MOVE 'WACAT017' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'OUTGOING PARTIAL TRANSFER DELIVERY (PTD)' TO                
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'R'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTD')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '200')                             
LRM007        MOVE 'WACAT018' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'INCOMING PARTIAL TRANSFER DELIVERY (PTD)' TO                
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'R'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '500')                             
LRM007        MOVE 'WACAT019' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'INCOMING PARTIAL TRANSFER FROM US (PTR)' TO                 
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'FRV')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '200')                             
LRM007        MOVE 'WACAT023' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'OUTGOING ACAT FAIL REVERSAL' TO                             
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM015     IF DSTBN-SIDE-CD   OF DCLVTRNFR = 'R'                        CAT756  
LRM015     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL')                             
LRM015     AND STTS-CD        OF DCLVTRNFR =  '200'                     CAT756  
LRM015        MOVE 'WACAT026' TO ESWWIRE-MSG-SCON                               
LRM015        MOVE 'OUTGOING ACAT RECLAIM' TO                                   
LRM015                          ESWWIRE-MSG-SUBJECT                             
LRM015     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'R'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'RCR')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '200')                             
LRM007        MOVE 'WACAT027' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'INCOMING ACAT RESIDUAL CREDIT' TO                           
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                                
LRM007     AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                               
LRM007     AND ADOPT-AGRMT-IND OF DCLVTRNFR = 'N'                               
LRM007     AND (STTS-CD       OF DCLVTRNFR = '140')                             
LRM007        MOVE 'WACAT028' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'OUTGOING ACATS REJECTION' TO                                
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007     IF  DSTBN-SIDE-CD  OF DCLVTRNFR = 'D'                                
LRM007     AND (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR')                             
LRM007     AND (STTS-CD       OF DCLVTRNFR = '500')                             
LRM007        MOVE 'WACAT029' TO ESWWIRE-MSG-SCON                               
LRM007        MOVE 'OUTGOING ACAT PARTIAL TRANSFER (PTR)' TO                    
LRM007                          ESWWIRE-MSG-SUBJECT                             
LRM007     ELSE                                                                 
LRM007        GO TO 0750-EXIT                                                   
LRM007     END-IF.                                                              
LRM007                                                                          
LRM007     PERFORM 0752-AUTO-WIRE-CREATION.                                     
LRM007                                                                          
LRM007 0750-EXIT. EXIT.                                                         
LRM007                                                                          
LRM007     SKIP3                                                                
LRM007 0752-AUTO-WIRE-CREATION.                                                 
LRM007     MOVE B1-WRK-ADP-CL-NO TO ESWWIRE-MSG-CLIENT.                         
LRM007     MOVE BRANCH-CD OF DCLVTRNFR TO ESWWIRE-MSG-RECIPIENT-BR              
LRM007                          WIRE-ACAT-BRANCH                                
LRM007* WAITING ON ORIG RR CODE ON DB2 VTRNFR                                   
LRM007     MOVE RR-ORGNL-CD OF DCLVTRNFR TO ESWWIRE-MSG-RECIPIENT-RR            
LRM007                          WIRE-ACAT-RR                                    
LRM007     MOVE 'ACATS'      TO ESWWIRE-MSG-SENDER                              
LRM007     MOVE 'CAT610'     TO ESWWIRE-MSG-PGM-SOURCE                          
LRM007     MOVE PROC-DATE    TO ESWWIRE-MSG-TIMESTAMP(1 : 8).                   
LRM007     MOVE CURRENT-TIME TO ESWWIRE-MSG-TIMESTAMP(9 : 6).                   
LRM007                                                                          
LRM007     MOVE ACCT-CD OF DCLVTRNFR TO  WIRE-ACAT-ACCOUNT                      
LRM012                      ESWWIRE-MSG-ACCOUNT-NUM                             
LRM007     MOVE ACAT-CONTROL-NBR OF DCLVTRNFR                                   
LRM007                           TO   WIRE-ACAT-CONTROL-NBR                     
LRM007     MOVE BRANCH-ALTNT-CD OF DCLVTRNFR TO WIRE-ACAT-ALT-BRANCH            
LRM012                                ESWWIRE-MSG-ALTBR                         
LRM007     IF  NOT NNAPPN-SEGMENT-MISSING                                       
LRM007        MOVE NNAPPN-SHORT-NAME-P TO WIRE-ACAT-SHORT-NAME                  
LRM007     ELSE                                                                 
LRM007        MOVE SPACES              TO WIRE-ACAT-SHORT-NAME                  
LRM007     END-IF.                                                              
LRM007     MOVE RCV-CUST-NM OF DCLVTRNFR TO WIRE-ACAT-TITLE                     
LRM007     IF BRANCH-ALTNT-CD OF DCLVTRNFR (1 : 1) = '2'                        
LRM007        MOVE 'DAIN CORRESPONDENT SVCS' TO WIRE-ACAT-CONTACT-NAME          
LRM007        MOVE '(866) 506-8587'          TO WIRE-ACAT-CONTACT-PHONE         
LRM007     ELSE                                                                 
LRM007        MOVE 'ACCOUNT TRANSFER DEPARTMENT' TO                             
LRM007                                          WIRE-ACAT-CONTACT-NAME          
LRM007        MOVE '(612) 607-8229'          TO WIRE-ACAT-CONTACT-PHONE         
LRM007     END-IF.                                                              
LRM007     MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO WIRE-ACAT-TRNFR-TYPE              
LRM007     MOVE STTS-CD OF DCLVTRNFR TO WIRE-ACAT-STATUS-CD                     
LRM007     IF  DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                                 
LRM007       MOVE RCV-NBR      OF DCLVTRNFR TO WIRE-ACAT-CONTRA-BRK-NBR         
LRM007       MOVE ACCT-RCV-NBR OF DCLVTRNFR TO WIRE-ACAT-CONTRA-ACCOUNT         
LRM007     ELSE                                                                 
LRM007      MOVE DLVR-NBR      OF DCLVTRNFR TO WIRE-ACAT-CONTRA-BRK-NBR         
LRM007      MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO WIRE-ACAT-CONTRA-ACCOUNT         
LRM007     END-IF.                                                              
LRM007                                                                          
LRM007     MOVE 500              TO ESWWIRE-MSG-LENGTH                          
LRM007*****MOVE WIRE-ACAT-RECORD TO ESWWIRE-MSG-DATA.                           
LRM007     WRITE AUTOWIRE-REC  FROM ESWWIRE-MSG                                 
LRM007     ADD 1 TO WS-AUTOWIRE-REC-CNT.                                        
LRM007                                                                          
       EJECT                                                                    
LRM009 770-SELECT-VASSET-90DR-RTN.                                              
LRM009     EXEC SQL SELECT ASSET_CMNT_TXT                                       
LRM009       INTO :DCLVASSET.ASSET-CMNT-TXT                                     
LRM009          FROM VASSET                                                     
LRM009       WHERE    CLIENT_NBR       =  :DCLVTRNFR.CLIENT-NBR                 
LRM009         AND    ACAT_CONTROL_NBR =  :DCLVTRNFR.ACAT-CONTROL-NBR           
LRM009         AND    STTLM_RSN_CD     =  '90DR'                                
LRM009     END-EXEC.                                                            
LRM009                                                                          
LRM009 780-UPD-90DAY-TRADE-RESTR-RTN.                                           
LRM009     MOVE ASSET-CMNT-TXT OF DCLVASSET (1 : 8) TO WS-90DR-DATE.            
LRM009     IF ASSET-CMNT-TXT OF DCLVASSET (1 : 8) NOT NUMERIC                   
LRM009     OR (WS-90DR-DATE-MM  < '01' OR > '12')                               
LRM009     OR (WS-90DR-DATE-DD  < '01' OR > '31')                               
LRM009     OR  WS-90DR-DATE-CC  < '20'                                          
LRM009     OR (WS-90DR-DATE-MM  = '02'                                          
LRM009       AND WS-90DR-DATE-DD  > '28')                                       
LRM009     OR ((WS-90DR-DATE-MM  = '04' OR '06' OR '09' OR '11')                
LRM009       AND WS-90DR-DATE-DD  > '30')                                       
LRM009        DISPLAY '90DR MEMO BYPASSED / DATE NOT DB2 COMPATIBLE '           
LRM009           ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                            
LRM009        ' ' CLIENT-NBR OF DCLVTRNFR                                       
LRM009        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                                 
LRM009        ' ' ACCT-RCV-NBR OF DCLVTRNFR                                     
LRM009     ELSE                                                                 
LRM009     MOVE NAPPA-DATE-90DAY-ENDED TO WS-NA-90DAY-END-DT-UNPK               
LRM009     IF ASSET-CMNT-TXT OF DCLVASSET (1 : 8) >= PROC-DATE                  
LRM009     AND ASSET-CMNT-TXT OF DCLVASSET (1 : 8) > WS-NA-90DAY-END-DT         
LRM009        PERFORM 790-CALC-90DR-MINUS90-RTN                                 
LRM009        IF BPD-VALID-RETURN                                               
LRM009           MOVE SPACES  TO  NAUP-1000A00-REC                              
LRM009           MOVE '10'                TO  NAUP-10A0-RECORD-ID               
LRM009           MOVE '00'                TO  NAUP-10A0-RECORD-ID2              
LRM009           MOVE 'X'                 TO  NAUP-10A0-CHECK-DIGIT             
LRM009           MOVE ZERO                TO  NAUP-10A0-ACCT-TYPE               
LRM009           MOVE '3'                 TO  NAUP-10A0-ACTION-CD               
LRM009***********MOVE 'A'                 TO  NAUP-10A0-TRID-CODE               
LRM026           MOVE 'B'                 TO  NAUP-10A0-TRID-CODE               
LRM009           MOVE 'A'                 TO  NAUP-10A0-SEG-ID                  
LRM009           MOVE 00                TO  NAUP-10A0-SEG-UPDT-SEQ              
LRM009           MOVE B1-WRK-ADP-CL-NO    TO  NAUP-10A0-CL                      
LRM009           MOVE BRANCH-CD OF DCLVTRNFR  TO  NAUP-10A0-BR                  
LRM009           MOVE ACCT-CD   OF DCLVTRNFR  TO  NAUP-10A0-ACCT                
LRM009                                                                          
LRM009           MOVE '1' TO  NAUPA0-90-DAY-RES-IND                             
LRM009           MOVE WS-90DR-DATE-NUM TO     NAUPA0-DATE-90DAY-RES-END         
LRM009           MOVE BPD-DT-CALDATE TO       NAUPA0-DATE-90DAY-RES-BEG         
LRM009                                                                          
LRM009           MOVE NAUP-1000A00-REC  TO  NA-UPDATE-REC                       
LRM009           PERFORM 900-WRITE-NA-UPDATE THRU                               
LRM009                   900-WRITE-NA-UPDATE-EXIT                               
LRM009        END-IF                                                            
LRM009     ELSE                                                                 
LRM009        DISPLAY '90DR UPDT BYPASSED / NOT FUTURE DATE CCYYMMDD '          
LRM009           ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                            
LRM009        ' ' CLIENT-NBR OF DCLVTRNFR                                       
LRM009        ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                                 
LRM009        ' ' ACCT-RCV-NBR OF DCLVTRNFR                                     
LRM009     END-IF.                                                              
LRM009                                                                          
LRM009 780-EXIT.                                                                
LRM009     EXIT.                                                                
LRM009 790-CALC-90DR-MINUS90-RTN.                                               
LRM009* GET START DATE 90 DAYS PRIOR                                            
LRM009                                                                          
LRM009     MOVE  'D'                     TO  BPDATES-REQ-TYPE.                  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*****MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.             
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.             
LRM009     MOVE  ASSET-CMNT-TXT OF DCLVASSET (1 : 8)                            
LRM009                                   TO  BPDATES-BASE-DATE.                 
LRM009     MOVE  'M'                     TO  BPDATES-DTSEARCH-IND.              
LRM009     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.             
LRM009     MOVE  90                      TO  BPDATES-DTSEARCH-DISP.             
LRM009     CALL   BPDATES             USING  BPDATES-PARAMETERS.                
LRM009                                                                          
LRM009     IF NOT BPD-VALID-RETURN                                              
LRM009        DISPLAY 'BPDATES DISPL -90 DAY FAILED WITH RC = '                 
LRM009            BPDATES-RETURN-CODE  ' FOR ' BPDATES-BASE-DATE                
LRM009        DISPLAY '90DR N/A UPD BYPASSED'                                   
LRM009     END-IF.                                                              
LRM009                                                                          
                                                                                
LRM013 795-CALC-DATE-MINUS1-RTN.                                                
LRM013* GET PRIOR ACAT DATE EITHER S/D OR T/D                                   
LRM013                                                                          
LRM013     MOVE  'D'                     TO  BPDATES-REQ-TYPE.                  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*****MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE              
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE              
LRM013     MOVE  WS-TODAY-CCYYMMDD       TO  BPDATES-BASE-DATE.                 
LRM013     MOVE  'M'                     TO  BPDATES-DTSEARCH-IND.              
LRM013     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.             
LRM013     MOVE '0' TO BPD-DT-DAY-TYPE                                          
LRM013     PERFORM VARYING DAY-SUB FROM 1 BY 1                                  
LRM013        UNTIL DAY-SUB > 5                                                 
LRM013            OR BPD-DT-TD-AND-SD                                           
LRM013            OR BPD-DT-TRADE-DAY-ONLY                                      
LRM013        MOVE  DAY-SUB                 TO  BPDATES-DTSEARCH-DISP           
LRM013        CALL   BPDATES             USING  BPDATES-PARAMETERS              
LRM013        END-CALL                                                          
LRM013     END-PERFORM.                                                         
LRM013     IF NOT BPD-VALID-RETURN                                              
LRM013        DISPLAY 'BPDATES DISPL -1 DAY FAILED WITH RC = '                  
LRM013            BPDATES-RETURN-CODE  ' FOR ' BPDATES-BASE-DATE                
LRM013        DISPLAY 'PRIOR DATE SRCH FAILED,MAY EFFECT WIRES CREATE'          
LRM013        MOVE 'CCYYDDD'      TO WS-YEST-JULIAN-DT                          
LRM013     ELSE                                                                 
LRM013        DISPLAY 'CAT610 JUL DATE YEST ' BPD-DT-JULDATE                    
LRM013        MOVE BPD-DT-JULDATE TO WS-YEST-JULIAN-DT                          
LRM013     END-IF.                                                              
LRM013                                                                          
       EJECT                                                                    
LRM014 796-CALC-DATE-PLUS1-RTN.                                                 
LRM014* LOOK FOR NEXT PROCESSING DAY TO SEE IF BANK HOLIDAY                     
LRM014                                                                          
LRM014     MOVE  'D'                     TO  BPDATES-REQ-TYPE.                  
CSG001*****MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE              
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE              
LRM014     MOVE  WS-TODAY-CCYYMMDD       TO  BPDATES-BASE-DATE.                 
LRM014     MOVE  'P'                     TO  BPDATES-DTSEARCH-IND.              
LRM014     MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.             
LRM014     MOVE ' ' TO BPD-DT-DAY-TYPE                                          
LRM014     PERFORM VARYING DAY-SUB FROM 1 BY 1                                  
LRM014        UNTIL DAY-SUB > 5                                                 
LRM014            OR BPD-DT-TD-AND-SD                                           
LRM014            OR BPD-DT-TRADE-DAY-ONLY                                      
LRM014        MOVE  DAY-SUB                 TO  BPDATES-DTSEARCH-DISP           
LRM014        CALL   BPDATES             USING  BPDATES-PARAMETERS              
LRM014        END-CALL                                                          
TEST          DISPLAY 'NEXT DAY ' BPD-DT-JULDATE                                
TEST                 ' TYPE-DAY ' BPD-DT-DAY-TYPE                               
LRM014     END-PERFORM.                                                         
LRM014     IF NOT BPD-VALID-RETURN                                              
LRM014        DISPLAY 'BPDATES DISPL +1 DAY FAILED WITH RC = '                  
LRM014            BPDATES-RETURN-CODE  ' FOR ' BPDATES-BASE-DATE                
LRM014        DISPLAY 'BANK HOLIDAY - N/A UPD BYPASSED'                         
LRM014     ELSE                                                                 
LRM014        MOVE  BPD-DT-DAY-TYPE TO WS-TOMORROW-TYPE-OF-DAY                  
LRM014        DISPLAY 'CAT610 JUL DATE TOMORROW ' BPD-DT-JULDATE                
LRM014     END-IF.                                                              
                                                                                
       EJECT                                                                    
       800-FORMAT-REPORT-REC.                                                   
                                                                                
           MOVE 'Y'                 TO  B1-CL-HIT (B1-SUB1-SVE).                
           MOVE B1-WRK-ADP-CL-NO    TO  ADR-CLIENT.                             
           MOVE ZERO                TO  ADR-CONTROLLER.                         
           MOVE BRANCH-CD OF DCLVTRNFR  TO  ADR-BRANCH.                         
           MOVE ACCT-CD   OF DCLVTRNFR  TO  ADR-ACCOUNT.                        
           MOVE B1-WRK-CLI-NAME     TO  ADR-CLIENT-NAME.                        
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NAPPB-SEGMENT-MISSING                                       
              MOVE NAPPB-NA-LINE1-30 (1)  TO  ADR-ACCT-TITLE                    
              MOVE NAPPB-NA-LINE1-30 (2)  TO  ADR-ACCT-TITLE (31:30)            
              MOVE NAPPB-NA-LINE1-30 (3)  TO  ADR-ACCT-TITLE (61:30)            
           ELSE                                                                 
              MOVE '* NOT FOUND ON N\A MASTER *'  TO ADR-ACCT-TITLE.            
                                                                                
           IF  GETNA-RETURN-FOUND     AND                                       
               NOT  NNARPC-SEGMENT-MISSING                                      
             MOVE NNARPC-DATE-CARD-OPENED TO WORK-DATE-OPEN                     
             MOVE WORK-DATE-OPEN          TO  ADR-DATE-OPENED                   
           ELSE                                                                 
             MOVE '00000000'              TO  ADR-DATE-OPENED.                  
                                                                                
           RELEASE SORT-REC FROM ACAT-DATA-REC.                                 
                                                                                
       800-FORMAT-REPORT-REC-EXIT.  EXIT.                                       
       EJECT                                                                    
                                                                                
       900-WRITE-NA-UPDATE.                                                     
                                                                                
           WRITE NA-UPDATE-REC.                                                 
           ADD  1  TO  NA-UPDATE-RECS.                                          
                                                                                
       900-WRITE-NA-UPDATE-EXIT.  EXIT.                                         
       EJECT                                                                    
                                                                                
       1000-MRGN-INTEREST-FILE-RTN.                                             
           MOVE SPACE            TO MGNINT-REC.                                 
           MOVE CLIENT-NBR OF DCLVTRNFR (2:3) TO MGNINT-CLT-X.                  
           MOVE ZEROES           TO MGNINT-CURR-N.                              
           MOVE BRANCH-CD OF DCLVTRNFR TO MGNINT-BR-X.                          
           MOVE ACCT-CD   OF DCLVTRNFR TO MGNINT-ACCT-X.                        
           MOVE 'CAT610'         TO MGNINT-SRC-PGM.                             
           IF WK-TRNFR-SETTLED                                                  
              MOVE 0  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '1'                                        
              MOVE 6  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '2'                                        
              MOVE 7  TO MGNINT-NUM-OF-DAYS                                     
           ELSE                                                                 
           IF B1-WRK-SUBMIT-ASSETS = '3'                                        
              MOVE 8  TO MGNINT-NUM-OF-DAYS                                     
           END-IF.                                                              
LRM002*** THE FOLLOWING 8 LINES ADDED TO REDUCE THE PROJECTED INTEREST          
LRM002*** BY 1 OR 2 DAYS WHEN REFRESHING ASSETS AND IN REQ-2 OR REQ-3.          
LRM002**   IF NOT WK-TRNFR-SETTLED                                              
LRM002**   AND B1-WRK-REFRESH-ASSETS = '1'                                      
LRM002**      IF WK-DAYS-STTS-QTY = 2                                           
LRM002**         SUBTRACT 1 FROM MGNINT-NUM-OF-DAYS                             
LRM002**      ELSE                                                              
LRM002**      IF WK-DAYS-STTS-QTY = 3                                           
LRM002**         SUBTRACT 2 FROM MGNINT-NUM-OF-DAYS                             
LRM002**   END-IF.                                                              
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
           ADD  1  TO  MGN-INT-REC-CNT                                          
                       MGNINT-REC-CNT.                                          
                                                                                
       1010-MRGN-INT-HEADER-RTN.                                                
           MOVE SPACE             TO MGNINT-REC.                                
           MOVE LOW-VALUE         TO MGNINT-KEY.                                
           MOVE EDIT-CURRENT-DATE TO MGNINT-FH-MDY-X.                           
           MOVE 'CAT610'          TO MGNINT-FH-SRC-PGM.                         
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
                                                                                
       1020-MRGN-INT-TRLR-RTN.                                                  
           MOVE SPACE            TO MGNINT-REC.                                 
           MOVE HIGH-VALUE       TO MGNINT-KEY.                                 
           MOVE MGN-INT-REC-CNT  TO MGNINT-FT-CNT.                              
           MOVE 'CAT610'         TO MGNINT-FT-SRC-PGM.                          
           WRITE MGN-INT-REC FROM MGNINT-REC.                                   
       EJECT                                                                    
                                                                                
       1100-PAYMENT-DETAIL-RTN.                                                 
           MOVE SPACE            TO PMNT-RECORD.                                
           MOVE CLIENT-NBR OF DCLVTRNFR (2:3) TO PMNT-CLIENT-NBR.               
           MOVE BRANCH-CD OF DCLVTRNFR  TO PMNT-BRANCH-NBR.                     
           MOVE ACCT-CD   OF DCLVTRNFR  TO PMNT-ACCOUNT-NBR.                    
           WRITE PAYMENT-REC  FROM PMNT-RECORD.                                 
           ADD 1 TO PPMNT-REC-CNT.                                              
                                                                                
       1110-PAYMENT-HEADER-RTN.                                                 
           MOVE SPACE     TO PMNT-RECORD.                                       
           SET PMNT-HDR-DATE-LITERAL TO TRUE.                                   
           MOVE PROC-DATE TO PMNT-HDR-PROC-DATE.                                
           WRITE PAYMENT-REC  FROM PMNT-RECORD.                                 
                                                                                
                                                                                
       1400-PREMIER-REPORT SECTION.                                             
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT610: SORT OUTPUT PROCEDURE #1'                           
C11582     MOVE ZERO TO TRAC-CLI.                                               
                                                                                
       1410-NEXT-REC.                                                           
           RETURN SORT-FILE INTO ACAT-DATA-REC                                  
             AT END GO TO 1400-PREMIER-REPORT-EXIT.                             
                                                                                
C11582*    DISPLAY 'REC= ' ACAT-DATA-REC.                                       
                                                                                
C11582     IF ADR-CLIENT NOT = TRAC-CLI                                         
C11582       MOVE 0 TO PAGECNT                                                  
C11582       PERFORM 1450-HEADERS THRU                                          
C11582               1450-HEADERS-EXIT.                                         
                                                                                
           IF LINECNT > 55                                                      
             PERFORM 1450-HEADERS THRU                                          
                     1450-HEADERS-EXIT.                                         
                                                                                
           IF ADR-BRANCH  =  LOW-VALUES                                         
             MOVE '**** NO PREMIER ACCOUNT TRANSFERS ****' TO NAL-MSG           
             MOVE NO-ACTV-LINE         TO PRINT-AREA                            
             MOVE '0'                  TO CC                                    
             PERFORM 1425-PRINT-LINE THRU                                       
                     1425-PRINT-LINE-EXIT                                       
             GO TO 1410-NEXT-REC.                                               
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-BRANCH             TO DL1-BRANCH.                           
           MOVE '-'                    TO DL1-DASH.                             
           MOVE ADR-ACCOUNT            TO DL1-ACCOUNT.                          
           MOVE ADR-ACCT-TITLE (1:30)  TO DL1-ACCT-TITLE.                       
      **   MOVE ADR-DATE-OPENED        TO WORK-DATE-AREA.                       
      **   MOVE WDA-YY                 TO DL1-DO-YY.                            
      **   MOVE WDA-MM                 TO DL1-DO-MM.                            
      **   MOVE WDA-DD                 TO DL1-DO-DD.                            
      **   MOVE '/'                    TO DL1-SL1                               
      **                                  DL1-SL2.                              
           IF ADR-DATE-OPENED > '00000000'                                      
              MOVE ADR-DATE-OPENED     TO WORK-DATE-AREA                        
              MOVE WDA-YY              TO DL1-DO-YY                             
              MOVE WDA-MM              TO DL1-DO-MM                             
              MOVE WDA-DD              TO DL1-DO-DD                             
              MOVE '/'                 TO DL1-SL1                               
                                       DL1-SL2.                                 
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE '0'                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-ACCT-TITLE (31:30) TO DL1-ACCT-TITLE.                       
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE ' '                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-1.                        
           MOVE ADR-ACCT-TITLE (61:30) TO DL1-ACCT-TITLE.                       
           MOVE DETAIL-LINE-1          TO PRINT-AREA.                           
           MOVE ' '                    TO CC.                                   
                                                                                
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           GO TO 1410-NEXT-REC.                                                 
                                                                                
       1400-PREMIER-REPORT-EXIT.  EXIT.                                         
                                                                                
       1425-PRINT-LINE.                                                         
                                                                                
           WRITE REPORT-REC FROM PRINTAREA.                                     
           IF CC = '1'                                                          
             MOVE 3 TO LINECNT.                                                 
           IF CC = '-'                                                          
             ADD 3 TO LINECNT.                                                  
           IF CC = '0'                                                          
             ADD 2 TO LINECNT.                                                  
           IF CC = ' '                                                          
             ADD 1 TO LINECNT.                                                  
                                                                                
       1425-PRINT-LINE-EXIT.  EXIT.                                             
                                                                                
       1450-HEADERS.                                                            
                                                                                
           MOVE ADR-CLIENT             TO  TRAC-CLI.                            
           MOVE ADR-CONTROLLER         TO  TRAC-CNTL.                           
                                                                                
           ADD  1                      TO  PAGECNT.                             
           MOVE ADR-CLIENT             TO  H1-CLIENT                            
           MOVE ADR-CLIENT-NAME        TO  H1-CLIENT-NAME.                      
           MOVE PAGECNT                TO  H1-PGENO.                            
           MOVE HDR1                   TO  PRINT-AREA.                          
           MOVE '1'                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR2                   TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR3                   TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1425-PRINT-LINE THRU                                         
                   1425-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE 5                       TO  LINECNT.                            
                                                                                
       1450-HEADERS-EXIT.  EXIT.                                                
           EJECT                                                                
       1500-NAUPDT-REPORT SECTION.                                              
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT610: SORT OUTPUT PROCEDURE #2'                           
C11582     MOVE ZERO TO TRAC-CLI.                                               
           MOVE ' ' TO REPORT-2-BREAK-SW.                                       
ET0004     MOVE ' ' TO REPORT-3-BREAK-SW.                                       
                                                                                
       1510-NEXT-REC.                                                           
           RETURN SORT-FILE-2 INTO TEMP-DATA-REC                                
             AT END GO TO 1500-NAUPDT-REPORT-EXIT.                              
                                                                                
ET0004     IF TEMP-ALTBR-CHNG-IND > SPACE                                       
ET0004        PERFORM 1600-ALTBR-UPDT-REPT                                      
ET0004           THRU 1600-EXIT                                                 
ET0004        GO TO 1510-NEXT-REC                                               
ET0004     END-IF.                                                              
ET0004                                                                          
C11582     IF TEMP-CLIENT NOT = TRAC-CLI                                        
C11582        MOVE ZERO TO PAGECNT-2                                            
C11582        PERFORM 1550-HEADERS THRU                                         
C11582                1550-HEADERS-EXIT.                                        
                                                                                
           IF TEMP-REJ-IND > ' '                                                
             IF REPORT-2-BREAK-SW = ' '                                         
                PERFORM 1550-HEADERS THRU                                       
                        1550-HEADERS-EXIT                                       
                MOVE 'Y' TO REPORT-2-BREAK-SW                                   
             END-IF                                                             
           END-IF.                                                              
                                                                                
C11582*    DISPLAY 'REC2= ' TEMP-DATA-REC.                                      
                                                                                
           IF LINECNT-2 > 55                                                    
             PERFORM 1550-HEADERS THRU                                          
                     1550-HEADERS-EXIT.                                         
                                                                                
           IF TEMP-BRANCH  =  LOW-VALUES                                        
             MOVE '** NO DELIVERER N&A UPDATES TODAY **' TO NAL-MSG             
             MOVE NO-ACTV-LINE         TO PRINT-AREA                            
             MOVE '0'                  TO CC                                    
             PERFORM 1525-PRINT-LINE THRU                                       
                     1525-PRINT-LINE-EXIT                                       
             GO TO 1510-NEXT-REC.                                               
                                                                                
           MOVE SPACES                 TO DETAIL-LINE-2.                        
           MOVE TEMP-BRANCH            TO DL2-BRANCH.                           
           MOVE '-'                    TO DL2-DASH.                             
           MOVE TEMP-ACCOUNT           TO DL2-ACCOUNT.                          
           MOVE TEMP-DIV-CODE          TO DL2-DIV-CODE.                         
           MOVE TEMP-SELL-CODE         TO DL2-SELL-CODE.                        
           MOVE TEMP-REJ-IND           TO DL2-REJ-IND.                          
C05759     MOVE TEMP-CASH-SWEEP        TO DL2-CASH-SWEEP.                       
ET0002     MOVE TEMP-BUS-STOP-DT       TO DL2-BUS-STOP-DT.                      
           MOVE DETAIL-LINE-2          TO PRINT-AREA.                           
           MOVE '0'                    TO CC.                                   
                                                                                
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           GO TO 1510-NEXT-REC.                                                 
                                                                                
       1500-NAUPDT-REPORT-EXIT.  EXIT.                                          
                                                                                
       1525-PRINT-LINE.                                                         
                                                                                
           WRITE REPORT-REC-2 FROM PRINTAREA.                                   
           IF CC = '1'                                                          
             MOVE 3 TO LINECNT-2.                                               
           IF CC = '-'                                                          
             ADD 3 TO LINECNT-2.                                                
           IF CC = '0'                                                          
             ADD 2 TO LINECNT-2.                                                
           IF CC = ' '                                                          
             ADD 1 TO LINECNT-2.                                                
                                                                                
       1525-PRINT-LINE-EXIT.  EXIT.                                             
                                                                                
       1550-HEADERS.                                                            
                                                                                
           MOVE TEMP-CLIENT            TO  TRAC-CLI.                            
           MOVE ZEROS                  TO  TRAC-CNTL.                           
                                                                                
           ADD  1                      TO  PAGECNT-2.                           
ET0001     IF PARM-CYCLE-RUN = 'Y'                                              
ET0001        MOVE 'CAT611'            TO  H1-PGM-2                             
ET0001     ELSE                                                                 
ET0001        MOVE 'CAT610'            TO  H1-PGM-2.                            
           MOVE TEMP-CLIENT            TO  H1-CLIENT-2.                         
           MOVE TEMP-CLIENT-NAME       TO  H1-CLIENT-NAME-2.                    
           MOVE PAGECNT-2              TO  H1-PGENO-2.                          
           MOVE HDR1-2                 TO  PRINT-AREA.                          
           MOVE '1'                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR2-2                 TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE HDR3-2                 TO  PRINT-AREA.                          
           MOVE ' '                    TO  CC.                                  
           PERFORM 1525-PRINT-LINE THRU                                         
                   1525-PRINT-LINE-EXIT.                                        
                                                                                
           MOVE 5                       TO  LINECNT-2.                          
                                                                                
       1550-HEADERS-EXIT.  EXIT.                                                
      /                                                                         
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*      N/A ALTERNATE BRCNCH & RR# UPDATE REPORT                           
ET0004*--------------------------------------------------------------*          
ET0004 1600-ALTBR-UPDT-REPT.                                                    
           IF TEMP-CLIENT NOT = TRAC-CLI                                        
              MOVE ZERO TO PAGECNT-3                                            
              PERFORM 1610-ALTBR-HEADERS                                        
                 THRU 1610-EXIT                                                 
              IF TEMP-REJ-IND > ' '                                             
                 MOVE 'Y'   TO REPORT-3-BREAK-SW                                
              ELSE                                                              
                 MOVE SPACE TO REPORT-3-BREAK-SW                                
              END-IF                                                            
           ELSE                                                                 
           IF TEMP-REJ-IND > ' '                                                
              IF REPORT-3-BREAK-SW = ' '                                        
                 PERFORM 1610-ALTBR-HEADERS                                     
                    THRU 1610-EXIT                                              
                 MOVE 'Y' TO REPORT-3-BREAK-SW                                  
              END-IF                                                            
           END-IF                                                               
           END-IF.                                                              
                                                                                
           IF LINECNT-3 > 55                                                    
              PERFORM 1610-ALTBR-HEADERS                                        
                 THRU 1610-EXIT                                                 
           END-IF.                                                              
                                                                                
           IF TEMP-BRANCH  =  LOW-VALUES                                        
              MOVE '** NO N&A ALTERNATE BRANCH AND RR# UPDATES TODAY **'        
                TO NAL-MSG                                                      
              MOVE NO-ACTV-LINE         TO PRINT-AREA                           
              MOVE '0'                  TO CC                                   
              PERFORM 1650-ALTBR-PRINT-LINE                                     
                 THRU 1650-EXIT                                                 
              GO TO 1600-EXIT                                                   
           END-IF.                                                              
                                                                                
           IF TEMP-REJ-IND = ' '                                                
              MOVE TEMP-BRANCH          TO DL3-BRANCH                           
              MOVE TEMP-ACCOUNT         TO DL3-ACCOUNT                          
              MOVE TEMP-REJ-IND         TO DL3-REJ-IND                          
              MOVE TEMP-ALTBR-CHNG-IND  TO DL3-ALTBR-IND                        
              MOVE TEMP-ALTBR-FROM      TO DL3-ALTBR-FROM                       
              MOVE TEMP-ALTBR-TO        TO DL3-ALTBR-TO                         
              MOVE TEMP-RR-CHNG-IND     TO DL3-RR-IND                           
              MOVE TEMP-RR-FROM         TO DL3-RR-FROM                          
              MOVE TEMP-RR-TO           TO DL3-RR-TO                            
              MOVE DETAIL-LINE-3        TO PRINT-AREA                           
              MOVE '0'                  TO CC                                   
              PERFORM 1650-ALTBR-PRINT-LINE                                     
                 THRU 1650-EXIT                                                 
           ELSE                                                                 
              MOVE TEMP-BRANCH          TO DL4-BRANCH                           
              MOVE TEMP-ACCOUNT         TO DL4-ACCOUNT                          
              MOVE TEMP-REJ-IND         TO DL4-REJ-IND                          
              MOVE 'Y'                  TO DL4-ALTBR-REV                        
              MOVE TEMP-ALTBR-TO        TO DL4-ALTBR-REV-TO                     
              MOVE 'Y'                  TO DL4-RR-REV                           
              MOVE TEMP-RR-TO           TO DL4-RR-REV-TO                        
              MOVE DETAIL-LINE-4        TO PRINT-AREA                           
              MOVE '0'                  TO CC                                   
              PERFORM 1650-ALTBR-PRINT-LINE                                     
                 THRU 1650-EXIT                                                 
           END-IF.                                                              
                                                                                
       1600-EXIT.  EXIT.                                                        
       EJECT                                                                    
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*   HEADER LINES FOR ALTENATE BRANCH UPDATE REPORT                        
ET0004*--------------------------------------------------------------*          
ET0004 1610-ALTBR-HEADERS.                                                      
                                                                                
           MOVE TEMP-CLIENT            TO  TRAC-CLI.                            
           MOVE ZEROS                  TO  TRAC-CNTL.                           
                                                                                
           ADD  1                      TO  PAGECNT-3.                           
           MOVE 'CAT611'               TO  H1-PGM-2                             
           MOVE TEMP-CLIENT            TO  H1-CLIENT-2.                         
           MOVE TEMP-CLIENT-NAME       TO  H1-CLIENT-NAME-2.                    
           MOVE PAGECNT-3              TO  H1-PGENO-2.                          
           MOVE HDR1-2                 TO  PRINT-AREA.                          
           MOVE '1'                    TO  CC.                                  
           PERFORM 1650-ALTBR-PRINT-LINE                                        
              THRU 1650-EXIT.                                                   
                                                                                
           MOVE HDR2-3     TO  PRINT-AREA.                                      
           MOVE ' '        TO  CC.                                              
           PERFORM 1650-ALTBR-PRINT-LINE                                        
              THRU 1650-EXIT.                                                   
                                                                                
           IF TEMP-REJ-IND = ' '                                                
              MOVE HDR3-3     TO  PRINT-AREA                                    
              MOVE ' '        TO  CC                                            
              PERFORM 1650-ALTBR-PRINT-LINE                                     
                 THRU 1650-EXIT.                                                
                                                                                
           IF TEMP-REJ-IND = 'Y'                                                
              MOVE HDR3-4     TO  PRINT-AREA                                    
              MOVE ' '        TO  CC                                            
              PERFORM 1650-ALTBR-PRINT-LINE                                     
                 THRU 1650-EXIT.                                                
                                                                                
       1610-EXIT.  EXIT.                                                        
       EJECT                                                                    
ET0004*                                                                         
ET0004*--------------------------------------------------------------*          
ET0004*       PRINT ALTERNATE BRANCH UPDATE REPORT LINE                         
ET0004*--------------------------------------------------------------*          
ET0004 1650-ALTBR-PRINT-LINE.                                                   
           WRITE ALTBR-REPT-REC FROM PRINTAREA.                                 
           IF CC = '1'                                                          
              MOVE 3 TO LINECNT-3.                                              
           IF CC = '-'                                                          
              ADD 3  TO LINECNT-3.                                              
           IF CC = '0'                                                          
              ADD 2  TO LINECNT-3.                                              
           IF CC = ' '                                                          
              ADD 1  TO LINECNT-3.                                              
                                                                                
       1650-EXIT.   EXIT.                                                       
                                                                                
       1900-ENDJOB-ROUTINE  SECTION.                                            
                                                                                
LRM004     DISPLAY ' '                                                          
LRM004     DISPLAY 'CAT610: END OF JOB ROUTINE'                                 
      **   DISPLAY 'ACAT HEADERS READ         ' ACAT-HDRS-READ.                 
      **   DISPLAY 'ACAT TRAILERS READ        ' ACAT-TRLR-READ.                 
      **   DISPLAY 'ACAT DETAIL RCDS READ     ' ACAT-DTL-RECS.                  
      **   DISPLAY 'ACAT RCDS BYPASSED        ' ACAT-BYP-RECS.                  
      **   DISPLAY 'ACAT RCDS REJECTED        ' ACAT-REJ-RECS.                  
      **   DISPLAY 'ACAT RCDS ACCEPTED        ' ACAT-ACPT-RECS.                 
           DISPLAY 'NA UPDATE RECS WRTN       ' NA-UPDATE-RECS.                 
           DISPLAY 'DB2 KEY SAVE RECS WRTN    ' DBSAVE-REC-CNT.                 
           DISPLAY 'PERIODIC PMNT RECS WRTN   ' PPMNT-REC-CNT.                  
           DISPLAY 'MRGN INT REQ RECS WRTN    ' MGNINT-REC-CNT.                 
LRM004     DISPLAY 'W-ACCTDEL-READ-CNT        ' W-ACCTDEL-READ-CNT              
LRM004     DISPLAY 'W-NACCTDEL-WRITTEN-CNT    ' W-NACCTDEL-WRITTEN-CNT          
ET0004     DISPLAY 'NA ALTERNATE BR UPDT CNT  ' NA-ALTBR-UPDT-CNT.              
ET0004     DISPLAY 'NA ALT BR REVERSED CNT    ' NA-ALTBR-REVERSED-CNT.          
DJ0002     DISPLAY 'NA DELIVERY REVERSED CNT  ' NA-DLVR-REVERSED-CNT.           
LRM006     DISPLAY 'NA ACTIVE FILE FND CNT    ' NA-ACTIVE-FILE-FND-CNT.         
LRM006     DISPLAY 'NA FILE FND CNT           ' NA-FILE-FND-CNT.                
LRM006     DISPLAY 'NA FILE NOT FND CNT       ' NA-FILE-NOT-FND-CNT.            
LRM007     DISPLAY 'WIRE DETAIL CNT           ' WS-AUTOWIRE-REC-CNT.            
LRM010     DISPLAY 'NA UPDATE WRAP RECS READ  ' WS-NAUP-WRAP-READ.              
LRM010     DISPLAY 'NA UPDATE WRAP APPLIED    ' WS-NAUP-WRAP-UPD-CNT.           
LRM010     DISPLAY 'NA UPDATE WRAP RECS WRTN  ' WS-NAUP-WRAP-WRITTEN.           
                                                                                
      * WRITE NA UPDATE TRAILER RECORD                                          
           MOVE NA-UPDATE-RECS  TO  NAUP-T-REC-COUNT.                           
           WRITE NA-UPDATE-REC  FROM  NAUPDTLR-REC.                             
                                                                                
LRM004***WRITE NACCTDEL TRAILER RECORD                                          
LRM004     MOVE ' ' TO W-ACCTDEL-TRLR-REC.                                      
LRM004     SET W-ACCTDEL-TRLRREC TO TRUE.                                       
LRM004     SET W-ACCTDEL-TRLRLIT TO TRUE.                                       
LRM004     MOVE W-NACCTDEL-WRITTEN-CNT TO W-ACCTDEL-TRLR-COUNT.                 
LRM004     WRITE NACCTDEL-RECORD FROM W-ACCTDEL-TRLR-REC.                       
                                                                                
LRM007     MOVE 'T'                 TO CP2-REQUEST-CODE.                        
LRM007     MOVE 'CAT610'            TO CP2-PROGRAM-ID.                          
LRM007     MOVE WS-AUTOWIRE-REC-CNT TO CP2-RECORD-COUNT.                        
LRM007     MOVE 999                 TO CP2-CLIENT-NUMBER.                       
LRM007     CALL P2HDTR   USING CP2-AREA AUTOWIRE-FILE                           
LRM007     MOVE CP2-RETURN-RECORD TO WS-AUTOWIRE-TRL                            
LRM007     WRITE AUTOWIRE-REC   FROM WS-AUTOWIRE-TRL.                           
                                                                                
           CLOSE NA-UPDATE-FILE                                                 
                 MGN-INT-FILE                                                   
                 PAYMENT-FILE                                                   
                 REPORT-FILE-2                                                  
                 REPORT-FILE                                                    
ET0004           ALTBR-REPT-FILE                                                
ET0004           ALTBR-FILE                                                     
LRM007           AUTOWIRE-FILE                                                  
LRM004           ACCTDEL-FILE                                                   
LRM004           NACCTDEL-FILE.                                                 
                                                                                
       1900-ENDJOB-ROUTINE-EXIT. EXIT.                                          
       EJECT                                                                    
                                                                                
       8000-SQL-ERROR.                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
                                                                                
       8000-EXIT. EXIT.                                                         
