000001* PDX    - CAT660P  C0367472 06/09/15 11:19:55 TBLAMUR            00001000
000001* LRM025 SSR 103577 PASS BNWTRAN FOR CLIENTS 237 - B STREAM AND           
000001*  327 N STREAM ONLY, IN THE SAME MANNER AS CLIENT 313 HAS.               
000001*  SCHEDULE CHANGE WILL MOVE JOB CAT6602* EARLIER, AT 5PM.                
000001* PDX    - CAT660P  C0353098 04/16/14 08:49:04 TBLAMUR            00001000
000001* LRM024 SSR 94111 PASS N/A GEO CODE ON BNWTRAN.                          
000001* PDX    - CAT660P  C0351863 02/19/14 11:16:57 TBLAMUR            00001000
000001* LRM023 PDR 100081 DST/SCHWAB PASS IRA-IND = Y ON BWNTRAN WHEN           
000001*   KEOUGH > SPACE.                                                       
000001* PDX    - CAT660P  C0351345 02/06/14 08:39:17 TBLAMUR            00001000
000001* LRM022 SSR 85742 DST/SCHWAB DO NOT PASS ORIG ACCT NBR.                  
000001* PDX    - CAT660P  C0348198 11/14/13 13:42:53 TBLAMUR            00001000
000001* LRM021 98054 SOC7 FIX NAPPA-STK-WH-TAX-N = SPACES, DUE TO N/A           
000001*   NOT FOUND.  DEFAULT THE RATE TO ZERO.                                 
000001* PDX    - CAT660P  C0344128 09/16/13 09:27:54 TBLAMUR            00001000
000001* LRM020 SSR 94296 RECOMPILE FOR EXPANDED BNWTRANW AND CHANGE FD,         
000001*    ALSO NEW COPYBOOK VERSION FOR NTWIOREC, POPULATE NEW FIELD           
000001*    NRA-TAX-RATE-EXP ON BNWTRAN WITH OLD RATE TIMES 100.                 
000001* PDX    - CAT660P  C0338980 03/21/13 11:19:34 TBLAMUR            00001000
000001*LRM019 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                            
000001* ADD COPY NNASGRPA FOR PRIVATE-FLD #7, TO MATCH TO 537646,               
000001* TO CAUSE WRAP = 5 ON BNWTRAN.                                           
000001* PDX    - CAT660P  C0326762 05/22/12 09:12:45 TBLAMUR            00001000
000001* LRM011 SSR 84199 RECOMPILE TO PICKUP NEW COPYLIB BNWTAXWW               
000001* PDX    - CAT660P  C0310990 04/27/11 09:10:28 TBLAMUR            00001000
000001* LRM010 SSR 76863 RECOMPILE TO PICKUP NEW COPYLIB BNWTAXWW               
000001* PDX    - CAT660P  C0297710 06/11/10 23:50:04 TBLAMUR            00001000
000001* PDX    - CAT660P  C0297705 06/11/10 22:16:02 TBYOHON            00001000
000001* PDX    - CAT660P  C0297701 06/11/10 20:27:04 TBYOHON            00001000
000001* PDX    - CAT660P  C0294520 04/05/10 14:51:14 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT660  
       PROGRAM-ID.  CAT660P.                                            CAT660  
       AUTHOR.      LARRY MUREY.                                        CAT660  
       DATE-WRITTEN.  MARCH 2010.                                       CAT660  
      *---------------------------------------------------------------*         
      *  THE PURPOSE OF THIS PROGRAM IS TO EXTRACT ADDITIONAL BNWTRAN   CAT660  
      *  RECORDS FOR MFRS ON THE DAY THE F/R WAS SENT TO NSCC FOR A     CAT660  
      *  PNC FUND.  THIS FILE WILL BE MERGED WITH CAT660.BNWTRAN.       CAT660  
      *  THE ACATPEND (SHADOW POST VERSION HAS EVERY ASSET) IS READ             
      *  AND RECEIVER SIDE FUNDS ARE CONSIDERED FOR EXTRACT.                    
      *  B1 435739 VALUES 1,2 CAUSE EXTRACT.  THE 5 CAT501 NSCC EXTRACTS        
      *  ARE READ AND THE CONTROL, SEQ NUMBER TABLED FOR MATCH TO THE           
      *  SHADOW ACATPEND DATA.  IF THE ASSET WAS DELETED INTRA-DAY,             
      *  OR THE TRANSFER IS REJECTED, THEN IT IS BYPASSED.                      
      *  THE PROGRAM WAS COPIED/CONVERTED FROM CAT660 WITH PNC CHANGES          
      *  FROM PDX 292845 VERSION 3/23/10.                                       
      *---------------------------------------------------------------*         
      ***************************************************************** CAT660  
       ENVIRONMENT DIVISION.                                            CAT660  
      ***************************************************************** CAT660  
      ***************************************************************** CAT660  
       INPUT-OUTPUT SECTION.                                            CAT660  
       FILE-CONTROL.                                                    CAT660  
                                                                        CAT660  
           SELECT IPEND-FILE            ASSIGN  TO  IPEND               CAT660  
                                        FILE STATUS IS WS-FILE-STATUS.  CAT660  
                                                                                
           SELECT NSCC-IN-FILE          ASSIGN  TO  NSCCIN.                     
                                                                        CAT660  
           SELECT IREG-FILE             ASSIGN  TO  IREG                CAT660  
                                        ORGANIZATION IS INDEXED         CAT660  
                                        ACCESS MODE IS RANDOM           CAT660  
                                        RECORD KEY IS REG-OPT-KEY-AREA  CAT660  
                                        FILE STATUS IS WS-FILE-STATUS.  CAT660  
                                                                        CAT660  
           SELECT RRMA-FILE             ASSIGN  TO  RRMA                CAT660  
                                        ORGANIZATION IS INDEXED         CAT660  
                                        ACCESS MODE IS RANDOM           CAT660  
                                        RECORD KEY IS RRMA-KEY          CAT660  
                                        FILE STATUS IS WS-FILE-STATUS.  CAT660  
                                                                        CAT660  
           SELECT BNWTRAN-FILE          ASSIGN  TO  BNWTRANO            CAT660  
                                        FILE STATUS IS WS-FILE-STATUS.  CAT660  
                                                                        CAT660  
      ***************************************************************** CAT660  
       DATA DIVISION.                                                   CAT660  
      ***************************************************************** CAT660  
                                                                        CAT660  
       FILE SECTION.                                                    CAT660  
                                                                        CAT660  
       FD  IPEND-FILE                                                   CAT660  
           RECORDING MODE IS V                                          CAT660  
           BLOCK CONTAINS 0 RECORDS.                                    CAT660  
       COPY ACATPEND  REPLACING ==:FMT:== BY ==IPEND==.                 CAT660  
                                                                        CAT660  
       FD  NSCC-IN-FILE                                                         
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 2991 CHARACTERS                  
              DEPENDING ON WS-REC-LEN-IN                                        
           DATA RECORDS ARE NSCC-HEADER-TRAILER                                 
           NSCC-TI-REC                                                          
           NSCC-AT-REC NSCC-AT-OPTN-REC NSCC-AT-MF-REC                          
           NSCC-FR-0-PYBL-REC  NSCC-FR-1-PYBL-REC NSCC-FR-2-PYBL-REC            
           NSCC-FR-3-PYBL-REC  NSCC-FR-4-PYBL-REC NSCC-FR-5-PYBL-REC            
           NSCC-FR-6-PYBL-REC                                                   
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  NSCC-HEADER-TRAILER                    PIC  X(080).                  
                                                                                
       01  NSCC-TI-REC                            PIC  X(356).                  
       01  NSCC-AT-REC                            PIC  X(431).                  
       01  NSCC-AT-MF-REC.                                                      
           05  NSCC-AT-BASIC2                     PIC  X(431).                  
           05  NSCC-AT-MF                         PIC  X(119).                  
       01  NSCC-FR-6-PYBL-REC.                                                  
           05  NSCC-FR-BASIC6                     PIC  X(759).                  
           05  NSCC-FR-PYBL-6 OCCURS 6 TIMES      PIC  X(372).                  
       01  NSCC-REC                               PIC X(2291).                  
                                                                                
       FD  IREG-FILE                                                    CAT660  
           BLOCK CONTAINS 0 RECORDS.                                    CAT660  
       01  IREG-RECORD.                                                 CAT660  
       COPY BNWREGOP.                                                   CAT660  
                                                                        CAT660  
       FD  RRMA-FILE                                                    CAT660  
           BLOCK CONTAINS 0 RECORDS.                                    CAT660  
       COPY MFRRMAST.                                                   CAT660  
                                                                        CAT660  
       FD  BNWTRAN-FILE                                                 CAT660  
           RECORDING MODE IS F                                          CAT660  
           BLOCK CONTAINS 0 RECORDS.                                    CAT660  
LRM020 01  BNWTRAN-RECORD               PIC X(1160).                    CAT660  
           EJECT                                                        CAT660  
                                                                        CAT660  
           EJECT                                                        CAT660  
      ******************************************************************CAT660  
       WORKING-STORAGE SECTION.                                         CAT660  
      ******************************************************************CAT660  
                                                                        CAT660  
       01  WS-REC-LEN-IN        PIC 9(05) VALUE ZERO.                           
       01  WORK-AREA.                                                   CAT660  
           05  WS-EOF-IND                  PIC X(01) VALUE SPACE.       CAT660  
               88  END-OF-FILE-IPEND                 VALUE 'Y'.         CAT660  
           05  WS-EOF-NSCC-FILE            PIC X(01) VALUE SPACE.       CAT660  
               88  NSCC-INFILE-EOF                   VALUE 'Y'.         CAT660  
           05  WS-DATE.                                                 CAT660  
               10  WS-DATE-YEAR            PIC X(04).                   CAT660  
               10  FILLER                  PIC X(01) VALUE '-'.         CAT660  
               10  WS-DATE-MM              PIC X(02).                   CAT660  
               10  FILLER                  PIC X(01) VALUE '-'.         CAT660  
               10  WS-DATE-DD              PIC X(02).                   CAT660  
           05  WS-FNDSRVS-FLAG             PIC X(01) VALUE 'N'.         CAT660  
               88  FNDSRVS-FND                       VALUE 'Y'.         CAT660  
           05  WS-FNDRGST-FLAG             PIC X(01) VALUE 'N'.         CAT660  
               88  FNDRGST-FND                       VALUE 'Y'.         CAT660  
           05  WS-VASSET-FLAG              PIC X(01) VALUE 'N'.         CAT660  
               88  VASSET-FOUND                      VALUE 'Y'.         CAT660  
               88  VASSET-NOTFND                     VALUE 'N'.         CAT660  
JPC004     05  WS-MF-FLAG                  PIC X(01) VALUE 'N'.         CAT660  
JPC004         88  MF-FND                            VALUE 'Y'.         CAT660  
           05  WS-PROC-DATE-CCYYMMDD.                                   CAT660  
               10  WS-PROC-CCYYMMDD-CC     PIC X(02).                   CAT660  
               10  WS-PROC-CCYYMMDD-YY     PIC X(02).                   CAT660  
               10  WS-PROC-CCYYMMDD-MM     PIC X(02).                   CAT660  
               10  WS-PROC-CCYYMMDD-DD     PIC X(02).                   CAT660  
           05  WS-PROC-DATE-MMDDYY.                                     CAT660  
               10  WS-PROC-MMDDYY-MM       PIC X(02).                   CAT660  
               10  WS-PROC-MMDDYY-DD       PIC X(02).                   CAT660  
               10  WS-PROC-MMDDYY-YY       PIC X(02).                   CAT660  
TR0001     05  WS-DTSEARCH-DATE-CCYYMMDD.                               CAT660  
TR0001         10  WS-DTSEARCH-DATE-CC     PIC X(02).                   CAT660  
TR0001         10  WS-DTSERACH-DATE-YY     PIC X(02).                   CAT660  
TR0001         10  WS-DTSEARCH-DATE-MM     PIC X(02).                   CAT660  
TR0001         10  WS-DTSEARCH-DATE-DD     PIC X(02).                   CAT660  
           05  WS-FILE-STATUS              PIC X(02).                   CAT660  
               88  WS-FILE-STATUS-OK       VALUE '00' '04' '10'         CAT660  
                                                 '23' '97'.             CAT660  
           05  WS-CKDIGIT-PARM.                                         CAT660  
               10  WS-CKDIG-ACCT-ID.                                    CAT660  
                   15  WS-CKDIG-BRCH       PIC 9(03) VALUE ZEROES.      CAT660  
                   15  WS-CKDIG-ACCT       PIC 9(05) VALUE ZEROES.      CAT660  
                   15  WS-CKDIG-ACCT-TYPE  PIC 9(01) VALUE ZEROES.      CAT660  
                   15  WS-CKDIG-CHCK-DGIT  PIC 9(01) VALUE ZEROES.      CAT660  
               10  WS-CKDIG-NO-OF-DIGIT    PIC 9(02) VALUE 9.           CAT660  
           05  WS-IREG-RECORD-IND          PIC X(01) VALUE 'N'.         CAT660  
               88  WS-IREG-RECORD-FOUND              VALUE 'Y'.         CAT660  
           05  DIV-CG-TABLE-VALUES.                                     CAT660  
               10  FILLER                  PIC X(03) VALUE 'CCC'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'RRR'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'CCR'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'CRR'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'CRC'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'RCC'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'RRC'.       CAT660  
               10  FILLER                  PIC X(03) VALUE 'RCR'.       CAT660  
           05  FILLER REDEFINES DIV-CG-TABLE-VALUES.                    CAT660  
               10  DIV-CG-TABLE OCCURS 8 TIMES INDEXED BY DIV-CG-INDX.  CAT660  
                   15  DIV-CODE            PIC X(01).                   CAT660  
                   15  LTCG-CODE           PIC X(01).                   CAT660  
                   15  STCG-CODE           PIC X(01).                   CAT660  
           05  DIV-CG-CNTR                 PIC 9(01) VALUE 0.           CAT660  
           05  WS-CNTR-IPEND               PIC S9(08) COMP VALUE 0.     CAT660  
           05  WS-CNTR-NSCCIN              PIC S9(08) COMP VALUE 0.     CAT660  
           05  WS-CNTR-IREG-NOTFND         PIC S9(08) COMP VALUE 0.     CAT660  
           05  WS-CNTR-BNWTRAN             PIC S9(08) COMP VALUE 0.     CAT660  
           05  WS-LINE-FBO.                                             CAT660  
               10  FILLER                  PIC X(04)    VALUE 'FBO '.   CAT660  
               10  WS-LINE.                                             CAT660  
                   15  WS-LINE-BRANCH      PIC X(03).                   CAT660  
                   15  FILLER              PIC X(01)    VALUE '-'.      CAT660  
                   15  WS-LINE-ACCT        PIC X(05).                   CAT660  
                   15  FILLER              PIC X(01)    VALUE '-'.      CAT660  
                   15  WS-LINE-ACCT-TYPE   PIC X(01).                   CAT660  
                   15  WS-LINE-CHCK-DGIT   PIC X(01).                   CAT660  
           05  WS-NAME-LINE-INDICATOR      PIC 9(01)    VALUE 0.        CAT660  
           05  WS-PREV-CLIENT              PIC 999      VALUE 0.        CAT660  
           05  WS-PREV-TRAN-KEY            PIC X(47)    VALUE SPACES.   CAT660  
           05  WS-CL-NO.                                                CAT660  
               10  WS-CL-NO-NUM            PIC 9(04).                   CAT660  
           05  WS-BRANCH-FND-IN-EXEC-BKR-TBL    PIC X(01) VALUE 'N'.    CAT660  
               88  BRANCH-NOT-FND-IN-EXEC-BKR-TBL         VALUE 'N'.    CAT660  
               88  BRANCH-FND-IN-EXEC-BKR-TBL             VALUE 'Y'.    CAT660  
           05  WS-DONE-LOOKING-SW          PIC X(01)      VALUE 'N'.    CAT660  
               88  WS-NOT-DONE-LOOKING                    VALUE 'N'.    CAT660  
               88  WS-DONE-LOOKING                        VALUE 'Y'.    CAT660  
           05  WS-SUB                      PIC 9(03)  VALUE ZERO.       CAT660  
           05  WS-NA                       PIC S9(04) USAGE COMP.       CAT660  
           05  WS-NA-DONE-IND              PIC X(01)  VALUE SPACE.      CAT660  
               88  WS-NA-DONE                         VALUE 'Y'.        CAT660  
           05  C-BNW59CTY                  PIC X(08)  VALUE 'BNW59CTY'. CAT660  
           05  WS-RRNAME-LOOKUP-KEY.                                    CAT660  
               10  WS-RRNAME-LOOKUP-CLIENT   PIC 9(03) VALUE ZEROES.    CAT660  
               10  WS-RRNAME-LOOKUP-BR4.                                CAT660  
                   15  WS-RRNAME-LOOKUP-BR1  PIC 9(01) VALUE ZEROES.    CAT660  
                   15  WS-RRNAME-LOOKUP-BR3  PIC 9(03) VALUE ZEROES.    CAT660  
               10  WS-RRNAME-LOOKUP-RR-NO    PIC X(03) VALUE SPACES.    CAT660  
           05  WS-RRNAME-LOOKUP-RR-NAME      PIC X(15) VALUE SPACES.    CAT660  
           05  WS-PREV-RRNAME-LOOKUP-KEY     PIC X(10) VALUE SPACES.    CAT660  
           05  WS-PREV-RRMA-KEY              PIC X(11) VALUE SPACES.    CAT660  
           05  FILE-STAT-RRMA           PIC X(02)      VALUE '00'.      CAT660  
               88  VALID-FILE-STAT-RRMA VALUE '00' '23' '97'.           CAT660  
           05  RCRD-IND-RRMA            PIC X(01)      VALUE SPACE.     CAT660  
               88  RCRD-FOUND-RRMA      VALUE '1'.                      CAT660  
           05  RCRD-IND-STAT            PIC X(01)      VALUE SPACE.     CAT660  
               88  RCRD-FOUND-STAT      VALUE '1'.                      CAT660  
           05  SAVE-CLIENT-NO           PIC 9(03)      VALUE ZEROES.    CAT660  
           05  SAVE-CUSIP-9             PIC X(09)      VALUE SPACES.    CAT660  
LRM002     05  LENGTH-KEY               PIC 99         VALUE 9.         CAT660  
           05  SUB                      PIC S9(4) COMP VALUE ZERO.              
           05  WS-FR-SENT-COUNT         PIC S9(4) COMP VALUE ZERO.              
LRM019     05  NTW-SHWB-ACCT-FLAG       PIC X(01)  VALUE SPACES.                
LRM019         88  NTW-SHWB-ACCT                       VALUE 'Y'.               
LRM019         88  NTW-NOT-SHWB-ACCT                   VALUE 'N'.               
LRM019     05  NTW-WAIVE-ACCT-FLAG      PIC X(01)  VALUE SPACES.                
LRM019         88  NTW-WAIVE-ACCT                      VALUE 'Y'.               
LRM019         88  NTW-NOT-WAIVE-ACCT                  VALUE 'N'.               
                                                                        CAT660  
       01  WS-FR-SENT-TABLE.                                                    
           05  WS-FR-SENT-ENTRY OCCURS      5000 TIMES.                         
               07  WS-FR-SENT-CNTL-NBR    PIC X(14).                            
               07  WS-FR-SENT-ASSET-SEQ   PIC 9(04).                            
       EJECT                                                                    
       COPY NSCCDTI.                                                            
                                                                                
       EJECT                                                                    
       COPY NSCCDAT.                                                            
                                                                                
       EJECT                                                                    
       COPY NSCCDFR.                                                            
                                                                                
       EJECT                                                                    
       COPY NSCCDTRL.                                                           
                                                                        CAT660  
                                                                        CAT660  
       COPY BHINFO.                                                     CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BHMF.                                                       CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BHMF3.                                                      CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BHMF4.                                                      CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BHACAT.                                                     CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BPDATESC.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY RECDATZC.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY GETMSDCE.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY GETNACOB.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       01  GETNA-SEGMENT-INCLUDES.                                      CAT660  
       COPY NASEGPPA.                                                   CAT660  
LRM019 COPY NNASGRPA.                                                           
       COPY NASEGPPB.                                                   CAT660  
       COPY NASEGIP.                                                    CAT660  
       COPY NASEGEND.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       01  BNWTRAN-REC.                                                 CAT660  
       COPY BNWTRANW.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       01  BNW59CTY-PARM-INFO.                                          CAT660  
       COPY BNW59CTY.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BNWTAXWW.                                                   CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       COPY BSKPARM.                                                    CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
DJ0003 COPY BSKREC01 REPLACING ==:BSK-ST:== BY ==BSK-ST==.              CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
       01  WS-DB2-MESSAGE-AREA.                                         CAT660  
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    CAT660  
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     CAT660  
               INDEXED BY WS-ERROR-INDEX.                               CAT660  
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     CAT660  
DJ0001 01  W-DB2-SQLCODE                 PIC  ---9.                     CAT660  
                                                                        CAT660  
      /                                                                 CAT660  
      ***--->COBOL LE                                                   CAT660  
       01  W-ABEND-AREA.                                                CAT660  
           03  ABEND-CD                  PIC S9(04) COMP.               CAT660  
                                                                        CAT660  
           COPY STUBCPY.                                                CAT660  
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT660  
           03  GETSTRGN                  PIC X(008) VALUE 'GETSTRGN'.   CAT660  
           03  CKDIGIT                   PIC X(008) VALUE 'CKDIGIT '.   CAT660  
LRM003     03  BMFSEC                    PIC X(008) VALUE 'BMFSEC  '.   CAT660  
LRM002     03  BNWNTWIO                  PIC X(008) VALUE 'BNWNTWIO'.   CAT660  
      ***<---COBOL LE                                                   CAT660  
                                                                        CAT660  
       EJECT                                                            CAT660  
                                                                        CAT660  
      **************************                                        CAT660  
      * DB2 COMMUNICATION AREA *                                        CAT660  
      **************************                                        CAT660  
           EXEC SQL                                                     CAT660  
              INCLUDE SQLCA                                             CAT660  
           END-EXEC.                                                    CAT660  
           EJECT                                                        CAT660  
                                                                        CAT660  
           EXEC SQL                                                     CAT660  
              INCLUDE VTRNFR                                            CAT660  
           END-EXEC.                                                    CAT660  
                                                                                
           EXEC SQL                                                     CAT660  
              INCLUDE VASSET                                            CAT660  
           END-EXEC.                                                    CAT660  
                                                                                
           EXEC SQL                                                     CAT660  
              INCLUDE VFNDRGST                                          CAT660  
           END-EXEC.                                                    CAT660  
                                                                        CAT660  
           EXEC SQL                                                     CAT660  
              INCLUDE VFNDNA                                            CAT660  
           END-EXEC.                                                    CAT660  
           EJECT                                                        CAT660  
LRM003 01  BMFSECIO-CALLING-AREA.                                       CAT660  
LRM003     COPY BMFSECIO.                                               CAT660  
           SKIP3                                                        CAT660  
LRM003 01  MF-MSD-REC.                                                  CAT660  
LRM003     COPY MFMSDREC.                                               CAT660  
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.            CAT660  
           EJECT                                                        CAT660  
                                                                        CAT660  
      ******************************************************************CAT660  
       LINKAGE SECTION.                                                 CAT660  
      ******************************************************************CAT660  
       01  PARM-AREA.                                                   CAT660  
           05  PARM-LENGTH              PIC S9(04) COMP.                CAT660  
LRM019     05  PARM-STREAM              PIC X(01).                      CAT660  
           05  PARM-INFO.                                               CAT660  
               10  PARM-BYPDATE         PIC X(01).                      CAT660  
                   88  BYPASS-DATE-CHK  VALUE '1'.                      CAT660  
                                                                        CAT660  
           EJECT                                                        CAT660  
      ***************************************************************** CAT660  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT660  
      ***************************************************************** CAT660  
           DISPLAY 'CAT660P - ACATS PNC ADDITIONAL FUND EXTRACT'.       CAT660  
           DISPLAY ' '.                                                 CAT660  
                                                                        CAT660  
           COPY MSGCOBO.                                                CAT660  
                                                                        CAT660  
           PERFORM 8000-INITIALIZE.                                     CAT660  
LRM019     IF PARM-STREAM = 'F' OR 'Q'                                  CAT660  
LRM019        MOVE 006 TO WS-PREV-CLIENT                                        
LRM019     ELSE                                                         CAT660  
LRM025     IF PARM-STREAM = 'B'                                         CAT660  
LRM025        MOVE 237 TO WS-PREV-CLIENT                                        
LRM025     ELSE                                                         CAT660  
LRM025     IF PARM-STREAM = 'N'                                         CAT660  
LRM025        MOVE 327 TO WS-PREV-CLIENT                                        
LRM025     ELSE                                                         CAT660  
LRM019        MOVE 313 TO WS-PREV-CLIENT                                        
LRM019     END-IF.                                                              
           PERFORM 6300-GETB1.                                          CAT660  
           IF BH-ACAT-ACTIVE                                                    
           AND (BH-ACAT-MFRS-RECEIVE-PNC = '1' OR '2')                          
              CONTINUE                                                          
LRM019     ELSE                                                                 
LRM019     IF PARM-STREAM = 'Q'                                         CAT660  
LRM019        MOVE 313 TO WS-PREV-CLIENT                                        
LRM019        PERFORM 6300-GETB1                                        CAT660  
LRM019     END-IF.                                                              
                                                                                
           IF BH-ACAT-ACTIVE                                                    
           AND (BH-ACAT-MFRS-RECEIVE-PNC = '1' OR '2')                          
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'ACAT B1 434739 NOT ACTIVE - PROCESSING BYPASSED'         
              PERFORM 9000-EOJ                                          CAT660  
              GOBACK                                                            
           END-IF.                                                              
                                                                        CAT660  
           PERFORM 1000-LOAD-PNC-FR-SENT-TABLE THRU 1000-EXIT           CAT660  
                UNTIL NSCC-INFILE-EOF.                                          
           MOVE SUB TO WS-FR-SENT-COUNT                                         
           DISPLAY 'LOADED F/RS INTO TABLE ' WS-FR-SENT-COUNT.                  
           IF SUB = ZERO                                                        
              DISPLAY 'NO FR FOUND FOR PNC FUNDS - PROCESSING BYPASSED'         
              PERFORM 9000-EOJ                                          CAT660  
              GOBACK                                                            
           END-IF.                                                              
                                                                        CAT660  
           PERFORM 6000-READ-IPEND   THRU 6000-EXIT.                    CAT660  
           PERFORM 8100-CHECK-HEADER THRU 8100-EXIT                     CAT660  
           IF  NOT END-OF-FILE-IPEND                                    CAT660  
               PERFORM 6000-READ-IPEND THRU 6000-EXIT                   CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
           PERFORM 2000-PROCESS-IPEND THRU 2000-EXIT                    CAT660  
                   UNTIL END-OF-FILE-IPEND.                             CAT660  
                                                                        CAT660  
           PERFORM 9000-EOJ.                                            CAT660  
                                                                        CAT660  
           GOBACK.                                                      CAT660  
                                                                        CAT660  
           EJECT                                                        CAT660  
       1000-LOAD-PNC-FR-SENT-TABLE.                                     CAT660  
           READ NSCC-IN-FILE                                                    
              AT END                                                            
                SET NSCC-INFILE-EOF TO TRUE                                     
                GO TO 1000-EXIT                                                 
           END-READ.                                                            
           ADD 1 TO WS-CNTR-NSCCIN.                                     CAT660  
           IF NSCC-HEADER-TRAILER(1:3) = 'HDR' OR 'END'                         
              GO TO 1000-EXIT                                                   
           END-IF.                                                              
           IF NSCC-HEADER-TRAILER(1:2) = 'FR'                                   
              MOVE NSCC-REC(1 : WS-REC-LEN-IN) TO NSCCFR-AREA                   
              IF NSCCFR-SUB-PART-NBR = '0235'                                   
              AND NSCCFR-TRANS-TYPE = 'A'                                       
                 MOVE 006 TO SAVE-CLIENT-NO                             CAT660  
                 MOVE 0006 TO CLIENT-NBR OF DCLVTRNFR                           
                 MOVE NSCCFR-SEC-ID TO SAVE-CUSIP-9                             
                 PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT             CAT660  
                 IF PNC-SURPAS-PROCESSING  OF IREG-RECORD               CAT660  
                    PERFORM 1200-READ-ACTIVE-TRANSFER-RTN THRU 1200-EXIT        
                    IF VASSET-FOUND                                             
                       IF SUB < 5000                                            
                          ADD 1 TO SUB                                          
                          MOVE NSCCFR-ACATS-CNTL-NBR                            
                             TO WS-FR-SENT-CNTL-NBR(SUB)                        
                          MOVE NSCCFR-ASSET-SEQ-NBR                             
                              TO WS-FR-SENT-ASSET-SEQ(SUB)                      
                          DISPLAY 'LOADED ' NSCCFR-ACATS-CNTL-NBR               
                                       ' '  NSCCFR-ASSET-SEQ-NBR                
                       ELSE                                                     
                          DISPLAY 'CAT660P TABLE OVERFLOW FR PNC'               
                          MOVE +1000               TO ABEND-CD          CAT660  
                          CALL ABEND            USING ABEND-CD          CAT660  
              END-IF                                                            
           END-IF.                                                              
                                                                                
LRM019     IF NSCC-HEADER-TRAILER(1:2) = 'FR'                                   
LRM019        MOVE NSCC-REC(1 : WS-REC-LEN-IN) TO NSCCFR-AREA                   
LRM019        IF NSCCFR-SUB-PART-NBR = '0701'                                   
LRM019        AND NSCCFR-TRANS-TYPE = 'A'                                       
LRM019           MOVE 313 TO SAVE-CLIENT-NO                             CAT660  
LRM019           MOVE 0313 TO CLIENT-NBR OF DCLVTRNFR                           
LRM019           MOVE NSCCFR-SEC-ID TO SAVE-CUSIP-9                             
LRM019           PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT             CAT660  
LRM019           IF TBL-MNT-SOURCE-SHWB                                 CAT660  
LRM019              PERFORM 1200-READ-ACTIVE-TRANSFER-RTN THRU 1200-EXIT        
LRM019              IF VASSET-FOUND                                             
LRM019                 IF SUB < 5000                                            
LRM019                    ADD 1 TO SUB                                          
LRM019                    MOVE NSCCFR-ACATS-CNTL-NBR                            
LRM019                       TO WS-FR-SENT-CNTL-NBR(SUB)                        
LRM019                    MOVE NSCCFR-ASSET-SEQ-NBR                             
LRM019                        TO WS-FR-SENT-ASSET-SEQ(SUB)                      
LRM019                    DISPLAY 'LOADED ' NSCCFR-ACATS-CNTL-NBR               
LRM019                                 ' '  NSCCFR-ASSET-SEQ-NBR                
LRM019                 ELSE                                                     
LRM019                    DISPLAY 'CAT660P TABLE OVERFLOW FR PNC'               
LRM019                    MOVE +1000               TO ABEND-CD          CAT660  
LRM019                    CALL ABEND            USING ABEND-CD          CAT660  
LRM019        END-IF                                                            
LRM019     END-IF.                                                              
                                                                                
LRM025     IF NSCC-HEADER-TRAILER(1:2) = 'FR'                                   
LRM025        MOVE NSCC-REC(1 : WS-REC-LEN-IN) TO NSCCFR-AREA                   
LRM025        IF NSCCFR-SUB-PART-NBR = '0385'                                   
LRM025        AND NSCCFR-TRANS-TYPE = 'A'                                       
LRM025           MOVE 237 TO SAVE-CLIENT-NO                             CAT660  
LRM025           MOVE 0237 TO CLIENT-NBR OF DCLVTRNFR                           
LRM025           MOVE NSCCFR-SEC-ID TO SAVE-CUSIP-9                             
LRM025           PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT             CAT660  
LRM025           IF TBL-MNT-SOURCE-SHWB                                 CAT660  
LRM025              PERFORM 1200-READ-ACTIVE-TRANSFER-RTN THRU 1200-EXIT        
LRM025              IF VASSET-FOUND                                             
LRM025                 IF SUB < 5000                                            
LRM025                    ADD 1 TO SUB                                          
LRM025                    MOVE NSCCFR-ACATS-CNTL-NBR                            
LRM025                       TO WS-FR-SENT-CNTL-NBR(SUB)                        
LRM025                    MOVE NSCCFR-ASSET-SEQ-NBR                             
LRM025                        TO WS-FR-SENT-ASSET-SEQ(SUB)                      
LRM025                    DISPLAY 'LOADED ' NSCCFR-ACATS-CNTL-NBR               
LRM025                                 ' '  NSCCFR-ASSET-SEQ-NBR                
LRM025                 ELSE                                                     
LRM025                    DISPLAY 'CAT660P TABLE OVERFLOW FR PNC'               
LRM025                    MOVE +1000               TO ABEND-CD          CAT660  
LRM025                    CALL ABEND            USING ABEND-CD          CAT660  
LRM025        END-IF                                                            
LRM025     END-IF.                                                              
                                                                                
LRM025     IF NSCC-HEADER-TRAILER(1:2) = 'FR'                                   
LRM025        MOVE NSCC-REC(1 : WS-REC-LEN-IN) TO NSCCFR-AREA                   
LRM025        IF NSCCFR-SUB-PART-NBR = '0705'                                   
LRM025        AND NSCCFR-TRANS-TYPE = 'A'                                       
LRM025           MOVE 327 TO SAVE-CLIENT-NO                             CAT660  
LRM025           MOVE 0327 TO CLIENT-NBR OF DCLVTRNFR                           
LRM025           MOVE NSCCFR-SEC-ID TO SAVE-CUSIP-9                             
LRM025           PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT             CAT660  
LRM025           IF TBL-MNT-SOURCE-SHWB                                 CAT660  
LRM025              PERFORM 1200-READ-ACTIVE-TRANSFER-RTN THRU 1200-EXIT        
LRM025              IF VASSET-FOUND                                             
LRM025                 IF SUB < 5000                                            
LRM025                    ADD 1 TO SUB                                          
LRM025                    MOVE NSCCFR-ACATS-CNTL-NBR                            
LRM025                       TO WS-FR-SENT-CNTL-NBR(SUB)                        
LRM025                    MOVE NSCCFR-ASSET-SEQ-NBR                             
LRM025                        TO WS-FR-SENT-ASSET-SEQ(SUB)                      
LRM025                    DISPLAY 'LOADED ' NSCCFR-ACATS-CNTL-NBR               
LRM025                                 ' '  NSCCFR-ASSET-SEQ-NBR                
LRM025                 ELSE                                                     
LRM025                    DISPLAY 'CAT660P TABLE OVERFLOW FR PNC'               
LRM025                    MOVE +1000               TO ABEND-CD          CAT660  
LRM025                    CALL ABEND            USING ABEND-CD          CAT660  
LRM025        END-IF                                                            
LRM025     END-IF.                                                              
       1000-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
       1200-READ-ACTIVE-TRANSFER-RTN.                                           
            SET VASSET-NOTFND TO TRUE.                                          
            EXEC SQL SELECT                                                     
                  STTS_CD                                                       
               INTO                                                             
                  :DCLVTRNFR.STTS-CD                                            
                      FROM VTRNFR                                               
                  WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                
                    AND ACAT_CONTROL_NBR = :NSCCFR-ACATS-CNTL-NBR               
            END-EXEC.                                                           
            IF SQLCODE NOT = +0                                                 
            OR (STTS-CD OF DCLVTRNFR NOT = '200' AND '210' AND '220'            
                             AND '230' AND '240' AND '300' AND '310')           
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT660  
               DISPLAY 'FAIL ON VTRNFR READ ' W-DB2-SQLCODE                     
                  ' ' STTS-CD OF DCLVTRNFR                                      
                 ' '   CLIENT-NBR OF DCLVTRNFR                                  
                 ' '   NSCCFR-ACATS-CNTL-NBR                                    
               GO TO 1200-EXIT                                                  
            END-IF.                                                             
                                                                                
            MOVE NSCCFR-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASSET             
            EXEC SQL SELECT                                                     
               CSH_MGN_SHRT_CD                                                  
            INTO                                                                
               :DCLVASSET.CSH-MGN-SHRT-CD                                       
                   FROM VASSET                                                  
               WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                   
                 AND ACAT_CONTROL_NBR = :NSCCFR-ACATS-CNTL-NBR                  
                 AND ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR                
            END-EXEC.                                                           
            IF SQLCODE = +0                                                     
              SET VASSET-FOUND TO TRUE                                          
            ELSE                                                                
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT660  
               DISPLAY 'FAIL ON VASSET READ ' W-DB2-SQLCODE                     
                 ' '   CLIENT-NBR OF DCLVTRNFR                                  
                 ' '   NSCCFR-ACATS-CNTL-NBR                                    
                 ' '   ASSET-SEQ-NBR OF DCLVASSET                               
            END-IF.                                                             
       1200-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
           EJECT                                                        CAT660  
      **********************                                            CAT660  
       2000-PROCESS-IPEND.                                              CAT660  
      **********************                                            CAT660  
                                                                        CAT660  
           IF (IPEND-TI-ADP-CL-NO-X NOT = '006'                                 
LRM025     AND PARM-STREAM = 'F')                                               
LRM019     OR (IPEND-TI-ADP-CL-NO-X NOT = '313'                                 
LRM019     AND PARM-STREAM = 'Y')                                               
LRM025     OR (IPEND-TI-ADP-CL-NO-X NOT = '237'                                 
LRM025     AND PARM-STREAM = 'B')                                               
LRM025     OR (IPEND-TI-ADP-CL-NO-X NOT = '327'                                 
LRM025     AND PARM-STREAM = 'N')                                               
LRM019     OR ((IPEND-TI-ADP-CL-NO-X NOT = '006' AND '313'                      
LRM025                                 AND '237' AND '327')                     
LRM019     AND PARM-STREAM = 'Q')                                               
               CONTINUE                                                         
           ELSE                                                                 
           IF  IPEND-AT-RECORD-ID                                       CAT660  
               IF  IPEND-AT-ADP-CL-NO IS NUMERIC                        CAT660  
               AND IPEND-AT-ADP-CL-NO = WS-PREV-CLIENT                  CAT660  
                   CONTINUE                                             CAT660  
               ELSE                                                     CAT660  
                   MOVE IPEND-AT-ADP-CL-NO TO WS-PREV-CLIENT            CAT660  
                   PERFORM 6300-GETB1 THRU 6300-EXIT                    CAT660  
               END-IF                                                   CAT660  
                                                                        CAT660  
               IF IPEND-FUND-SERV                                       CAT660  
                  PERFORM VARYING SUB FROM 1 BY 1                               
                      UNTIL SUB > WS-FR-SENT-COUNT                              
                      OR (WS-FR-SENT-CNTL-NBR(SUB) =                            
                                  IPEND-AT-CONTROL-NUM                          
                       AND WS-FR-SENT-ASSET-SEQ(SUB) =                          
                                  IPEND-ASSET-SEQ-NO-9)                         
                  END-PERFORM                                                   
                  IF SUB NOT > WS-FR-SENT-COUNT                         CAT660  
                     PERFORM 2100-UPDATE-PEND THRU 2100-EXIT            CAT660  
                  ELSE                                                          
                     DISPLAY 'IPEND NOT MATCHED TO TABLE '                      
LRM019                            IPEND-AT-ADP-CL-NO                            
                            ' '   IPEND-AT-CONTROL-NUM                          
                            ' '   IPEND-ASSET-SEQ-NO-9                          
                            ' '   IPEND-CUSIP-NUM                               
           END-IF.                                                      CAT660  
                                                                        CAT660  
           PERFORM 6000-READ-IPEND    THRU 6000-EXIT.                   CAT660  
       2000-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      *******************                                               CAT660  
       2100-UPDATE-PEND.                                                CAT660  
      *******************                                               CAT660  
           MOVE 'N'                     TO WS-FNDSRVS-FLAG              CAT660  
           MOVE 'N'                     TO WS-FNDRGST-FLAG              CAT660  
           INITIALIZE DCLVFNDRGST                                       CAT660  
                                                                        CAT660  
           PERFORM 2700-FUND-RGST-LOOKUP.                               CAT660  
                                                                        CAT660  
           IF BH-MF-ACTIVE                                              CAT660  
               IF  IPEND-AT-CLNT-IS-RECEIVER                            CAT660  
DJ0002             IF FNDSRVS-FND                                       CAT660  
DJ0002                DISPLAY 'INP=' WS-CNTR-IPEND                      CAT660  
DJ0002                   ' ' IPEND-AT-ADP-CL-NO                         CAT660  
DJ0002                   ' ' IPEND-AT-CONTROL-NUM                       CAT660  
DJ0002                   ' ' IPEND-ASSET-SEQ-NO-9                       CAT660  
DJ0002                   ' ' IPEND-STTLM-LCTN-CD                        CAT660  
DJ0002                   ' ' IPEND-FSRV-ACKN-IND                        CAT660  
DJ0002                   ' ' IPEND-ACTION-TYPE-CD                       CAT660  
DJ0002                   ' IPEND-NWK=' IPEND-NTWRK-CNTL-CD              CAT660  
DJ0002             END-IF                                               CAT660  
                   PERFORM 2900-CREATE-BNWTRAN-RECV                     CAT660  
           END-IF.                                                              
                                                                        CAT660  
       2100-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      ************************                                          CAT660  
       2700-FUND-RGST-LOOKUP.                                           CAT660  
      ************************                                          CAT660  
           MOVE IPEND-AT-ADP-CL-NO      OF IPEND-AT-RECORD              CAT660  
             TO WS-CL-NO-NUM                                            CAT660  
           MOVE WS-CL-NO                                                CAT660  
             TO CLIENT-NBR              OF DCLVFNDRGST                  CAT660  
           MOVE IPEND-AT-CONTROL-NUM    OF IPEND-AT-RECORD              CAT660  
             TO ACAT-CONTROL-NBR        OF DCLVFNDRGST                  CAT660  
           MOVE IPEND-ASSET-SEQ-NO-9    OF IPEND-AT-RECORD              CAT660  
             TO ASSET-SEQ-NBR           OF DCLVFNDRGST                  CAT660  
           EXEC SQL                                                     CAT660  
              SELECT                                                    CAT660  
                 CLIENT_NBR                                             CAT660  
                ,ACAT_CONTROL_NBR                                       CAT660  
                ,ASSET_SEQ_NBR                                          CAT660  
                ,SBMTG_PRTCP_NBR                                        CAT660  
                ,SBMT_PRT_NR_STS_CD                                     CAT660  
                ,CONTROL_NBR_STS_CD                                     CAT660  
                ,AST_SEQ_NBR_STS_CD                                     CAT660  
                ,MF_TRANS_TYPE_CD                                       CAT660  
                ,NRA_TAX_PCT                                            CAT660  
                ,BK_PHSCL_SHR_CD                                        CAT660  
                ,CUST_NM                                                CAT660  
                ,FUND_ACCT_CD                                           CAT660  
                ,BRKR_EXCTG_NBR                                         CAT660  
                ,NTWRK_CNTL_CD                                          CAT660  
                ,DVDND_CD                                               CAT660  
                ,STCG_CD                                                CAT660  
                ,LTCG_CD                                                CAT660  
                ,FNBR                                                   CAT660  
                ,SS_TIN_CD                                              CAT660  
                ,WTHLD_CD                                               CAT660  
                ,PYBL_INFO_CD                                           CAT660  
                ,ZIP5_CD                                                CAT660  
                ,ZIP4_CD                                                CAT660  
                ,SOC_CD                                                 CAT660  
                ,NAV_ACCT_IND                                           CAT660  
                ,MRGN_ACCT_IND                                          CAT660  
                ,CHCK_WRTNG_IND                                         CAT660  
                ,SL_ST_CD                                               CAT660  
                ,CNTRY_ORGN_CD                                          CAT660  
                ,ACCT_RR_NM                                             CAT660  
                ,ACCT_RR_CD                                             CAT660  
                ,BRCH_NBR                                               CAT660  
                ,MEMO_TXT                                               CAT660  
                ,ACH_IND                                                CAT660  
                ,PAC_IND                                                CAT660  
                ,SWP_IND                                                CAT660  
                ,ROA_LOI_AMT                                            CAT660  
                ,LOI_DT                                                 CAT660  
                ,TRD_RLTD_IND                                           CAT660  
                ,ACCT_RLTD_NBR                                          CAT660  
                ,ACCT_RLTD_CD                                           CAT660  
                ,SWP_PAC_EFFCT_DT                                       CAT660  
                ,CDSC_PYMNT_CD                                          CAT660  
                ,DSBMT_OPTN_CD                                          CAT660  
                ,DSBMT_AMT                                              CAT660  
                ,PYMNT_JAN_IND                                          CAT660  
                ,PYMNT_FEB_IND                                          CAT660  
                ,PYMNT_MAR_IND                                          CAT660  
                ,PYMNT_APR_IND                                          CAT660  
                ,PYMNT_MAY_IND                                          CAT660  
                ,PYMNT_JUN_IND                                          CAT660  
                ,PYMNT_JUL_IND                                          CAT660  
                ,PYMNT_AUG_IND                                          CAT660  
                ,PYMNT_SEP_IND                                          CAT660  
                ,PYMNT_OCT_IND                                          CAT660  
                ,PYMNT_NOV_IND                                          CAT660  
                ,PYMNT_DEC_IND                                          CAT660  
                ,PYMNT_DT_CD                                            CAT660  
                ,RTRMT_TAX_CD                                           CAT660  
                ,SHRHR_BNK_ACCT_NBR                                     CAT660  
                ,SHRHR_BNK_TYPE_CD                                      CAT660  
                ,CHCK_FRST_DT                                           CAT660  
                ,ABA_ROUTING_NBR                                        CAT660  
                ,COST_BSS_CD                                            CAT660  
                ,SS_TIN_NBR                                             CAT660  
                ,TRNFR_TYPE_CD                                          CAT660  
                ,ISIN_SEC_ISSUE_CD                                      CAT660  
                ,PI_DLRVY_CD                                            CAT660  
                ,NM_END_LN_QTY                                          CAT660  
                ,DSTBN_SIDE_CD                                          CAT660  
                ,PRCS_DT                                                CAT660  
                ,ACTION_TYPE_CD                                         CAT660  
                ,CRT_TMSTP                                              CAT660  
                ,UPDT_TMSTP                                             CAT660  
                ,SECURITY_ADP_NBR                                       CAT660  
                ,DLVR_NBR                                               CAT660  
                ,ROA_LOI_CD                                             CAT660  
                ,FUND_BK_CD                                             CAT660  
              INTO                                                      CAT660  
                :DCLVFNDRGST.CLIENT-NBR                                 CAT660  
               ,:DCLVFNDRGST.ACAT-CONTROL-NBR                           CAT660  
               ,:DCLVFNDRGST.ASSET-SEQ-NBR                              CAT660  
               ,:DCLVFNDRGST.SBMTG-PRTCP-NBR                            CAT660  
               ,:DCLVFNDRGST.SBMT-PRT-NR-STS-CD                         CAT660  
               ,:DCLVFNDRGST.CONTROL-NBR-STS-CD                         CAT660  
               ,:DCLVFNDRGST.AST-SEQ-NBR-STS-CD                         CAT660  
               ,:DCLVFNDRGST.MF-TRANS-TYPE-CD                           CAT660  
               ,:DCLVFNDRGST.NRA-TAX-PCT                                CAT660  
               ,:DCLVFNDRGST.BK-PHSCL-SHR-CD                            CAT660  
               ,:DCLVFNDRGST.CUST-NM                                    CAT660  
               ,:DCLVFNDRGST.FUND-ACCT-CD                               CAT660  
               ,:DCLVFNDRGST.BRKR-EXCTG-NBR                             CAT660  
               ,:DCLVFNDRGST.NTWRK-CNTL-CD                              CAT660  
               ,:DCLVFNDRGST.DVDND-CD                                   CAT660  
               ,:DCLVFNDRGST.STCG-CD                                    CAT660  
               ,:DCLVFNDRGST.LTCG-CD                                    CAT660  
               ,:DCLVFNDRGST.FNBR                                       CAT660  
               ,:DCLVFNDRGST.SS-TIN-CD                                  CAT660  
               ,:DCLVFNDRGST.WTHLD-CD                                   CAT660  
               ,:DCLVFNDRGST.PYBL-INFO-CD                               CAT660  
               ,:DCLVFNDRGST.ZIP5-CD                                    CAT660  
               ,:DCLVFNDRGST.ZIP4-CD                                    CAT660  
               ,:DCLVFNDRGST.SOC-CD                                     CAT660  
               ,:DCLVFNDRGST.NAV-ACCT-IND                               CAT660  
               ,:DCLVFNDRGST.MRGN-ACCT-IND                              CAT660  
               ,:DCLVFNDRGST.CHCK-WRTNG-IND                             CAT660  
               ,:DCLVFNDRGST.SL-ST-CD                                   CAT660  
               ,:DCLVFNDRGST.CNTRY-ORGN-CD                              CAT660  
               ,:DCLVFNDRGST.ACCT-RR-NM                                 CAT660  
               ,:DCLVFNDRGST.ACCT-RR-CD                                 CAT660  
               ,:DCLVFNDRGST.BRCH-NBR                                   CAT660  
               ,:DCLVFNDRGST.MEMO-TXT                                   CAT660  
               ,:DCLVFNDRGST.ACH-IND                                    CAT660  
               ,:DCLVFNDRGST.PAC-IND                                    CAT660  
               ,:DCLVFNDRGST.SWP-IND                                    CAT660  
               ,:DCLVFNDRGST.ROA-LOI-AMT                                CAT660  
               ,:DCLVFNDRGST.LOI-DT                                     CAT660  
               ,:DCLVFNDRGST.TRD-RLTD-IND                               CAT660  
               ,:DCLVFNDRGST.ACCT-RLTD-NBR                              CAT660  
               ,:DCLVFNDRGST.ACCT-RLTD-CD                               CAT660  
               ,:DCLVFNDRGST.SWP-PAC-EFFCT-DT                           CAT660  
               ,:DCLVFNDRGST.CDSC-PYMNT-CD                              CAT660  
               ,:DCLVFNDRGST.DSBMT-OPTN-CD                              CAT660  
               ,:DCLVFNDRGST.DSBMT-AMT                                  CAT660  
               ,:DCLVFNDRGST.PYMNT-JAN-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-FEB-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-MAR-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-APR-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-MAY-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-JUN-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-JUL-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-AUG-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-SEP-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-OCT-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-NOV-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-DEC-IND                              CAT660  
               ,:DCLVFNDRGST.PYMNT-DT-CD                                CAT660  
               ,:DCLVFNDRGST.RTRMT-TAX-CD                               CAT660  
               ,:DCLVFNDRGST.SHRHR-BNK-ACCT-NBR                         CAT660  
               ,:DCLVFNDRGST.SHRHR-BNK-TYPE-CD                          CAT660  
               ,:DCLVFNDRGST.CHCK-FRST-DT                               CAT660  
               ,:DCLVFNDRGST.ABA-ROUTING-NBR                            CAT660  
               ,:DCLVFNDRGST.COST-BSS-CD                                CAT660  
               ,:DCLVFNDRGST.SS-TIN-NBR                                 CAT660  
               ,:DCLVFNDRGST.TRNFR-TYPE-CD                              CAT660  
               ,:DCLVFNDRGST.ISIN-SEC-ISSUE-CD                          CAT660  
               ,:DCLVFNDRGST.PI-DLRVY-CD                                CAT660  
               ,:DCLVFNDRGST.NM-END-LN-QTY                              CAT660  
               ,:DCLVFNDRGST.DSTBN-SIDE-CD                              CAT660  
               ,:DCLVFNDRGST.PRCS-DT                                    CAT660  
               ,:DCLVFNDRGST.ACTION-TYPE-CD                             CAT660  
               ,:DCLVFNDRGST.CRT-TMSTP                                  CAT660  
               ,:DCLVFNDRGST.UPDT-TMSTP                                 CAT660  
               ,:DCLVFNDRGST.SECURITY-ADP-NBR                           CAT660  
               ,:DCLVFNDRGST.DLVR-NBR                                   CAT660  
               ,:DCLVFNDRGST.ROA-LOI-CD                                 CAT660  
               ,:DCLVFNDRGST.FUND-BK-CD                                 CAT660  
                 FROM VFNDRGST                                          CAT660  
              WHERE CLIENT_NBR       = :DCLVFNDRGST.CLIENT-NBR          CAT660  
                AND ACAT_CONTROL_NBR = :DCLVFNDRGST.ACAT-CONTROL-NBR    CAT660  
                AND ASSET_SEQ_NBR    = :DCLVFNDRGST.ASSET-SEQ-NBR       CAT660  
           END-EXEC.                                                    CAT660  
           IF  SQLCODE = +0                                             CAT660  
               SET FNDRGST-FND          TO TRUE                         CAT660  
           ELSE                                                         CAT660  
               IF  SQLCODE = +100                                       CAT660  
ENP001             CONTINUE                                             CAT660  
ENP001*        DISPLAY 'VFNDRGST NOT FOUND: ' IPEND-AT-CONTROL-NUM ' '  CAT660  
ENP001*                                       IPEND-AT-ADP-CL-NO   ' '  CAT660  
ENP001*                                       IPEND-ASSET-SEQ-NO-9 ' '  CAT660  
               ELSE                                                     CAT660  
                   PERFORM SQL-ERROR-ROUTINE                            CAT660  
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
       2700-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      ***************************                                       CAT660  
       2900-CREATE-BNWTRAN-RECV.                                        CAT660  
      ***************************                                       CAT660  
           MOVE SPACES                  TO BNWTRAN-REC.                 CAT660  
           MOVE ZEROES                                                  CAT660  
             TO ACCT-ID                 OF BNWTRAN-REC                  CAT660  
           MOVE IPEND-AT-ADP-CL-NO                                      CAT660  
             TO CLIENT-NO               OF BNWTRAN-REC                  CAT660  
                CLIENT                  OF BNWTRAN-REC                  CAT660  
           MOVE IPEND-CUSIP-NUM                                         CAT660  
             TO CUSIP-9                 OF BNWTRAN-REC                  CAT660  
           MOVE IPEND-AT-CUST-ACCOUNT (1:3)                             CAT660  
             TO BRANCH-3                OF BNWTRAN-REC                  CAT660  
           MOVE IPEND-AT-CUST-ACCOUNT (4:5)                             CAT660  
             TO ACCT-5                  OF BNWTRAN-REC                  CAT660  
           EVALUATE TRUE                                                CAT660  
               WHEN IPEND-CASH-ACT                                      CAT660  
                    MOVE 1                                              CAT660  
                      TO ACCT-TYPE      OF BNWTRAN-REC                  CAT660  
               WHEN IPEND-MARGIN-ACT                                    CAT660  
                    MOVE 2                                              CAT660  
                      TO ACCT-TYPE      OF BNWTRAN-REC                  CAT660  
               WHEN IPEND-SHORT-ACT                                     CAT660  
                    MOVE 5                                              CAT660  
                      TO ACCT-TYPE      OF BNWTRAN-REC                  CAT660  
           END-EVALUATE                                                 CAT660  
           IF  ACCT-ID (1:18) NOT = GETNA-KEY                           CAT660  
               PERFORM 6500-GETNA-RTN THRU 6500-EXIT                    CAT660  
LRM021         IF GETNA-RETURN-NOT-FOUND                                        
LRM021            INITIALIZE NASEGPPA                                           
LRM021                       NASEGPPB                                           
LRM021                       NASEGIP15                                          
           END-IF.                                                      CAT660  
                                                                        CAT660  
           MOVE BRANCH-3                TO WS-CKDIG-BRCH                CAT660  
           MOVE ACCT-5                  TO WS-CKDIG-ACCT                CAT660  
           MOVE ACCT-TYPE               TO WS-CKDIG-ACCT-TYPE           CAT660  
           CALL  CKDIGIT  USING WS-CKDIG-ACCT-ID                        CAT660  
                                WS-CKDIG-NO-OF-DIGIT                    CAT660  
                                WS-CKDIG-CHCK-DGIT                      CAT660  
           MOVE WS-CKDIG-CHCK-DGIT                                      CAT660  
             TO CHK-DIGIT               OF BNWTRAN-REC                  CAT660  
                                                                        CAT660  
           MOVE 'M'                                                     CAT660  
             TO MAINT-TRANSFER-IND      OF BNWTRAN-REC                  CAT660  
           MOVE SPACE                                                   CAT660  
             TO PENDING-INDICATOR       OF BNWTRAN-REC                  CAT660  
           MOVE 999999                                                  CAT660  
             TO SEQUENCE-NO             OF BNWTRAN-REC                  CAT660  
           MOVE ZEROES                                                  CAT660  
             TO PAYABLE-SEQUENCE-NO     OF BNWTRAN-REC                  CAT660  
                                                                        CAT660  
           MOVE '1'                                                     CAT660  
             TO REC-TYPE                OF BNWTRAN-REC                  CAT660  
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                      CAT660  
             TO CLEARING-SETTLING-BROKER OF BNWTRAN-REC                 CAT660  
           MOVE WS-PROC-DATE-MMDDYY                                     CAT660  
             TO ENTRY-DATE              OF BNWTRAN-REC                  CAT660  
           IF  CUSIP-9 OF BNWTRAN-REC  NOT = GETMSD-SEARCH-KEY          CAT660  
               PERFORM 6400-GETMSDC THRU 6400-EXIT                      CAT660  
           END-IF                                                       CAT660  
           IF  GETMSD-RETURN-VALID                                      CAT660  
               MOVE MS-SYMBOL                                           CAT660  
                 TO SYMBOL              OF BNWTRAN-REC                  CAT660  
           END-IF.                                                      CAT660  
           MOVE MS-ADP-NO                                               CAT660  
             TO ADP-SEC-NO              OF BNWTRAN-REC                  CAT660  
           MOVE SPACES                                                  CAT660  
             TO CLEARING-SETTLING-FUND  OF BNWTRAN-REC                  CAT660  
                                                                        CAT660  
TR0002     IF  CLIENT-NO OF BNWTRAN-REC IS NUMERIC                      CAT660  
TR0002     AND CLIENT-NO OF IREG-RECORD IS NUMERIC                      CAT660  
TR0002     AND CLIENT-NO OF BNWTRAN-REC =                               CAT660  
TR0002         CLIENT-NO OF IREG-RECORD                                 CAT660  
TR0002     AND CUSIP-9   OF BNWTRAN-REC =                               CAT660  
TR0002         CUSIP-9   OF IREG-RECORD                                 CAT660  
TR0002         CONTINUE                                                 CAT660  
TR0002     ELSE                                                         CAT660  
TR0002         PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT               CAT660  
TR0002     END-IF.                                                      CAT660  
                                                                        CAT660  
TR0002     IF  CLIENT-NO OF BNWTRAN-REC IS NUMERIC                      CAT660  
TR0002         MOVE CLIENT-NO OF BNWTRAN-REC   TO  SAVE-CLIENT-NO       CAT660  
TR0002     ELSE                                                         CAT660  
TR0002         DISPLAY 'CLIENT-NO OF BNWTRAN-REC IS NOT NUMERIC, PROGRAMCAT660  
TR0002-                ' IS ABENDING!'                                  CAT660  
TR0002         MOVE +2900               TO ABEND-CD                     CAT660  
TR0002         CALL ABEND            USING ABEND-CD                     CAT660  
TR0002     END-IF.                                                      CAT660  
TR0002     MOVE CUSIP-9 OF BNWTRAN-REC  TO SAVE-CUSIP-9.                CAT660  
                                                                        CAT660  
TR0002     PERFORM 6600-READ-IREG-FILE THRU 6600-EXIT.                  CAT660  
                                                                        CAT660  
           MOVE PROCESSING-CODE         OF IREG-RECORD                  CAT660  
             TO PROCESSING-CODE         OF BNWTRAN-REC                  CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE '1'                                                 CAT660  
                 TO ACCT-INFO-SEND-TO-NSCC-FLAG OF BNWTRAN-REC          CAT660  
           ELSE                                                         CAT660  
               MOVE '3'                                                 CAT660  
                 TO ACCT-INFO-SEND-TO-NSCC-FLAG OF BNWTRAN-REC          CAT660  
           END-IF                                                       CAT660  
           MOVE '3'                                                     CAT660  
             TO SOURCE-OF-TRAN-REC-FLAG OF BNWTRAN-REC                  CAT660  
           MOVE IPEND-AT-CONTROL-NUM                                    CAT660  
             TO REFERENCE-NO-15         OF BNWTRAN-REC                  CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE 6                                                   CAT660  
                 TO MATRIX-LEVEL        OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE IPEND-NTWRK-CNTL-CD                                 CAT660  
                 TO MATRIX-LEVEL        OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  NOT OMNIBUS-PROCESSING OF IREG-RECORD                    CAT660  
LRM005     AND NOT DST-DIRECT OF IREG-RECORD                            CAT660  
LRM009     AND NOT PNC-SURPAS-PROCESSING  OF IREG-RECORD                CAT660  
               MOVE 'Y'                                                 CAT660  
                 TO BKR-BOOKS-ONLY-INDICATOR OF BNWTRAN-REC             CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               MOVE PYBL-INFO-CD        OF DCLVFNDRGST                  CAT660  
                 TO PAYABLE-INFO-INDICATOR OF BNWTRAN-REC               CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE NAPPA-RR1-3                                         CAT660  
                 TO REG-REP             OF BNWTRAN-REC                  CAT660  
                    ACCT-REP-NO         OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE ACCT-RR-CD          OF DCLVFNDRGST                  CAT660  
                 TO REG-REP             OF BNWTRAN-REC                  CAT660  
                    ACCT-REP-NO         OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               MOVE FUND-ACCT-CD        OF DCLVFNDRGST                  CAT660  
                 TO FUND-ACCT-INDICATOR OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE '0'                 TO BOOK-OPTION                  CAT660  
           ELSE                                                         CAT660  
               EVALUATE TRUE                                            CAT660  
                   WHEN IPEND-BK-PHSCL-SHR-CD = '2'                     CAT660  
                        MOVE '2'        TO BOOK-OPTION                  CAT660  
                   WHEN IPEND-NTWRK-CNTL-CD = '3'                       CAT660  
                        MOVE '0'        TO  BOOK-OPTION                 CAT660  
                   WHEN IPEND-FUND-BK-CD = 'BC'                         CAT660  
                        MOVE '1'        TO  BOOK-OPTION                 CAT660  
                   WHEN IPEND-FUND-BK-CD = 'BB'                         CAT660  
                        MOVE '0'        TO  BOOK-OPTION                 CAT660  
               END-EVALUATE                                             CAT660  
           END-IF                                                       CAT660  
           SET DIV-CG-INDX          TO 1                                CAT660  
           MOVE 0                   TO DIV-CG-CNTR                      CAT660  
           SEARCH DIV-CG-TABLE VARYING DIV-CG-CNTR                      CAT660  
                  AT END MOVE SPACE TO DIVIDEND-CODE OF BNWTRAN-REC     CAT660  
                         DISPLAY ' DIV CD: ' DVDND-CD OF DCLVFNDRGST    CAT660  
                                 ' LT  CD: ' LTCG-CD  OF DCLVFNDRGST    CAT660  
                                 ' ST  CD: ' STCG-CD  OF DCLVFNDRGST    CAT660  
JPC001                           ' CNT: ' IPEND-AT-CONTROL-NUM ' '      CAT660  
JPC001                                    IPEND-AT-ADP-CL-NO   ' '      CAT660  
JPC001                                    IPEND-ASSET-SEQ-NO-9 ' '      CAT660  
                  WHEN DIV-CODE (DIV-CG-INDX) = DVDND-CD                CAT660  
                                                 OF DCLVFNDRGST         CAT660  
                   AND LTCG-CODE (DIV-CG-INDX) = LTCG-CD                CAT660  
                                                 OF DCLVFNDRGST         CAT660  
                   AND STCG-CODE (DIV-CG-INDX) = STCG-CD                CAT660  
                                                 OF DCLVFNDRGST         CAT660  
                       MOVE DIV-CG-CNTR                                 CAT660  
                         TO DIVIDEND-CODE OF BNWTRAN-REC                CAT660  
           END-SEARCH                                                   CAT660  
           IF (OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005               OR  DST-DIRECT OF IREG-RECORD                      CAT660  
LRM009               OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD)         CAT660  
               IF  BH-MFRS-SECONDARY-TAX-ID-OPT = '1'                   CAT660  
                   MOVE NAPPA-SOC-SEC-TAX-ID2 TO SS-NO OF BNWTRAN-REC   CAT660  
                   EVALUATE NAPPA-SOC-SEC-TAX-CODE2                     CAT660  
                       WHEN '1'                                         CAT660  
                            MOVE '1' TO SS-INDICATOR OF BNWTRAN-REC     CAT660  
                       WHEN '2'                                         CAT660  
                            MOVE '0' TO SS-INDICATOR OF BNWTRAN-REC     CAT660  
                   END-EVALUATE                                         CAT660  
               ELSE                                                     CAT660  
                   MOVE NAPPA-SOC-SEC-TAX-ID1 TO SS-NO OF BNWTRAN-REC   CAT660  
                   EVALUATE NAPPA-SOC-SEC-TAX-CODE1                     CAT660  
                       WHEN '1'                                         CAT660  
                            MOVE '1' TO SS-INDICATOR OF BNWTRAN-REC     CAT660  
                       WHEN '2'                                         CAT660  
                            MOVE '0' TO SS-INDICATOR OF BNWTRAN-REC     CAT660  
                   END-EVALUATE                                         CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               MOVE SS-TIN-CD           OF DCLVFNDRGST                  CAT660  
                 TO SS-INDICATOR        OF BNWTRAN-REC                  CAT660  
               MOVE SS-TIN-NBR          OF DCLVFNDRGST                  CAT660  
                 TO SS-NO               OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE NAPPA-STK-WH-TAX-N TO NRA-TAX-RATE OF BNWTRAN-REC   CAT660  
LRM020         MULTIPLY NAPPA-STK-WH-TAX-N BY 100                               
LRM020                  GIVING NRA-TAX-RATE-EXP OF BNWTRAN-REC                  
           ELSE                                                         CAT660  
               IF  NRA-TAX-PCT OF DCLVFNDRGST IS NUMERIC                CAT660  
               AND NRA-TAX-PCT OF DCLVFNDRGST > 0                       CAT660  
                   COMPUTE NRA-TAX-RATE OF BNWTRAN-REC =                CAT660  
                           NRA-TAX-PCT OF DCLVFNDRGST / 100             CAT660  
LRM020             MOVE NRA-TAX-PCT OF DCLVFNDRGST                              
LRM020                      TO NRA-TAX-RATE-EXP OF BNWTRAN-REC                  
               ELSE                                                     CAT660  
                   INITIALIZE NRA-TAX-RATE OF BNWTRAN-REC               CAT660  
LRM020             INITIALIZE NRA-TAX-RATE-EXP OF BNWTRAN-REC                   
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
           IF (OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD)                   CAT660  
LRM019     AND NOT NTW-SHWB-ACCT                                                
               IF  NAPPA-IRA-KEOUGH-IND <= SPACES                       CAT660  
                   MOVE '06'                                            CAT660  
                     TO SOCIAL-CODE     OF BNWTRAN-REC                  CAT660  
               ELSE                                                     CAT660  
                   MOVE '08'                                            CAT660  
                     TO SOCIAL-CODE     OF BNWTRAN-REC                  CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               MOVE SOC-CD              OF DCLVFNDRGST                  CAT660  
                 TO SOCIAL-CODE         OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
JPC003**       IF  NAV-ACCT-IND OF DCLVFNDRGST = '0'                    CAT660  
JPC003**           MOVE '6'                                             CAT660  
JPC003**             TO NAV-ACCT-INDICATOR OF BNWTRAN-REC               CAT660  
JPC003**       ELSE                                                     CAT660  
JPC003**           MOVE '0'                                             CAT660  
JPC003**             TO NAV-ACCT-INDICATOR OF BNWTRAN-REC               CAT660  
JPC003**       END-IF                                                   CAT660  
JPC003         IF  NAV-ACCT-IND OF DCLVFNDRGST = 'Y'                    CAT660  
JPC003             MOVE '0'                                             CAT660  
JPC003               TO NAV-ACCT-INDICATOR OF BNWTRAN-REC               CAT660  
JPC003         ELSE                                                     CAT660  
JPC003             MOVE '6'                                             CAT660  
JPC003               TO NAV-ACCT-INDICATOR OF BNWTRAN-REC               CAT660  
JPC003         END-IF                                                   CAT660  
           END-IF                                                       CAT660  
LRM019     IF NTW-SHWB-ACCT                                                     
LRM019     AND NTW-WAIVE-ACCT                                                   
LRM019       MOVE '5' TO NAV-ACCT-INDICATOR OF BNWTRAN-REC                      
LRM019     END-IF                                                               
           MOVE MEMO-TXT                OF DCLVFNDRGST                  CAT660  
             TO MEMO-FIELD              OF BNWTRAN-REC                  CAT660  
LRM004     IF BOOK-OPTION = '2'                                         CAT660  
              MOVE PI-DLRVY-CD          OF DCLVFNDRGST                  CAT660  
                TO PI-DELIVERY-INDICATOR   OF BNWTRAN-REC               CAT660  
LRM004     ELSE                                                         CAT660  
LRM004        MOVE SPACES                                               CAT660  
LRM004          TO PI-DELIVERY-INDICATOR   OF BNWTRAN-REC               CAT660  
LRM004     END-IF                                                       CAT660  
           MOVE NM-END-LN-QTY           OF DCLVFNDRGST                  CAT660  
             TO WS-NAME-LINE-INDICATOR                                  CAT660  
           MOVE WS-NAME-LINE-INDICATOR                                  CAT660  
             TO NAME-LINE-INDICATOR     OF BNWTRAN-REC                  CAT660  
           MOVE PYBL-QTY                OF DCLVFNDRGST                  CAT660  
             TO NUMBER-OF-PAYABLES      OF BNWTRAN-REC                  CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               PERFORM 2982-GET-RR-NAME                                 CAT660  
               IF  WS-RRNAME-LOOKUP-RR-NAME > SPACES                    CAT660  
                   MOVE WS-RRNAME-LOOKUP-RR-NAME                        CAT660  
                     TO ACCT-REP-NAME   OF BNWTRAN-REC                  CAT660  
               ELSE                                                     CAT660  
                   MOVE REG-REP  OF BNWTRAN-REC                         CAT660  
                     TO ACCT-REP-NAME   OF BNWTRAN-REC                  CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               MOVE ACCT-RR-NM          OF DCLVFNDRGST                  CAT660  
                 TO ACCT-REP-NAME       OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF (OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD)                   CAT660  
               IF  BH-MF4-ACTIVE                                        CAT660  
               AND BH-MF4-OMNIB-SUB-EXEC-BROK-NO IS NUMERIC             CAT660  
               AND BH-MF4-OMNIB-SUB-EXEC-BROK-NO > ZERO                 CAT660  
                   PERFORM 2970-SEARCH-OMNIB-EXEC-BKR-TBL               CAT660  
                   IF  BRANCH-FND-IN-EXEC-BKR-TBL                       CAT660  
                       MOVE BH-MF4-OMNIB-SUB-EXEC-BROK-NUM (WS-SUB)     CAT660  
                         TO EXECUTING-BROKER-NO OF BNWTRAN-REC          CAT660  
                   END-IF                                               CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               MOVE BRKR-EXCTG-NBR      OF DCLVFNDRGST                  CAT660  
                 TO EXECUTING-BROKER-NO OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE BRANCH-3            OF BNWTRAN-REC                  CAT660  
                 TO BRANCH-ID-NO        OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE BRCH-NBR            OF DCLVFNDRGST                  CAT660  
                 TO BRANCH-ID-NO        OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           MOVE SPACES                                                  CAT660  
             TO NEW-BROKER-ID-NO        OF BNWTRAN-REC                  CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE 0                                                   CAT660  
                 TO ROA-LOI-AMT         OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
JPC002**       MOVE ACH-IND             OF DCLVFNDRGST                  CAT660  
JPC002**         TO ACH-INDICATOR       OF BNWTRAN-REC                  CAT660  
JPC002         EVALUATE ACH-IND OF DCLVFNDRGST                          CAT660  
JPC002             WHEN '0'                                             CAT660  
JPC002                  MOVE ACH-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO ACH-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN '1'                                             CAT660  
JPC002                  MOVE ACH-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO ACH-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'N'                                             CAT660  
JPC002                  MOVE '0'                                        CAT660  
JPC002                    TO ACH-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'Y'                                             CAT660  
JPC002                  MOVE '1'                                        CAT660  
JPC002                    TO ACH-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002         END-EVALUATE                                             CAT660  
JPC002**       MOVE PAC-IND             OF DCLVFNDRGST                  CAT660  
JPC002**         TO PAC-INDICATOR       OF BNWTRAN-REC                  CAT660  
JPC002         EVALUATE PAC-IND OF DCLVFNDRGST                          CAT660  
JPC002             WHEN '0'                                             CAT660  
JPC002                  MOVE PAC-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO PAC-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN '1'                                             CAT660  
JPC002                  MOVE PAC-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO PAC-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'N'                                             CAT660  
JPC002                  MOVE '0'                                        CAT660  
JPC002                    TO PAC-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'Y'                                             CAT660  
JPC002                  MOVE '1'                                        CAT660  
JPC002                    TO PAC-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002         END-EVALUATE                                             CAT660  
JPC002**       MOVE SWP-IND             OF DCLVFNDRGST                  CAT660  
JPC002**         TO SWP-INDICATOR       OF BNWTRAN-REC                  CAT660  
JPC002         EVALUATE SWP-IND OF DCLVFNDRGST                          CAT660  
JPC002             WHEN '0'                                             CAT660  
JPC002                  MOVE SWP-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO SWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN '1'                                             CAT660  
JPC002                  MOVE SWP-IND        OF DCLVFNDRGST              CAT660  
JPC002                    TO SWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'N'                                             CAT660  
JPC002                  MOVE '0'                                        CAT660  
JPC002                    TO SWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002             WHEN 'Y'                                             CAT660  
JPC002                  MOVE '1'                                        CAT660  
JPC002                    TO SWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC002         END-EVALUATE                                             CAT660  
JPC001         EVALUATE CHCK-WRTNG-IND OF DCLVFNDRGST                   CAT660  
JPC001             WHEN '0'                                             CAT660  
JPC001                  MOVE CHCK-WRTNG-IND OF DCLVFNDRGST              CAT660  
JPC001                    TO CWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC001             WHEN '1'                                             CAT660  
JPC001                  MOVE CHCK-WRTNG-IND OF DCLVFNDRGST              CAT660  
JPC001                    TO CWP-INDICATOR  OF BNWTRAN-REC              CAT660  
JPC001             WHEN 'N'                                             CAT660  
JPC001                  MOVE '0'                                        CAT660  
JPC001                    TO CWP-INDICATOR OF BNWTRAN-REC               CAT660  
JPC001             WHEN 'Y'                                             CAT660  
JPC001                  MOVE '1'                                        CAT660  
JPC001                    TO CWP-INDICATOR OF BNWTRAN-REC               CAT660  
JPC001         END-EVALUATE                                             CAT660  
JPC001         EVALUATE MRGN-ACCT-IND OF DCLVFNDRGST                    CAT660  
JPC001             WHEN '0'                                             CAT660  
JPC001                  MOVE MRGN-ACCT-IND OF DCLVFNDRGST               CAT660  
JPC001                    TO MARGIN-ACCT-INDICATOR OF BNWTRAN-REC       CAT660  
JPC001             WHEN '1'                                             CAT660  
JPC001                  MOVE MRGN-ACCT-IND OF DCLVFNDRGST               CAT660  
JPC001                    TO MARGIN-ACCT-INDICATOR OF BNWTRAN-REC       CAT660  
JPC001             WHEN 'N'                                             CAT660  
JPC001                  MOVE '0'                                        CAT660  
JPC001                    TO MARGIN-ACCT-INDICATOR OF BNWTRAN-REC       CAT660  
JPC001             WHEN 'Y'                                             CAT660  
JPC001                  MOVE '1'                                        CAT660  
JPC001                    TO MARGIN-ACCT-INDICATOR OF BNWTRAN-REC       CAT660  
JPC001         END-EVALUATE                                             CAT660  
               MOVE ABA-ROUTING-NBR     OF DCLVFNDRGST                  CAT660  
                 TO ABA-ROUTING-NO      OF BNWTRAN-REC                  CAT660  
               MOVE LOI-DT              OF DCLVFNDRGST (1:4)            CAT660  
                 TO LOI-YYYY            OF BNWTRAN-REC                  CAT660  
               MOVE LOI-DT              OF DCLVFNDRGST (6:2)            CAT660  
                 TO LOI-MM              OF BNWTRAN-REC                  CAT660  
               MOVE LOI-DT              OF DCLVFNDRGST (9:2)            CAT660  
                 TO LOI-DD              OF BNWTRAN-REC                  CAT660  
JPC001         IF  LOI-NO-OR-DATE OF BNWTRAN-REC = '01010001'           CAT660  
JPC001             MOVE SPACES                                          CAT660  
JPC001               TO LOI-NO-OR-DATE  OF BNWTRAN-REC                  CAT660  
JPC001         END-IF                                                   CAT660  
               IF  ROA-LOI-AMT OF DCLVFNDRGST IS NUMERIC                CAT660  
               AND ROA-LOI-AMT OF DCLVFNDRGST > 0                       CAT660  
                   MOVE ROA-LOI-AMT     OF DCLVFNDRGST                  CAT660  
                     TO ROA-LOI-AMT     OF BNWTRAN-REC                  CAT660  
               ELSE                                                     CAT660  
                   MOVE 0                                               CAT660  
                     TO ROA-LOI-AMT     OF BNWTRAN-REC                  CAT660  
               END-IF                                                   CAT660  
JPC001         EVALUATE TRD-RLTD-IND OF DCLVFNDRGST                     CAT660  
JPC001             WHEN '0'                                             CAT660  
JPC001                  MOVE TRD-RLTD-IND OF DCLVFNDRGST                CAT660  
JPC001                    TO RELATED-TRADE-INDICATOR OF BNWTRAN-REC     CAT660  
JPC001             WHEN '1'                                             CAT660  
JPC001                  MOVE TRD-RLTD-IND OF DCLVFNDRGST                CAT660  
JPC001                    TO RELATED-TRADE-INDICATOR OF BNWTRAN-REC     CAT660  
JPC001             WHEN 'N'                                             CAT660  
JPC001                  MOVE '0'                                        CAT660  
JPC001                    TO RELATED-TRADE-INDICATOR OF BNWTRAN-REC     CAT660  
JPC001             WHEN 'Y'                                             CAT660  
JPC001                  MOVE '1'                                        CAT660  
JPC001                    TO RELATED-TRADE-INDICATOR OF BNWTRAN-REC     CAT660  
JPC001         END-EVALUATE                                             CAT660  
               MOVE ACCT-RLTD-NBR       OF DCLVFNDRGST                  CAT660  
                 TO RELATED-ACCT-NO     OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           MOVE SPACES                  TO BNW59CTY-PARM-INFO           CAT660  
           MOVE NAPPA-GEO-LOC           TO BNW59CTY-GEO-CODE            CAT660  
           MOVE NAPPA-ALC               TO BNW59CTY-ALC-CODE            CAT660  
           MOVE PROCESSING-CODE         OF BNWTRAN-REC                  CAT660  
                                        TO BNW59CTY-PROCESSING-CODE     CAT660  
           CALL C-BNW59CTY USING BNW59CTY-PARM-INFO                     CAT660  
                                                                        CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE BNW59CTY-COUNTRY-OF-ORIGIN                          CAT660  
                 TO COUNTRY-OF-ORIGIN   OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE CNTRY-ORGN-CD       OF DCLVFNDRGST                  CAT660  
                 TO COUNTRY-OF-ORIGIN   OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           MOVE 'N'                                                     CAT660  
             TO IRA-INDICATOR           OF BNWTRAN-REC                  CAT660  
           IF  BH-MFN-INHOUSE-IRA-DEFAULT-OPT = '1'                     CAT660  
               IF  NAPPA-IRA-KEOUGH-IND NOT = SPACES                    CAT660  
               AND (MATRIX-LEVEL OF BNWTRAN-REC = ('1' OR '3')          CAT660  
LRM023         OR  DST-DIRECT OF IREG-RECORD)                                   
                   MOVE 'Y'                                             CAT660  
                     TO IRA-INDICATOR   OF BNWTRAN-REC                  CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               IF NAPPA-IRA-KEOUGH-IND = '1'                            CAT660  
                   MOVE 'Y'                                             CAT660  
                     TO IRA-INDICATOR   OF BNWTRAN-REC                  CAT660  
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE BNW59CTY-STATE-OF-SALE                              CAT660  
                 TO STATE-OF-SALE       OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE SL-ST-CD            OF DCLVFNDRGST                  CAT660  
                 TO STATE-OF-SALE       OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE SPACES              TO TAXW-SEARCH-KEY              CAT660  
               MOVE NAPPA-USA-WITHHOLD  TO TAXW-NA-WITHHOLDING-IND      CAT660  
               MOVE IRA-INDICATOR OF BNWTRAN-REC TO TAXW-IRA-IND        CAT660  
               MOVE MATRIX-LEVEL  OF BNWTRAN-REC TO TAXW-MATRIX-LEVEL   CAT660  
               MOVE SS-NO         OF BNWTRAN-REC TO TAXW-SS-OR-TAX      CAT660  
               PERFORM 8000-TRANSLATE-TAX                               CAT660  
               MOVE TAXW-NSCC-WITHHOLDING-IND                           CAT660  
                 TO WITHHOLDING-INDICATOR OF BNWTRAN-REC                CAT660  
           ELSE                                                         CAT660  
               MOVE WTHLD-CD            OF DCLVFNDRGST                  CAT660  
                 TO WITHHOLDING-INDICATOR OF BNWTRAN-REC                CAT660  
           END-IF                                                       CAT660  
           IF  MATRIX-LEVEL OF BNWTRAN-REC = '3'                        CAT660  
               IF NTWK-LVL-3-REG-OPTION OF IREG-RECORD IS NUMERIC       CAT660  
                   MOVE NTWK-LVL-3-REG-OPTION OF IREG-RECORD            CAT660  
                     TO NTWK-LEVEL-3-REG-OPTION OF BNWTRAN-REC          CAT660  
               ELSE                                                     CAT660  
                   MOVE BH-MFN-REGIS-SETUP-OPT                          CAT660  
                     TO NTWK-LEVEL-3-REG-OPTION OF BNWTRAN-REC          CAT660  
               END-IF                                                   CAT660  
           END-IF                                                       CAT660  
           MOVE SPACES                                                  CAT660  
             TO PURGED-ACCOUNT-INDICATOR OF BNWTRAN-REC                 CAT660  
           MOVE SPACES                                                  CAT660  
             TO OLD-BROKER-ACCOUNT-NO   OF BNWTRAN-REC                  CAT660  
           MOVE SPACES                                                  CAT660  
             TO FUND-BRANCH-NO          OF BNWTRAN-REC                  CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005*****OR  DST-DIRECT OF IREG-RECORD                                CAT660  
               MOVE CLIENT-NO           OF BNWTRAN-REC                  CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC (1:3)            CAT660  
               MOVE BRANCH-3            OF BNWTRAN-REC                  CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC (4:3)            CAT660  
               MOVE ACCT-5              OF BNWTRAN-REC                  CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC (7:5)            CAT660  
               MOVE ACCT-TYPE           OF BNWTRAN-REC                  CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC (12:1)           CAT660  
               MOVE CHK-DIGIT           OF BNWTRAN-REC                  CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC (13:1)           CAT660  
           ELSE                                                         CAT660  
           IF  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
LRM022     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
               MOVE SPACES                                              CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE NSCCFR-FND-CUST-ACCT-NBR                            CAT660  
                 TO OLD-FUND-ACCOUNT-NO OF BNWTRAN-REC                  CAT660  
           END-IF                                                       CAT660  
           END-IF                                                       CAT660  
           IF (OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD)                   CAT660  
               IF  NAPPA-ZIP-CODE (1:4) = SPACES                        CAT660  
               AND NAPPA-ZIP-CODE-5 > SPACES                            CAT660  
                   MOVE NAPPA-ZIP-CODE-5 TO CUST-ZIP-CODE               CAT660  
                                         OF BNWTRAN-REC                 CAT660  
               ELSE                                                     CAT660  
                   IF  NAPPA-ZIP-CODE > SPACES                          CAT660  
                       MOVE NAPPA-ZIP-CODE TO CUST-ZIP-CODE             CAT660  
                                           OF BNWTRAN-REC               CAT660  
                   END-IF                                               CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               MOVE ZIP5-CD             OF DCLVFNDRGST                  CAT660  
                 TO CUST-ZIP-CODE       OF BNWTRAN-REC (1:5)            CAT660  
               MOVE ZIP4-CD             OF DCLVFNDRGST                  CAT660  
                 TO CUST-ZIP-CODE       OF BNWTRAN-REC (6:4)            CAT660  
           END-IF                                                       CAT660  
                                                                        CAT660  
                                                                        CAT660  
           PERFORM 2910-REG-SETUP THRU 2910-EXIT                        CAT660  
                                                                        CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR  DST-DIRECT OF IREG-RECORD                                CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE ZEROES                                              CAT660  
                 TO FIRST-CHECK-DATE       OF BNWTRAN-REC               CAT660  
               MOVE ZEROES                                              CAT660  
                 TO SWP-PAC-EFFECTIVE-DATE OF BNWTRAN-REC               CAT660  
           ELSE                                                         CAT660  
               MOVE TRD-RLTD-IND          OF DCLVFNDRGST                CAT660  
                 TO RELATED-ACCT-NO-INDICATOR OF BNWTRAN-REC            CAT660  
               MOVE SWP-PAC-EFFCT-DT      OF DCLVFNDRGST                CAT660  
                                            TO WS-DATE                  CAT660  
               MOVE WS-DATE-MM          TO SWP-PAC-EFFECTIVE-DATE(1:2)  CAT660  
               MOVE WS-DATE-DD          TO SWP-PAC-EFFECTIVE-DATE(3:2)  CAT660  
               MOVE WS-DATE-YEAR (3:2)  TO SWP-PAC-EFFECTIVE-DATE(5:2)  CAT660  
               IF  SWP-PAC-EFFECTIVE-DATE NOT NUMERIC                   CAT660  
               OR  SWP-PAC-EFFECTIVE-DATE = 010101                      CAT660  
                   MOVE ZEROES                                          CAT660  
                     TO SWP-PAC-EFFECTIVE-DATE OF BNWTRAN-REC           CAT660  
               END-IF                                                   CAT660  
               MOVE CDSC-PYMNT-CD       OF DCLVFNDRGST                  CAT660  
                 TO CDSC-PAYMENT-CODE   OF BNWTRAN-REC                  CAT660  
JPC002**       MOVE CDSC-PYMNT-CD       OF DCLVFNDRGST                  CAT660  
JPC002**         TO DISBURSEMENT-OPTION OF BNWTRAN-REC                  CAT660  
               MOVE DSBMT-OPTN-CD       OF DCLVFNDRGST                  CAT660  
                 TO DISBURSEMENT-OPTION OF BNWTRAN-REC                  CAT660  
               MOVE DSBMT-AMT           OF DCLVFNDRGST                  CAT660  
                 TO DISBURSEMENT-AMOUNT OF BNWTRAN-REC                  CAT660  
JPC002         IF  DISBURSEMENT-AMOUNT IS NUMERIC                       CAT660  
JPC002         AND DISBURSEMENT-AMOUNT > 0                              CAT660  
JPC002             CONTINUE                                             CAT660  
JPC002         ELSE                                                     CAT660  
JPC002             MOVE SPACE                                           CAT660  
JPC002               TO DISBURSEMENT-OPTION OF BNWTRAN-REC              CAT660  
JPC002         END-IF                                                   CAT660  
               MOVE PYMNT-JAN-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (1)              CAT660  
               MOVE PYMNT-FEB-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (2)              CAT660  
               MOVE PYMNT-MAR-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (3)              CAT660  
               MOVE PYMNT-APR-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (4)              CAT660  
               MOVE PYMNT-MAY-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (5)              CAT660  
               MOVE PYMNT-JUN-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (6)              CAT660  
               MOVE PYMNT-JUL-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (7)              CAT660  
               MOVE PYMNT-AUG-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (8)              CAT660  
               MOVE PYMNT-SEP-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (9)              CAT660  
               MOVE PYMNT-OCT-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (10)             CAT660  
               MOVE PYMNT-NOV-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (11)             CAT660  
               MOVE PYMNT-DEC-IND       OF DCLVFNDRGST                  CAT660  
                 TO MONTHLY-PYMT-IND    OF BNWTRAN-REC (12)             CAT660  
JPC001         INSPECT MONTHLY-PAYMENT-INDICATORS                       CAT660  
JPC001                 REPLACING ALL 'N' BY '0'                         CAT660  
JPC001         INSPECT MONTHLY-PAYMENT-INDICATORS                       CAT660  
JPC001                 REPLACING ALL 'Y' BY '1'                         CAT660  
               MOVE PYMNT-DT-CD          OF DCLVFNDRGST                 CAT660  
                 TO PAYMENT-DAY-OF-MONTH-IND OF BNWTRAN-REC             CAT660  
               MOVE RTRMT-TAX-CD         OF DCLVFNDRGST                 CAT660  
                 TO RETIREMENT-TAX-INDICATOR OF BNWTRAN-REC             CAT660  
               MOVE SHRHR-BNK-ACCT-NBR   OF DCLVFNDRGST                 CAT660  
                 TO SHAREHOLDER-BANK-ACCT-NO OF BNWTRAN-REC             CAT660  
               MOVE SHRHR-BNK-TYPE-CD      OF DCLVFNDRGST               CAT660  
                 TO SHAREHOLDER-BANK-ACCT-TYPE OF BNWTRAN-REC           CAT660  
               MOVE CHCK-FRST-DT        OF DCLVFNDRGST                  CAT660  
                 TO WS-DATE                                             CAT660  
               MOVE WS-DATE-MM                                          CAT660  
                 TO FIRST-CHECK-DATE    OF BNWTRAN-REC(1:2)             CAT660  
               MOVE WS-DATE-DD                                          CAT660  
                 TO FIRST-CHECK-DATE    OF BNWTRAN-REC(3:2)             CAT660  
               MOVE WS-DATE-YEAR (3:2)                                  CAT660  
                 TO FIRST-CHECK-DATE    OF BNWTRAN-REC(5:2)             CAT660  
               MOVE COST-BSS-CD         OF DCLVFNDRGST                  CAT660  
                 TO COST-BASIS-OPTION   OF BNWTRAN-REC                  CAT660  
               IF  FIRST-CHECK-DATE NOT NUMERIC                         CAT660  
               OR  FIRST-CHECK-DATE = 010101                            CAT660  
                   MOVE ZEROES                                          CAT660  
                     TO FIRST-CHECK-DATE OF BNWTRAN-REC                 CAT660  
               END-IF                                                   CAT660  
           END-IF                                                       CAT660  
           MOVE SPACES                                                  CAT660  
             TO RELATED-CUSIP           OF BNWTRAN-REC                  CAT660  
           MOVE SPACES                                                  CAT660  
             TO GROSS-SETTLEMENT-INDICATOR OF BNWTRAN-REC               CAT660  
LRM024**** MOVE SPACES                                                  CAT660  
LRM024     MOVE NAPPA-GEO-LOC                                           CAT660  
             TO ADP-GEO-ALC-CODE           OF BNWTRAN-REC               CAT660  
           MOVE BPD-PROC-DATE                                           CAT660  
             TO BAT-CREATE-DATE-CCYYMMDD OF ACCT-TRAN-RECORD.           CAT660  
           MOVE 'CAT660P' TO BAT-CREATE-PROGRAM OF ACCT-TRAN-RECORD.    CAT660  
           IF  TRAN-KEY-AREA OF BNWTRAN-REC = WS-PREV-TRAN-KEY          CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               MOVE TRAN-KEY-AREA OF BNWTRAN-REC TO WS-PREV-TRAN-KEY    CAT660  
               WRITE BNWTRAN-RECORD FROM BNWTRAN-REC                    CAT660  
               IF  WS-FILE-STATUS-OK                                    CAT660  
                   ADD 1                TO WS-CNTR-BNWTRAN              CAT660  
               ELSE                                                     CAT660  
                   DISPLAY 'BNWTRANO FILE WRITE ERROR, STATUS = '       CAT660  
                            WS-FILE-STATUS                              CAT660  
                   MOVE +2901 TO ABEND-CD                               CAT660  
                   CALL  ABEND  USING ABEND-CD                          CAT660  
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
           MOVE TRAN-KEY-AREA OF BNWTRAN-REC TO WS-PREV-TRAN-KEY.       CAT660  
       2900-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      *****************                                                 CAT660  
       2910-REG-SETUP.                                                  CAT660  
      *****************                                                 CAT660  
           IF  OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005     OR DST-DIRECT OF IREG-RECORD                                 CAT660  
LRM009     OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD                    CAT660  
               MOVE NAPPB-NA-LINE (1)                                   CAT660  
                 TO ACCT-LINE-ONE       OF BNWTRAN-REC                  CAT660  
               MOVE NAPPB-NA-LINE (2)                                   CAT660  
                 TO ACCT-LINE-TWO       OF BNWTRAN-REC                  CAT660  
               MOVE NAPPB-NA-LINE (3)                                   CAT660  
                 TO ACCT-LINE-THREE     OF BNWTRAN-REC                  CAT660  
               MOVE NAPPB-NA-LINE (4)                                   CAT660  
                 TO ACCT-LINE-FOUR      OF BNWTRAN-REC                  CAT660  
               MOVE NAPPB-NA-LINE (5)                                   CAT660  
                 TO ACCT-LINE-FIVE      OF BNWTRAN-REC                  CAT660  
               MOVE NAPPB-NA-LINE (6)                                   CAT660  
                 TO ACCT-LINE-SIX       OF BNWTRAN-REC                  CAT660  
               IF  NAPPA-MAIL-ADDR IS NUMERIC                           CAT660  
               AND NAPPA-MAIL-ADDR >= '2'                               CAT660  
               AND NAPPA-MAIL-ADDR <= '5'                               CAT660  
                   SUBTRACT 1 FROM NAPPA-MAIL-ADDR-N                    CAT660  
                   GIVING WS-NAME-LINE-INDICATOR                        CAT660  
               ELSE                                                     CAT660  
                   MOVE '1'                                             CAT660  
                     TO WS-NAME-LINE-INDICATOR                          CAT660  
               END-IF                                                   CAT660  
               MOVE WS-NAME-LINE-INDICATOR                              CAT660  
                 TO NAME-LINE-INDICATOR OF BNWTRAN-REC                  CAT660  
           ELSE                                                         CAT660  
               MOVE IPEND-AT-ADP-CL-NO   OF IPEND-AT-RECORD             CAT660  
                 TO WS-CL-NO-NUM                                        CAT660  
               MOVE WS-CL-NO                                            CAT660  
                 TO CLIENT-NBR           OF DCLVFNDNA                   CAT660  
               MOVE IPEND-AT-CONTROL-NUM OF IPEND-AT-RECORD             CAT660  
                 TO ACAT-CONTROL-NBR     OF DCLVFNDNA                   CAT660  
               MOVE IPEND-ASSET-SEQ-NO-9 OF IPEND-AT-RECORD             CAT660  
                 TO ASSET-SEQ-NBR        OF DCLVFNDNA                   CAT660  
JPC001         PERFORM VARYING WS-NA FROM 1 BY 1 UNTIL WS-NA > 6        CAT660  
JPC001             MOVE WS-NA TO NA-LINE-NBR OF DCLVFNDNA               CAT660  
JPC001             EXEC SQL                                             CAT660  
JPC001                SELECT                                            CAT660  
JPC001                  CUST_NA_LINE_TXT                                CAT660  
JPC001                INTO                                              CAT660  
JPC001                  :DCLVFNDNA.CUST-NA-LINE-TXT                     CAT660  
JPC001                FROM VFNDNA                                       CAT660  
JPC001                WHERE CLIENT_NBR = :DCLVFNDNA.CLIENT-NBR          CAT660  
JPC001                  AND ACAT_CONTROL_NBR =                          CAT660  
JPC001                      :DCLVFNDNA.ACAT-CONTROL-NBR                 CAT660  
JPC001                  AND ASSET_SEQ_NBR = :DCLVFNDNA.ASSET-SEQ-NBR    CAT660  
JPC001                  AND NA_LINE_NBR = :DCLVFNDNA.NA-LINE-NBR        CAT660  
JPC001             END-EXEC                                             CAT660  
JPC001             IF  SQLCODE = +0                                     CAT660  
JPC001                 MOVE CUST-NA-LINE-TXT OF DCLVFNDNA               CAT660  
JPC001                   TO ACCT-LINE OF BNWTRAN-REC (WS-NA)            CAT660  
JPC001                 MOVE '1'                                         CAT660  
JPC001                   TO WS-NAME-LINE-INDICATOR                      CAT660  
JPC001                 IF  WS-NA = 1                                    CAT660  
JPC001                     DISPLAY 'VFNDNA   FOUND '                    CAT660  
JPC001                                        IPEND-AT-ADP-CL-NO ' '    CAT660  
JPC001                                        IPEND-AT-CONTROL-NUM ' '  CAT660  
JPC001                                        IPEND-ASSET-SEQ-NO-9 ' '  CAT660  
DJ0001                      'NA-LINE=' CUST-NA-LINE-TXT OF DCLVFNDNA    CAT660  
JPC001                 END-IF                                           CAT660  
JPC001             ELSE                                                 CAT660  
JPC001                 IF  SQLCODE = +100                               CAT660  
JPC001                     CONTINUE                                     CAT660  
JPC001                 ELSE                                             CAT660  
JPC001                     PERFORM SQL-ERROR-ROUTINE                    CAT660  
JPC001                 END-IF                                           CAT660  
JPC001             END-IF                                               CAT660  
JPC001         END-PERFORM.                                             CAT660  
       2910-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
      *********************************                                 CAT660  
       2970-SEARCH-OMNIB-EXEC-BKR-TBL.                                  CAT660  
      *********************************                                 CAT660  
           MOVE 'N'                     TO WS-DONE-LOOKING-SW.          CAT660  
           MOVE 1                       TO WS-SUB.                      CAT660  
           PERFORM UNTIL WS-SUB > BH-MF4-OMNIB-SUB-EXEC-BROK-NO         CAT660  
                OR WS-DONE-LOOKING                                      CAT660  
               IF  BRANCH-3 OF BNWTRAN-REC NOT LESS THAN                CAT660  
                   BH-MF4-OMNIB-SUB-EXEC-BROK-LO (WS-SUB)               CAT660  
               AND BRANCH-3 OF BNWTRAN-REC NOT GREATER THAN             CAT660  
                   BH-MF4-OMNIB-SUB-EXEC-BROK-HI (WS-SUB)               CAT660  
                   SET WS-DONE-LOOKING              TO TRUE             CAT660  
                   SET BRANCH-FND-IN-EXEC-BKR-TBL TO TRUE               CAT660  
               ELSE                                                     CAT660  
                   ADD 1                TO WS-SUB                       CAT660  
               END-IF                                                   CAT660  
           END-PERFORM.                                                 CAT660  
       2970-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
       2982-GET-RR-NAME.                                                CAT660  
           MOVE CLIENT   OF BNWTRAN-REC TO WS-RRNAME-LOOKUP-CLIENT      CAT660  
           MOVE BRANCH-3 OF BNWTRAN-REC TO WS-RRNAME-LOOKUP-BR3         CAT660  
           MOVE ACCT-5   OF BNWTRAN-REC (1:1)                           CAT660  
                                        TO WS-RRNAME-LOOKUP-BR1         CAT660  
           MOVE REG-REP  OF BNWTRAN-REC TO WS-RRNAME-LOOKUP-RR-NO       CAT660  
           MOVE SPACES                  TO WS-RRNAME-LOOKUP-RR-NAME     CAT660  
           IF  BH-MFRS-RR-NAME-LOOKUP-OPT = '2'                         CAT660  
               MOVE SPACES                  TO GETSTREG-CALLING-INFO    CAT660  
               MOVE 'R'                     TO GETSTREG-FUNCTION-IND    CAT660  
               MOVE WS-RRNAME-LOOKUP-CLIENT TO GETSTREG-CLNT-NUM        CAT660  
               MOVE WS-RRNAME-LOOKUP-BR3    TO GETSTREG-BRCH-NUM        CAT660  
               MOVE WS-RRNAME-LOOKUP-RR-NO  TO GETSTREG-RR-NUM          CAT660  
               IF  WS-PREV-RRNAME-LOOKUP-KEY = WS-RRNAME-LOOKUP-KEY     CAT660  
                   IF  BSK-ST-RR-NAME > SPACES                          CAT660  
                       MOVE BSK-ST-RR-NAME TO WS-RRNAME-LOOKUP-RR-NAME  CAT660  
                   END-IF                                               CAT660  
               ELSE                                                     CAT660  
                   CALL  GETSTRGN  USING GETSTREG-CALLING-INFO          CAT660  
                   IF  GETSTREG-SUCCESSFUL                              CAT660  
                       MOVE GETSTREG-STATE-REC TO BSK-ST-REC            CAT660  
                       IF  BSK-ST-RR-NAME > SPACES                      CAT660  
                           MOVE BSK-ST-RR-NAME                          CAT660  
                             TO WS-RRNAME-LOOKUP-RR-NAME                CAT660  
                       END-IF                                           CAT660  
                   END-IF                                               CAT660  
               END-IF                                                   CAT660  
               MOVE WS-RRNAME-LOOKUP-KEY                                CAT660  
                 TO WS-PREV-RRNAME-LOOKUP-KEY                           CAT660  
           ELSE                                                         CAT660  
               IF  BH-MFRS-RR-NAME-LOOKUP-OPT = '1'                     CAT660  
                   MOVE SPACES           TO RRMA-RCRD                   CAT660  
                   MOVE WS-RRNAME-LOOKUP-CLIENT TO RRMA-CLNT            CAT660  
                   MOVE ZEROES           TO RRMA-BRCH-NMBR-5            CAT660  
                   IF  BH-MFRS-RR-SETUP-TYPE = '1'                      CAT660  
                       IF  BH-MFRS-FOUR-DIGIT-BRANCH-OPT = '1'          CAT660  
                           MOVE WS-RRNAME-LOOKUP-BR4                    CAT660  
                             TO RRMA-BRCH-NMBR-4                        CAT660  
                       ELSE                                             CAT660  
                           MOVE WS-RRNAME-LOOKUP-BR3                    CAT660  
                             TO RRMA-BRCH-NMBR-3                        CAT660  
                       END-IF                                           CAT660  
                   END-IF                                               CAT660  
                   MOVE WS-RRNAME-LOOKUP-RR-NO TO RRMA-REG-REP-NMBR     CAT660  
                   IF  WS-PREV-RRMA-KEY = RRMA-KEY                      CAT660  
                       IF  RRMA-REG-REP-NAME > SPACES                   CAT660  
                           MOVE RRMA-REG-REP-NAME                       CAT660  
                             TO WS-RRNAME-LOOKUP-RR-NAME                CAT660  
                       END-IF                                           CAT660  
                   ELSE                                                 CAT660  
                       SET RCRD-FOUND-RRMA TO TRUE                      CAT660  
                       READ RRMA-FILE INVALID KEY                       CAT660  
                            MOVE SPACE TO RCRD-IND-RRMA                 CAT660  
                       END-READ                                         CAT660  
                       IF  WS-FILE-STATUS-OK                            CAT660  
                           IF  RCRD-FOUND-RRMA                          CAT660  
                               MOVE RRMA-REG-REP-NAME                   CAT660  
                                 TO WS-RRNAME-LOOKUP-RR-NAME            CAT660  
                           END-IF                                       CAT660  
                       ELSE                                             CAT660  
                           DISPLAY 'READ RRMA ERROR, FILE STATUS IS = ' CAT660  
                                   WS-FILE-STATUS                       CAT660  
                           MOVE +2982 TO ABEND-CD                       CAT660  
                           CALL  ABEND  USING ABEND-CD                  CAT660  
                       END-IF                                           CAT660  
                   END-IF                                               CAT660  
                   MOVE RRMA-KEY TO WS-PREV-RRMA-KEY                    CAT660  
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
       2982-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
      ******************                                                CAT660  
       6000-READ-IPEND.                                                 CAT660  
      ******************                                                CAT660  
           READ IPEND-FILE                                              CAT660  
                AT END SET END-OF-FILE-IPEND TO TRUE                    CAT660  
           END-READ.                                                    CAT660  
           IF  WS-FILE-STATUS-OK                                        CAT660  
               IF  END-OF-FILE-IPEND                                    CAT660  
                   CONTINUE                                             CAT660  
               ELSE                                                     CAT660  
                   ADD 1                TO WS-CNTR-IPEND                CAT660  
               END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'READ IPEND ERROR, FILE STATUS IS = '            CAT660  
                       WS-FILE-STATUS                                   CAT660  
               MOVE +6000 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
       6000-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
      *************                                                     CAT660  
       6300-GETB1.                                                      CAT660  
      *************                                                     CAT660  
           MOVE SPACES                  TO BH-BROKER-HEADER-INFO        CAT660  
                                           BH-MF-INFO                   CAT660  
TK0008                                     BH-ACAT-INFO                 CAT660  
                                           BH-MF3-INFO                  CAT660  
                                           BH-MF4-INFO                  CAT660  
LRM019     MOVE WS-PREV-CLIENT          TO BH-BROKER-NUMBER-N           CAT660  
           MOVE  '015'                  TO BH-LOGICAL-RECORD-CODE       CAT660  
           MOVE  '434500'               TO BH-B2-INFO-ID                CAT660  
           CALL   GETB1V                USING BH-BROKER-HEADER-INFO,    CAT660  
                                              BH-ACAT-INFO.             CAT660  
                                                                        CAT660  
LRM019     MOVE WS-PREV-CLIENT          TO BH-BROKER-NUMBER-N           CAT660  
           MOVE '015'                   TO BH-LOGICAL-RECORD-CODE       CAT660  
           MOVE '537000'                TO BH-B2-INFO-ID                CAT660  
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO     CAT660  
                                              BH-MF-INFO.               CAT660  
                                                                        CAT660  
LRM019     MOVE WS-PREV-CLIENT          TO BH-BROKER-NUMBER-N           CAT660  
           MOVE  '015'                  TO BH-LOGICAL-RECORD-CODE       CAT660  
           MOVE  '540000'               TO BH-B2-INFO-ID                CAT660  
           CALL   GETB1V                USING BH-BROKER-HEADER-INFO,    CAT660  
                                              BH-MF3-INFO.              CAT660  
                                                                        CAT660  
LRM019     MOVE WS-PREV-CLIENT          TO BH-BROKER-NUMBER-N           CAT660  
           MOVE  '015'                  TO BH-LOGICAL-RECORD-CODE       CAT660  
           MOVE  '538110'               TO BH-B2-INFO-ID                CAT660  
           CALL   GETB1V                USING BH-BROKER-HEADER-INFO,    CAT660  
                                              BH-MF4-INFO.              CAT660  
                                                                        CAT660  
                                                                        CAT660  
TK0008     IF  BH-ACAT-INACTIVE OR BH-ACAT-NOT-FOUND OR                 CAT660  
TK0008         BH-ACAT-MF-FUND-SERV-CLIENT NOT = '1'                    CAT660  
               DISPLAY ' CLIENT IS NOT FUND SERV = '                    CAT660  
                        IPEND-AT-ADP-CL-NO                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
       6300-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
      ***************                                                   CAT660  
       6400-GETMSDC.                                                    CAT660  
      ***************                                                   CAT660  
           SET GETMSD-DEVICE-DISK       TO TRUE                         CAT660  
           SET GETMSD-ACCESS-RANDOM     TO TRUE                         CAT660  
           SET GETMSD-FORMAT-NEW        TO TRUE                         CAT660  
           MOVE SPACE                   TO GETMSD-RETURN-CODE           CAT660  
DJ0003     MOVE LOW-VALUES              TO GETMSD-SEARCH-KEY-AREA       CAT660  
           MOVE CUSIP-9 OF BNWTRAN-REC  TO GETMSD-SEARCH-KEY            CAT660  
           SET GETMSD-WI-REGULAR    TO TRUE                             CAT660  
DJ0003     MOVE IPEND-AT-ADP-CL-NO      TO GETMSD-CLIENT-PL2            CAT660  
           CALL  GETMSDC  USING MASTER-SECURITY-RECORD                  CAT660  
           IF  GETMSD-RETURN-VALID                                      CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'GETMSD ERROR, GETMSD RC = '                     CAT660  
                        GETMSD-RETURN-CODE                              CAT660  
               DISPLAY 'CUSIP: ' CUSIP-9 OF BNWTRAN-REC                 CAT660  
           END-IF.                                                      CAT660  
       6400-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      *****************                                                 CAT660  
       6500-GETNA-RTN.                                                  CAT660  
      *****************                                                 CAT660  
           INITIALIZE  GETNA-PARAMETERS.                                CAT660  
           MOVE 'R'                     TO GETNA-REQ-FUNC.              CAT660  
           MOVE 'R'                     TO GETNA-REQ-FILE.              CAT660  
           MOVE 'R'                     TO GETNA-REQ-FUNC2.             CAT660  
           MOVE 'N'                     TO GETNA-REQ-YEAREND.           CAT660  
           MOVE 'CAT660'                TO GETNA-PGM-NAME.              CAT660  
           MOVE CLIENT   OF BNWTRAN-REC TO GETNA-KEY-CLIENT.            CAT660  
           MOVE '00'                    TO GETNA-KEY-BRANCH1-2.         CAT660  
           MOVE BRANCH-3 OF BNWTRAN-REC TO GETNA-KEY-BRANCH3-5.         CAT660  
           MOVE '00000'                 TO GETNA-KEY-ACCOUNT1-5.        CAT660  
           MOVE ACCT-5   OF BNWTRAN-REC TO GETNA-KEY-ACCOUNT6-10.       CAT660  
           CALL  GETNA                 USING GETNA-PARAMETERS           CAT660  
                                              GETNA-SEGMENT-INCLUDES    CAT660  
           END-CALL.                                                    CAT660  
                                                                        CAT660  
       6500-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
      **********************                                            CAT660  
       6600-READ-IREG-FILE.                                             CAT660  
      **********************                                            CAT660  
                                                                        CAT660  
LRM019     SET NTW-NOT-SHWB-ACCT            TO  TRUE.                           
LRM019     SET NTW-NOT-WAIVE-ACCT           TO  TRUE.                           
TR0002     IF SAVE-CLIENT-NO             NUMERIC         AND            CAT660  
TR0002        CLIENT-NO OF IREG-RECORD   NUMERIC         AND            CAT660  
TR0002        SAVE-CLIENT-NO = CLIENT-NO OF IREG-RECORD  AND            CAT660  
TR0002        SAVE-CUSIP-9   = CUSIP-9   OF IREG-RECORD                 CAT660  
TR0002        CONTINUE                                                  CAT660  
TR0002     ELSE                                                         CAT660  
TR0002        MOVE SPACES                TO IREG-RECORD                 CAT660  
TR0002        MOVE SAVE-CLIENT-NO        TO CLIENT-NO OF IREG-RECORD    CAT660  
TR0002        MOVE SAVE-CUSIP-9          TO CUSIP-9   OF IREG-RECORD    CAT660  
              SET WS-IREG-RECORD-FOUND   TO TRUE                        CAT660  
              READ IREG-FILE                                            CAT660  
                   INVALID KEY MOVE SPACE TO WS-IREG-RECORD-IND         CAT660  
                      DISPLAY 'IREG NOTFND ' REG-OPT-KEY-AREA                   
                      ADD 1 TO WS-CNTR-IREG-NOTFND                              
              END-READ                                                  CAT660  
              IF  WS-FILE-STATUS-OK                                     CAT660  
LRM002            PERFORM 6610-CALL-NTWIO-RTN                           CAT660  
              ELSE                                                      CAT660  
                  DISPLAY 'READ IREG ERROR, FILE STATUS IS = '          CAT660  
                           WS-FILE-STATUS                               CAT660  
                  MOVE +6600 TO ABEND-CD                                CAT660  
                  CALL  ABEND  USING ABEND-CD                           CAT660  
              END-IF                                                    CAT660  
TR0002     END-IF.                                                      CAT660  
                                                                        CAT660  
       6600-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
LRM002 6610-CALL-NTWIO-RTN.                                             CAT660  
LRM019     SET NTW-NOT-SHWB-ACCT            TO  TRUE.                           
LRM019     SET NTW-NOT-WAIVE-ACCT           TO  TRUE.                           
LRM002     IF (OMNIBUS-PROCESSING OF IREG-RECORD                        CAT660  
LRM005           OR DST-DIRECT OF IREG-RECORD                           CAT660  
LRM009           OR  PNC-SURPAS-PROCESSING  OF IREG-RECORD)             CAT660  
LRM002     AND BH-MF-ACTIVE                                             CAT660  
LRM002     AND BH-MFN-OMNIBUS-MULTI-PLAT-OPT = '1'                      CAT660  
LRM002        MOVE 'R'                 TO NTWIO-FUNCTION-CODE           CAT660  
LRM002        MOVE SAVE-CLIENT-NO      TO NTWIO-CLIENT                  CAT660  
LRM002        MOVE CUSIP-9 OF IREG-RECORD TO NTWIO-CUSIP-9              CAT660  
LRM002        IF MS-SYMBOL > SPACES                                     CAT660  
LRM002           MOVE MS-SYMBOL        TO NTWIO-SYMBOL                  CAT660  
LRM002        ELSE                                                      CAT660  
LRM002           MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL                  CAT660  
LRM002        END-IF                                                    CAT660  
LRM002        MOVE IPEND-AT-CUST-ACCOUNT (1:3) TO WS-CKDIG-BRCH         CAT660  
LRM002        MOVE IPEND-AT-CUST-ACCOUNT (4:5) TO WS-CKDIG-ACCT         CAT660  
LRM002        EVALUATE TRUE                                             CAT660  
LRM002            WHEN IPEND-CASH-ACT                                   CAT660  
LRM002                 MOVE 1 TO WS-CKDIG-ACCT-TYPE                     CAT660  
LRM002            WHEN IPEND-MARGIN-ACT                                 CAT660  
LRM002                 MOVE 2 TO WS-CKDIG-ACCT-TYPE                     CAT660  
LRM002            WHEN IPEND-SHORT-ACT                                  CAT660  
LRM002                 MOVE 5 TO WS-CKDIG-ACCT-TYPE                     CAT660  
LRM002        END-EVALUATE                                              CAT660  
LRM002        CALL  CKDIGIT  USING WS-CKDIG-ACCT-ID                     CAT660  
LRM002                             WS-CKDIG-NO-OF-DIGIT                 CAT660  
LRM002                             WS-CKDIG-CHCK-DGIT                   CAT660  
LRM002        MOVE WS-CKDIG-ACCT-ID    TO NTWIO-ACCT-ID                 CAT660  
LRM002        DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS    CAT660  
LRM002        CALL  BNWNTWIO  USING NTWIO-PARAMETERS                    CAT660  
LRM002        IF NTWIO-RETURN-OK                                        CAT660  
LRM002           MOVE NTWIO-PROCESSING-CODE                             CAT660  
LRM002                TO PROCESSING-CODE OF IREG-RECORD                 CAT660  
LRM002           DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE TO '           CAT660  
LRM002                NTWIO-PROCESSING-CODE                             CAT660  
LRM019           IF TBL-MNT-SOURCE-SHWB                                         
TEST                DISPLAY 'HAVE SHWB ON TBL MAINT ' NTWIO-SYMBOL              
TEST                   ' WAIVE=' TBL-WAIVE-ACCT                                 
TEST                   ' PRVT7=' NNARPA-PRVT-FLD(7)                             
TEST                   ' B1=' BH-MF-WRAP-ACCT-CODES                             
LRM019              SET NTW-SHWB-ACCT          TO  TRUE                         
LRM019              IF TBL-WAIVE-ACCT > SPACE                                   
LRM019              AND NOT NNARPA-SEGMENT-MISSING                              
LRM019              AND NNARPA-PRVT-FLD(7) > SPACES                             
LRM019              PERFORM VARYING SUB FROM 1 BY 1                             
LRM019               UNTIL SUB > BH-MF-WRAP-ACCT-CODES-NO                       
LRM019                OR BH-MF-WRAP-ACCT-CODE(SUB) = NNARPA-PRVT-FLD(7)         
LRM019              END-PERFORM                                                 
LRM019              IF SUB NOT > BH-MF-WRAP-ACCT-CODES-NO                       
LRM019*************   MOVE TBL-WAIVE-ACCT    TO  ACCT-ID                        
LRM019                SET NTW-WAIVE-ACCT         TO  TRUE                       
TEST                  DISPLAY 'FOUND WAIVE ACCT ' TBL-WAIVE-ACCT                
LRM019              END-IF                                                      
LRM019           END-IF                                                         
LRM002        ELSE                                                      CAT660  
LRM002           DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE              CAT660  
LRM002        END-IF                                                    CAT660  
LRM002     END-IF.                                                      CAT660  
      *****************                                                 CAT660  
       8000-INITIALIZE.                                                 CAT660  
      *****************                                                 CAT660  
                                                                        CAT660  
           MOVE  'CAT660P'              TO BPDATES-CALLING-PGM.         CAT660  
           MOVE  'C'                    TO BPDATES-REQ-TYPE.            CAT660  
                                                                        CAT660  
           CALL   BPDATES            USING BPDATES-PARAMETERS.          CAT660  
                                                                        CAT660  
           MOVE BPD-PROC-DATE           TO WS-PROC-DATE-CCYYMMDD        CAT660  
           MOVE WS-PROC-CCYYMMDD-MM     TO WS-PROC-MMDDYY-MM            CAT660  
           MOVE WS-PROC-CCYYMMDD-DD     TO WS-PROC-MMDDYY-DD            CAT660  
           MOVE WS-PROC-CCYYMMDD-YY     TO WS-PROC-MMDDYY-YY            CAT660  
                                                                        CAT660  
TR0001     INITIALIZE BPDATES-PARAMETERS.                               CAT660  
                                                                        CAT660  
TR0001     MOVE 'CAT660P'                   TO  BPDATES-CALLING-PGM.    CAT660  
TR0001     MOVE 'D'                         TO  BPDATES-REQ-TYPE.       CAT660  
TR0001     MOVE '  '                        TO  BPDATES-CALENDAR-TYPE.  CAT660  
TR0001     MOVE WS-PROC-DATE-CCYYMMDD       TO  BPDATES-BASE-DATE.      CAT660  
TR0001     MOVE 'M'                         TO  BPDATES-DTSEARCH-IND.   CAT660  
TR0001     MOVE 'T'                         TO  BPDATES-DTSEARCH-TYPE.  CAT660  
TR0001     MOVE 6                           TO  BPDATES-DTSEARCH-DISP.  CAT660  
                                                                        CAT660  
TR0001     CALL  BPDATES                 USING  BPDATES-PARAMETERS.     CAT660  
TR0001     MOVE WS-PROC-DATE-CCYYMMDD       TO  BPD-PROC-DATE.          CAT660  
                                                                        CAT660  
TR0001     IF NOT BPD-VALID-RETURN                                      CAT660  
TR0001        DISPLAY '************************************************'CAT660  
TR0001        DISPLAY '*DTSEARCH VIA BPDATES FAILES, RETURN CODE = '    CAT660  
TR0001                  BPDATES-RETURN-CODE ' *'                        CAT660  
TR0001        DISPLAY '************************************************'CAT660  
TR0001        MOVE '00010101'               TO WS-DTSEARCH-DATE-CCYYMMDDCAT660  
TR0001     ELSE                                                         CAT660  
TR0001        MOVE BPD-DT-CALDATE           TO WS-DTSEARCH-DATE-CCYYMMDDCAT660  
TR0001     END-IF.                                                      CAT660  
                                                                        CAT660  
DJ0001     DISPLAY 'WS-PROC-DATE-CCYYMMDD     = ' WS-PROC-DATE-CCYYMMDD CAT660  
DJ0001     DISPLAY 'BPD-PROC-DATE             = ' BPD-PROC-DATE         CAT660  
DJ0001     DISPLAY 'WS-DTSEARCH-DATE-CCYYMMDD = '                       CAT660  
DJ0001              WS-DTSEARCH-DATE-CCYYMMDD                           CAT660  
                                                                        CAT660  
           OPEN INPUT  IPEND-FILE.                                      CAT660  
           IF  WS-FILE-STATUS-OK                                        CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'OPEN IPEND ERROR, FILE STATUS IS = '            CAT660  
                        WS-FILE-STATUS                                  CAT660  
               MOVE +0002 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
           OPEN INPUT  NSCC-IN-FILE.                                            
                                                                                
           OPEN INPUT  IREG-FILE.                                       CAT660  
           IF  WS-FILE-STATUS-OK                                        CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'OPEN IREG ERROR, FILE STATUS IS = '             CAT660  
                        WS-FILE-STATUS                                  CAT660  
               MOVE +0004 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
           OPEN INPUT  RRMA-FILE.                                       CAT660  
           IF  WS-FILE-STATUS-OK                                        CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'OPEN RRMA ERROR, FILE STATUS IS = '             CAT660  
                        WS-FILE-STATUS                                  CAT660  
               MOVE +0005 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
           MOVE 'O'                     TO GETNA-REQ-FUNC.              CAT660  
           MOVE 'R'                     TO GETNA-REQ-FILE.              CAT660  
           MOVE 'R'                     TO GETNA-REQ-FUNC2.             CAT660  
           MOVE 'N'                     TO GETNA-REQ-YEAREND.           CAT660  
           MOVE 'CAT660P'               TO GETNA-PGM-NAME.              CAT660  
           CALL   GETNA                 USING GETNA-PARAMETERS          CAT660  
                                              GETNA-SEGMENT-INCLUDES    CAT660  
           END-CALL                                                     CAT660  
           IF  GETNA-RETURN-CODE = SPACE                                CAT660  
               CONTINUE                                                 CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'GETNA OPEN ERROR, GETNA RC = '                  CAT660  
                        GETNA-RETURN-CODE                               CAT660  
               MOVE +0006 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
           OPEN OUTPUT  BNWTRAN-FILE                                    CAT660  
           IF  WS-FILE-STATUS-OK                                        CAT660  
               MOVE LOW-VALUES          TO TRAN-HEADER-RECORD           CAT660  
               MOVE 'DATE='             TO TRAN-HDR-DATE-LITERAL        CAT660  
               MOVE WS-PROC-DATE-MMDDYY TO TRAN-HDR-PROCESS-DATE        CAT660  
               MOVE 'TIME='             TO TRAN-HDR-TIME-LITERAL        CAT660  
               ACCEPT TRAN-HDR-TIME     FROM TIME                       CAT660  
LRM001***      MOVE 'CAT660P'           TO  TRAN-HDR-CREATION-PROG      CAT660  
LRM001***      WRITE BNWTRAN-RECORD     FROM TRAN-HEADER-RECORD         CAT660  
LRM001***      IF  WS-FILE-STATUS-OK                                    CAT660  
LRM001***          CONTINUE                                             CAT660  
LRM001***      ELSE                                                     CAT660  
LRM001***          DISPLAY 'BNWTRANO FILE WRITE ERROR, STATUS = '       CAT660  
LRM001***                   WS-FILE-STATUS                              CAT660  
LRM001***          MOVE +0011 TO ABEND-CD                               CAT660  
LRM001***          CALL  ABEND  USING ABEND-CD                          CAT660  
LRM001***      END-IF                                                   CAT660  
           ELSE                                                         CAT660  
               DISPLAY 'OPEN BNWTRANO ERROR, FILE STATUS IS = '         CAT660  
                        WS-FILE-STATUS                                  CAT660  
               MOVE +0012 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           END-IF.                                                      CAT660  
                                                                        CAT660  
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                       CAT660  
LRM002     MOVE  'CAT660P'   TO NTWIO-PGM-NAME.                         CAT660  
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                    CAT660  
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                     CAT660  
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                       CAT660  
                                                                        CAT660  
       8000-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
           EXIT.                                                        CAT660  
      ********************                                              CAT660  
       8100-CHECK-HEADER.                                               CAT660  
      ********************                                              CAT660  
           IF  END-OF-FILE-IPEND                                        CAT660  
               DISPLAY 'IPEND IS EMPTY'                                 CAT660  
               MOVE +0100 TO ABEND-CD                                   CAT660  
               CALL  ABEND  USING ABEND-CD                              CAT660  
           ELSE                                                         CAT660  
               IF  BYPASS-DATE-CHK                                      CAT660  
                   CONTINUE                                             CAT660  
               ELSE                                                     CAT660  
                   IF  IPEND-BOOK-DATE = BPD-PROC-DATE                  CAT660  
                       CONTINUE                                         CAT660  
                   ELSE                                                 CAT660  
                       DISPLAY 'IPEND HEADER DATE NOT = PROCESS DATE'   CAT660  
                       DISPLAY 'IPEND HEADER DATE: ' IPEND-BOOK-DATE    CAT660  
                       DISPLAY 'PROCESS DATE     : ' BPD-PROC-DATE      CAT660  
                       MOVE +0102 TO ABEND-CD                           CAT660  
                       CALL  ABEND  USING ABEND-CD                      CAT660  
                   END-IF                                               CAT660  
               END-IF                                                   CAT660  
           END-IF.                                                      CAT660  
       8100-EXIT.                                                       CAT660  
           EXIT.                                                        CAT660  
                                                                        CAT660  
      ****************                                                  CAT660  
       9000-EOJ.                                                        CAT660  
      ****************                                                  CAT660  
                                                                        CAT660  
           CLOSE  IPEND-FILE                                            CAT660  
                  NSCC-IN-FILE                                                  
                  IREG-FILE                                             CAT660  
                  RRMA-FILE                                             CAT660  
                  BNWTRAN-FILE.                                         CAT660  
                                                                        CAT660  
DJ0001     DISPLAY ' '                                                  CAT660  
           DISPLAY 'NO. OF NSCCIN   RECORDS : ' WS-CNTR-NSCCIN          CAT660  
           DISPLAY 'NO. OF IPEND    RECORDS : ' WS-CNTR-IPEND           CAT660  
           DISPLAY 'NO. OF IREG NOT FOUND   : ' WS-CNTR-IREG-NOTFND     CAT660  
           DISPLAY 'NO. OF BNWTRAN  RECORDS : ' WS-CNTR-BNWTRAN.        CAT660  
                                                                        CAT660  
           DISPLAY ' '                                                  CAT660  
           DISPLAY '***************************'                        CAT660  
           DISPLAY '* END OF CAT660P PROGRAM *'                         CAT660  
           DISPLAY '***************************'                        CAT660  
           DISPLAY ' '.                                                 CAT660  
      *******************                                               CAT660  
       SQL-ERROR-ROUTINE.                                               CAT660  
      *******************                                               CAT660  
                                                                        CAT660  
DJ0001     MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT660  
           DISPLAY 'SQLCODE IS ' W-DB2-SQLCODE                          CAT660  
                                                                        CAT660  
           CALL DSNTIAR               USING  SQLCA                      CAT660  
                                             WS-DB2-MESSAGE-AREA        CAT660  
                                             WS-ERR-LINE-LEN            CAT660  
                                                                        CAT660  
           DISPLAY ' '                                                  CAT660  
                                                                        CAT660  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT660  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT660  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT660  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT660  
                 END-IF                                                 CAT660  
           END-PERFORM                                                  CAT660  
                                                                        CAT660  
           DISPLAY ' '                                                  CAT660  
DJ0001     DISPLAY 'CAT660P: U3999 - ABENDING ON BAD DB2 STATUS'        CAT660  
           DISPLAY ' '                                                  CAT660  
                                                                        CAT660  
           MOVE +3999 TO ABEND-CD                                       CAT660  
           CALL  ABEND  USING ABEND-CD          .                       CAT660  
       COPY BNWTAXWP.                                                   CAT660  
