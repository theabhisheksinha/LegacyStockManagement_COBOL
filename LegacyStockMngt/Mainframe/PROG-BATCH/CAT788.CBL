000001* PDX    - CAT788   C0363164 01/22/15 08:40:46 TBLAMUR            00001000
LRM018* SSR TBD    LOOKUP CSH/MRGN ACCT TYPE.                                   
000001* PDX    - CAT788   C0361590 12/08/14 11:31:14 TBLAMUR            00001000
LRM017* SSR 105451 VERIFY THAT ASSET FOUND ON VASTHSTY CUSIP MATCHES            
LRM017*     WHAT CONTRA BROKER SENT; THEY SEND BAD SEQ NBRS RESULTING           
LRM017*     IN WRONG ADP NBR SENT TO TLE.                                       
000001* PDX    - CAT788   C0359894 10/03/14 14:02:58 TBLAMUR            00001000
LRM016* SSR 103386 CALL MSISINB FOR FOREIGN ISIN.                               
000001* PDX    - CAT788   C0353123 03/31/14 09:48:56 TBLAMUR            00001000
LRM015* SSR 96502 RECOMPILE FOR COPYBOOK ACATTAXM,TAXO CHANGE.                  
000001* PDX    - CAT788   C0329368 07/27/12 21:10:42 TBLAMUR            00001000
LRM014*** REMOVE ASSET SEQ NBR LOOKUP DUE TO INBOUND GARBAGE                    
000001* PDX    - CAT788   C0325136 06/20/12 19:40:30 TBLAMUR            00001000
LRM014* SSR 83556 RECOMPILE FOR COPYBOOK ACATTAXM,TAXO CHANGE.                  
000001* PDX    - CAT788   C0325225 04/17/12 09:24:41 TBLAMUR            00001000
LRM013* SSR 83069 QA/PSE TO RUN ON CURRENT DATE.                                
000001* PDX    - CAT788   C0322068 01/31/12 14:09:36 TBLAMUR            00001000
LRM012* SSR 83285 RECOMPILE FOR COPYBOOK ACATTAXM,TAXO CHANGE.                  
000001* PDX    - CAT788   C0320051 01/03/12 14:56:20 TBLAMUR            00001000
LRM012* SSR TBD REPLACE RECEIVER SIDE CUST ACCT NMBR ON PTF IF FIRST            
LRM012*     8 BYTES DONT MATCH.  FUND CO MAY SEND OMNIBUS ACCT.                 
LRM011* SSR 78938 REMOVE TRANSFER TYPE REFERENCE AND USE TRANS 01,46,51         
LRM011*     TO IDENTIFY ITS ACAT DATA.                                          
000001* PDX    - CAT788   C0316938 09/23/11 09:54:11 TBLAMUR            00001000
LRM010* SSR 78938 REGULATORY CHANGE TO CBRS FILES, ON PTF, DTCC MOVED           
LRM010*          ACAT CNTL NBR TO ALT CNTL NBR FIELD.                           
000001* PDX    - CAT788   C0309061 05/02/11 14:55:37 TBLAMUR            00001000
LRM009* SSR 76809 PASS ASSET TYPE C/M/S ON A RECORD WHEN AVAILABLE.             
000001* PDX    - CAT788   C0307960 02/11/11 20:10:20 TBLAMUR            00001000
000001* PDX    - CAT788   C0307876 02/11/11 09:04:32 TBLAMUR            00001000
LRM008* CORRECT ERROR WHERE ADP SEC MISSING ON T RECORD, AND SET RC=O.          
000001* PDX    - CAT788   C0306569 01/13/11 09:41:34 TBLAMUR            00001000
LRM007* PMR 3252909 ALLOW QA FILE WITH CURRENT DATE WHEN EMPTY.                 
000001* PDX    - CAT788   C0305062 12/08/10 15:06:12 TBLAMUR            00001000
000001* PDX    - CAT788   C0299503 11/24/10 15:32:34 TBLAMUR            00001000
LRM006* SSR 72210 REG CHANGE A #6988 RECORD EXPANSION.  REMOVE DROP FILE        
LRM006*          WRITE (SSR 58228) WHEN ADP NUMBER NOT FOUND.                   
LRM006* SSR 77989 PASS FRV REQUEST RECORD SAME AS RCL TO TLE.                   
TCH006* READ MSD DIRECTLY FOR RECIEVER SIDE TLE DETAILS TO OBTAIN               
TCH006* ADP NUMBER.                                                             
000001* PDX    - CAT788   C0290020 02/05/10 13:31:25 TBLAMUR            00001000
LRM005* SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                         
000001* PDX    - CAT788   C0286877 11/04/09 15:56:17 TBLAMUR            00001000
LRM004* SSR 61023 OTION SYMBOLOGY CHANGE FOR Q STREAM ONLY, USE                 
LRM004*   NEW FILE FORMAT.                                                      
000001* PDX    - CAT788   C0267728 08/26/08 08:38:46 TBLAMUR            00001000
LRM003* SSR 58228 DROP COST BASIS DETAILS WHEN ADP NBR NOT AVAILABLE;           
LRM003*   WRITING THEM TO DROP FILE.                                            
LRM003*   ADD DATE CHECK ABEND FOR INFILE AND ACTIVE TRANSFER LOOKUP.           
000001* PDX    - CAT788   C0242045 07/17/07 10:23:07 TBLAMUR            00001000
LRM002* SSR 48168 GENERATE RCL RECORDS ON S/D FOR CLIENT 6 ASSETS               
LRM002*   COMING BACK IN.  THIS WILL CAUSE TLE TO LOOK ON THIER                 
LRM002*   RETENTION FILE FOR THE ORIGINAL DETAILS.                              
000001* PDX    - CAT788   C0235181 05/23/06 08:27:30 TBLAMUR            00001000
LRM001* SSR 47491 RECLAIMS (RCL)S ARE BEING REQUESTED FOR THE RECEIVER          
000001* PDX    - CAT788   C0204395 04/08/04 11:30:53 TBLAMUR            00001000
000001* PDX    - CAT788   C0185363 03/03/04 14:32:37 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT788  
       PROGRAM-ID.  CAT788.                                             CAT788  
      ***************************************************************** CAT788  
      * CAT788 - ACCEPT COST BASIS TRANSACTION FILE FROM NSCC,        * CAT788  
      *          AND EXTRACT FOR THIS STREAM.                         * CAT788  
      *                                                               * CAT788  
      * PROGRAM WILL RUN AT STREAM LEVEL EXTRACTING THE COST BASIS    * CAT788  
      * FILE DATA APPLICABLE TO THAT STREAM.                          * CAT788  
      *                                                               * CAT788  
      * INPUT  - NSCC ACATS COST BASIS TRANSACTION FILE   - GDG       * CAT788  
      * OUTPUT - COST BASIS TRANSACTION FILE EXTRACT      - GDG       * CAT788  
      *                                                               * CAT788  
      ***************************************************************** CAT788  
      *                                                                 CAT788  
       ENVIRONMENT DIVISION.                                            CAT788  
       INPUT-OUTPUT SECTION.                                            CAT788  
       FILE-CONTROL.                                                    CAT788  
                                                                        CAT788  
           SELECT INFILE           ASSIGN       TO INFILE.              CAT788  
           SELECT OUTFILE          ASSIGN       TO OUTFILE.             CAT788  
LRM003     SELECT OUT-DROPFILE     ASSIGN       TO OUTDROP.             CAT788  
      *                                                                 CAT788  
       DATA DIVISION.                                                   CAT788  
       FILE SECTION.                                                    CAT788  
       FD  INFILE                                                       CAT788  
           RECORDING MODE IS V                                          CAT788  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT788  
LRM002     DEPENDING ON W-REC-LEN-IN                                            
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
           COPY ACATTAXO REPLACING ==:TAXO:== BY ==NSCC==.              CAT788  
       01  DUMMY-LARGE-RECORD            PIC X(4000).                   CAT788  
                                                                        CAT788  
       FD  OUTFILE                                                      CAT788  
           RECORDING MODE IS F                                          CAT788  
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
           COPY ACATTAXM REPLACING ==:TAXM:== BY ==TAXM==.              CAT788  
                                                                        CAT788  
LRM003 FD  OUT-DROPFILE                                                 CAT788  
LRM003     RECORDING MODE IS F                                          CAT788  
LRM003     BLOCK CONTAINS 0 RECORDS.                                    CAT788  
LRM003                                                                  CAT788  
LRM003     COPY ACATTAXM REPLACING ==:TAXM:== BY ==TAXD==.              CAT788  
                                                                        CAT788  
      /                                                                 CAT788  
       WORKING-STORAGE SECTION.                                         CAT788  
           COPY PDXIDCOB.                                               CAT788  
                                                                        CAT788  
       01  WS-WORK-AREA.                                                CAT788  
           05  PGM-NAME                  PIC X(08) VALUE 'CAT788  '.    CAT788  
           05  WS-STREAM                 PIC X(01).                     CAT788  
           05  WS-CLNT-NO                PIC 9(04) VALUE 0.             CAT788  
           05  W-REC-LEN-IN              PIC 9(05) VALUE 0.             CAT788  
           05  SUB                       PIC 9(04) VALUE 0.             CAT788  
           05  WS-CLT-TBL-CNT            PIC 9(04) VALUE 0.             CAT788  
           05  W-INFILE-CNT              PIC 9(07) VALUE 0.             CAT788  
           05  W-OUTFILE-CNT             PIC 9(07) VALUE 0.             CAT788  
LRM002     05  W-RCL-REC-CNTR            PIC 9(07) VALUE 0.             CAT788  
LRM003     05  W-NSCC-DROP-COUNT         PIC 9(07) VALUE 0.             CAT788  
LRM011     05  WS-VTRNHSTY-FOUND         PIC 9(07) VALUE 0.             CAT788  
LRM011     05  WS-VASTHSTY-FOUND         PIC 9(07) VALUE 0.             CAT788  
LRM014     05  WS-VASTHSTY-BY-SEQ-FND    PIC 9(07) VALUE 0.             CAT788  
LRM014     05  WS-VASTHSTY-BY-SEQ-NOGO   PIC 9(07) VALUE 0.             CAT788  
LRM014     05  WS-VOPTHSTY-BY-SEQ-FND    PIC 9(07) VALUE 0.             CAT788  
LRM011     05  WS-VTRNFR-FOUND           PIC 9(07) VALUE 0.             CAT788  
LRM011     05  WS-VASSET-FOUND           PIC 9(07) VALUE 0.             CAT788  
LRM014     05  WS-VASSET-BY-SEQ-FOUND    PIC 9(07) VALUE 0.             CAT788  
LRM017     05  WS-VASSET-BY-SEQ-NOGO     PIC 9(07) VALUE 0.             CAT788  
LRM011     05  WS-ACAT-NOT-FOUND         PIC 9(07) VALUE 0.             CAT788  
LRM009     05  WS-TOT-ASSET-QTY-DEC      PIC 9(13)V9(4) COMP-3 VALUE 0.         
           05  W-CLIENT-FILE-CNT         PIC 9(07) VALUE 0.             CAT788  
           05  END-OF-INFILE-IND         PIC X(01).                     CAT788  
               88  END-OF-INFILE                   VALUE 'Y'.           CAT788  
           05  WS-CLT-IN-THIS-STREAM-SW  PIC X(01).                     CAT788  
               88  WS-CLT-IN-THIS-STREAM           VALUE 'Y'.           CAT788  
           05  WS-HST-TRNFR-NOT-FOUND-SW PIC X(01).                     CAT788  
               88  WS-HST-TRNFR-FOUND              VALUE ' '.           CAT788  
               88  WS-HST-TRNFR-NOT-FOUND          VALUE 'N'.           CAT788  
           05  WS-ACTIVE-TRNFR-NOT-FOUND-SW PIC X(01).                  CAT788  
               88  WS-ACTIVE-TRNFR-FOUND           VALUE ' '.           CAT788  
               88  WS-ACTIVE-TRNFR-NOT-FOUND       VALUE 'N'.           CAT788  
           05  WS-SUBMIT-BRKR-NBR        PIC X(04).                     CAT788  
           05  WS-ACCT-RCV-NBR           PIC X(20).                     CAT788  
           05  WS-ACCT-DLV-NBR           PIC X(20).                     CAT788  
           05  WS-CLIENT-NBR             PIC X(04).                     CAT788  
           05  WS-ACAT-CONTROL-NBR       PIC X(14).                     CAT788  
LRM002     05  WS-ASSET-SEQ-NBR.                                        CAT788  
LRM002         07  WS-ASSET-SEQ-NBR-9    PIC 9(04).                     CAT788  
           05  WS-CUSIP-NBR              PIC X(09).                     CAT788  
           05  WS-ADP-SEC-NBR            PIC X(07).                     CAT788  
           05  WS-PRC-CTGY-CD            PIC X(04).                             
           05  WS-OPT-SYM                PIC X(06).                     CAT788  
           05  WS-OPT-EXP-DATE           PIC X(10).                             
           05  WS-STPRC-INTEGER-AMT      PIC S9(4) USAGE COMP.                  
           05  WS-STPRC-FRCTN-AMT        PIC S9(4) USAGE COMP.                  
           05  WS-PUT-CALL-IND           PIC X(01).                             
           05  STREAM-ID.                                               CAT788  
               07  STREAM-ID1            PIC X(01).                     CAT788  
               07  STREAM-ID2            PIC X(01).                     CAT788  
               07  STREAM-ID3            PIC X(01).                     CAT788  
      *                                                                 CAT788  
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           CAT788  
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         CAT788  
                                                                        CAT788  
           05  W-QTY-X.                                                 CAT788  
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         CAT788  
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     CAT788  
                                                                        CAT788  
           05  W-QTY-N                   PIC 9(13)V9(4).                CAT788  
           05  W-QTY-X-NEW REDEFINES W-QTY-N.                           CAT788  
               07  W-QTY-INT             PIC 9(13).                     CAT788  
               07  W-QTY-DEC             PIC 9(04).                     CAT788  
                                                                        CAT788  
           05  W-INT                     PIC 9(17).                     CAT788  
           05  W-INT-X REDEFINES W-INT.                                 CAT788  
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         CAT788  
                                                                        CAT788  
           05  W-DEC                     PIC 9(04).                     CAT788  
           05  W-DEC-X REDEFINES W-DEC.                                 CAT788  
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         CAT788  
      *                                                                 CAT788  
           05  WS-PROC-DATE.                                            CAT788  
               07  WS-PROC-DATE-CC       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-YY       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-MM       PIC  X(02).                    CAT788  
               07  WS-PROC-DATE-DD       PIC  X(02).                    CAT788  
LRM002     05  WS-PROC-DATE-DB2          PIC  X(10).                    CAT788  
LRM002     05  FILLER REDEFINES WS-PROC-DATE-DB2.                       CAT788  
LRM002         07  WS-PROC-DATE-DB2-CCYY PIC  X(04).                    CAT788  
LRM002         07  WS-PROC-DATE-DB2-D1   PIC  X.                        CAT788  
LRM002         07  WS-PROC-DATE-DB2-MM   PIC  X(02).                    CAT788  
LRM002         07  WS-PROC-DATE-DB2-D2   PIC  X.                        CAT788  
LRM002         07  WS-PROC-DATE-DB2-DD   PIC  X(02).                    CAT788  
                                                                                
           05  W-STPRC-INTEGER-AMT       PIC 9(05).                             
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.                      
                                                                                
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT788  
           05  FILLER REDEFINES W-SYS-DATE.                             CAT788  
               07  W-SYS-YY              PIC  X(002).                   CAT788  
               07  W-SYS-MM              PIC  X(002).                   CAT788  
               07  W-SYS-DD              PIC  X(002).                   CAT788  
           05  W-CAL-DATE.                                              CAT788  
               07  W-CAL-DATE-MM         PIC X(02).                     CAT788  
               07  W-CAL-DATE-DD         PIC X(02).                     CAT788  
               07  W-CAL-DATE-YY         PIC X(02).                     CAT788  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT788  
           05  W-DB2-DATE-FORMAT.                                       CAT788  
               07  W-DB2-DATE-CC         PIC X(02).                     CAT788  
               07  W-DB2-DATE-YY         PIC X(02).                     CAT788  
               07  FILLER                PIC X(01).                     CAT788  
               07  W-DB2-DATE-MM         PIC X(02).                     CAT788  
               07  FILLER                PIC X(01).                     CAT788  
               07  W-DB2-DATE-DD         PIC X(02).                     CAT788  
           05  W-STTL-DATE.                                             CAT788  
               07  W-STTL-CC             PIC X(02).                     CAT788  
               07  W-STTL-YY             PIC X(02).                     CAT788  
               07  W-STTL-MM             PIC X(02).                     CAT788  
               07  W-STTL-DD             PIC X(02).                     CAT788  
           05  WS-MMDDYY                 PIC X(06).                             
           05  W-BLANK-SEC-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-DSTBN-SIDE-CD           PIC  X(001) VALUE ' '.                 
           05  W-ACTIAST-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTIAST-FOUND                    VALUE 'Y'.                 
           05  W-ACTIAST-ADP-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTIAST-ADP-FOUND                VALUE 'Y'.                 
               88 W-ACTIAST-ADP-NOT-FOUND            VALUE 'N'.                 
           05  W-CLIENT-X                PIC  X(003).                           
           05  W-CLIENT-NUM REDEFINES                                           
               W-CLIENT-X                PIC  9(003).                           
           05  W-SUB-ISIN-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-FND-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.                 
               88 W-MSD-NOTFND                       VALUE 'Y'.                 
               88 W-MSD-FOUND                        VALUE 'N'.                 
           05  WK-POS-DESC5.                                                    
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
               10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.                     
               10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.                     
           05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
           05  W-MSD-NOTFND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-BOND-FND-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-BOND-NOTFND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  ABEND-CD                  PIC  9(009) COMP SYNC VALUE 0.         
           05  W-OPT-DESC.                                                      
               07  W-OPT-BUY-SELL        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-CALL-PUT        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-OPEN-CLOSE      PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-SYMBOL          PIC X(06) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-MS-SYMBOL       PIC X(08) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-MM        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-S1        PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-CC        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-YY        PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(02) VALUE ' '.                   
               07  W-OPT-STRIKE-PRIC     PIC ZZZZ9.                             
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-STRIKE-FRAC     PIC X(01) VALUE ' '.                   
               07  W-OPT-SLASH-8         PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(11) VALUE ' '.                   
           05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
               07  FILLER                PIC X(22).                             
               07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
               07  FILLER                PIC X(02).                             
               07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
               07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
               07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
               07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
               07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
               07  FILLER                PIC X(01).                             
               07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
               07  FILLER                PIC X(01).                             
               07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
               07  FILLER                PIC X(12).                             
           05  W-DATE.                                                          
               07  W-DATE-YEAR.                                                 
                   09  W-DATE-CC         PIC X(2) VALUE ' '.                    
                   09  W-DATE-YY         PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-MM             PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-DD             PIC X(2) VALUE ' '.                    
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT788  
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 120.      CAT788  
           COPY CP2WS.                                                  CAT788  
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT788  
           COPY BPDATESC.                                               CAT788  
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(08) VALUE 'BHINFO=='.    CAT788  
           COPY BHINFO.                                                 CAT788  
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(08) VALUE 'BHACAT=='.    CAT788  
           COPY BHACAT.                                                 CAT788  
                                                                                
LRM006     COPY BHTLE.                                                  CAT788  
           EJECT                                                        CAT788  
       01  FILLER                        PIC X(08) VALUE 'B1-AREA='.    CAT788  
       01  WS-B1-TABLE-AREA.                                            CAT788  
           05  WS-B1-CLT-TABLE-ENTRY  OCCURS 300 TIMES.                 CAT788  
               07  WS-B1-TBL-CLT-NBR         PIC 9(04).                 CAT788  
               07  WS-B1-TBL-BROKER-NBR      PIC X(04).                 CAT788  
               07  WS-B1-TBL-BROKER-NAME     PIC X(30).                 CAT788  
               07  WS-B1-TBL-TAX-LOT         PIC X(01).                 CAT788  
               07  WS-B1-TBL-STREAM          PIC X(01).                 CAT788  
               07  WS-B1-TBL-BROKER-STATUS   PIC X(01).                 CAT788  
               07  WS-B1-TBL-ACAT-STATUS     PIC X(01).                 CAT788  
      /                                                                 CAT788  
       01  FILLER                        PIC X(08) VALUE 'SQLCA   '.    CAT788  
           EXEC SQL                                                     CAT788  
               INCLUDE SQLCA                                            CAT788  
           END-EXEC.                                                    CAT788  
      /                                                                 CAT788  
       01  FILLER                        PIC X(08) VALUE 'VTRNHSTY'.    CAT788  
           EXEC SQL                                                     CAT788  
               INCLUDE VTRNHSTY                                         CAT788  
           END-EXEC.                                                    CAT788  
      /                                                                 CAT788  
       01  FILLER                        PIC X(08) VALUE 'VASTHSTY'.    CAT788  
           EXEC SQL                                                     CAT788  
               INCLUDE VASTHSTY                                         CAT788  
           END-EXEC.                                                    CAT788  
      /                                                                 CAT788  
       01  FILLER                        PIC X(08) VALUE 'VOPTHSTY'.    CAT788  
           EXEC SQL                                                     CAT788  
               INCLUDE VOPTHSTY                                         CAT788  
           END-EXEC.                                                    CAT788  
LRM003/                                                                 CAT788  
LRM003 01  FILLER                        PIC X(08) VALUE 'VTRNFR'.      CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003         INCLUDE VTRNFR                                           CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003/                                                                 CAT788  
LRM003 01  FILLER                        PIC X(08) VALUE 'VASSET'.      CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003         INCLUDE VASSET                                           CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003/                                                                 CAT788  
LRM003 01  FILLER                        PIC X(08) VALUE 'VOPTN'.       CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003         INCLUDE VOPTN                                            CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM009/                                                                 CAT788  
LRM009 01  FILLER                        PIC X(08) VALUE 'VFNDSRVS'.    CAT788  
LRM009     EXEC SQL                                                     CAT788  
LRM009         INCLUDE VFNDSRVS                                         CAT788  
LRM009     END-EXEC.                                                    CAT788  
                                                                                
LRM002/                                                                 CAT788  
LRM002*DECLARE CURSOR TO OBTAIN ALL TI RECORDS SETTLE TODAY FOR                 
LRM002*CLIENT 6 INCOMMING RECLAIMS. NOTE DST=D MEANS RECEIVING BACK.            
LRM002     EXEC SQL                                                             
LRM002        DECLARE NSCC_TI_CRSR CURSOR FOR                                   
LRM002           SELECT                                                         
LRM002              CLIENT_NBR,                                                 
LRM002              ACAT_CONTROL_NBR,                                           
LRM002              RCV_NBR,                                                    
LRM002              ACCT_RCV_NBR,                                               
LRM002              DLVR_NBR,                                                   
LRM002              ACCT_DLVR_NBR,                                              
LRM002              STTS_CD,                                                    
LRM002              TRNFR_TYPE_CD,                                              
LRM002              DSTBN_SIDE_CD,                                              
LRM002              DAYS_STTS_QTY,                                              
LRM002              SBMTG_PRTCP_NBR,                                            
LRM002              RCV_CUST_NM,                                                
LRM002              RCV_SS_PRIM_NBR,                                            
LRM002              RCV_SS_SCNDY_NBR,                                           
LRM002              RCV_ACCT_TYPE_CD,                                           
LRM002              RCV_OCC_BRKR_NBR,                                           
LRM002              RCV_CRSPN_NBR,                                              
LRM002              STTLM_DT,                                                   
LRM002              PRCS_DT,                                                    
LRM002              PRTCP_CONTRA_CD,                                            
LRM002              ACAT_CNTL_ASTD_NBR                                          
LRM002           FROM VTRNHSTY                                                  
LRM002           WHERE  CLIENT_NBR = '0006'                                     
LRM006            AND TRNFR_TYPE_CD IN ('RCL', 'FRV')                           
LRM002            AND DSTBN_SIDE_CD = 'D'                                       
LRM002            AND STTS_CD = '310'                                           
LRM002            AND STTLM_DT = :WS-PROC-DATE-DB2                              
LRM002           FOR READ ONLY WITH UR                                          
LRM002     END-EXEC.                                                            
LRM002/                                                                 CAT788  
LRM002* DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR            
LRM002     EXEC SQL                                                             
LRM002        DECLARE NSCC_AT1_CRSR CURSOR FOR                                  
LRM002           SELECT                                                         
LRM002              CLIENT_NBR,                                                 
LRM002              ACAT_CONTROL_NBR,                                           
LRM002              ASSET_SEQ_NBR,                                              
LRM002              TRANS_TYPE_CD,                                              
LRM002              SBMTG_PRTCP_NBR,                                            
LRM002              TRANS_RFRN_ID_CD,                                           
LRM002              ASSET_PRC_CTGY_CD,                                          
LRM002              OPTN_CTGY_CD,                                               
LRM002              STTLM_LCTN_CD,                                              
LRM002              STTLM_RSN_CD,                                               
LRM002              ISIN_CNTRY_CD,                                              
LRM002              ISIN_SEC_ISSUE_CD,                                          
LRM002              ISIN_SEC_CDG_CD,                                            
LRM002              ASSET_DESC_TXT,                                             
LRM002              ASSET_RQST_QTY_CD,                                          
LRM002              AST_RQST_TRANS_CD,                                          
LRM002              ASSET_QTY,                                                  
LRM002              ASSET_PCT,                                                  
LRM002              PSTN_CD,                                                    
LRM002              ISO_CRNCY_CD,                                               
LRM002              ASSET_AMT,                                                  
LRM002              ASSET_AMT_STTS_CD,                                          
LRM002              BEARER_BOND_CD,                                             
LRM002              CSH_MGN_SHRT_CD,                                            
LRM002              WHI_CD,                                                     
LRM002              TRNFR_TYPE_RSN_CD,                                          
LRM002              MBS_SERIAL_NBR,                                             
LRM002              ASSET_CMNT_TXT,                                             
LRM002              NSCC_PEND_CD,                                               
LRM002              SECURITY_ADP_NBR,                                           
LRM002              CAGE_TAG_NBR,                                               
LRM002              SCRTY_866_NBR,                                              
LRM002              ASSET_866_QTY,                                              
LRM002              ASSET_PRC_CTGY_CD                                           
LRM002           FROM VASTHSTY                                                  
LRM002           WHERE CLIENT_NBR   = :DCLVTRNHSTY.CLIENT-NBR                   
LRM002            AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR         
LRM002            AND NOT STTLM_LCTN_CD = '40'                                  
LRM002            AND NOT STTLM_LCTN_CD = '45'                                  
LRM002            AND NOT STTLM_LCTN_CD = '60'                                  
LRM002            AND NOT STTLM_LCTN_CD = '65'                                  
LRM002           FOR READ ONLY WITH UR                                          
LRM002     END-EXEC.                                                            
      /                                                                 CAT788  
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    CAT788  
       01  DB2-ABEND-WORK-AREA.                                         CAT788  
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           CAT788  
           03  WS-DB2-MESSAGE-AREA.                                     CAT788  
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.CAT788  
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES CAT788  
                   INDEXED BY WS-ERROR-INDEX.                           CAT788  
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. CAT788  
           03  W-DB2-SQLCODE             PIC  -999.                     CAT788  
      /                                                                 CAT788  
       01  W-ABEND-AREA.                                                CAT788  
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT788  
       01  CALL-MODULES.                                                CAT788  
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT788  
           05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.   CAT788  
LRM006     05  GETADPNO                  PIC  X(08) VALUE 'GETADPNO'.           
      ****************************************************************          
      **                                                                        
      * OPTION SYMBOL LOOK UP                                                   
      *                                                                         
      ****************************************************************          
      **                                                                        
       01  FMT-OPT-AREA.                                                        
           03  FMT-OPT-AREA.                                                    
               05  FMT-OPT-SYMBOL         PIC X(6).                             
               05  FMT-OPT-ACT-TYPE       PIC X.                                
               05  FMT-OPT-PUT-CALL       PIC X.                                
                   88  FMT-PUT            VALUE 'P'.                            
                   88  FMT-CALL           VALUE 'C'.                            
               05  FMT-BUY-SELL-IND       PIC X.                                
                   88  FMT-BUY            VALUE 'B'.                            
                   88  FMT-SELL           VALUE 'S'.                            
               05  FMT-OPEN-CLOSE         PIC X.                                
                   88  FMT-OPEN           VALUE 'O'.                            
                   88  FMT-CLOSE          VALUE 'C'.                            
               05  FMT-OPT-EXP-DATE.                                            
                   10 FMT-OPT-EXP-CC      PIC X(2).                             
                   10 FMT-OPT-EXP-YY      PIC X(2).                             
                   10 FMT-OPT-EXP-MM      PIC X(2).                             
                   10 FMT-OPT-EXP-DD      PIC X(2).                             
               05  FMT-OPT-PRICE.                                               
                   10 FMT-OPT-PRICE-POS1  PIC X(1).                             
                   10 FMT-OPT-PRICE-POS2-3.                                     
                      15 FMT-OPT-PRICE-POS2 PIC X(1).                           
                      15 FMT-OPT-PRICE-POS3 PIC X(1).                           
               05  FMT-OPT-1-8TH-PRCE     PIC X.                                
               05  FMT-ADP-SEC-NO         PIC X(7).                             
               05  FMT-CUSIP-NO           PIC X(9).                             
               05  FMT-SEC-SYMBOL         PIC X(8).                             
               05  FMT-DESC1              PIC X(30).                            
               05  FMT-DESC2              PIC X(30).                            
               05  FMT-DESC3              PIC X(30).                            
       01  W-BOND-AREA.                                                         
           03  W-GETXRF-KEY-9             PIC X(9).                             
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT788  
           COPY STUBCPY.                                                CAT788  
LRM016     03  MSISINB                   PIC X(08) VALUE 'MSISINB '.            
       01  FILLER                        PIC  X(01) VALUE SPACES.       CAT788  
           COPY GETADPC.                                                        
                                                                                
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETXRFC '.            
           COPY GETXRFC.                                                        
      /                                                                         
LRM016     COPY MSISINC.                                                        
      /                                                                         
      ******************************************************************CAT788  
       LINKAGE SECTION.                                                 CAT788  
      ******************************************************************CAT788  
                                                                        CAT788  
       01  PARM-AREA.                                                   CAT788  
           05  PARM-LENGTH              PIC  S9(4) COMP.                CAT788  
           05  PARM-STREAM              PIC  X(01).                     CAT788  
LRM003     05  L-BYP-DATECHK-SW          PIC  X(001).                           
LRM003         88  L-BYP-DATECHK                     VALUE '1'.                 
      /                                                                 CAT788  
      *                                                                 CAT788  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT788  
           COPY MSGCOBO.                                                CAT788  
           DISPLAY 'CAT788 - EXTRACT COST BASIS TRANSACTION FILE BY '   CAT788  
                   'STREAM.'.                                           CAT788  
           DISPLAY '         EXTRACTION IS FOR B1-434681 = "1" OR "3" ' CAT788  
                   'ONLY.'.                                             CAT788  
                                                                        CAT788  
           PERFORM 1000-INITIAL-RTN.                                    CAT788  
                                                                        CAT788  
           PERFORM 3000-MAIN-RTN                                        CAT788  
              THRU 3000-EX                                              CAT788  
                UNTIL END-OF-INFILE.                                    CAT788  
                                                                        CAT788  
LRM002     IF PARM-STREAM = 'Q' OR 'F'                                  CAT788  
LRM002        EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                               
LRM002        IF SQLCODE = +0                                           CAT788  
LRM002           CONTINUE                                               CAT788  
LRM002        ELSE                                                      CAT788  
LRM002        IF SQLCODE = +100                                         CAT788  
LRM002           DISPLAY 'CAT788: TI CURSOR RCL/FRV OPEN +100'          CAT788  
LRM002        ELSE                                                      CAT788  
LRM002           MOVE +1010     TO ABEND-CODE                           CAT788  
LRM002           MOVE SQLCODE   TO W-DB2-SQLCODE                        CAT788  
LRM002           DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '     CAT788  
LRM002                'OPEN TI CURSOR **'                               CAT788  
LRM002           DISPLAY '           SQLCODE=' W-DB2-SQLCODE            CAT788  
LRM002           PERFORM 8000-SQL-ERROR-ROUTINE                         CAT788  
LRM002        END-IF END-IF                                             CAT788  
LRM002        PERFORM UNTIL SQLCODE NOT = +0                                    
LRM002          EXEC SQL                                                        
LRM002           FETCH NSCC_TI_CRSR                                             
LRM002             INTO                                                         
LRM002              :DCLVTRNHSTY.CLIENT-NBR                                     
LRM002             ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                               
LRM002             ,:DCLVTRNHSTY.RCV-NBR                                        
LRM002             ,:DCLVTRNHSTY.ACCT-RCV-NBR                                   
LRM002             ,:DCLVTRNHSTY.DLVR-NBR                                       
LRM002             ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                  
LRM002             ,:DCLVTRNHSTY.STTS-CD                                        
LRM002             ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                  
LRM002             ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                  
LRM002             ,:DCLVTRNHSTY.DAYS-STTS-QTY                                  
LRM002             ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                
LRM002             ,:DCLVTRNHSTY.RCV-CUST-NM                                    
LRM002             ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                
LRM002             ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                               
LRM002             ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                               
LRM002             ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                               
LRM002             ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                  
LRM002             ,:DCLVTRNHSTY.STTLM-DT                                       
LRM002             ,:DCLVTRNHSTY.PRCS-DT                                        
LRM002             ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                
LRM002             ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                             
LRM002          END-EXEC                                                        
LRM002          EVALUATE SQLCODE                                                
LRM002             WHEN +100                                                    
LRM002                CONTINUE                                                  
LRM002             WHEN +0                                                      
LRM002                PERFORM 4000-FETCH-AT-RECORDS                             
LRM002             WHEN OTHER                                                   
LRM002                MOVE 1500 TO ABEND-CODE                                   
LRM002                PERFORM 8000-SQL-ERROR-ROUTINE                            
LRM002          END-EVALUATE                                                    
LRM002        END-PERFORM                                               CAT788  
LRM002        EXEC SQL CLOSE NSCC_TI_CRSR END-EXEC                              
LRM002     END-IF.                                                              
                                                                                
           CLOSE INFILE                                                 CAT788  
                 OUTFILE                                                CAT788  
LRM003           OUT-DROPFILE.                                          CAT788  
                                                                        CAT788  
           MOVE PARM-STREAM TO STREAM-ID1 STREAM-ID2 STREAM-ID3.        CAT788  
                                                                        CAT788  
           DISPLAY ' '.                                                 CAT788  
           DISPLAY 'CAT788: NSCC TRANS FL INPUT CNT = '                 CAT788  
                    W-INFILE-CNT                                        CAT788  
                   ' (BZZZ.SIAC3607.NDMS / BQQQ.SIAQ4607.NDMS)'.        CAT788  
           DISPLAY 'CAT788: EXTRACT OUTPUT FILE CNT = '                 CAT788  
                    W-OUTFILE-CNT                                       CAT788  
                    ' (B' STREAM-ID '.CAT788.TAXLOT - INCLUDE HDR)'.    CAT788  
LRM003     DISPLAY 'RECORDS DROPPED FROM INPUT ' W-NSCC-DROP-COUNT      CAT788  
LRM011     DISPLAY 'VTRNHSTY FOUND  ' WS-VTRNHSTY-FOUND                 CAT788  
LRM011     DISPLAY 'VASTHSTY FOUND  ' WS-VASTHSTY-FOUND                 CAT788  
LRM014     DISPLAY '  VIA SEQ FOUND ' WS-VASTHSTY-BY-SEQ-FND            CAT788  
LRM017     DISPLAY 'VASTHSTY SEQ NG ' WS-VASTHSTY-BY-SEQ-NOGO           CAT788  
LRM014     DISPLAY '      OPT FOUND ' WS-VOPTHSTY-BY-SEQ-FND            CAT788  
LRM011     DISPLAY 'VTRNFR FOUND    ' WS-VTRNFR-FOUND                   CAT788  
LRM011     DISPLAY 'VASSET FOUND    ' WS-VASSET-FOUND                   CAT788  
LRM014     DISPLAY '  VIA SEQ FOUND ' WS-VASSET-BY-SEQ-FOUND            CAT788  
LRM017     DISPLAY '  VIA SEQ NG    ' WS-VASSET-BY-SEQ-NOGO             CAT788  
LRM011     DISPLAY 'ACAT ASSETS N/F ' WS-ACAT-NOT-FOUND                 CAT788  
LRM002     DISPLAY 'CLIENT 006 RCL/FRV RECORDS ADDED ' W-RCL-REC-CNTR   CAT788  
           DISPLAY ' '.                                                 CAT788  
           DISPLAY '** CAT788 COMPLETED SUCCESSFULLY **'.               CAT788  
LRM008     MOVE ZERO TO RETURN-CODE.                                            
           GOBACK.                                                      CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       1000-INITIAL-RTN.                                                CAT788  
           DISPLAY ' '.                                                 CAT788  
                                                                        CAT788  
           IF PARM-LENGTH = +0                                          CAT788  
              DISPLAY '** CAT788 ABENDED - JCL PARM STREAM MISSING **'  CAT788  
              MOVE +1005 TO ABEND-CODE                                  CAT788  
              PERFORM 9000-ABORT-RTN                                    CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           DISPLAY 'CAT788: RUNNING ON "' PARM-STREAM '" STREAM'.       CAT788  
                                                                        CAT788  
           OPEN      INPUT  INFILE                                      CAT788  
                    OUTPUT  OUTFILE                                     CAT788  
LRM003                      OUT-DROPFILE.                               CAT788  
                                                                        CAT788  
           MOVE SPACE TO WS-B1-TABLE-AREA.                              CAT788  
           PERFORM 1500-LOAD-B1-RTN.                                    CAT788  
                                                                        CAT788  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT788  
           MOVE  W-SYS-YY                 TO W-CAL-DATE-YY.             CAT788  
           MOVE  W-SYS-MM                 TO W-CAL-DATE-MM.             CAT788  
           MOVE  W-SYS-DD                 TO W-CAL-DATE-DD.             CAT788  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT788  
                                                                        CAT788  
           MOVE 'CAT788'                  TO BPDATES-CALLING-PGM.       CAT788  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT788  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT788  
           MOVE BPD-PROC-DATE             TO WS-PROC-DATE.              CAT788  
           DISPLAY 'CAT788: PROC DATE IS ' WS-PROC-DATE ' (CCYYMMDD)'.  CAT788  
LRM002     MOVE WS-PROC-DATE (1 : 4) TO WS-PROC-DATE-DB2-CCYY           CAT788  
LRM002     MOVE '-'                  TO WS-PROC-DATE-DB2-D1             CAT788  
LRM002                                  WS-PROC-DATE-DB2-D2             CAT788  
LRM002     MOVE WS-PROC-DATE-MM      TO WS-PROC-DATE-DB2-MM             CAT788  
LRM002     MOVE WS-PROC-DATE-DD      TO WS-PROC-DATE-DB2-DD             CAT788  
                                                                        CAT788  
           MOVE ' '                 TO TAXM-RECORD.                     CAT788  
           MOVE 'H'                 TO CP2-REQUEST-CODE.                CAT788  
           MOVE PGM-NAME            TO CP2-PROGRAM-ID.                  CAT788  
           MOVE 999                 TO CP2-CLIENT-NUMBER.               CAT788  
                                                                        CAT788  
           CALL P2HDTR           USING CP2-AREA                         CAT788  
                                       OUTFILE.                         CAT788  
                                                                        CAT788  
           MOVE CP2-RETURN-RECORD    TO TAXM-RECORD                     CAT788  
LRM003                                  TAXD-RECORD.                            
           DISPLAY 'CAT788: OUTFILE-HDR = ' TAXM-RECORD (1:55).         CAT788  
                                                                        CAT788  
           WRITE  TAXM-RECORD.                                          CAT788  
LRM003     WRITE  TAXD-RECORD.                                          CAT788  
           ADD 1 TO W-OUTFILE-CNT.                                      CAT788  
                                                                        CAT788  
           PERFORM 6000-READ-INFILE.                                    CAT788  
                                                                        CAT788  
           IF END-OF-INFILE                                             CAT788  
              CONTINUE                                                  CAT788  
           ELSE                                                         CAT788  
           IF NSCC-HDR-REC                                              CAT788  
              IF NSCC-TRANS-DATE = WS-PROC-DATE                         CAT788  
                 CONTINUE                                               CAT788  
              ELSE                                                      CAT788  
LRM003        IF L-BYP-DATECHK                                                  
                 DISPLAY 'CAT788: ** WARNING **'                        CAT788  
                 DISPLAY '        NSCC TRANS FL (INFILE) DETAILS'       CAT788  
                         ' WERE SKIPPED DUE TO HEADER DATE ERR AND PARM'CAT788  
                 DISPLAY '        NSCC FL HDR DATE = ' NSCC-TRANS-DATE  CAT788  
                         '   PROC DATE = ' WS-PROC-DATE                 CAT788  
                 SET  END-OF-INFILE   TO TRUE                           CAT788  
LRM003        ELSE                                                              
LRM003           MOVE +1010     TO ABEND-CODE                           CAT788  
LRM003           DISPLAY '** CAT788: ABENDED ON SIAC0264 HEADER DATE '  CAT788  
LRM003           DISPLAY '        NSCC TRANS FL (INFILE) DETAILS'       CAT788  
LRM003           DISPLAY '        NSCC FL HDR DATE = ' NSCC-TRANS-DATE  CAT788  
LRM003                      '   PROC DATE = ' WS-PROC-DATE              CAT788  
LRM003           PERFORM 8000-SQL-ERROR-ROUTINE                         CAT788  
              END-IF                                                    CAT788  
           END-IF.                                                      CAT788  
           MOVE 'D'              TO GETMSD-DEVICE-IND.                          
           MOVE 'R'              TO GETMSD-ACCESS-IND.                          
           MOVE 'E'              TO GETMSD-FORMAT-IND.                          
           SET GETXRF-DEVICE-DISK        TO TRUE.                               
           SET GETXRF-ACCESS-RANDOM      TO TRUE.                               
           SET GETXRF-RETURN-VALID       TO TRUE.                               
      *                                                                 CAT788  
       1500-LOAD-B1-RTN.                                                CAT788  
           MOVE 0 TO SUB                                                CAT788  
           PERFORM VARYING WS-CLNT-NO FROM 1 BY 1                       CAT788  
                    UNTIL WS-CLNT-NO > 500                              CAT788  
                                                                        CAT788  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO     CAT788  
                                              BH-ACAT-INFO              CAT788  
              MOVE  WS-CLNT-NO            TO  BH-BROKER-NUMBER-N        CAT788  
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE    CAT788  
              MOVE  '434500'              TO  BH-B2-INFO-ID             CAT788  
              CALL  GETB1V             USING  BH-BROKER-HEADER-INFO     CAT788  
                                              BH-ACAT-INFO              CAT788  
LRM006        MOVE  '435400'            TO  BH-B2-INFO-ID                       
LRM006        CALL   GETB1V           USING BH-BROKER-HEADER-INFO,              
LRM006                                      BH-TLE-INFO                         
LRM006        END-CALL                                                          
                                                                        CAT788  
              IF BH-BROKER-ACTIVE  AND  BH-ACAT-ACTIVE                  CAT788  
LRM006           AND BH-TLE-ACTIVE                                              
                 MOVE BH-BROKER-MINI-MAXI-INDICATOR TO WS-STREAM        CAT788  
                 IF WS-STREAM = PARM-STREAM                             CAT788  
                    ADD 1 TO SUB                                        CAT788  
                    MOVE WS-STREAM  TO  WS-B1-TBL-STREAM       (SUB)    CAT788  
                    MOVE WS-CLNT-NO TO  WS-B1-TBL-CLT-NBR      (SUB)    CAT788  
                    MOVE BH-ACAT-COST-BASIS-CLIENT                      CAT788  
                                    TO  WS-B1-TBL-TAX-LOT      (SUB)    CAT788  
                    MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                CAT788  
                                    TO WS-B1-TBL-BROKER-NBR    (SUB)    CAT788  
                    MOVE BH-BROKER-NAME                                 CAT788  
                                    TO WS-B1-TBL-BROKER-NAME   (SUB)    CAT788  
                    MOVE BH-BROKER-STATUS                               CAT788  
                                    TO WS-B1-TBL-BROKER-STATUS (SUB)    CAT788  
                    MOVE BH-ACAT-STATUS                                 CAT788  
                                    TO WS-B1-TBL-ACAT-STATUS   (SUB)    CAT788  
                    DISPLAY 'CAT788: LOADED CLT-TABLE ' SUB  ' :'       CAT788  
                            ' STRM='        WS-STREAM                   CAT788  
                            ' CLT='         WS-CLNT-NO                  CAT788  
                            ' BRK='         WS-B1-TBL-BROKER-NBR (SUB)  CAT788  
                            ' B1-434681='   WS-B1-TBL-TAX-LOT (SUB)     CAT788  
                 END-IF                                                 CAT788  
              END-IF                                                    CAT788  
           END-PERFORM.                                                 CAT788  
                                                                        CAT788  
           MOVE SUB TO WS-CLT-TBL-CNT.                                  CAT788  
           DISPLAY 'CAT788: CLIENT TABLE COUNT FOR "' PARM-STREAM       CAT788  
                   '" STREAM IS ' WS-CLT-TBL-CNT.                       CAT788  
           DISPLAY ' '.                                                 CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       3000-MAIN-RTN.                                                   CAT788  
           MOVE SPACE TO TAXM-RECORD.                                   CAT788  
                                                                        CAT788  
           IF NSCC-ASSET-OUTPUT                                         CAT788  
***********AND NSCC-SUBMITTING-BRKR(1 : 4) = '0000'                     CAT788  
              MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
              MOVE NSCC-SUBMITTING-BRKR(5 : 4) TO WS-SUBMIT-BRKR-NBR    CAT788  
LRM010********IF NSCC-TRNFR-TYPE = 'PTF'                                        
LRM011        IF NSCC-AO-TRANSACTION-TYPE = '46' OR '51'                        
LRM010           MOVE NSCC-AO-ALT-CNTL-NBR  TO WS-ACAT-CONTROL-NBR      CAT788  
LRM010        ELSE                                                              
                 MOVE NSCC-AO-ACAT-CNTL-NBR  TO WS-ACAT-CONTROL-NBR     CAT788  
LRM010        END-IF                                                            
              MOVE NSCC-AO-CUSIP-NUM      TO WS-CUSIP-NBR               CAT788  
              MOVE NSCC-AO-ACCT-RCV-NBR   TO WS-ACCT-RCV-NBR            CAT788  
              MOVE NSCC-AO-ACCT-DLVR-NBR  TO WS-ACCT-DLV-NBR            CAT788  
              MOVE NSCC-AO-OPTION-SYMBOL  TO WS-OPT-SYM                 CAT788  
LRM004        MOVE NSCC-AO-ASSET-PRC-CTGY-CD-NEW                                
LRM004                                    TO WS-PRC-CTGY-CD                     
LRM004        MOVE NSCC-AO-OPT-EXP-DATE-NEW(1 : 4)                              
LRM004                                    TO WS-OPT-EXP-DATE(1 : 4)             
LRM004        MOVE NSCC-AO-OPT-EXP-DATE-NEW(5 : 2)                              
LRM004                                    TO WS-OPT-EXP-DATE(6 : 2)             
LRM004        MOVE NSCC-AO-OPT-EXP-DATE-NEW(7 : 2)                              
LRM004                                    TO WS-OPT-EXP-DATE(9 : 2)             
              MOVE '-'                    TO WS-OPT-EXP-DATE(5 : 1)             
                                             WS-OPT-EXP-DATE(8 : 1)             
LRM014        IF  NSCC-AO-STPRC-INTEGER-AMT-NEW NUMERIC                         
LRM014        AND NSCC-AO-STPRC-FRCTN-AMT-NEW NUMERIC                           
LRM004           MOVE NSCC-AO-STPRC-INTEGER-AMT-NEW                             
LRM004                                    TO WS-STPRC-INTEGER-AMT               
LRM004           MOVE NSCC-AO-STPRC-FRCTN-AMT-NEW                               
LRM004                                    TO WS-STPRC-FRCTN-AMT                 
LRM014        ELSE                                                              
LRM014           MOVE ZERO TO WS-STPRC-INTEGER-AMT                              
LRM014                        WS-STPRC-FRCTN-AMT                                
LRM014        END-IF                                                            
              MOVE NSCC-AO-OPT-PUT-CALL      TO WS-PUT-CALL-IND                 
LRM009        IF NSCC-AO-TOT-ASSET-QTY = SPACES                         CAT788  
LRM009           MOVE ZEROS               TO WS-TOT-ASSET-QTY-DEC               
LRM009        ELSE                                                              
LRM009           MOVE NSCC-AO-TOT-ASSET-QTY TO W-QTY-X                  CAT788  
LRM009           PERFORM  3300-REFORMAT-TO-DECIMAL                      CAT788  
LRM009           MOVE W-QTY-N             TO WS-TOT-ASSET-QTY-DEC       CAT788  
LRM009        END-IF                                                            
           ELSE                                                         CAT788  
           IF NSCC-TAX-LOT-OUTPUT                                       CAT788  
***********AND NSCC-SUBMITTING-BRKR(1 : 4) = '0000'                     CAT788  
              MOVE NSCC-SUBMITTING-BRKR(5 : 4) TO WS-SUBMIT-BRKR-NBR    CAT788  
LRM010********IF NSCC-TRNFR-TYPE = 'PTF'                                        
LRM011        IF NSCC-AO-TRANSACTION-TYPE = '46' OR '51'                        
LRM010           MOVE NSCC-TO-ALT-CNTL-NBR  TO WS-ACAT-CONTROL-NBR      CAT788  
LRM010        ELSE                                                              
                 MOVE NSCC-TO-ACAT-CNTL-NBR  TO WS-ACAT-CONTROL-NBR     CAT788  
LRM010        END-IF                                                            
              MOVE NSCC-TO-CUSIP-NUM      TO WS-CUSIP-NBR               CAT788  
              MOVE NSCC-TO-ACCT-DLVR-NBR  TO WS-ACCT-DLV-NBR            CAT788  
              MOVE NSCC-TO-OPTION-SYMBOL  TO WS-OPT-SYM                 CAT788  
           ELSE                                                         CAT788  
              DISPLAY 'SKIP INPUT RECORD # ' W-INFILE-CNT               CAT788  
              DISPLAY '    ' DUMMY-LARGE-RECORD (1 : 60)                        
              PERFORM 6000-READ-INFILE                                  CAT788  
              GO TO 3000-EX                                             CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           MOVE SPACES TO WS-CLT-IN-THIS-STREAM-SW.                     CAT788  
                                                                        CAT788  
           PERFORM VARYING SUB FROM 1 BY 1                              CAT788  
                               UNTIL SUB > WS-CLT-TBL-CNT               CAT788  
              IF WS-SUBMIT-BRKR-NBR = WS-B1-TBL-BROKER-NBR (SUB)        CAT788  
LRM006           IF (WS-B1-TBL-TAX-LOT (SUB) = '1' OR '3')              CAT788  
                     MOVE WS-B1-TBL-CLT-NBR (SUB) TO WS-CLIENT-NBR      CAT788  
                     SET WS-CLT-IN-THIS-STREAM  TO TRUE                 CAT788  
                 END-IF                                                 CAT788  
              END-IF                                                    CAT788  
           END-PERFORM.                                                 CAT788  
                                                                        CAT788  
           IF NOT WS-CLT-IN-THIS-STREAM                                 CAT788  
               PERFORM 6000-READ-INFILE                                 CAT788  
               GO TO 3000-EX                                            CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
LRM011     IF NSCC-ASSET-OUTPUT                                         CAT788  
LRM006        INITIALIZE DCLVTRNHSTY DCLVASTHSTY                                
LRM011     END-IF.                                                              
LRM006*****IF NSCC-TRNFR-TYPE NOT = SPACES                                      
LRM011     IF (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                 
              PERFORM  3100-READ-HISTORY-TRNFR-TBL                      CAT788  
              IF WS-HST-TRNFR-NOT-FOUND                                 CAT788  
LRM003           PERFORM  3500-READ-ACTIVE-TRNFR-TBL                    CAT788  
           END-IF.                                                      CAT788  
                                                                                
                                                                        CAT788  
LRM006*****IF NSCC-TRNFR-TYPE NOT = SPACES                                      
LRM011     IF (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                 
LRM014        IF NSCC-ASSET-SEQ-NO NUMERIC                                      
LRM014          MOVE NSCC-ASSET-SEQ-NO-9 TO ASSET-SEQ-NBR OF DCLVOPTHSTY        
LRM014           IF WS-HST-TRNFR-FOUND                                  CAT788  
LRM014              PERFORM 3170-READ-ASSET-VIA-SEQ-NBR                 CAT788  
LRM014              IF WS-ADP-SEC-NBR > SPACES                          CAT788  
LRM014                 ADD 1 TO WS-VASTHSTY-BY-SEQ-FND                  CAT788  
LRM014              END-IF                                              CAT788  
LRM014              IF WS-PRC-CTGY-CD = 'OPT'                                   
LRM014                 PERFORM 3152-READ-HSTY-OPT-AST-SEQ               CAT788  
LRM014              END-IF                                                      
LRM014           ELSE                                                           
LRM014           IF WS-ACTIVE-TRNFR-FOUND                               CAT788  
LRM014              PERFORM 3670-READ-ASSET-VIA-SEQ-NBR                 CAT788  
LRM014              IF WS-ADP-SEC-NBR > SPACES                          CAT788  
LRM014                 ADD 1 TO WS-VASSET-BY-SEQ-FOUND                  CAT788  
LRM014              END-IF                                              CAT788  
LRM014              IF WS-PRC-CTGY-CD = 'OPT'                                   
LRM014                 PERFORM  3652-READ-ACTIVE-OPT-AST-SEQ            CAT788  
LRM014              END-IF                                                      
LRM014           END-IF END-IF                                                  
LRM014        END-IF                                                            
LRM014        IF WS-ADP-SEC-NBR NOT > SPACES                            CAT788  
              IF WS-PRC-CTGY-CD = 'OPT'                                         
LRM003           IF WS-HST-TRNFR-FOUND                                  CAT788  
                    PERFORM  3150-READ-HSTY-OPT-ASSET-TBL               CAT788  
                       THRU  3150-EXIT                                          
LRM003           ELSE                                                   CAT788  
LRM006           IF WS-ACTIVE-TRNFR-FOUND                               CAT788  
LRM003              PERFORM  3650-READ-ACTIVE-OPT-ASSET-TBL             CAT788  
LRM003                 THRU  3650-EXIT                                          
LRM006           END-IF                                                         
              ELSE                                                              
LRM003           IF WS-HST-TRNFR-FOUND                                  CAT788  
LRM008           AND NSCC-ASSET-OUTPUT                                  CAT788  
                    PERFORM  3200-READ-HISTORY-ASSET-TBL                CAT788  
LRM003           ELSE                                                   CAT788  
LRM006           IF WS-ACTIVE-TRNFR-FOUND                               CAT788  
LRM008           AND NSCC-ASSET-OUTPUT                                  CAT788  
LRM003              PERFORM  3700-READ-ACTIVE-ASSET-TBL                 CAT788  
LRM006        END-IF                                                            
LRM014***     END-IF                                                            
           END-IF.                                                              
                                                                        CAT788  
LRM006*****IF NSCC-TRNFR-TYPE > SPACES                                          
LRM011     IF (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                 
LRM008     AND WS-ADP-SEC-NBR > SPACES                                  CAT788  
LRM006*****AND SECURITY-ADP-NBR OF DCLVASTHSTY > SPACES                 CAT788  
LRM006        SET TAXM-ADP-SEC-FOUND TO TRUE                                    
LRM006     ELSE                                                                 
LRM006        SET TAXM-MISMATCH-TO-ACAT TO TRUE                                 
LRM006     END-IF.                                                              
LRM011     IF (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                 
LRM011     AND WS-ADP-SEC-NBR NOT > SPACES                              CAT788  
LRM011        ADD 1 TO WS-ACAT-NOT-FOUND                                CAT788  
LRM011     END-IF.                                                              
                                                                                
LRM006*---------------------------------------------------------------          
LRM006* NON ACAT CBRS RECORDS ARE IDENTIFIED BY SPACES IN THE ACAT              
LRM006* TRANSFER TYPE.  READ MSD TO OBTAIN ADP SECURITY NUMBER.                 
LRM006* POPULATE THE TAXM RECORD PREFIX AND SUFFIX WITH AVAILABLE               
LRM006* DETAILS.  WRITE TO TAXM (TLE) REGARDLESS IF FOUND ON MSD.               
LRM006*---------------------------------------------------------------          
           IF NSCC-ASSET-OUTPUT                                         CAT788  
LRM006********IF*(NSCC-TRNFR-TYPE NOT > SPACES                                  
LRM011       IF ((NSCC-AO-TRANSACTION-TYPE NOT = '01' AND '46' AND '51')        
LRM006       OR WS-ADP-SEC-NBR NOT > SPACES)                            CAT788  
                 IF NSCC-AO-OPTION-SYMBOL > SPACE                               
TEST                 DISPLAY 'WE FOUND A NON ACAT OPTION'                       
LRM029               PERFORM 6950-GETADPNO-OPTION THRU 6950-EXIT                
                 ELSE                                                           
                     PERFORM 6700-GETMSDC THRU 6700-EXIT                        
LRM006     END-IF.                                                      CAT788  
                                                                                
           MOVE WS-CLIENT-NBR (2:3)            TO TAXM-ADP-CL-NO        CAT788  
           MOVE WS-ADP-SEC-NBR                 TO TAXM-ADP-NBR          CAT788  
           MOVE STTLM-DT        OF DCLVTRNHSTY TO W-DB2-DATE-FORMAT.    CAT788  
           MOVE W-DB2-DATE-CC                  TO W-STTL-CC.            CAT788  
           MOVE W-DB2-DATE-YY                  TO W-STTL-YY.            CAT788  
           MOVE W-DB2-DATE-MM                  TO W-STTL-MM.            CAT788  
           MOVE W-DB2-DATE-DD                  TO W-STTL-DD.            CAT788  
           MOVE NSCC-RECORD     TO TAXM-TRANSACT-RECORD-DETAIL.         CAT788  
           MOVE W-STTL-DATE     TO TAXM-SETTL-DATE                      CAT788  
LRM001*---------------------------------------------------------------          
LRM001*** NOTE - RECLAIMS ARE LOGICALLY BACKWARDS, R = ORIG RECEIVER            
LRM001*** WHICH MEANS THIS IS A DELIVERY.                                       
LRM001*---------------------------------------------------------------          
LRM006*****IF NSCC-TRNFR-TYPE > SPACES                                          
LRM012     IF NSCC-ASSET-OUTPUT                                         CAT788  
LRM012     AND (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                
LRM007     AND TRNFR-TYPE-CD OF DCLVTRNHSTY > SPACES                            
LRM011        MOVE TRNFR-TYPE-CD OF DCLVTRNHSTY                                 
LRM011                                   TO TAXM-TRNFR-TYPE                     
LRM007        IF (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'RCL' OR 'FRV')                
LRM001           IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                          
LRM001              SET TAXM-DELIVERY    TO TRUE                                
LRM001           ELSE                                                           
LRM001              SET TAXM-RECEIVE     TO TRUE                                
LRM001        ELSE                                                              
              IF DSTBN-SIDE-CD       OF DCLVTRNHSTY = 'R'                       
                 SET TAXM-RECEIVE     TO TRUE                                   
              ELSE                                                              
                 SET TAXM-DELIVERY    TO TRUE                                   
LRM012        END-IF END-IF                                                     
LRM012        IF  TRNFR-TYPE-CD OF DCLVTRNHSTY = 'PTF'                          
LRM012        AND DSTBN-SIDE-CD      OF DCLVTRNHSTY = 'R'                       
LRM012        AND  ACCT-RCV-NBR OF DCLVTRNHSTY (1:8) NOT =                      
LRM012                                 TAXM-AO-ACCT-RCV-NBR (1:8)               
LRM012           MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO                            
LRM012                                 TAXM-AO-ACCT-RCV-NBR                     
LRM012        END-IF                                                            
LRM012     ELSE                                                                 
LRM012     IF NSCC-TAX-LOT-OUTPUT                                       CAT788  
LRM012     AND (NSCC-TO-TRANSACTION-TYPE = '01' OR '46' OR '51')                
LRM007     AND TRNFR-TYPE-CD OF DCLVTRNHSTY > SPACES                            
LRM011        MOVE TRNFR-TYPE-CD OF DCLVTRNHSTY                                 
LRM011                                   TO TAXM-TRNFR-TYPE                     
LRM007        IF (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'RCL' OR 'FRV')                
LRM001           IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                          
LRM001              SET TAXM-DELIVERY    TO TRUE                                
LRM001           ELSE                                                           
LRM001              SET TAXM-RECEIVE     TO TRUE                                
LRM001        ELSE                                                              
              IF DSTBN-SIDE-CD       OF DCLVTRNHSTY = 'R'                       
                 SET TAXM-RECEIVE     TO TRUE                                   
              ELSE                                                              
                 SET TAXM-DELIVERY    TO TRUE                                   
LRM012        END-IF END-IF                                                     
LRM012        IF  TRNFR-TYPE-CD OF DCLVTRNHSTY = 'PTF'                          
LRM012        AND DSTBN-SIDE-CD      OF DCLVTRNHSTY = 'R'                       
LRM012        AND  ACCT-RCV-NBR OF DCLVTRNHSTY (1:8) NOT =                      
LRM012                                 TAXM-TO-ACCT-RCV-NBR (1:8)               
LRM012           MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO                            
LRM012                                 TAXM-TO-ACCT-RCV-NBR                     
LRM012        END-IF                                                            
LRM006*** NON ACAT OR ACAT DETAILS NOT FOUND ON DB2 TABLES...                   
LRM006*** IN CBRS WORLD, SUBMITTER IDENTIFIES WHOSE DATA THIS IS.               
           ELSE                                                                 
           IF NSCC-ASSET-OUTPUT                                         CAT788  
              IF NSCC-SUBMITTING-BRKR = NSCC-AO-RCV-NBR                         
                 SET TAXM-RECEIVE     TO TRUE                                   
              ELSE                                                              
                 SET TAXM-DELIVERY    TO TRUE                                   
           ELSE                                                                 
           IF NSCC-TAX-LOT-OUTPUT                                       CAT788  
              IF NSCC-SUBMITTING-BRKR = NSCC-TO-RCV-NBR                         
                 SET TAXM-RECEIVE     TO TRUE                                   
              ELSE                                                              
                 SET TAXM-DELIVERY    TO TRUE                                   
           END-IF.                                                              
                                                                                
                                                                        CAT788  
           MOVE ZEROES TO TAXM-ASSET-QTY-DEC                            CAT788  
                          TAXM-ASSET-PRICE-DEC                          CAT788  
                          TAXM-ASSET-ORIG-COST-DEC.                     CAT788  
                                                                        CAT788  
           IF NSCC-TAX-LOT-OUTPUT                                       CAT788  
              IF NSCC-TO-ASSET-QTY = SPACES                             CAT788  
                 MOVE ZEROS               TO TAXM-ASSET-QTY-DEC                 
              ELSE                                                              
                 MOVE NSCC-TO-ASSET-QTY   TO W-QTY-X                    CAT788  
                 PERFORM  3300-REFORMAT-TO-DECIMAL                      CAT788  
                 MOVE W-QTY-N             TO TAXM-ASSET-QTY-DEC         CAT788  
              END-IF                                                            
                                                                        CAT788  
              IF NSCC-TO-ORIG-UNIT-COST = SPACES                        CAT788  
                 MOVE ZEROS               TO TAXM-ASSET-PRICE-DEC       CAT788  
              ELSE                                                              
                 MOVE NSCC-TO-ORIG-UNIT-COST TO W-QTY-X                 CAT788  
                 PERFORM  3300-REFORMAT-TO-DECIMAL                      CAT788  
                 MOVE W-QTY-N             TO TAXM-ASSET-PRICE-DEC       CAT788  
              END-IF                                                            
                                                                        CAT788  
              IF NSCC-TO-ORIG-COST = SPACES                             CAT788  
                 MOVE ZEROS               TO TAXM-ASSET-ORIG-COST-DEC   CAT788  
              ELSE                                                              
                 MOVE NSCC-TO-ORIG-COST      TO W-QTY-X                 CAT788  
                 PERFORM  3300-REFORMAT-TO-DECIMAL                      CAT788  
                 MOVE W-QTY-N             TO TAXM-ASSET-ORIG-COST-DEC   CAT788  
              END-IF                                                            
           END-IF.                                                      CAT788  
LRM009*****IF NSCC-TRNFR-TYPE > SPACES                                          
LRM011     IF (NSCC-AO-TRANSACTION-TYPE = '01' OR '46' OR '51')                 
LRM009     AND (NSCC-ASSET-OUTPUT                                       CAT788  
LRM009      OR NSCC-TAX-LOT-OUTPUT)                                     CAT788  
LRM009        MOVE CSH-MGN-SHRT-CD OF DCLVASTHSTY                               
LRM009                                    TO TAXM-TO-CASH-MGN-IND               
LRM009     END-IF.                                                      CAT788  
                                                                                
           WRITE TAXM-RECORD.                                           CAT788  
           ADD 1 TO W-OUTFILE-CNT.                                      CAT788  
                                                                        CAT788  
           PERFORM 6000-READ-INFILE.                                    CAT788  
                                                                        CAT788  
       3000-EX.           EXIT.                                         CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       3100-READ-HISTORY-TRNFR-TBL.                                     CAT788  
           MOVE +0 TO SQLCODE.                                          CAT788  
           MOVE SPACE TO WS-HST-TRNFR-NOT-FOUND-SW.                     CAT788  
LRM003     MOVE SPACE TO WS-ACTIVE-TRNFR-NOT-FOUND-SW.                  CAT788  
                                                                        CAT788  
           EXEC SQL                                                     CAT788  
              SELECT                                                    CAT788  
                  CLIENT_NBR                                            CAT788  
                 ,ACAT_CONTROL_NBR                                      CAT788  
                 ,STTLM_DT                                              CAT788  
                 ,DSTBN_SIDE_CD                                                 
LRM001           ,TRNFR_TYPE_CD                                                 
LRM002           ,ACAT_CNTL_ASTD_NBR                                            
LRM012           ,ACCT_RCV_NBR                                                  
              INTO                                                      CAT788  
                  :DCLVTRNHSTY.CLIENT-NBR                               CAT788  
                 ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                         CAT788  
                 ,:DCLVTRNHSTY.STTLM-DT                                 CAT788  
                 ,:DCLVTRNHSTY.DSTBN-SIDE-CD                            CAT788  
LRM001           ,:DCLVTRNHSTY.TRNFR-TYPE-CD                            CAT788  
LRM002           ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                       CAT788  
LRM012           ,:DCLVTRNHSTY.ACCT-RCV-NBR                             CAT788  
              FROM                                                      CAT788  
                  VTRNHSTY                                              CAT788  
              WHERE                                                     CAT788  
                  CLIENT_NBR = :WS-CLIENT-NBR                           CAT788  
                  AND ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR           CAT788  
              WITH UR                                                   CAT788  
           END-EXEC.                                                    CAT788  
                                                                        CAT788  
           IF SQLCODE = +0                                              CAT788  
LRM011        ADD 1 TO WS-VTRNHSTY-FOUND                                CAT788  
           ELSE                                                         CAT788  
           IF SQLCODE = +100                                            CAT788  
              SET  WS-HST-TRNFR-NOT-FOUND  TO TRUE                      CAT788  
              DISPLAY 'CAT788: NOT FOUND IN VTRNHSTY - RECORD '         CAT788  
              DISPLAY '        CLIENT=' WS-CLIENT-NBR                   CAT788  
                      ' CTL='   WS-ACAT-CONTROL-NBR                     CAT788  
                      ' CUSIP=' WS-CUSIP-NBR                            CAT788  
                      ' RCV='   WS-ACCT-RCV-NBR (1:12)                  CAT788  
                      ' DLV='   WS-ACCT-DLV-NBR (1:12)                  CAT788  
           ELSE                                                         CAT788  
              MOVE +3010     TO ABEND-CODE                              CAT788  
              MOVE SQLCODE   TO W-DB2-SQLCODE                           CAT788  
              DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '        CAT788  
                      'SELECT VTRNHSTY TABLE **'                        CAT788  
              DISPLAY '           SQLCODE=' W-DB2-SQLCODE               CAT788  
                      ' CLIENT=' WS-CLIENT-NBR                          CAT788  
                      ' CTL=' WS-ACAT-CONTROL-NBR                       CAT788  
              PERFORM 8000-SQL-ERROR-ROUTINE                            CAT788  
           END-IF.                                                      CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       3150-READ-HSTY-OPT-ASSET-TBL.                                    CAT788  
           MOVE +0 TO SQLCODE.                                          CAT788  
                                                                        CAT788  
           EXEC SQL                                                     CAT788  
              SELECT                                                    CAT788  
                  ASSET_SEQ_NBR                                         CAT788  
              INTO                                                      CAT788  
                  :DCLVOPTHSTY.ASSET-SEQ-NBR                            CAT788  
              FROM                                                      CAT788  
                  VOPTHSTY                                              CAT788  
              WHERE                                                     CAT788  
                  CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
                  AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
                  AND SYM_CD            = :WS-OPT-SYM                   CAT788  
                  AND EXPTN_DT          = :WS-OPT-EXP-DATE                      
                  AND PTCL_CD           = :WS-PUT-CALL-IND                      
                  AND STPRC_INTEGER_AMT = :WS-STPRC-INTEGER-AMT                 
                  AND STPRC_FRCTN_AMT   = :WS-STPRC-FRCTN-AMT                   
              WITH UR                                                   CAT788  
           END-EXEC.                                                    CAT788  
                                                                        CAT788  
LRM008     IF NOT NSCC-ASSET-OUTPUT                                     CAT788  
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
           IF (SQLCODE = +0  OR  -811)                                  CAT788  
              PERFORM 3170-READ-ASSET-VIA-SEQ-NBR                       CAT788  
           ELSE                                                         CAT788  
           IF SQLCODE = +100                                            CAT788  
              DISPLAY 'CAT788: *** WARNING - '                          CAT788  
                          'ADP OPTION SYMBOL NOT FOUND ***'             CAT788  
              DISPLAY '          CLIENT=' WS-CLIENT-NBR                 CAT788  
                          ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
                          ' SYM=' WS-OPT-SYM                            CAT788  
                          ' EXP=' WS-OPT-EXP-DATE                               
                          ' STR=' WS-STPRC-INTEGER-AMT                          
                          ' FRC=' WS-STPRC-FRCTN-AMT                            
                          ' P/C=' WS-PUT-CALL-IND                               
           ELSE                                                         CAT788  
              MOVE +3015     TO ABEND-CODE                              CAT788  
              MOVE SQLCODE   TO W-DB2-SQLCODE                           CAT788  
              DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '        CAT788  
                          'SELECT VASTHSTY TABLE **'                    CAT788  
              DISPLAY '           SQLCODE=' W-DB2-SQLCODE               CAT788  
                          ' CLIENT=' WS-CLIENT-NBR                      CAT788  
                          ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
                          ' SEC=' WS-CUSIP-NBR                          CAT788  
              PERFORM 8000-SQL-ERROR-ROUTINE                            CAT788  
           END-IF.                                                      CAT788  
       3150-EXIT. EXIT.                                                 CAT788  
      *                                                                 CAT788  
LRM014 3152-READ-HSTY-OPT-AST-SEQ.                                      CAT788  
LRM014     MOVE +0 TO SQLCODE.                                          CAT788  
LRM014                                                                  CAT788  
LRM014     EXEC SQL                                                     CAT788  
LRM014        SELECT                                                    CAT788  
LRM014            ASSET_SEQ_NBR                                         CAT788  
LRM014        INTO                                                      CAT788  
LRM014            :DCLVOPTHSTY.ASSET-SEQ-NBR                            CAT788  
LRM014        FROM                                                      CAT788  
LRM014            VOPTHSTY                                              CAT788  
LRM014        WHERE                                                     CAT788  
LRM014            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM014            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM014            AND ASSET_SEQ_NBR     = :DCLVOPTHSTY.ASSET-SEQ-NBR    CAT788  
LRM014        WITH UR                                                   CAT788  
LRM014     END-EXEC.                                                    CAT788  
LRM014                                                                  CAT788  
LRM014     IF NOT NSCC-ASSET-OUTPUT                                     CAT788  
LRM014        CONTINUE                                                          
LRM014     ELSE                                                                 
LRM014     IF (SQLCODE = +0  OR  -811)                                  CAT788  
LRM014        MOVE SECURITY-ADP-NBR OF DCLVASTHSTY TO WS-ADP-SEC-NBR    CAT788  
LRM014        ADD 1 TO WS-VOPTHSTY-BY-SEQ-FND                           CAT788  
LRM014     ELSE                                                         CAT788  
LRM014     IF SQLCODE = +100                                            CAT788  
LRM014        DISPLAY 'CAT788: *** WARNING - '                          CAT788  
LRM014                    'ADP OPTION SYMBOL NOT FOUND ***'             CAT788  
LRM014        DISPLAY '          CLIENT=' WS-CLIENT-NBR                 CAT788  
LRM014                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM014                    ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
LRM014     ELSE                                                         CAT788  
LRM014        MOVE +3016     TO ABEND-CODE                              CAT788  
LRM014        MOVE SQLCODE   TO W-DB2-SQLCODE                           CAT788  
LRM014        DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '        CAT788  
LRM014                    'SELECT VASTHSTY TABLE **'                    CAT788  
LRM014        DISPLAY '           SQLCODE=' W-DB2-SQLCODE               CAT788  
LRM014                    ' CLIENT=' WS-CLIENT-NBR                      CAT788  
LRM014                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM014                    ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
LRM014        PERFORM 8000-SQL-ERROR-ROUTINE                            CAT788  
LRM014     END-IF.                                                      CAT788  
LRM014 3152-EXIT. EXIT.                                                 CAT788  
      *                                                                 CAT788  
       3170-READ-ASSET-VIA-SEQ-NBR.                                     CAT788  
           MOVE +0 TO SQLCODE.                                          CAT788  
                                                                        CAT788  
           EXEC SQL                                                     CAT788  
              SELECT                                                    CAT788  
                  CLIENT_NBR                                            CAT788  
                 ,ISIN_SEC_ISSUE_CD                                     CAT788  
                 ,ACAT_CONTROL_NBR                                      CAT788  
                 ,SBMTG_PRTCP_NBR                                       CAT788  
                 ,SECURITY_ADP_NBR                                      CAT788  
                 ,ASSET_QTY                                             CAT788  
                 ,ASSET_AMT                                             CAT788  
LRM018           ,CSH_MGN_SHRT_CD                                               
              INTO                                                      CAT788  
                  :DCLVASTHSTY.CLIENT-NBR                               CAT788  
                 ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                        CAT788  
                 ,:DCLVASTHSTY.ACAT-CONTROL-NBR                         CAT788  
                 ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                          CAT788  
                 ,:DCLVASTHSTY.SECURITY-ADP-NBR                         CAT788  
                 ,:DCLVASTHSTY.ASSET-QTY                                CAT788  
                 ,:DCLVASTHSTY.ASSET-AMT                                CAT788  
LRM018           ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                          CAT788  
              FROM                                                      CAT788  
                  VASTHSTY                                              CAT788  
              WHERE                                                     CAT788  
                  CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
                  AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
                  AND ASSET_SEQ_NBR     = :DCLVOPTHSTY.ASSET-SEQ-NBR    CAT788  
              WITH UR                                                   CAT788  
           END-EXEC.                                                    CAT788  
                                                                        CAT788  
           IF SQLCODE = +0  OR  -811                                    CAT788  
LRM017        IF NSCC-AO-CUSIP-NUM > SPACES                                     
LRM017        AND ISIN-SEC-ISSUE-CD OF DCLVASTHSTY                              
LRM017                          NOT = NSCC-AO-CUSIP-NUM                         
LRM017          DISPLAY 'IN 3170-  SKIP VASTHSTY '                              
LRM017         ' NSCC=' NSCC-AO-CUSIP-NUM                                       
LRM017         ' VASTHSTY=' ISIN-SEC-ISSUE-CD OF DCLVASTHSTY            CAT788  
LRM017         ' CONTRA=' NSCC-AO-DLVR-NBR                              CAT788  
LRM017         ' '  WS-ACAT-CONTROL-NBR                                 CAT788  
LRM017         ' SEC WAS =' WS-ADP-SEC-NBR                                      
LRM017         ' BYP=' SECURITY-ADP-NBR OF DCLVASTHSTY                          
LRM017         ADD 1 TO WS-VASTHSTY-BY-SEQ-NOGO                                 
LRM017        ELSE                                                              
LRM016        IF SECURITY-ADP-NBR OF DCLVASTHSTY NOT = WS-ADP-SEC-NBR   CAT788  
LRM016********* DISPLAY 'IN 3170-  SEC WAS =' WS-ADP-SEC-NBR                    
LRM016*********' IS =' SECURITY-ADP-NBR OF DCLVASTHSTY                          
                MOVE SECURITY-ADP-NBR OF DCLVASTHSTY TO WS-ADP-SEC-NBR  CAT788  
              END-IF END-IF                                                     
           ELSE                                                         CAT788  
           IF SQLCODE = +100                                            CAT788  
LRM006****    MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
                  DISPLAY 'CAT788: *** WARNING - '                      CAT788  
                          'ADP SECURITY NUMBER NOT FOUND FOR OPT ***'   CAT788  
                  DISPLAY '          CLIENT=' WS-CLIENT-NBR             CAT788  
                          ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
                          ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
                          ' SEC=' WS-CUSIP-NBR                          CAT788  
           ELSE                                                         CAT788  
                  MOVE +3017     TO ABEND-CODE                          CAT788  
                  MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
                  DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
                          'SELECT VASTHSTY TABLE VIA SEQ NBR **'        CAT788  
                  DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
                          ' CLIENT=' WS-CLIENT-NBR                      CAT788  
                          ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
                          ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
                  PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
           END-IF.                                                      CAT788  
      *                                                                 CAT788  
       3200-READ-HISTORY-ASSET-TBL.                                     CAT788  
           MOVE +0 TO SQLCODE.                                          CAT788  
                                                                        CAT788  
           EXEC SQL                                                     CAT788  
              SELECT                                                    CAT788  
                  CLIENT_NBR                                            CAT788  
                 ,ISIN_SEC_ISSUE_CD                                     CAT788  
                 ,ACAT_CONTROL_NBR                                      CAT788  
                 ,SBMTG_PRTCP_NBR                                       CAT788  
                 ,SECURITY_ADP_NBR                                      CAT788  
                 ,ASSET_QTY                                             CAT788  
                 ,ASSET_AMT                                             CAT788  
LRM002           ,ASSET_SEQ_NBR                                         CAT788  
LRM009           ,CSH_MGN_SHRT_CD                                               
              INTO                                                      CAT788  
                  :DCLVASTHSTY.CLIENT-NBR                               CAT788  
                 ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                        CAT788  
                 ,:DCLVASTHSTY.ACAT-CONTROL-NBR                         CAT788  
                 ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                          CAT788  
                 ,:DCLVASTHSTY.SECURITY-ADP-NBR                         CAT788  
                 ,:DCLVASTHSTY.ASSET-QTY                                CAT788  
                 ,:DCLVASTHSTY.ASSET-AMT                                CAT788  
LRM002           ,:DCLVASTHSTY.ASSET-SEQ-NBR                            CAT788  
LRM009           ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                          CAT788  
              FROM                                                      CAT788  
                  VASTHSTY                                              CAT788  
              WHERE                                                     CAT788  
                  CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
                  AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
                  AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
              WITH UR                                                   CAT788  
           END-EXEC.                                                    CAT788  
                                                                        CAT788  
           IF SQLCODE = +0  OR  -811                                    CAT788  
LRM011        ADD 1 TO WS-VASTHSTY-FOUND                                CAT788  
              MOVE SECURITY-ADP-NBR OF DCLVASTHSTY TO WS-ADP-SEC-NBR    CAT788  
TEST          DISPLAY 'FND VASTHSTY ' CSH-MGN-SHRT-CD OF DCLVASTHSTY            
                  ' ' WS-CLIENT-NBR  ' '   WS-ACAT-CONTROL-NBR          CAT788  
                  ' ' ASSET-SEQ-NBR OF DCLVASTHSTY ' ' WS-ADP-SEC-NBR           
                  ' ' TRNFR-TYPE-CD OF DCLVTRNHSTY                              
LRM009        IF SQLCODE = -811                                         CAT788  
LRM009           PERFORM 3220-SEARCH-FOR-MULTI-CMS-RTN                  CAT788  
LRM009              THRU 3220-EXIT                                      CAT788  
LRM009        END-IF                                                            
           ELSE                                                         CAT788  
           IF SQLCODE = +100                                            CAT788  
              CONTINUE                                                          
LRM006***     MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
           ELSE                                                         CAT788  
                  MOVE +3020     TO ABEND-CODE                          CAT788  
                  MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
                  DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
                          'SELECT VASTHSTY TABLE **'                    CAT788  
                  DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
                          ' CLIENT=' WS-CLIENT-NBR                      CAT788  
                          ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
                          ' SEC=' WS-CUSIP-NBR                          CAT788  
                  PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
           END-IF.                                                      CAT788  
                                                                                
LRM009 3220-SEARCH-FOR-MULTI-CMS-RTN.                                   CAT788  
LRM009*** AT THIS POINT, WE HAVE MORE THAN ONE SECURITY ON THIS XFER            
LRM009*** THAT MATCHES THE ISIN.  TRY FOR MATCH ON QY WITH PEND CODE            
LRM009*** NOT USED (WE DID NOT ALLOC THIS ROW TO TLE YET).                      
TEST       DISPLAY '3220- LOOKING FOR BETTER MATCH '                            
TEST           'QTY=' WS-TOT-ASSET-QTY-DEC                              CAT788  
LRM009     MOVE WS-TOT-ASSET-QTY-DEC TO ASSET-QTY OF DCLVASSET.         CAT788  
LRM009     EXEC SQL                                                     CAT788  
LRM009        SELECT                                                    CAT788  
LRM009            CSH_MGN_SHRT_CD                                               
LRM009           ,ASSET_SEQ_NBR                                         CAT788  
LRM009        INTO                                                      CAT788  
LRM009            :DCLVASSET.CSH-MGN-SHRT-CD                            CAT788  
LRM009           ,:DCLVASSET.ASSET-SEQ-NBR                              CAT788  
LRM009        FROM                                                      CAT788  
LRM009            VASTHSTY                                              CAT788  
LRM009        WHERE                                                     CAT788  
LRM009            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM009            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM009            AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
LRM009            AND ASSET_QTY         = :DCLVASSET.ASSET-QTY          CAT788  
LRM009            AND NOT NSCC_PEND_CD  = 'T'                                   
LRM009        WITH UR                                                   CAT788  
LRM009     END-EXEC.                                                    CAT788  
LRM009                                                                  CAT788  
LRM009     IF SQLCODE = +0 OR -811                                      CAT788  
LRM009        DISPLAY 'MATCH CMS VIA QTY AND NOT ALLOC '                        
LRM009            WS-CLIENT-NBR  ' '   WS-ACAT-CONTROL-NBR              CAT788  
LRM009                 ' '  ASSET-SEQ-NBR OF DCLVASSET                          
LRM009        MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO                      CAT788  
LRM009             CSH-MGN-SHRT-CD OF DCLVASTHSTY                       CAT788  
LRM009        MOVE ASSET-SEQ-NBR   OF DCLVASSET TO                      CAT788  
LRM009             ASSET-SEQ-NBR   OF DCLVASTHSTY                       CAT788  
LRM009        PERFORM 3250-MARK-VASTHSTY-AS-ALLOC                               
LRM009        MOVE +0 TO SQLCODE                                        CAT788  
LRM009        GO TO 3220-EXIT                                                   
LRM009     ELSE                                                                 
LRM009        DISPLAY 'MATCH CMS #1 NG ' SQLCODE                                
LRM009     END-IF.                                                              
LRM009*** TRY MATCHING WITHOUT THE QTY.                                         
LRM009     EXEC SQL                                                     CAT788  
LRM009        SELECT                                                    CAT788  
LRM009            CSH_MGN_SHRT_CD                                               
LRM009           ,ASSET_SEQ_NBR                                         CAT788  
LRM009        INTO                                                      CAT788  
LRM009            :DCLVASSET.CSH-MGN-SHRT-CD                            CAT788  
LRM009           ,:DCLVASSET.ASSET-SEQ-NBR                              CAT788  
LRM009        FROM                                                      CAT788  
LRM009            VASTHSTY                                              CAT788  
LRM009        WHERE                                                     CAT788  
LRM009            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM009            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM009            AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
LRM009            AND NOT NSCC_PEND_CD  = 'T'                                   
LRM009        WITH UR                                                   CAT788  
LRM009     END-EXEC.                                                    CAT788  
LRM009                                                                  CAT788  
LRM009     IF SQLCODE = +0 OR -811                                      CAT788  
LRM009        DISPLAY 'MATCH CMS VIA NOT ALLOC '                                
LRM009            WS-CLIENT-NBR  ' '   WS-ACAT-CONTROL-NBR              CAT788  
LRM009                 ' '  ASSET-SEQ-NBR OF DCLVASSET                          
LRM009        MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO                      CAT788  
LRM009             CSH-MGN-SHRT-CD OF DCLVASTHSTY                       CAT788  
LRM009        MOVE ASSET-SEQ-NBR   OF DCLVASSET TO                      CAT788  
LRM009             ASSET-SEQ-NBR   OF DCLVASTHSTY                       CAT788  
LRM009        PERFORM 3250-MARK-VASTHSTY-AS-ALLOC                               
LRM009        MOVE +0 TO SQLCODE                                        CAT788  
LRM009        GO TO 3220-EXIT                                                   
LRM009     ELSE                                                                 
LRM009        DISPLAY 'MATCH CMS #2 NG ' SQLCODE                                
LRM009     END-IF.                                                              
LRM009                                                                          
LRM009     MOVE +0 TO SQLCODE.                                          CAT788  
LRM009 3220-EXIT. EXIT.                                                 CAT788  
LRM009                                                                          
LRM009 3250-MARK-VASTHSTY-AS-ALLOC.                                             
LRM009     EXEC SQL UPDATE VASTHSTY                                     CAT788  
LRM009        SET NSCC_PEND_CD  = 'T'                                   CAT788  
LRM009        WHERE                                                     CAT788  
LRM009            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM009            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM009            AND ASSET_SEQ_NBR     = :DCLVASTHSTY.ASSET-SEQ-NBR    CAT788  
LRM009     END-EXEC.                                                    CAT788  
LRM009                                                                  CAT788  
LRM009     IF SQLCODE = +0                                              CAT788  
LRM009        DISPLAY 'UPDATED PEND CODE ON SEQ '                               
LRM009                      ASSET-SEQ-NBR OF DCLVASTHSTY                        
LRM009     ELSE                                                                 
LRM009        DISPLAY 'MATCH CMS/UPDATE NG ' SQLCODE                            
LRM009     END-IF.                                                              
       EJECT                                                            CAT788  
      *                                                                 CAT788  
      *--------------------------------------------------------------*  CAT788  
      *   ALPHANUMERICALLY DEFINED NUMBER WITH COMMA INSTEAD OF      *  CAT788  
      *   DECIMAL PERIOD IS REFORMATED TO DECIMAL NUMERIC FIELD.     *  CAT788  
      *                                                              *  CAT788  
      *   EXAMPLE:                                                   *  CAT788  
      *      FROM = '955,1234         ' (ALPHANUMERIC)               *  CAT788  
      *      TO   =  000000000955.1234  (NUMERIC)                    *  CAT788  
      *--------------------------------------------------------------*  CAT788  
       3300-REFORMAT-TO-DECIMAL.                                        CAT788  
           MOVE 0          TO W-INT                                     CAT788  
                              W-DEC                                     CAT788  
                              W-QTY-N.                                  CAT788  
           MOVE ' '        TO W-COMMA-FND-SW.                           CAT788  
                                                                        CAT788  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT788  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT788  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT788  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT788  
                        END-IF                                          CAT788  
           END-PERFORM.                                                 CAT788  
                                                                        CAT788  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT788  
               MOVE 17                   TO W-INT-PTR                   CAT788  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT788  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT788  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT788  
                       UNTIL W-QTY-PTR = 0                              CAT788  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT788  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT788  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT788  
               END-PERFORM                                              CAT788  
               MOVE 1           TO W-DEC-PTR                            CAT788  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT788  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT788  
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)          CAT788  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT788  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT788  
                       ADD 1        TO W-DEC-PTR                        CAT788  
               END-PERFORM                                              CAT788  
           ELSE                                                         CAT788  
               MOVE W-QTY           TO W-INT                            CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           MOVE W-INT               TO W-QTY-INT.                       CAT788  
           MOVE W-DEC               TO W-QTY-DEC.                       CAT788  
                                                                        CAT788  
           IF W-QTY-N  NOT NUMERIC                                      CAT788  
               DISPLAY 'CAT788: *WARNING* WIPED GARBAGE QTY/PRICE FOR ' CAT788  
                          ' REC# ' W-INFILE-CNT                         CAT788  
                           ' CLT=' WS-CLIENT-NBR                        CAT788  
                          ' CNTL=' WS-ACAT-CONTROL-NBR                  CAT788  
                         ' CUSIP=' WS-CUSIP-NBR                         CAT788  
                           ' ADP=' WS-ADP-SEC-NBR                       CAT788  
               DISPLAY '     WAS=' W-QTY-X                                      
                           ' GOT=' W-QTY-X-NEW                                  
               MOVE ZEROS TO W-QTY-N                                    CAT788  
           END-IF.                                                      CAT788  
       EJECT                                                            CAT788  
LRM003 3500-READ-ACTIVE-TRNFR-TBL.                                      CAT788  
LRM003     MOVE +0 TO SQLCODE.                                          CAT788  
LRM003     MOVE SPACE TO WS-ACTIVE-TRNFR-NOT-FOUND-SW.                  CAT788  
LRM003                                                                  CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003        SELECT                                                    CAT788  
LRM003            CLIENT_NBR                                            CAT788  
LRM003           ,ACAT_CONTROL_NBR                                      CAT788  
LRM003           ,STTLM_DT                                              CAT788  
LRM003           ,DSTBN_SIDE_CD                                                 
LRM003           ,TRNFR_TYPE_CD                                                 
LRM003           ,ACAT_CNTL_ASTD_NBR                                            
LRM012           ,ACCT_RCV_NBR                                                  
LRM003        INTO                                                      CAT788  
LRM003            :DCLVTRNHSTY.CLIENT-NBR                               CAT788  
LRM003           ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                         CAT788  
LRM003           ,:DCLVTRNHSTY.STTLM-DT                                 CAT788  
LRM003           ,:DCLVTRNHSTY.DSTBN-SIDE-CD                            CAT788  
LRM003           ,:DCLVTRNHSTY.TRNFR-TYPE-CD                            CAT788  
LRM003           ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                       CAT788  
LRM012           ,:DCLVTRNHSTY.ACCT-RCV-NBR                             CAT788  
LRM003        FROM                                                      CAT788  
LRM003            VTRNFR                                                CAT788  
LRM003        WHERE                                                     CAT788  
LRM003            CLIENT_NBR = :WS-CLIENT-NBR                           CAT788  
LRM003            AND ACAT_CONTROL_NBR = :WS-ACAT-CONTROL-NBR           CAT788  
LRM003        WITH UR                                                   CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003                                                                  CAT788  
LRM003     IF SQLCODE = +0                                              CAT788  
LRM011        ADD 1 TO WS-VTRNFR-FOUND                                  CAT788  
LRM003     ELSE                                                         CAT788  
LRM003     IF SQLCODE = +100                                            CAT788  
LRM003        SET  WS-ACTIVE-TRNFR-NOT-FOUND  TO TRUE                   CAT788  
LRM003        DISPLAY 'CAT788: NOT FOUND IN VTRNFR - RECORD '           CAT788  
LRM024                ' ACAT NOT MATCHED'                               CAT788  
LRM003        DISPLAY '        CLIENT=' WS-CLIENT-NBR                   CAT788  
LRM003                ' CTL='   WS-ACAT-CONTROL-NBR                     CAT788  
LRM003                ' CUSIP=' WS-CUSIP-NBR                            CAT788  
LRM003                ' RCV='   WS-ACCT-RCV-NBR (1:12)                  CAT788  
LRM003                ' DLV='   WS-ACCT-DLV-NBR (1:12)                  CAT788  
LRM003     ELSE                                                         CAT788  
LRM003        MOVE +3510     TO ABEND-CODE                              CAT788  
LRM003        MOVE SQLCODE   TO W-DB2-SQLCODE                           CAT788  
LRM003        DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '        CAT788  
LRM003                'SELECT VTRNNF TABLE **'                          CAT788  
LRM003        DISPLAY '           SQLCODE=' W-DB2-SQLCODE               CAT788  
LRM003                ' CLIENT=' WS-CLIENT-NBR                          CAT788  
LRM003                ' CTL=' WS-ACAT-CONTROL-NBR                       CAT788  
LRM003        PERFORM 8000-SQL-ERROR-ROUTINE                            CAT788  
LRM003     END-IF.                                                      CAT788  
LRM003 EJECT                                                            CAT788  
LRM003*                                                                 CAT788  
LRM003 3650-READ-ACTIVE-OPT-ASSET-TBL.                                  CAT788  
LRM003     MOVE +0 TO SQLCODE.                                          CAT788  
LRM003                                                                  CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003        SELECT                                                    CAT788  
LRM003            ASSET_SEQ_NBR                                         CAT788  
LRM003        INTO                                                      CAT788  
LRM003            :DCLVOPTHSTY.ASSET-SEQ-NBR                            CAT788  
LRM003        FROM                                                      CAT788  
LRM003            VOPTN                                                 CAT788  
LRM003        WHERE                                                     CAT788  
LRM003            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM003            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM003            AND SYM_CD            = :WS-OPT-SYM                   CAT788  
LRM003            AND EXPTN_DT          = :WS-OPT-EXP-DATE                      
LRM003            AND PTCL_CD           = :WS-PUT-CALL-IND                      
LRM003            AND STPRC_INTEGER_AMT = :WS-STPRC-INTEGER-AMT                 
LRM003            AND STPRC_FRCTN_AMT   = :WS-STPRC-FRCTN-AMT                   
LRM003        WITH UR                                                   CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003                                                                  CAT788  
LRM003     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM003        PERFORM 3670-READ-ASSET-VIA-SEQ-NBR                       CAT788  
LRM003     ELSE                                                         CAT788  
LRM003     IF SQLCODE = +100                                            CAT788  
LRM006****    MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
LRM003            DISPLAY 'CAT788: *** WARNING - '                      CAT788  
LRM003                    'ADP OPTION SYMBOL NOT FOUND ***'             CAT788  
LRM003            DISPLAY '          CLIENT=' WS-CLIENT-NBR             CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SYM=' WS-OPT-SYM                            CAT788  
LRM003                    ' EXP=' WS-OPT-EXP-DATE                               
LRM003                    ' STR=' WS-STPRC-INTEGER-AMT                          
LRM003                    ' FRC=' WS-STPRC-FRCTN-AMT                            
LRM003                    ' P/C=' WS-PUT-CALL-IND                               
LRM003     ELSE                                                         CAT788  
LRM003            MOVE +3615     TO ABEND-CODE                          CAT788  
LRM003            MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
LRM003            DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
LRM003                    'SELECT VASSET TABLE **'                      CAT788  
LRM003            DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
LRM003                    ' CLIENT=' WS-CLIENT-NBR                      CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SEC=' WS-CUSIP-NBR                          CAT788  
LRM003            PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
LRM003     END-IF.                                                      CAT788  
LRM003 3650-EXIT. EXIT.                                                 CAT788  
LRM003*                                                                 CAT788  
LRM014 3652-READ-ACTIVE-OPT-AST-SEQ.                                    CAT788  
LRM014     MOVE +0 TO SQLCODE.                                          CAT788  
LRM014                                                                  CAT788  
LRM014     EXEC SQL                                                     CAT788  
LRM014        SELECT                                                    CAT788  
LRM014            ASSET_SEQ_NBR                                         CAT788  
LRM014        INTO                                                      CAT788  
LRM014            :DCLVOPTHSTY.ASSET-SEQ-NBR                            CAT788  
LRM014        FROM                                                      CAT788  
LRM014            VOPTN                                                 CAT788  
LRM014        WHERE                                                     CAT788  
LRM014            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM014            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM014            AND ASSET_SEQ_NBR     = :DCLVOPTHSTY.ASSET-SEQ-NBR    CAT788  
LRM014        WITH UR                                                   CAT788  
LRM014     END-EXEC.                                                    CAT788  
LRM014                                                                  CAT788  
LRM014     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM014        CONTINUE                                                  CAT788  
LRM014     ELSE                                                         CAT788  
LRM014     IF SQLCODE = +100                                            CAT788  
LRM014****    MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
LRM014            DISPLAY 'CAT788: *** WARNING - '                      CAT788  
LRM014                    'ADP OPTION SYMBOL NOT FOUND ***'             CAT788  
LRM014            DISPLAY '          CLIENT=' WS-CLIENT-NBR             CAT788  
LRM014                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM014                    ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
LRM014     ELSE                                                         CAT788  
LRM014            MOVE +3617     TO ABEND-CODE                          CAT788  
LRM014            MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
LRM014            DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
LRM014                    'SELECT VASSET TABLE **'                      CAT788  
LRM014            DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
LRM014                    ' CLIENT=' WS-CLIENT-NBR                      CAT788  
LRM014                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM014                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM014            PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
LRM014     END-IF.                                                      CAT788  
LRM014 3652-EXIT. EXIT.                                                 CAT788  
LRM014*                                                                 CAT788  
LRM003 3670-READ-ASSET-VIA-SEQ-NBR.                                     CAT788  
LRM003     MOVE +0 TO SQLCODE.                                          CAT788  
LRM003                                                                  CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003        SELECT                                                    CAT788  
LRM003            CLIENT_NBR                                            CAT788  
LRM003           ,ISIN_SEC_ISSUE_CD                                     CAT788  
LRM003           ,ACAT_CONTROL_NBR                                      CAT788  
LRM003           ,SBMTG_PRTCP_NBR                                       CAT788  
LRM003           ,SECURITY_ADP_NBR                                      CAT788  
LRM003           ,ASSET_QTY                                             CAT788  
LRM003           ,ASSET_AMT                                             CAT788  
LRM018           ,CSH_MGN_SHRT_CD                                               
LRM003        INTO                                                      CAT788  
LRM003            :DCLVASTHSTY.CLIENT-NBR                               CAT788  
LRM003           ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                        CAT788  
LRM003           ,:DCLVASTHSTY.ACAT-CONTROL-NBR                         CAT788  
LRM003           ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                          CAT788  
LRM003           ,:DCLVASTHSTY.SECURITY-ADP-NBR                         CAT788  
LRM003           ,:DCLVASTHSTY.ASSET-QTY                                CAT788  
LRM003           ,:DCLVASTHSTY.ASSET-AMT                                CAT788  
LRM018           ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                          CAT788  
LRM003        FROM                                                      CAT788  
LRM003            VASSET                                                CAT788  
LRM003        WHERE                                                     CAT788  
LRM003            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM003            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM003            AND ASSET_SEQ_NBR     = :DCLVOPTHSTY.ASSET-SEQ-NBR    CAT788  
LRM003        WITH UR                                                   CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003                                                                  CAT788  
LRM003     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM017        IF NSCC-AO-CUSIP-NUM > SPACES                                     
LRM017        AND ISIN-SEC-ISSUE-CD OF DCLVASTHSTY                              
LRM017                          NOT = NSCC-AO-CUSIP-NUM                         
LRM017           DISPLAY 'IN 3670-  SKIP MATCHED VASSET ADP MATCH'              
LRM017          ' NSCC=' NSCC-AO-CUSIP-NUM                                      
LRM017          ' VASTHSTY=' ISIN-SEC-ISSUE-CD OF DCLVASTHSTY           CAT788  
LRM017          ADD 1 TO WS-VASSET-BY-SEQ-NOGO                          CAT788  
LRM017        ELSE                                                              
LRM011        ADD 1 TO WS-VASSET-FOUND                                  CAT788  
LRM016        IF SECURITY-ADP-NBR OF DCLVASTHSTY NOT = WS-ADP-SEC-NBR   CAT788  
LRM016          DISPLAY 'IN 3670-  SEC WAS =' WS-ADP-SEC-NBR                    
LRM016         ' IS =' SECURITY-ADP-NBR OF DCLVASTHSTY                          
LRM003          MOVE SECURITY-ADP-NBR OF DCLVASTHSTY TO WS-ADP-SEC-NBR  CAT788  
LRM016        END-IF END-IF                                                     
LRM003     ELSE                                                         CAT788  
LRM003     IF SQLCODE = +100                                            CAT788  
LRM006***     MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
LRM003            DISPLAY 'CAT788: *** WARNING - '                      CAT788  
LRM003                    'ADP SECURITY NUMBER NOT FOUND FOR OPT ***'   CAT788  
LRM003            DISPLAY '          CLIENT=' WS-CLIENT-NBR             CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SEC=' WS-CUSIP-NBR                          CAT788  
LRM003     ELSE                                                         CAT788  
LRM003            MOVE +3617     TO ABEND-CODE                          CAT788  
LRM003            MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
LRM003            DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
LRM003                    'SELECT VASSET TABLE VIA SEQ NBR **'          CAT788  
LRM003            DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
LRM003                    ' CLIENT=' WS-CLIENT-NBR                      CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SEQ=' ASSET-SEQ-NBR OF DCLVOPTHSTY          CAT788  
LRM003            PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
LRM003     END-IF.                                                      CAT788  
LRM003*                                                                 CAT788  
LRM003 3700-READ-ACTIVE-ASSET-TBL.                                      CAT788  
LRM003     MOVE +0 TO SQLCODE.                                          CAT788  
LRM003                                                                  CAT788  
LRM003     EXEC SQL                                                     CAT788  
LRM003        SELECT                                                    CAT788  
LRM003            CLIENT_NBR                                            CAT788  
LRM003           ,ISIN_SEC_ISSUE_CD                                     CAT788  
LRM003           ,ACAT_CONTROL_NBR                                      CAT788  
LRM003           ,SBMTG_PRTCP_NBR                                       CAT788  
LRM003           ,SECURITY_ADP_NBR                                      CAT788  
LRM003           ,ASSET_QTY                                             CAT788  
LRM003           ,ASSET_AMT                                             CAT788  
LRM003           ,ASSET_SEQ_NBR                                         CAT788  
LRM009           ,CSH_MGN_SHRT_CD                                       CAT788  
LRM003        INTO                                                      CAT788  
LRM003            :DCLVASTHSTY.CLIENT-NBR                               CAT788  
LRM003           ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                        CAT788  
LRM003           ,:DCLVASTHSTY.ACAT-CONTROL-NBR                         CAT788  
LRM003           ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                          CAT788  
LRM003           ,:DCLVASTHSTY.SECURITY-ADP-NBR                         CAT788  
LRM003           ,:DCLVASTHSTY.ASSET-QTY                                CAT788  
LRM003           ,:DCLVASTHSTY.ASSET-AMT                                CAT788  
LRM003           ,:DCLVASTHSTY.ASSET-SEQ-NBR                            CAT788  
LRM009           ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                          CAT788  
LRM003        FROM                                                      CAT788  
LRM003            VASSET                                                CAT788  
LRM003        WHERE                                                     CAT788  
LRM003            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM003            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM003            AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
LRM003        WITH UR                                                   CAT788  
LRM003     END-EXEC.                                                    CAT788  
LRM003                                                                  CAT788  
LRM003     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM011        ADD 1 TO WS-VASSET-FOUND                                  CAT788  
LRM003        MOVE SECURITY-ADP-NBR OF DCLVASTHSTY TO WS-ADP-SEC-NBR    CAT788  
LRM009        IF SQLCODE = -811                                         CAT788  
LRM009           PERFORM 3720-SEARCH-FOR-MULTI-CMS-RTN                  CAT788  
LRM009              THRU 3720-EXIT                                      CAT788  
LRM009        END-IF                                                            
LRM003     ELSE                                                         CAT788  
LRM003     IF SQLCODE = +100                                            CAT788  
LRM006***     MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
LRM003            DISPLAY 'CAT788: *** WARNING - '                      CAT788  
LRM003             'ADP SECURITY NUMBER NOT FOUND ***'                  CAT788  
LRM003            DISPLAY '          CLIENT=' WS-CLIENT-NBR             CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SEC=' WS-CUSIP-NBR                          CAT788  
LRM003     ELSE                                                         CAT788  
LRM003            MOVE +3720     TO ABEND-CODE                          CAT788  
LRM003            MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
LRM003            DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
LRM003                    'SELECT VASSET TABLE **'                      CAT788  
LRM003            DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
LRM003                    ' CLIENT=' WS-CLIENT-NBR                      CAT788  
LRM003                    ' CTL=' WS-ACAT-CONTROL-NBR                   CAT788  
LRM003                    ' SEC=' WS-CUSIP-NBR                          CAT788  
LRM003            PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
LRM003     END-IF.                                                      CAT788  
                                                                                
LRM009 3720-SEARCH-FOR-MULTI-CMS-RTN.                                   CAT788  
LRM009*** AT THIS POINT, WE HAVE MORE THAN ONE SECURITY ON THIS XFER            
LRM009*** THAT MATCHES THE ISIN.  TRY FOR MATCH ON QY WITH PEND CODE            
LRM009*** NOT USED (WE DID NOT ALLOC THIS ROW TO TLE YET).                      
TEST       DISPLAY '3720- LOOKING FOR BETTER MATCH '                            
TEST           'QTY=' WS-TOT-ASSET-QTY-DEC                              CAT788  
LRM009     MOVE WS-TOT-ASSET-QTY-DEC TO ASSET-QTY OF DCLVASSET.         CAT788  
LRM009     EXEC SQL                                                     CAT788  
LRM009        SELECT                                                    CAT788  
LRM009            CSH_MGN_SHRT_CD                                               
LRM009           ,ASSET_SEQ_NBR                                         CAT788  
LRM009        INTO                                                      CAT788  
LRM009            :DCLVASSET.CSH-MGN-SHRT-CD                            CAT788  
LRM009           ,:DCLVASSET.ASSET-SEQ-NBR                              CAT788  
LRM009        FROM                                                      CAT788  
LRM009            VASSET                                                CAT788  
LRM009        WHERE                                                     CAT788  
LRM009            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM009            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM009            AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
LRM009            AND ASSET_QTY         = :DCLVASSET.ASSET-QTY          CAT788  
LRM009            AND NOT NSCC_PEND_CD  = 'T'                                   
LRM009        WITH UR                                                   CAT788  
LRM009     END-EXEC.                                                    CAT788  
LRM009                                                                  CAT788  
LRM009     IF SQLCODE = +0 OR -811                                      CAT788  
LRM009        DISPLAY 'MATCH CMS ACTIVE VIA QTY AND NOT ALLOC '                 
LRM009            WS-CLIENT-NBR  ' '   WS-ACAT-CONTROL-NBR              CAT788  
LRM009                 ' '  ASSET-SEQ-NBR OF DCLVASSET                          
LRM009        MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO                      CAT788  
LRM009             CSH-MGN-SHRT-CD OF DCLVASTHSTY                       CAT788  
LRM009        MOVE ASSET-SEQ-NBR   OF DCLVASSET TO                      CAT788  
LRM009             ASSET-SEQ-NBR   OF DCLVASTHSTY                       CAT788  
LRM009        PERFORM 3250-MARK-VASTHSTY-AS-ALLOC                               
LRM009        MOVE +0 TO SQLCODE                                        CAT788  
LRM009        GO TO 3720-EXIT                                                   
LRM009     ELSE                                                                 
LRM009        DISPLAY 'MATCH CMS #1 ACTIVE NG ' SQLCODE                         
LRM009     END-IF.                                                              
LRM009*** TRY MATCHING WITHOUT THE QTY.                                         
LRM009     EXEC SQL                                                     CAT788  
LRM009        SELECT                                                    CAT788  
LRM009            CSH_MGN_SHRT_CD                                               
LRM009           ,ASSET_SEQ_NBR                                         CAT788  
LRM009        INTO                                                      CAT788  
LRM009            :DCLVASSET.CSH-MGN-SHRT-CD                            CAT788  
LRM009           ,:DCLVASSET.ASSET-SEQ-NBR                              CAT788  
LRM009        FROM                                                      CAT788  
LRM009            VASSET                                                CAT788  
LRM009        WHERE                                                     CAT788  
LRM009            CLIENT_NBR            = :WS-CLIENT-NBR                CAT788  
LRM009            AND ACAT_CONTROL_NBR  = :WS-ACAT-CONTROL-NBR          CAT788  
LRM009            AND ISIN_SEC_ISSUE_CD = :WS-CUSIP-NBR                 CAT788  
LRM009            AND NOT NSCC_PEND_CD  = 'T'                                   
LRM009        WITH UR                                                   CAT788  
LRM009     END-EXEC.                                                    CAT788  
LRM009                                                                  CAT788  
LRM009     IF SQLCODE = +0 OR -811                                      CAT788  
LRM009        DISPLAY 'MATCH CMS ACTIVE VIA NOT ALLOC '                         
LRM009            WS-CLIENT-NBR  ' '   WS-ACAT-CONTROL-NBR              CAT788  
LRM009                 ' '  ASSET-SEQ-NBR OF DCLVASSET                          
LRM009        MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO                      CAT788  
LRM009             CSH-MGN-SHRT-CD OF DCLVASTHSTY                       CAT788  
LRM009        MOVE ASSET-SEQ-NBR   OF DCLVASSET TO                      CAT788  
LRM009             ASSET-SEQ-NBR   OF DCLVASTHSTY                       CAT788  
LRM009        PERFORM 3250-MARK-VASTHSTY-AS-ALLOC                               
LRM009        MOVE +0 TO SQLCODE                                        CAT788  
LRM009        GO TO 3720-EXIT                                                   
LRM009     ELSE                                                                 
LRM009        DISPLAY 'MATCH CMS #2 ACTIVE NG ' SQLCODE                         
LRM009     END-IF.                                                              
LRM009                                                                          
LRM009     MOVE +0 TO SQLCODE.                                          CAT788  
LRM009 3720-EXIT. EXIT.                                                 CAT788  
       EJECT                                                            CAT788  
LRM002 4000-FETCH-AT-RECORDS.                                                   
LRM002                                                                          
LRM002       EXEC SQL                                                           
LRM002          OPEN NSCC_AT1_CRSR                                              
LRM002       END-EXEC                                                           
LRM002                                                                          
LRM002     IF SQLCODE NOT = +0                                                  
LRM002        MOVE 4200 TO ABEND-CODE                                           
LRM002        PERFORM 8000-SQL-ERROR-ROUTINE                                    
LRM002     END-IF                                                               
LRM002                                                                          
LRM002     PERFORM UNTIL SQLCODE NOT = +0                                       
LRM002           EXEC SQL                                                       
LRM002              FETCH NSCC_AT1_CRSR                                         
LRM002                INTO                                                      
LRM002                :DCLVASTHSTY.CLIENT-NBR                                   
LRM002               ,:DCLVASTHSTY.ACAT-CONTROL-NBR                             
LRM002               ,:DCLVASTHSTY.ASSET-SEQ-NBR                                
LRM002               ,:DCLVASTHSTY.TRANS-TYPE-CD                                
LRM002               ,:DCLVASTHSTY.SBMTG-PRTCP-NBR                              
LRM002               ,:DCLVASTHSTY.TRANS-RFRN-ID-CD                             
LRM002               ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                            
LRM002               ,:DCLVASTHSTY.OPTN-CTGY-CD                                 
LRM002               ,:DCLVASTHSTY.STTLM-LCTN-CD                                
LRM002               ,:DCLVASTHSTY.STTLM-RSN-CD                                 
LRM002               ,:DCLVASTHSTY.ISIN-CNTRY-CD                                
LRM002               ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                            
LRM002               ,:DCLVASTHSTY.ISIN-SEC-CDG-CD                              
LRM002               ,:DCLVASTHSTY.ASSET-DESC-TXT                               
LRM002               ,:DCLVASTHSTY.ASSET-RQST-QTY-CD                            
LRM002               ,:DCLVASTHSTY.AST-RQST-TRANS-CD                            
LRM002               ,:DCLVASTHSTY.ASSET-QTY                                    
LRM002               ,:DCLVASTHSTY.ASSET-PCT                                    
LRM002               ,:DCLVASTHSTY.PSTN-CD                                      
LRM002               ,:DCLVASTHSTY.ISO-CRNCY-CD                                 
LRM002               ,:DCLVASTHSTY.ASSET-AMT                                    
LRM002               ,:DCLVASTHSTY.ASSET-AMT-STTS-CD                            
LRM002               ,:DCLVASTHSTY.BEARER-BOND-CD                               
LRM002               ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                              
LRM002               ,:DCLVASTHSTY.WHI-CD                                       
LRM002               ,:DCLVASTHSTY.TRNFR-TYPE-RSN-CD                            
LRM002               ,:DCLVASTHSTY.MBS-SERIAL-NBR                               
LRM002               ,:DCLVASTHSTY.ASSET-CMNT-TXT                               
LRM002               ,:DCLVASTHSTY.NSCC-PEND-CD                                 
LRM002               ,:DCLVASTHSTY.SECURITY-ADP-NBR                             
LRM002               ,:DCLVASTHSTY.CAGE-TAG-NBR                                 
LRM002               ,:DCLVASTHSTY.SCRTY-866-NBR                                
LRM002               ,:DCLVASTHSTY.ASSET-866-QTY                                
LRM002               ,:DCLVASTHSTY.ASSET-PRC-CTGY-CD                            
LRM002            END-EXEC                                                      
LRM002                                                                          
LRM002        EVALUATE SQLCODE                                                  
LRM002           WHEN +100                                                      
LRM002             CONTINUE                                                     
LRM002           WHEN +0                                                        
LRM002             PERFORM 4100-WRITE-AT-RECORD                                 
LRM002             MOVE ZERO TO SQLCODE                                         
LRM002        END-EVALUATE                                                      
LRM002     END-PERFORM.                                                         
LRM002                                                                          
LRM002     IF SQLCODE NOT = +100                                                
LRM002        MOVE 4400 TO ABEND-CODE                                           
LRM002        PERFORM 8000-SQL-ERROR-ROUTINE                                    
LRM002     END-IF                                                               
LRM002                                                                          
LRM002     EXEC SQL                                                             
LRM002        CLOSE NSCC_AT1_CRSR                                               
LRM002     END-EXEC                                                             
LRM002                                                                          
LRM002     IF SQLCODE NOT = +0                                                  
LRM002        MOVE 4500 TO ABEND-CODE                                           
LRM002        PERFORM 8000-SQL-ERROR-ROUTINE                                    
LRM002     END-IF.                                                              
LRM002 EJECT                                                            CAT788  
LRM002 4100-WRITE-AT-RECORD.                                                    
LRM002     MOVE SPACES TO TAXM-RECORD.                                  ACATTAXM
LRM002     MOVE CLIENT-NBR OF DCLVASTHSTY (2 : 3)                       ACATTAXM
LRM002                                    TO TAXM-ADP-CL-NO             ACATTAXM
LRM002     MOVE SECURITY-ADP-NBR OF DCLVASTHSTY                                 
LRM002                                    TO TAXM-ADP-NBR               ACATTAXM
LRM002     MOVE WS-PROC-DATE              TO TAXM-SETTL-DATE.           ACATTAXM
LRM002     SET TAXM-RECEIVE TO TRUE.                                            
LRM002     SET TAXM-ASSET-OUTPUT TO TRUE                                ACATTAXM
LRM002     SET TAXM-RECORD-O-LENGTH TO TRUE                             ACATTAXM
LRM002     MOVE 'R' TO TAXM-DSTBN-SIDE-CD                               ACATTAXM
LRM002     MOVE SBMTG-PRTCP-NBR OF DCLVTRNHSTY TO TAXM-SUBMITTING-BRKR  ACATTAXM
LRM002     MOVE TRNFR-TYPE-CD OF DCLVTRNHSTY TO TAXM-TRNFR-TYPE         ACATTAXM
LRM002     SET TAXM-ASSET-OUTPUT-TYPE TO TRUE                           ACATTAXM
LRM002     MOVE ACAT-CONTROL-NBR OF DCLVTRNHSTY                         ACATTAXM
LRM002                                        TO TAXM-AO-ACAT-CNTL-NBR  ACATTAXM
LRM002     MOVE RCV-NBR OF DCLVTRNHSTY        TO TAXM-AO-DLVR-NBR       ACATTAXM
LRM002     MOVE DLVR-NBR OF DCLVTRNHSTY       TO TAXM-AO-RCV-NBR        ACATTAXM
LRM002     MOVE ACCT-RCV-NBR OF DCLVTRNHSTY   TO TAXM-AO-ACCT-DLVR-NBR  ACATTAXM
LRM002     MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY  TO TAXM-AO-ACCT-RCV-NBR   ACATTAXM
LRM002     MOVE ISIN-CNTRY-CD OF DCLVASTHSTY  TO TAXM-AO-ISIN-CNTRY-CD  ACATTAXM
LRM002     MOVE ISIN-SEC-ISSUE-CD OF DCLVASTHSTY TO TAXM-AO-CUSIP-NUM   ACATTAXM
LRM002     MOVE ISIN-SEC-CDG-CD OF DCLVASTHSTY TO TAXM-AO-ISIN-SEC-CDG  ACATTAXM
LRM002     IF STTLM-RSN-CD OF DCLVASTHSTY = 'OPT'                               
LRM002        PERFORM  4150-READ-OPT-ASSET-TBL                          CAT788  
LRM002           THRU  4150-EXIT                                                
LRM002        IF SQLCODE = +0  OR  -811                                 CAT788  
LRM002            MOVE SYM-CD OF DCLVOPTHSTY TO TAXM-AO-OPTION-SYMBOL           
LRM005****        IF PARM-STREAM = 'Q'                                  CAT788  
LRM004               MOVE EXPTN-DT OF DCLVOPTHSTY (1 : 4) TO                    
LRM004                              TAXM-AO-OPT-EXP-DATE-NEW (1 : 4)            
LRM004               MOVE EXPTN-DT OF DCLVOPTHSTY (6 : 2) TO                    
LRM004                              TAXM-AO-OPT-EXP-DATE-NEW (5 : 2)            
LRM004               MOVE EXPTN-DT OF DCLVOPTHSTY (9 : 2) TO                    
LRM004                              TAXM-AO-OPT-EXP-DATE-NEW (7 : 2)            
LRM004               MOVE STPRC-INTEGER-AMT OF DCLVOPTHSTY                      
LRM004                                TO TAXM-AO-STPRC-INTEGER-AMT-NEW          
LRM004               MOVE STPRC-FRCTN-AMT   OF DCLVOPTHSTY                      
LRM004                                TO TAXM-AO-STPRC-FRCTN-AMT-NEW            
LRM004****        ELSE                                                          
LRM002****           MOVE EXPTN-DT OF DCLVOPTHSTY (6 : 2) TO                    
LRM002****                          TAXM-AO-OPT-EXP-DATE (1 : 2)                
LRM002****           MOVE EXPTN-DT OF DCLVOPTHSTY (9 : 2) TO                    
LRM002****                          TAXM-AO-OPT-EXP-DATE (3 : 2)                
LRM002****           MOVE EXPTN-DT OF DCLVOPTHSTY (3 : 2) TO                    
LRM002****                          TAXM-AO-OPT-EXP-DATE (1 : 2)                
LRM002****           MOVE STPRC-INTEGER-AMT OF DCLVOPTHSTY                      
LRM002****                               TO TAXM-AO-STPRC-INTEGER-AMT           
LRM002****           MOVE STPRC-FRCTN-AMT   OF DCLVOPTHSTY                      
LRM002****                               TO TAXM-AO-STPRC-FRCTN-AMT             
LRM004****        END-IF                                                        
LRM002            MOVE PTCL-CD OF DCLVOPTHSTY TO TAXM-AO-OPT-PUT-CALL           
LRM002        END-IF                                                            
LRM002     END-IF.                                                              
LRM005**** IF PARM-STREAM = 'Q'                                         CAT788  
LRM004        MOVE ASSET-DESC-TXT OF DCLVASTHSTY TO                             
LRM004                                   TAXM-AO-SEC-DESC-NEW                   
LRM004        MOVE ASSET-PRC-CTGY-CD OF DCLVASTHSTY TO                          
LRM004                                   TAXM-AO-ASSET-PRC-CTGY-CD-NEW          
LRM004**** ELSE                                                                 
LRM002****    MOVE ASSET-DESC-TXT OF DCLVASTHSTY TO                             
LRM002****                               TAXM-AO-SEC-DESC                       
LRM002****    MOVE ASSET-PRC-CTGY-CD OF DCLVASTHSTY TO                          
LRM002****                               TAXM-AO-ASSET-PRC-CTGY-CD              
LRM004**** END-IF.                                                              
LRM002     MOVE ASSET-QTY OF DCLVASTHSTY TO W-QTY-N                             
LRM002     MOVE W-QTY-INT (2 : 12) TO TAXM-AO-TOT-ASSET-QTY (1 : 12)            
LRM002     MOVE ','                TO TAXM-AO-TOT-ASSET-QTY (13 : 1)            
LRM002     MOVE W-QTY-DEC          TO TAXM-AO-TOT-ASSET-QTY (14 : 4)            
LRM002     MOVE PSTN-CD OF DCLVASTHSTY    TO TAXM-AO-PSTN-CD                    
LRM002     MOVE CSH-MGN-SHRT-CD OF DCLVASTHSTY TO TAXM-AO-CASH-MGN-IND          
LRM002     MOVE ISO-CRNCY-CD OF DCLVASTHSTY  TO TAXM-AO-ISO-CURRENCY            
LRM002     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNHSTY                               
LRM002                                       TO TAXM-RCL-ORIG-CNTL-NBR          
LRM002     MOVE CLIENT-NBR OF DCLVTRNHSTY       TO WS-CLIENT-NBR                
LRM002     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNHSTY TO WS-ACAT-CONTROL-NBR        
LRM002     MOVE ISIN-SEC-ISSUE-CD  OF DCLVASTHSTY TO WS-CUSIP-NBR               
LRM002     PERFORM  3200-READ-HISTORY-ASSET-TBL                         CAT788  
LRM002     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM002       MOVE ASSET-SEQ-NBR OF DCLVASTHSTY TO WS-ASSET-SEQ-NBR-9            
LRM002       MOVE WS-ASSET-SEQ-NBR            TO TAXM-RCL-ORIG-SEQ-NBR          
LRM002     ELSE                                                                 
LRM002       MOVE ZEROS                         TO TAXM-RCL-ORIG-SEQ-NBR        
LRM002     END-IF.                                                              
LRM002     MOVE ASSET-QTY OF DCLVASTHSTY  TO TAXM-ASSET-QTY-DEC                 
LRM002     MOVE ZEROS TO TAXM-ASSET-PRICE-DEC                                   
LRM002                   TAXM-ASSET-ORIG-COST-DEC                               
LRM002     WRITE  TAXM-RECORD                                                   
LRM002     ADD 1 TO W-OUTFILE-CNT                                               
LRM002              W-RCL-REC-CNTR.                                             
LRM002*                                                                         
LRM002 4150-READ-OPT-ASSET-TBL.                                                 
LRM002     EXEC SQL                                                             
LRM002        SELECT                                                            
LRM002            SYM_CD                                                        
LRM002           ,PTCL_CD                                               CAT788  
LRM002           ,STPRC_INTEGER_AMT                                             
LRM002           ,STPRC_FRCTN_AMT                                               
LRM002           ,EXPTN_DT                                                      
LRM002        INTO                                                      CAT788  
LRM002            :DCLVOPTHSTY.SYM-CD                                   CAT788  
LRM002           ,:DCLVOPTHSTY.PTCL-CD                                  CAT788  
LRM002           ,:DCLVOPTHSTY.STPRC-INTEGER-AMT                        CAT788  
LRM002           ,:DCLVOPTHSTY.STPRC-FRCTN-AMT                          CAT788  
LRM002           ,:DCLVOPTHSTY.EXPTN-DT                                 CAT788  
LRM002        FROM                                                      CAT788  
LRM002            VOPTHSTY                                              CAT788  
LRM002        WHERE                                                     CAT788  
LRM002            CLIENT_NBR            = :DCLVTRNHSTY.CLIENT-NBR       CAT788  
LRM002            AND ACAT_CONTROL_NBR  = :DCLVTRNHSTY.ACAT-CONTROL-NBR CAT788  
LRM002            AND ASSET_SEQ_NBR     = :DCLVASTHSTY.ASSET-SEQ-NBR    CAT788  
LRM002        WITH UR                                                   CAT788  
LRM002     END-EXEC.                                                    CAT788  
LRM002                                                                  CAT788  
LRM002     IF SQLCODE = +0  OR  -811                                    CAT788  
LRM002        CONTINUE                                                  CAT788  
LRM002     ELSE                                                         CAT788  
LRM002     IF SQLCODE = +100                                            CAT788  
LRM006***     MOVE SPACE  TO WS-ADP-SEC-NBR                             CAT788  
LRM002            DISPLAY 'CAT788: *** WARNING - '                      CAT788  
LRM002                    'OPTION SEGMENT NOT FOUND FOR RCL ***'        CAT788  
LRM002            DISPLAY '          CLIENT=' CLIENT-NBR OF DCLVTRNHSTY CAT788  
LRM002                    ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY       CAT788  
LRM002                    ' SEQ NBR=' ASSET-SEQ-NBR OF DCLVASTHSTY      CAT788  
LRM002     ELSE                                                         CAT788  
LRM002            MOVE +4150     TO ABEND-CODE                          CAT788  
LRM002            MOVE SQLCODE   TO W-DB2-SQLCODE                       CAT788  
LRM002            DISPLAY '** CAT788: ABENDED ON BAD DB2 STATUS ON '    CAT788  
LRM002                    'SELECT VOPTHSTY TABLE VIA SEQ NBR **'        CAT788  
LRM002            DISPLAY '           SQLCODE=' W-DB2-SQLCODE           CAT788  
LRM002            DISPLAY '          CLIENT=' CLIENT-NBR OF DCLVTRNHSTY CAT788  
LRM002                    ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY       CAT788  
LRM002                    ' SEQ NBR=' ASSET-SEQ-NBR OF DCLVASTHSTY      CAT788  
LRM002            PERFORM 8000-SQL-ERROR-ROUTINE                        CAT788  
LRM002     END-IF.                                                      CAT788  
LRM002                                                                  CAT788  
LRM002 4150-EXIT. EXIT.                                                 CAT788  
      /                                                                         
       6000-READ-INFILE.                                                CAT788  
           READ INFILE                                                  CAT788  
                AT END                                                  CAT788  
                   SET END-OF-INFILE TO TRUE                            CAT788  
                NOT AT END                                              CAT788  
                   ADD  1   TO W-INFILE-CNT                             CAT788  
           END-READ.                                                    CAT788  
                                                                        CAT788  
       8000-SQL-ERROR-ROUTINE.                                          CAT788  
                                                                        CAT788  
           CALL DSNTIAR       USING  SQLCA                              CAT788  
                                     WS-DB2-MESSAGE-AREA                CAT788  
                                     WS-ERR-LINE-LEN.                   CAT788  
                                                                        CAT788  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT788  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT788  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT788  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT788  
                 END-IF                                                 CAT788  
           END-PERFORM.                                                 CAT788  
                                                                        CAT788  
           PERFORM 9000-ABORT-RTN.                                      CAT788  
      *                                                                 CAT788  
       9000-ABORT-RTN.                                                  CAT788  
           CALL ABEND USING ABEND-CODE.                                 CAT788  
      *#################################################################CAT788  
                                                                                
       6700-GETMSDC         SECTION.                                            
           MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA                
           MOVE NSCC-AO-CUSIP-NUM    TO GETMSD-SEARCH-KEY                       
TEST       DISPLAY 'ABOUT TO CALL MMSD WITH CUSIP ' GETMSD-SEARCH-KEY           
           MOVE 'N' TO W-ACTIAST-ADP-SW                                         
           IF  NSCC-AO-CUSIP-NUM   = ' '                                        
               ADD 1 TO W-BLANK-SEC-CNT                                         
TEST           DISPLAY 'CUSIP BLANK ON REC# ' W-INFILE-CNT                      
               IF NSCC-AO-SEC-DESC-NEW (121:8) = 'ADP-SEC:'                     
                   MOVE 'Y' TO W-ACTIAST-ADP-SW                                 
                   MOVE NSCC-AO-SEC-DESC-NEW (129:7)                            
                                         TO WS-ADP-SEC-NBR                      
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' NSCC-AO-SEC-DESC-NEW '                          
                              ' ADP-SEC= ' WS-ADP-SEC-NBR                       
                            ' ' NSCC-AO-SEC-DESC-NEW (1:30)                     
               END-IF                                                           
               GO TO 6700-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF W-ACTIAST-ADP-SW = 'N'  AND                                       
           (NSCC-AO-ASSET-PRC-CTGY-CD-NEW = 'CORP' OR 'MUNI' OR 'ZERO')         
               PERFORM 6800-BONDS      THRU 6800-EXIT                           
               GO TO 6700-EXIT                                                  
           END-IF                                                               
                                                                                
LRM006***       NSCC-AO-WHN-ISS-IND  NOT AVAILABLE                              
DJ0020     MOVE '0'               TO GETMSD-WI-CODE                             
DJ0018     MOVE WS-CLIENT-NBR(2:3) TO W-CLIENT-X                                
DJ0018     MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2                     
                                                                                
LRM016     IF  NSCC-AO-ISIN-CNTRY-CD > SPACES                                   
LRM016     AND NSCC-AO-ISIN-CNTRY-CD NOT = 'US'                                 
LRM016        PERFORM 6704-RECEIVER-ISIN THRU 6704-EXIT                         
LRM016     END-IF.                                                              
                                                                                
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT.                        
           IF  GETMSD-RETURN-VALID                                              
               PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
           END-IF.                                                              
       6700-EXIT. EXIT.                                                         
      /                                                                         
DJ0020 6703-USE-ISIN-FOR-GETMSD SECTION.                                        
DJ0020*WHEN CUSIP NOT FOUND, TRY ISIN NUMBER                                    
DJ0020                                                                          
DJ0020***USE ALL THREE ISIN FIELDS FROM SIAC TO LOOK UP MSD                     
DJ0020     MOVE NSCC-AO-ISIN-CNTRY-CD     TO GETMSD-SEARCH-KEY(1:2)             
DJ0020     MOVE NSCC-AO-CUSIP-NUM         TO GETMSD-SEARCH-KEY(3:9)             
DJ0020     MOVE NSCC-AO-ISIN-SEC-CDG      TO GETMSD-SEARCH-KEY(12:1)            
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                         
DJ0020     IF  GETMSD-RETURN-VALID                                              
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020               ' 6703-USE-ISIN        '                                   
DJ0020            '"' GETMSD-SEARCH-KEY '"' ' FOUND'                            
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' WS-CLIENT-NBR                                     
DJ0020                    ' ' NSCC-AO-ACAT-CNTL-NBR                             
DJ0020*                   ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' ISIN FOUND'                                                 
DJ0020           ' ISN='  NSCC-AO-ISIN-CNTRY-CD                                 
DJ0020                    NSCC-AO-CUSIP-NUM                                     
DJ0020                    NSCC-AO-ISIN-SEC-CDG                                  
DJ0020            ' CT=' NSCC-AO-ASSET-PRC-CTGY-CD-NEW                          
DJ0020*           ' SL=' NSCC-OT-STL-LOC                                        
DJ0020*           ' RS=' NSCC-OT-STL-LOC-RSN-CD                                 
DJ0020*           ' WH=' NSCC-OT-WHN-ISS-IND                                    
DJ0020*           ' BD=' NSCC-OT-BEARER-BOND                                    
DJ0020*           ' OP=' NSCC-OT-OPT-CATG                                       
DJ0020*           ' CU=' NSCC-OT-ISO-CURCY-CD                                   
DJ0020*        DISPLAY '    ' 'DESC=' NSCC-AO-SEC-DESC-NEW (1:110)              
DJ0020*        DISPLAY '    ' NSCC-AO-SEC-DESC-NEW (111:30) '<='                
DJ0022*        DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020     ELSE                                                                 
DJ0020       IF  NSCC-AO-SEC-DESC-NEW (114:15) = 'SUBMITTER ISIN:'              
DJ0020       AND NSCC-AO-SEC-DESC-NEW (138:1) > ' '                             
DJ0020       AND NSCC-AO-SEC-DESC-NEW (139:1) > ' '                             
DJ0020         PERFORM 6705-SUBMITTER-ISIN THRU 6705-EXIT                       
DJ0020       ELSE                                                               
DJ0020         PERFORM 6720-MSD-NOTFND THRU 6720-EXIT                           
DJ0020       END-IF                                                             
DJ0020     END-IF.                                                              
DJ0020                                                                          
DJ0020 6703-EXIT. EXIT.                                                         
      /                                                                         
LRM016 6704-RECEIVER-ISIN  SECTION.                                             
LRM016*---------------------------------------------------------------          
LRM016* FIRST CALL MSISINB WITH ISIN AND COUNTRY FOR MATCH.  IF FOUND           
LRM016* USE THE ADP NUMBER RETURNED, OTHER LOOKUP THE OLD WAY.                  
LRM016*---------------------------------------------------------------          
TEST       DISPLAY  'USING 6704- NEW RTN'                                       
LRM016     MOVE 'G' TO MSISIN-ACTION                                            
LRM016     MOVE NSCC-AO-ISIN-CNTRY-CD  TO MSISIN-ISIN-NBR(1:2)                  
LRM016                                    MSISIN-COUNTRY                        
LRM016     MOVE NSCC-AO-CUSIP-NUM      TO MSISIN-ISIN-NBR(3:9)                  
LRM016     MOVE NSCC-AO-ISIN-SEC-CDG   TO MSISIN-ISIN-NBR(12:1)                 
LRM016     DISPLAY '6704- CALLING MSISINB WITH ' MSISIN-ISIN-NBR                
LRM016                                       ' ' MSISIN-COUNTRY                 
LRM016     CALL MSISINB                                                         
LRM016         USING MSISIN-COMMAREA.                                           
LRM016     IF MSISIN-RETURN-CODE NOT = SPACES                                   
LRM016        DISPLAY 'MSISIN RET-CODE ' MSISIN-RETURN-CODE                     
LRM017        PERFORM 6703-USE-ISIN-FOR-GETMSD THRU 6703-EXIT                   
LRM016     ELSE                                                                 
LRM016        DISPLAY  'MSISIN-ADP-NO ' MSISIN-ADP-NO                           
LRM016        MOVE MSISIN-ADP-NO               TO GETMSD-SEARCH-KEY             
LRM016     END-IF.                                                              
LRM016 6704-EXIT. EXIT.                                                         
      /                                                                         
DJ0020 6705-SUBMITTER-ISIN  SECTION.                                            
DJ0020* USE "SUBMITTER-ISIN:" IN THE ASSET DESCRIPTION FIELD                    
DJ0020                                                                          
DJ0020* USE "SUBMITTER-ISIN:" 12 BYTES                                          
DJ0020     MOVE NSCC-AO-SEC-DESC-NEW (129:12) TO GETMSD-SEARCH-KEY              
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                         
DJ0020     IF  GETMSD-RETURN-VALID                                              
LRM028         MOVE 'I' TO NSCC-NON-ADP-IND   OF DCLVASSET                      
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN12'                             
DJ0020          '"' NSCC-AO-SEC-DESC-NEW (114:27) '"' ' FOUND'                  
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' WS-CLIENT-NBR                                     
DJ0020                    ' ' NSCC-AO-ACAT-CNTL-NBR                             
DJ0020*                   ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBM-FND-1'                                                 
DJ0020           ' ISN='  NSCC-AO-ISIN-CNTRY-CD                                 
DJ0020                    NSCC-AO-CUSIP-NUM                                     
DJ0020                    NSCC-AO-ISIN-SEC-CDG                                  
DJ0020            ' CT=' NSCC-AO-ASSET-PRC-CTGY-CD-NEW                          
DJ0020*           ' SL=' NSCC-OT-STL-LOC                                        
DJ0020*           ' RS=' NSCC-OT-STL-LOC-RSN-CD                                 
DJ0020*           ' WH=' NSCC-OT-WHN-ISS-IND                                    
DJ0020*           ' BD=' NSCC-OT-BEARER-BOND                                    
DJ0020*           ' OP=' NSCC-OT-OPT-CATG                                       
DJ0020*           ' CU=' NSCC-OT-ISO-CURCY-CD                                   
DJ0020*        DISPLAY '    ' 'DESC=' NSCC-AO-SEC-DESC-NEW (1:110)              
DJ0020*        DISPLAY '    ' NSCC-AO-SEC-DESC-NEW (111:30) '<='                
DJ0022         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0020     ELSE                                                                 
DJ0020***----USE "SUBMITTER-ISIN:" 9 BYTES                                      
DJ0020       MOVE ' '                         TO GETMSD-SEARCH-KEY              
DJ0020       MOVE NSCC-AO-SEC-DESC-NEW (131:9)                                  
DJ0020                                        TO GETMSD-SEARCH-KEY(1:9)         
DJ0023       PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                       
DJ0020       IF  GETMSD-RETURN-VALID                                            
LRM028         MOVE '9' TO NSCC-NON-ADP-IND   OF DCLVASSET                      
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN9 '                             
DJ0020          '"' NSCC-AO-SEC-DESC-NEW (114:27) '"' ' FOUND'                  
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' WS-CLIENT-NBR                                     
DJ0020                    ' ' NSCC-AO-ACAT-CNTL-NBR                             
DJ0020*                   ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBM-FND-9'                                                 
DJ0020           ' ISN='  NSCC-AO-ISIN-CNTRY-CD                                 
DJ0020                    NSCC-AO-CUSIP-NUM                                     
DJ0020                    NSCC-AO-ISIN-SEC-CDG                                  
DJ0020            ' CT=' NSCC-AO-ASSET-PRC-CTGY-CD-NEW                          
DJ0020*           ' SL=' NSCC-OT-STL-LOC                                        
DJ0020*           ' RS=' NSCC-OT-STL-LOC-RSN-CD                                 
DJ0020*           ' WH=' NSCC-OT-WHN-ISS-IND                                    
DJ0020*           ' BD=' NSCC-OT-BEARER-BOND                                    
DJ0020*           ' OP=' NSCC-OT-OPT-CATG                                       
DJ0020*           ' CU=' NSCC-OT-ISO-CURCY-CD                                   
DJ0020*        DISPLAY '    ' 'DESC=' NSCC-AO-SEC-DESC-NEW (1:110)              
DJ0020*        DISPLAY '    ' NSCC-AO-SEC-DESC-NEW (111:30) '<='                
DJ0022         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0020       ELSE                                                               
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN  '                             
DJ0020          '"' NSCC-AO-SEC-DESC-NEW (114:27) '"' ' NOT FOUND'              
DJ0020         PERFORM 6720-MSD-NOTFND THRU 6720-EXIT                           
DJ0020       END-IF                                                             
DJ0020     END-IF.                                                              
DJ0020                                                                          
DJ0020 6705-EXIT. EXIT.                                                         
      /                                                                         
       6710-MSD-FOUND       SECTION.                                            
                                                                                
           ADD 1 TO W-MSD-FND-CNT                                               
                                                                                
           MOVE 'N'           TO W-MSD-NOTFND-SW                                
           MOVE MS-ADP-NO     TO WS-ADP-SEC-NBR.                                
                                                                                
       6710-EXIT. EXIT.                                                         
      /                                                                         
       6720-MSD-NOTFND      SECTION.                                            
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           MOVE ' '         TO WS-ADP-SEC-NBR.                                  
       6720-EXIT. EXIT.                                                         
      /                                                                         
       6800-BONDS.                                                              
                                                                                
DJ0022***---IGNORE WHEN ISSUE INDICATOR FOR BONDS, USE REGULAR                  
            MOVE '0'               TO GETXRF-WI-CODE                            
            MOVE NSCC-AO-CUSIP-NUM TO W-GETXRF-KEY-9                            
TEST        DISPLAY 'IN 6800-BOND CUSIP =' NSCC-AO-CUSIP-NUM                    
LRM006******IF  NSCC-OT-BEARER-BOND = 'B'                                       
LRM006**********PERFORM 6810-BEARER-BOND THRU 6810-EXIT                         
LRM006******ELSE                                                                
            IF  NSCC-AO-ASSET-PRC-CTGY-CD-NEW = 'MUNI'                          
                PERFORM 6820-MUNI-BOND THRU 6820-EXIT                           
            ELSE                                                                
                PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT                     
            END-IF.                                                             
                                                                                
LRM006     IF WS-ADP-SEC-NBR > SPACES                                           
DJ0020         CONTINUE                                                         
DJ0020     ELSE                                                                 
DJ0020       IF NSCC-AO-SEC-DESC-NEW (114:15) = 'SUBMITTER ISIN:'               
DJ0023       AND NSCC-AO-SEC-DESC-NEW (138:1) > ' '                             
DJ0023       AND NSCC-AO-SEC-DESC-NEW (139:1) > ' '                             
DJ0020          MOVE NSCC-AO-SEC-DESC-NEW (131:9) TO W-GETXRF-KEY-9             
LRM006**********IF  NSCC-OT-BEARER-BOND = 'B'                                   
LRM006**************PERFORM 6810-BEARER-BOND THRU 6810-EXIT                     
LRM006**********ELSE                                                            
DJ0020              IF  NSCC-AO-ASSET-PRC-CTGY-CD-NEW = 'MUNI'                  
DJ0020                  PERFORM 6820-MUNI-BOND THRU 6820-EXIT                   
DJ0020              ELSE                                                        
DJ0020                  PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT             
DJ0020              END-IF                                                      
LRM006**********END-IF                                                          
DJ0020          IF  GETXRF-RETURN-VALID                                         
DJ0020          AND GETMSD-RETURN-VALID                                         
LRM028            MOVE 'B' TO NSCC-NON-ADP-IND   OF DCLVASSET                   
DJ0020            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0020                    ' ' NSCC-AO-ACAT-CNTL-NBR                             
DJ0020*                   ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBB-FND-9'                                                 
DJ0020            ' ISN=' NSCC-AO-ISIN-CNTRY-CD                                 
DJ0020                    NSCC-AO-CUSIP-NUM                                     
DJ0020                    NSCC-AO-ISIN-SEC-CDG                                  
DJ0020            ' CT=' NSCC-AO-ASSET-PRC-CTGY-CD-NEW                          
DJ0020*           ' SL=' NSCC-OT-STL-LOC                                        
DJ0020*           ' RS=' NSCC-OT-STL-LOC-RSN-CD                                 
DJ0020*           ' WH=' NSCC-OT-WHN-ISS-IND                                    
DJ0020*           ' OP=' NSCC-OT-OPT-CATG                                       
DJ0020*           ' CU=' NSCC-OT-ISO-CURCY-CD                                   
DJ0020*           DISPLAY '    DESC=' NSCC-AO-SEC-DESC-NEW (1:110)              
DJ0020*           DISPLAY '    ' NSCC-AO-SEC-DESC-NEW (111:30) '<='             
DJ0022            DISPLAY '    ADP=' MS-ADP-NO                                  
DJ0022                     ' ' MS-DESC1 MS-DESC2 MS-DESC3                       
DJ0020          END-IF                                                          
DJ0020       END-IF                                                             
DJ0020     END-IF                                                               
                                                                                
LRM006     IF WS-ADP-SEC-NBR > SPACES                                           
              CONTINUE                                                          
           ELSE                                                                 
DJ0023***----IF ALL ELSE FAIL, TRY JUST 9 BYTE CUSIP                            
DJ0023       IF W-GETXRF-KEY-9 > ' '                                            
DJ0023       AND W-GETXRF-KEY-9(8:1) > ' '                                      
DJ0023       AND W-GETXRF-KEY-9(9:1) > ' '                                      
DJ0023         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0023         ' ' NSCC-AO-ACAT-CNTL-NBR                                        
DJ0023*         W-ASSET-SEQ-NBR                                                 
DJ0023         ' USE 9 BYTES FOR BOND: ' W-GETXRF-KEY-9                         
LRM006*********'-' NSCC-OT-SEC-ID '-' NSCC-AO-SEC-DESC-NEW(131:9) '-'           
DJ0023         MOVE W-GETXRF-KEY-9   TO GETMSD-SEARCH-KEY                       
DJ0023         PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                     
DJ0023         IF  GETMSD-RETURN-VALID                                          
LRM028             MOVE '9' TO NSCC-NON-ADP-IND   OF DCLVASSET                  
                   MOVE MS-ADP-NO     TO WS-ADP-SEC-NBR                         
DJ0023         ELSE                                                             
DJ0023             PERFORM 6805-BOND-NOT-FOUND THRU 6805-EXIT                   
DJ0023         END-IF                                                           
DJ0023       ELSE                                                               
DJ0023             PERFORM 6805-BOND-NOT-FOUND THRU 6805-EXIT                   
DJ0023       END-IF                                                             
           END-IF.                                                              
                                                                                
       6800-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
DJ0023 6803-BOND-FOUND.                                                         
           ADD 1 TO W-MSD-FND-CNT                                               
           ADD 1 TO W-BOND-FND-CNT                                              
           MOVE 'N'           TO W-MSD-NOTFND-SW                                
           MOVE MS-ADP-NO     TO WS-ADP-SEC-NBR.                                
                                                                                
DJ0023 6803-EXIT. EXIT.                                                         
      /                                                                         
DJ0023 6805-BOND-NOT-FOUND.                                                     
                                                                                
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           ADD 1 TO W-BOND-NOTFND-CNT                                           
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET                  
           MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET                  
           DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0020                ' ' NSCC-AO-ACAT-CNTL-NBR                                 
DJ0020*               ' ' W-ASSET-SEQ-NBR                                       
DJ0020                  ' BOND-NOTFD'                                           
DJ0020            ' ISN=' NSCC-AO-ISIN-CNTRY-CD                                 
DJ0020                    NSCC-AO-CUSIP-NUM                                     
DJ0020                    NSCC-AO-ISIN-SEC-CDG                                  
DJ0020             ' CT=' NSCC-AO-ASSET-PRC-CTGY-CD-NEW.                        
DJ0020*            ' SL=' NSCC-OT-STL-LOC                                       
DJ0020*            ' RS=' NSCC-OT-STL-LOC-RSN-CD                                
DJ0020*            ' WH=' NSCC-OT-WHN-ISS-IND                                   
DJ0020*            ' OP=' NSCC-OT-OPT-CATG                                      
DJ0020*            ' CU=' NSCC-OT-ISO-CURCY-CD                                  
DJ0020*    DISPLAY '    ' 'DESC=' NSCC-AO-SEC-DESC-NEW (1:110)                  
DJ0020*    DISPLAY '    ' NSCC-AO-SEC-DESC-NEW (111:30) '<='.                   
                                                                                
DJ0023 6805-EXIT. EXIT.                                                         
      /                                                                         
       6810-BEARER-BOND.                                                        
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
       6810-EXIT. EXIT.                                                         
      /                                                                         
       6820-MUNI-BOND.                                                          
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
TEST       DISPLAY 'IN 6820-MUNI GETXREF-KEY-9=' W-GETXRF-KEY-9                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
       6820-EXIT. EXIT.                                                         
      /                                                                         
       6830-REGISTERED-BOND.                                                    
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
       6830-EXIT. EXIT.                                                         
      /                                                                         
                                                                                
       6940-GETXREF.                                                            
                                                                                
           MOVE ' '          TO GETMSD-RETURN-CODE                              
           MOVE ' '          TO GETXRF-RETURN-CODE                              
           CALL GETXREF   USING GETXRF-CALLING-INFO.                            
LRM008     DISPLAY 'AFTER    CALL GETXRF ' GETXRF-CALLING-INFO                  
           EVALUATE TRUE                                                        
               WHEN  GETXRF-RETURN-VALID                                        
                   MOVE MSXREF-ADP-NO     TO WS-ADP-SEC-NBR                     
                   DISPLAY 'IN GETXREF ADP FND ' MSXREF-ADP-NO                  
               WHEN  GETXRF-RETURN-EOF                                          
                 OR  GETXRF-INVALID-SYMBOL-CUSIP                                
                 OR  GETXRF-RETURN-REC-NOT-FOUND                                
                 OR  GETXRF-REQ-KEY-SECURITY-NO                                 
                   CONTINUE                                                     
                                                                                
               WHEN  GETXRF-RETURN-IO-ERROR                                     
                     DISPLAY ' CAT788: CALL ZGETXRF ERROR'                      
                             ' GETXRF-RETURN-CODE='                             
                               GETXRF-RETURN-CODE                               
                     MOVE +3701    TO ABEND-CD                                  
                     CALL ABEND USING ABEND-CD                                  
               WHEN  OTHER                                                      
                   CONTINUE                                                     
           END-EVALUATE.                                                        
                                                                                
       6940-EXIT. EXIT.                                                         
      /                                                                         
LRM029 6950-GETADPNO-OPTION.                                                    
LRM029                                                                          
LRM029     IF  NSCC-AO-SEC-DESC-NEW (121:8)  = 'ADP-SEC:'                       
LRM029        MOVE NSCC-AO-SEC-DESC-NEW (129:7) TO WS-ADP-SEC-NBR               
              GO TO 6950-EXIT.                                                  
           MOVE NSCC-AO-OPT-EXP-DATE-NEW(1:2) TO W-DATE-CC                      
           MOVE NSCC-AO-OPT-EXP-DATE-NEW(3:2) TO W-DATE-YY                      
           MOVE NSCC-AO-OPT-EXP-DATE-NEW(5:2) TO W-DATE-MM                      
           MOVE NSCC-AO-OPT-EXP-DATE-NEW(7:2) TO W-DATE-DD                      
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-CC             < '00')                                   
           OR  (W-DATE-CC             > '99')                                   
           OR  (W-DATE-YY             < '00')                                   
           OR  (W-DATE-YY             > '99')                                   
           OR  NSCC-AO-OPT-EXP-DATE-NEW NOT NUMERIC                             
                DISPLAY 'INP='                                                  
                        ' OPT-EXP-DT(MMYYCC) IS INVALID: '                      
                                            NSCC-AO-OPT-EXP-DATE-NEW            
                        '  DEFAULT TO 0001-01-01.'                              
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF.                                                              
                                                                                
LRM029     INITIALIZE GETADP-COMMAREA                                           
LRM029     MOVE  ZEROS                       TO GETADP-CLIENT-NBR               
LRM029     MOVE  NSCC-AO-OPTION-SYMBOL     TO GETADP-OPTION-UNDSEC              
LRM029     MOVE  W-DATE-MM                 TO GETADP-OPTION-MONTH               
LRM029     MOVE  W-DATE-DD                 TO GETADP-OPTION-DAY                 
LRM029     MOVE  W-DATE-YY                 TO GETADP-OPTION-YR                  
LRM006***** NO BUT/SELL AVAILABLE; USE POSTN CD                                 
LRM006*****DISPLAY 'B/S= ' NSCC-ATO-OPT-BS-IND                                  
LRM032******      ' OPEN/CLOSE ' FMT-OPEN-CLOSE                                 
LRM032*****IF (NSCC-ATO-OPT-BS-IND = 'B' AND FMT-OPEN)                          
LRM032*****OR (NSCC-ATO-OPT-BS-IND = 'S' AND FMT-CLOSE)                         
LRM006     IF NSCC-AO-PSTN-CD = 'S'                                             
LRM029        MOVE 'S'           TO GETADP-OPTION-LS                            
LRM029     ELSE                                                                 
LRM032*****IF (NSCC-ATO-OPT-BS-IND = 'S' AND FMT-OPEN)                          
LRM032*****OR (NSCC-ATO-OPT-BS-IND = 'B' AND FMT-CLOSE)                         
LRM029        MOVE 'L'           TO GETADP-OPTION-LS                            
LRM029     END-IF.                                                              
LRM029     MOVE  NSCC-AO-OPT-PUT-CALL      TO GETADP-OPTION-PC                  
LRM029     IF  NSCC-AO-STPRC-INTEGER-AMT-NEW NUMERIC                            
LRM029     AND NSCC-AO-STPRC-FRCTN-AMT-NEW NUMERIC                              
LRM029        MOVE NSCC-AO-STPRC-INTEGER-AMT-NEW                                
LRM029                                      TO GETADP-OPTION-STRIKE(1:5)        
LRM029        MOVE NSCC-AO-STPRC-FRCTN-AMT-NEW                                  
LRM029                                      TO GETADP-OPTION-STRIKE(6:3)        
LRM029     ELSE                                                                 
LRM029        MOVE ZERO TO GETADP-OPTION-STRIKE                                 
LRM029     END-IF.                                                              
LRM029                                                                          
TEST       DISPLAY 'CALLING GETADPNO WITH ' GETADP-COMMAREA.                    
LRM029     CALL GETADPNO USING GETADP-COMMAREA.                                 
LRM029                                                                          
LRM029     EVALUATE GETADP-RET-CODE                                             
LRM029        WHEN SPACES                                                       
LRM029             DISPLAY '   FND ' GETADP-ADP-NBR                             
LRM029             MOVE 'XX'           TO FMT-CUSIP-NO (1:2)                    
LRM029             MOVE GETADP-ADP-NBR TO GETMSD-SEARCH-KEY                     
LRM029                                    FMT-CUSIP-NO (3:7)                    
LRM029                                    FMT-ADP-SEC-NO                        
LRM029                                    WS-ADP-SEC-NBR                        
LRM029             MOVE '0'            TO GETMSD-WI-CODE                        
LRM029             MOVE WS-CLIENT-NBR(2:3) TO W-CLIENT-X                        
LRM029             MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2             
LRM029             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 
LRM029             IF GETMSD-RETURN-VALID                                       
LRM029                MOVE SPACES TO MS-CUSIP-NO                                
LRM029                               MSD-ISIN                                   
LRM029                MOVE MS-DESC1            TO FMT-DESC1                     
LRM029                MOVE MS-DESC2            TO FMT-DESC2                     
LRM029                MOVE MS-DESC3            TO FMT-DESC3                     
LRM029                DISPLAY '  3GETMSD RETURN:'                               
LRM029                                           ' ' FMT-SEC-SYMBOL             
LRM029                                           ' ' FMT-ADP-SEC-NO             
LRM029                                           ' ' FMT-CUSIP-NO               
LRM029                                           ' ' FMT-DESC1                  
LRM029                                           ' ' FMT-DESC2                  
LRM029             END-IF                                                       
LRM029        WHEN 'N'                                                          
LRM029             DISPLAY '   GETADP NOT FOUND'                                
LRM029        WHEN 'D'                                                          
LRM029             DISPLAY '**** PROGRAM CAT788'                                
LRM029             DISPLAY '**** CALL GETADPNO PROBLEM  ****'                   
LRM029             DISPLAY '**** IN  6950-GETADPNO                 '            
LRM029             MOVE GETADP-SQLCA TO SQLCA                                   
LRM029             MOVE SQLCODE      TO W-DB2-SQLCODE                           
LRM029             DISPLAY 'GETADP SQLCODE ' W-DB2-SQLCODE                      
LRM029             DISPLAY 'GETADP-SQLCA ' GETADP-SQLCA                         
LRM029             MOVE 6950 TO ABEND-CD                                        
LRM029             CALL ABEND USING ABEND-CD                                    
LRM029     END-EVALUATE.                                                        
LRM029                                                                          
LRM029 6950-EXIT. EXIT.                                                         
      /                                                                         
DJ0023 6970-CALL-GETMSDC           SECTION.                                     
DJ0023                                                                          
DJ0023     CALL GETMSDC USING MASTER-SECURITY-RECORD.                           
DJ0023                                                                          
DJ0023 6970-EXIT. EXIT.                                                         
      /                                                                         
