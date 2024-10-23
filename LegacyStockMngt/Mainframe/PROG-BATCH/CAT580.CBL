000001* PDX    - CAT580   C0348882 12/06/13 06:47:24 TBCHKOP            00001000
      * CSG001 SSR 91356  MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 
000001* PDX    - CAT580   C0324918 04/03/12 13:28:29 TBLAMUR            00001000
      * LRM008 SSR 83069 REMOVE QA LOGIC FOR PROCESSING TDY MINUS 1.            
000001* PDX    - CAT580   C0282585 06/17/09 15:28:32 TBLAMUR            00001000
000001* LRM007 TSK 65488 QA ONLY, ADD 1 TO FUNDSERV PRCS-DT TO CAUSE    CAT580  
000001* LRM007 FAILS TO SETUP.                                          CAT580  
000001* PDX    - CAT580   C0278902 03/30/09 10:06:35 TBLAMUR            00001000
000001* LRM006 SSR 64085 PTF RECEIVER ASSET COMES IN WITH QTY=0 FROM    CAT580  
      *   FULL-PULL.  REPLACE VASSET QTY WITH ORIGINAL QTY ON SIAC0720. CAT580  
      *   THIS IS DONE FOR PTF AND QTY=0 ONLY.                                  
000001* PDX    - CAT580   C0249006 06/29/07 12:13:15 TBDOJUN            00001000
      * DJ0003 SSR 47339 SUPPORT DUALLY LISTED SECURITIES               CAT580  
      * DJ0003           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD CAT580  
000001* PDX    - CAT580   C0227086 11/02/05 08:12:19 TBLAMUR            00001000
LRM005* SSR 0032638 CAUSE RC=12 IF PRODUCTION FUNDSERV LESS 100 RECORDS         
000001* PDX    - CAT580   C0222725 06/24/05 08:59:14 TBLAMUR            00001000
      * SSR 0040438 WM PROCESS (FIX CLIENT 1235 LOOKUP)                         
000001* PDX    - CAT580   C0203711 01/07/05 15:01:50 TBLAMUR            00001000
      * LRM004 - SSR 0037159 UBS CL 235 (WM) WEALTH MNGT ACCOUNTS.              
      * LRM004 - USE CLIENT 1235 TO ISOLATE BASED ON B1 032977.                 
000001* PDX    - CAT580   C0182369 11/08/02 16:18:28 TBLAMUR            00001000
      * LRM003 FOR Q STREAM, ONLY PROCESS INPUT WHEN DATE IS PRIOR      CAT580  
000001* PDX    - CAT580   C0155175 03/02/01 11:38:26 TBDOJUN            00001000
000001* PDX    - CAT580   C0151178 12/18/00 08:39:38 TBDOJUN            00001000
      * DJ0002 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE     CAT580  
      *                   REMOVE VFNDRGST CODING.  NOT USED ANYMORE.    CAT580  
000001* PDX    - CAT580   C0125263 06/14/99 13:32:56 TBDOJUN            CAT580  
000001* 05/10/99 DJ       RECOMPILED FOR FOREIGN KEY REMOVED            CAT580  
000001*                   FROM VFNDRGST                                 CAT580  
000001* PDX    - CAT580   C0121596 02/17/99 10:32:28 TBELPIN            CAT580  
000001* PDX    - CAT580   C0120335 01/28/99 15:02:17 TBELPIN            CAT580  
000001* PDX    - CAT580   C0119254 01/20/99 13:57:58 TBELPIN            CAT580  
000001* PDX    - CAT580   C0120335 01/14/99 17:14:42 TBELPIN            CAT580  
000001* PDX    - CAT580   C0119254 01/08/99 16:17:46 TBELPIN            CAT580  
       IDENTIFICATION DIVISION.                                         CAT580  
       PROGRAM-ID.  CAT580.                                             CAT580  
       AUTHOR.     JULIETA CASIN.                                       CAT580  
      ***************************************************************** CAT580  
      * THIS PROGRAM CONTAINS DB2.                                    * CAT580  
      ***************************************************************** CAT580  
      * CAT580 - PROCESS SIAC0720 TRANSMISSION FROM NSCC.             * CAT580  
      *                                                               * CAT580  
      *        - UPDATE/INSERT FUND/SERV STAT TABLE.                  * CAT580  
ENP001*        - UPDATE        FUND/SERV MF   TABLE.                  * CAT580  
      *                                                               * CAT580  
      *                                                               * CAT580  
      ***************************************************************** CAT580  
      * 01/08/99       NEW PROGRAM                                    * CAT580  
      ***************************************************************** CAT580  
      /                                                                 CAT580  
       ENVIRONMENT DIVISION.                                            CAT580  
       INPUT-OUTPUT SECTION.                                            CAT580  
       FILE-CONTROL.                                                    CAT580  
                                                                        CAT580  
           SELECT INFILE           ASSIGN       TO INFILE               CAT580  
                                   FILE STATUS  IS INFILE-STAT.         CAT580  
                                                                        CAT580  
           SELECT STAT-SEQ-FILE    ASSIGN       TO OSTATFL.             CAT580  
                                                                        CAT580  
      /                                                                 CAT580  
       DATA DIVISION.                                                   CAT580  
       FILE SECTION.                                                    CAT580  
       FD  INFILE                                                       CAT580  
           RECORDING MODE IS V                                          CAT580  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT580  
              DEPENDING ON W-REC-LEN-IN                                 CAT580  
           BLOCK CONTAINS 0 RECORDS.                                    CAT580  
                                                                        CAT580  
       01  IN-RECORD                   PIC X(520).                      CAT580  
                                                                        CAT580  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT580  
                                                                        CAT580  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT580  
                                                                        CAT580  
       01  DUMMY-LARGE-RECORD         PIC X(4000).                      CAT580  
                                                                        CAT580  
       FD  STAT-SEQ-FILE                                                CAT580  
           RECORDING MODE IS F                                          CAT580  
           BLOCK CONTAINS 0 RECORDS                                     CAT580  
           LABEL RECORDS ARE STANDARD.                                  CAT580  
                                                                        CAT580  
       01  STAT-RECORD                 PIC X(520).                      CAT580  
                                                                        CAT580  
      /                                                                 CAT580  
       WORKING-STORAGE SECTION.                                         CAT580  
       COPY PDXIDCOB.                                                   CAT580  
                                                                        CAT580  
       01  W-FIELDS.                                                    CAT580  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT580'.    CAT580  
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT580  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT580  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT580  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT580  
               88 END-OF-INFILE                      VALUE '1'.         CAT580  
LRM003         88 SKIP-ALL-INPUT                     VALUE 'S'.                 
           05  INFILE-STAT               PIC  X(002).                   CAT580  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT580  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT580  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT580  
           05  OUTFILE-STAT              PIC  X(002).                   CAT580  
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT580  
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT580  
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT580  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT580  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT580  
LRM006     05  STOP-VASSET-SW            PIC  X(001) VALUE ' '.         CAT580  
LRM006         88 STOP-VASSET                        VALUE 'Y'.         CAT580  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT580  
           05  FILLER  REDEFINES                                        CAT580  
               W-SYS-DATE.                                              CAT580  
               10  W-UPD-DATE            PIC  X(006).                   CAT580  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT580  
           05  FILLER  REDEFINES                                        CAT580  
               W-SYS-TIME.                                              CAT580  
               10  W-UPD-TIME            PIC  X(006).                   CAT580  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT580  
           05  LD-PROC-DATE.                                            CAT580  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT580  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT580  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT580  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT580  
               88 HDR-FOUND                          VALUE 'H'.         CAT580  
               88 TRL-FOUND                          VALUE 'T'.         CAT580  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT580  
               88 BRK-FOUND                          VALUE 'Y'.         CAT580  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT580  
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'OUTPUTCT'.  CAT580  
           05  W-OUTFILE-CNT             PIC  9(009) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT580  
           05  W-DETAIL-CNT              PIC  9(009) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT580  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.  CAT580  
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT580  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.  CAT580  
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.           CAT580  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT580  
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.           CAT580  
           05  W-SQL-CNT                 PIC  9(009) VALUE 0.           CAT580  
           05  W-NON-DETAIL-CNT          PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-ADD-CNT        PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-NOT-ADD-CNT    PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-UPD-CNT        PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-NOT-UPD-CNT    PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-DEL-CNT        PIC  9(009) VALUE 0.           CAT580  
           05  W-VFNDSRVS-NOT-DEL-CNT    PIC  9(009) VALUE 0.           CAT580  
           05  W-VMF-UPD-CNT             PIC  9(009) VALUE 0.           CAT580  
           05  W-VMF-NOT-UPD-CNT         PIC  9(009) VALUE 0.           CAT580  
           05  W-MSD-FND-CNT             PIC  9(009) VALUE 0.           CAT580  
           05  W-MSD-NOTFND-CNT          PIC  9(009) VALUE 0.           CAT580  
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.         CAT580  
               88 W-MSD-NOTFND                       VALUE 'Y'.         CAT580  
           05  W-DATE.                                                  CAT580  
               07  W-DATE-YEAR           PIC  X(04).                    CAT580  
               07  FILLER                PIC  X(01) VALUE '-'.          CAT580  
               07  W-DATE-MM             PIC  X(02).                    CAT580  
               07  FILLER                PIC  X(01) VALUE '-'.          CAT580  
               07  W-DATE-DD             PIC  X(02).                    CAT580  
           05  W-NSCC-DATE.                                             CAT580  
               07  W-NSCC-DATE-YEAR      PIC  X(04).                    CAT580  
               07  W-NSCC-DATE-MM        PIC  X(02).                    CAT580  
               07  W-NSCC-DATE-DD        PIC  X(02).                    CAT580  
           05  W-CERT-DATE.                                             CAT580  
               07  W-CERT-DATE-MM        PIC  X(02).                    CAT580  
               07  W-CERT-DATE-DD        PIC  X(02).                    CAT580  
               07  W-CERT-DATE-YEAR      PIC  X(04).                    CAT580  
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           CAT580  
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           CAT580  
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           CAT580  
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           CAT580  
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         CAT580  
                                                                        CAT580  
           05  W-QTY-X.                                                 CAT580  
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         CAT580  
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     CAT580  
                                                                        CAT580  
           05  W-QTY-N                   PIC 9(13)V9(4).                CAT580  
           05  FILLER REDEFINES W-QTY-N.                                CAT580  
               07  W-QTY-INT             PIC 9(13).                     CAT580  
               07  W-QTY-DEC             PIC 9(04).                     CAT580  
                                                                        CAT580  
           05  W-INT                     PIC 9(17).                     CAT580  
           05  W-INT-X REDEFINES W-INT.                                 CAT580  
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         CAT580  
                                                                        CAT580  
           05  W-DEC                     PIC 9(04).                     CAT580  
           05  W-DEC-X REDEFINES W-DEC.                                 CAT580  
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'NSCC SEQ'.   CAT580  
       01  WS-STAT-RECORD.                                              CAT580  
           05  WS-STAT-KEY.                                             CAT580  
               10  WS-STAT-CLIENT            PIC 9(03).                 CAT580  
               10  WS-STAT-ACATS-CTRL-NBR    PIC X(14).                 CAT580  
               10  WS-STAT-ASSET-SEQ-NBR     PIC 9(04).                 CAT580  
               10  WS-STAT-LCTN-CD           PIC X(02).                 CAT580  
           05  WS-STAT-DATA                  PIC X(490).                CAT580  
           05  FILLER                        PIC X(07).                 CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'F - NSCC'.   CAT580  
           COPY NSCCF.                                                  CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.   CAT580  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.         CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.   CAT580  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.         CAT580  
      /                                                                 CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   CAT580  
       01  W-TAB-CNT                     PIC  9(003) VALUE 0.           CAT580  
       01  W-TAB-AREA.                                                  CAT580  
           05  W-TAB OCCURS 500 TIMES INDEXED BY TAB-X.                 CAT580  
               10 W-TAB-STREAM-CD            PIC X(001).                CAT580  
               10 W-TAB-CLIENT-NBR           PIC X(004).                CAT580  
               10 W-TAB-BRK-NBR              PIC X(004).                CAT580  
               10 W-TAB-HDR-SW               PIC X(001).                CAT580  
               10 W-TAB-HDR-DATE             PIC X(008).                CAT580  
               10 W-TAB-HDR-CYCLE            PIC X(004).                CAT580  
               10 W-TAB-TRL-SW               PIC X(001).                CAT580  
               10 W-TAB-TRL-DATE             PIC X(008).                CAT580  
               10 W-TAB-TRL-CYCLE            PIC X(004).                CAT580  
               10 W-TAB-ITEM-CNT             PIC 9(009).                CAT580  
               10 W-TAB-TOT-CNT              PIC 9(009).                CAT580  
                                                                        CAT580  
       01  FILLER                        PIC X(047) VALUE ' '.          CAT580  
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.   CAT580  
       01  W-CURR-TAB.                                                  CAT580  
           05  W-CURR-STREAM-CD              PIC X(001).                CAT580  
           05  W-CURR-CLIENT-NBR             PIC X(004).                CAT580  
DJ0003     05  W-CURR-CLIENT-NUM REDEFINES                              CAT580  
DJ0003         W-CURR-CLIENT-NBR             PIC 9(004).                CAT580  
           05  W-CURR-BRK-NBR                PIC X(004).                CAT580  
           05  W-CURR-HDR-SW                 PIC X(001).                CAT580  
           05  W-CURR-HDR-DATE               PIC X(008).                CAT580  
           05  W-CURR-HDR-CYCLE              PIC X(004).                CAT580  
           05  W-CURR-TRL-SW                 PIC X(001).                CAT580  
           05  W-CURR-TRL-DATE               PIC X(008).                CAT580  
           05  W-CURR-TRL-CYCLE              PIC X(004).                CAT580  
           05  W-CURR-ITEM-CNT               PIC 9(009).                CAT580  
           05  W-CURR-TOT-CNT                PIC 9(009).                CAT580  
                                                                        CAT580  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT580  
       01  B1-WORK-FIELEDS.                                             CAT580  
           03  B1-TBL-CNT                   PIC 9(03).                  CAT580  
           03  B1-SUB                       PIC 9(03).                  CAT580  
       01  B1-TABLE-AREA.                                               CAT580  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT580  
               05  B1-ADP-CL-NO             PIC 9(04).                  CAT580  
               05  B1-CLI-NAME              PIC X(30).                  CAT580  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT580  
               05  B1-STREAM                PIC X(01).                  CAT580  
               05  B1-STATUS                PIC X(01).                  CAT580  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT580  
      /                                                                 CAT580  
      ******************************************************************CAT580  
      * B1 HEADER                                                      *CAT580  
      ******************************************************************CAT580  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT580  
           COPY BHINFO.                                                 CAT580  
      /                                                                 CAT580  
      ******************************************************************CAT580  
      * B1 ACAT SECTION                                                *CAT580  
      ******************************************************************CAT580  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT580  
           COPY BHACAT.                                                 CAT580  
                                                                                
LRM004     COPY BHREQ.                                                          
      ******************************************************************CAT580  
      * GETMSD COMMAREA                                                *CAT580  
      ******************************************************************CAT580  
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    CAT580  
           COPY GETMSDCE.                                               CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT580  
                                                                        CAT580  
LRM007 01  DAY-SUB                       PIC  S9(04) COMP.                      
LRM007 01  WS-BPD-PROC-DATE              PIC X(08).                     CAT580  
           COPY BPDATESC.                                               CAT580  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT580  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT580  
      /                                                                 CAT580  
       01  FILLER                        PIC X(008) VALUE 'VFNDSRVS'.   CAT580  
           EXEC SQL INCLUDE VFNDSRVS     END-EXEC.                      CAT580  
                                                                        CAT580  
       01  FILLER                        PIC X(008) VALUE 'VMF'.        CAT580  
           EXEC SQL INCLUDE VMF          END-EXEC.                      CAT580  
                                                                        CAT580  
LRM006 01  FILLER                        PIC X(008) VALUE 'VASSET'.     CAT580  
                                                                                
LRM006     EXEC SQL INCLUDE VASSET       END-EXEC.                      CAT580  
LRM006                                                                  CAT580  
LRM006     EXEC SQL                                                             
LRM006        DECLARE AT_CRSR CURSOR WITH HOLD FOR                              
LRM006           SELECT                                                         
LRM006             CLIENT_NBR                                                   
LRM006            ,ACAT_CONTROL_NBR                                             
LRM006            ,ASSET_SEQ_NBR                                                
LRM006           FROM VASSET                                                    
LRM006           WHERE (TRNFR_TYPE_CD = 'PTF'       AND                         
LRM006                  ASSET_QTY = 0.00)                                       
LRM006     END-EXEC.                                                            
                                                                                
       01  W-DB2-MESSAGE-AREA.                                          CAT580  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT580  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT580  
                   INDEXED BY W-DB2-IDX.                                CAT580  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT580  
                                                                        CAT580  
       01  W-DB2-WORKAREA.                                              CAT580  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT580  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT580  
               88  ROLLBACK-OK                VALUE +0.                 CAT580  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT580  
                                                    +1   THRU +999.     CAT580  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT580  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT580  
               88  COMMIT-OK                  VALUE +0.                 CAT580  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT580  
                                                    +1   THRU +999.     CAT580  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT580  
                                              VALUE 0.                  CAT580  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           CAT580  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT580  
           05  W-DB2-ACTION              PIC  X(008).                   CAT580  
           05  W-DB2-SQLCODE             PIC  ---9.                     CAT580  
                                                                        CAT580  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT580  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT580  
      /                                                                 CAT580  
DJ0002***===> COBOL LE                                                  CAT580  
DJ0002 01  W-ABEND-AREA.                                                CAT580  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT580  
DJ0002 01  CALL-MODULES.                                                CAT580  
DJ0002     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT580  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT580  
DJ0002     COPY STUBCPY.                                                CAT580  
DJ0002***<=== COBOL LE                                                  CAT580  
                                                                        CAT580  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT580  
      /                                                                 CAT580  
      ***************************************************************** CAT580  
      *    LINKAGE SECTION                                            * CAT580  
      ***************************************************************** CAT580  
       LINKAGE SECTION.                                                 CAT580  
       01  L-JCL-PARMS.                                                 CAT580  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT580  
LRM007     05  PARM-STREAM-IND          PIC  X(01).                             
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT580  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT580  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT580  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT580  
LRM005     05  L-BYP-REC-CNT-SW          PIC  X(001).                   CAT580  
LRM005         88  L-BYP-REC-CNT                     VALUE '1'.         CAT580  
                                                                        CAT580  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT580  
      *                         ===========                             CAT580  
       0000-MAIN SECTION.                                               CAT580  
           DISPLAY 'CAT580 - PROCESS ACATS FUND/SERV STATISTICS FILE'.  CAT580  
           DISPLAY '         INPUT = BZZZ.SIAC0720.ACAT.FUND'.          CAT580  
           DISPLAY '         UPDATE/INSERT VFNDSRVS DATABASE'.          CAT580  
           DISPLAY ' '.                                                 CAT580  
           COPY MSGCOBO.                                                CAT580  
           DISPLAY ' '.                                                 CAT580  
                                                                        CAT580  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT580  
           PERFORM 1500-LOAD-B1        THRU 1500-EXIT.                  CAT580  
           PERFORM 1600-LOAD-TABLE     THRU 1600-EXIT.                  CAT580  
           DISPLAY '2000-PROCESS - EDITING NSCC FILE'.                  CAT580  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT580  
           PERFORM 2000-PROCESS        THRU 2000-EXIT                   CAT580  
                   UNTIL END-OF-INFILE.                                 CAT580  
LRM006     PERFORM 7050-LOOKUP-PTF-QTY                                          
           PERFORM 9100-CLOSE-ROUTINE  THRU 9100-EXIT.                  CAT580  
                                                                        CAT580  
           GOBACK.                                                      CAT580  
      /                                                                 CAT580  
       1000-INIT SECTION.                                               CAT580  
                                                                        CAT580  
           EXEC SQL                                                     CAT580  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT580  
           END-EXEC                                                     CAT580  
                                                                        CAT580  
           MOVE SQLCODE TO W-DB2-SQLCODE                                CAT580  
           IF  SQLCODE = +0                                             CAT580  
               DISPLAY ' '                                              CAT580  
               DISPLAY 'CAT580: W-CURRENT-TIMESTAMP = '                 CAT580  
                                                    W-CURRENT-TIMESTAMP CAT580  
               DISPLAY ' '                                              CAT580  
           ELSE                                                         CAT580  
               DISPLAY '      SQLCODE = ' W-DB2-SQLCODE                 CAT580  
               PERFORM  8000-SQL-ERROR THRU 9000-EXIT                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT580  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT580  
           DISPLAY 'CAT580: SYS-DATE ' W-SYS-DATE                       CAT580  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT580  
                                                                        CAT580  
           DISPLAY ' '.                                                 CAT580  
           DISPLAY 'CAT580: L-BYP-DATECHK-SW = '                        CAT580  
                            L-BYP-DATECHK-SW                            CAT580  
           ' (1=BYPASS DATE CHECK)'                                     CAT580  
           DISPLAY 'CAT580: L-BYP-FILECHK-SW = '                        CAT580  
                            L-BYP-FILECHK-SW                            CAT580  
           ' (1=BYPASS FILE CHECK)'                                     CAT580  
           IF  L-BYP-DATECHK                                            CAT580  
               DISPLAY 'CAT580: DATE CHECK WILL BE BYPASSED'            CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: DATE CHECK WILL BE PERFORMED'           CAT580  
           END-IF.                                                      CAT580  
           IF  L-BYP-FILECHK                                            CAT580  
               DISPLAY 'CAT580: FILE CHECK WILL BE BYPASSED'            CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: FILE CHECK WILL BE PERFORMED'           CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE 'CAT580'                  TO BPDATES-CALLING-PGM.       CAT580  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT580  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT580  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT580  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT580  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT580  
LRM007     MOVE BPD-PROC-DATE TO WS-BPD-PROC-DATE                       CAT580  
                                                                        CAT580  
           DISPLAY ' '.                                                 CAT580  
           DISPLAY 'CAT580:       BPD-PROC-DATE= ' WS-BPD-PROC-DATE     CAT580  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT580  
           DISPLAY 'CAT580: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT580  
           DISPLAY ' '.                                                 CAT580  
                                                                        CAT580  
           OPEN INPUT INFILE.                                           CAT580  
           DISPLAY 'CAT580: INFILE  OPENED FOR INPUT.  STATUS = '       CAT580  
                                               INFILE-STAT.             CAT580  
                                                                        CAT580  
           IF  INFILE-OKAY                                              CAT580  
               CONTINUE                                                 CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: ERROR OPENING INFILE'                   CAT580  
               DISPLAY 'CAT580: OPEN STATUS = ' INFILE-STAT             CAT580  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT580  
               DISPLAY 'CAT580: U3001 - ABENDING ON BAD FILE STATUS'    CAT580  
               MOVE +3001    TO ABEND-CODE                              CAT580  
               CALL ABEND USING ABEND-CODE                              CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           OPEN OUTPUT STAT-SEQ-FILE.                                   CAT580  
                                                                        CAT580  
           DISPLAY ' '.                                                 CAT580  
           MOVE SPACES                   TO W-TAB-AREA.                 CAT580  
                                                                        CAT580  
       1000-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
       1500-LOAD-B1 SECTION.                                            CAT580  
           DISPLAY 'CAT580: 1500-LOAD-B1'.                              CAT580  
                                                                        CAT580  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT580  
           MOVE 0                        TO  B1-TBL-CNT.                CAT580  
                                                                        CAT580  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT580  
                                                                        CAT580  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT580  
                                             BH-ACAT-INFO               CAT580  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT580  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT580  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT580  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT580  
                                             BH-ACAT-INFO               CAT580  
             IF   BH-BROKER-ACTIVE                                      CAT580  
              AND BH-ACAT-ACTIVE                                        CAT580  
                   ADD 1 TO B1-TBL-CNT                                  CAT580  
                   MOVE  BH-BROKER-NUMBER-N                             CAT580  
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)  CAT580  
                   MOVE  BH-BROKER-NAME                                 CAT580  
                                         TO B1-CLI-NAME   (B1-TBL-CNT)  CAT580  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT580  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT580  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT580  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT580  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT580  
                   ELSE                                                 CAT580  
                      MOVE BH-BROKER-MINI-MAXI-INDICATOR                CAT580  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT580  
                   END-IF                                               CAT580  
                   MOVE  BH-BROKER-STATUS                               CAT580  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT580  
                   MOVE  BH-ACAT-STATUS                                 CAT580  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT580  
                       DISPLAY     'CNT=' B1-TBL-CNT                    CAT580  
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)  CAT580  
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)  CAT580  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT580  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT580  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT580  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT580  
             END-IF                                                     CAT580  
                                                                        CAT580  
           END-PERFORM.                                                 CAT580  
                                                                        CAT580  
           DISPLAY ' '.                                                 CAT580  
                                                                        CAT580  
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                     CAT580  
           DISPLAY ' '.                                                 CAT580  
                                                                                
LRM004     MOVE  235                 TO  BH-BROKER-NUMBER-N                     
LRM004     MOVE  '114'               TO  BH-LOGICAL-RECORD-CODE                 
LRM004     CALL   GETB1V           USING BH-BROKER-HEADER-INFO,                 
LRM004                                   BH-REQ-INFO                            
LRM004     END-CALL                                                             
LRM004     IF NOT BH-REQ-ACTIVE                                                 
LRM004        MOVE SPACES TO BH-REQ-WEALTH-MGMT-OMNI-ACCT                       
LRM004     END-IF.                                                              
LRM004     DISPLAY 'WM OMNI ACCOUNT ' BH-REQ-WEALTH-MGMT-OMNI-ACCT.             
                                                                                
       1500-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       1600-LOAD-TABLE SECTION.                                         CAT580  
                                                                        CAT580  
           PERFORM VARYING W-SUB1 FROM 1 BY 1                           CAT580  
                   UNTIL W-SUB1 > B1-TBL-CNT                            CAT580  
                   MOVE B1-STREAM     (W-SUB1)                          CAT580  
                                  TO W-TAB-STREAM-CD  (W-SUB1)          CAT580  
                   MOVE B1-ADP-CL-NO  (W-SUB1)                          CAT580  
                                  TO W-TAB-CLIENT-NBR (W-SUB1)          CAT580  
                   MOVE B1-BKR-CLR-NO (W-SUB1)                          CAT580  
                                  TO W-TAB-BRK-NBR    (W-SUB1)          CAT580  
                   MOVE 0         TO W-TAB-ITEM-CNT   (W-SUB1)          CAT580  
                   MOVE 0         TO W-TAB-TOT-CNT    (W-SUB1)          CAT580  
                   IF   B1-STREAM     (W-SUB1) > ' '                    CAT580  
                        ADD 1 TO W-TAB-CNT                              CAT580  
                   END-IF                                               CAT580  
           END-PERFORM.                                                 CAT580  
                                                                        CAT580  
           DISPLAY 'CAT580: W-TAB-CNT = ' W-TAB-CNT.                    CAT580  
           DISPLAY ' '.                                                 CAT580  
                                                                        CAT580  
       1600-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
       2000-PROCESS SECTION.                                            CAT580  
                                                                        CAT580  
           IF  NSCCMHDR-REC-TYPE = 'H'                                  CAT580  
               DISPLAY ' '                                              CAT580  
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                       CAT580  
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                     CAT580  
               IF  W-HDR-TRL-SW = 'T'                                   CAT580  
                   PERFORM 3500-EDIT-HEADER  THRU 3500-EXIT             CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: MISSING TRAILER FOR PREV BROKER'    CAT580  
                   MOVE +3001 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
               MOVE 1 TO W-CURR-TOT-CNT                                 CAT580  
DJ0001         ADD 1 TO W-NON-DETAIL-CNT                                CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT580  
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                       CAT580  
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                     CAT580  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT580  
               IF  W-HDR-TRL-SW = 'H'                                   CAT580  
                   PERFORM 7000-EDIT-TRAILER THRU 7000-EXIT             CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: MISSING HEADER FOR THIS TRAILER'    CAT580  
                   MOVE +3001 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
DJ0001         ADD 1 TO W-NON-DETAIL-CNT                                CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           IF  NSCCMHDR-REC-TYPE = 'F'                                  CAT580  
               ADD 1 TO W-DETAIL-CNT                                    CAT580  
               IF  W-HDR-TRL-SW = 'H'                                   CAT580  
                   IF BRK-FOUND                                         CAT580  
                      PERFORM 4000-LOAD      THRU 4000-EXIT             CAT580  
                   ELSE                                                 CAT580  
                      ADD 1 TO W-NON-DETAIL-CNT                         CAT580  
                   END-IF                                               CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: MISSING HEADER FOR THIS DETAIL'     CAT580  
                   MOVE +3001 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
               ADD 1 TO W-CURR-TOT-CNT                                  CAT580  
           ELSE                                                         CAT580  
DJ0001         IF  NSCCMHDR-REC-TYPE = '1'                              CAT580  
DJ0001             DISPLAY ' '                                          CAT580  
DJ0001             DISPLAY 'CAT580: THIS IS THE SIAC HEADER RECORD: '   CAT580  
DJ0001             DISPLAY 'COLS.001-063 => ' IN-RECORD     (1 : 63)    CAT580  
DJ0001                     ' <= COLS.001-063'                           CAT580  
DJ0001             DISPLAY 'COLS.064-133 => ' IN-RECORD     (64: 70)    CAT580  
DJ0001                     ' <= COLS.064-133'                           CAT580  
DJ0001             DISPLAY ' '                                          CAT580  
DJ0001             ADD 1 TO W-NON-DETAIL-CNT                            CAT580  
DJ0001         END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT.                      CAT580  
                                                                        CAT580  
       2000-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
       3000-READ-INPUT SECTION.                                         CAT580  
                                                                        CAT580  
LRM003     IF SKIP-ALL-INPUT                                                    
LRM003             MOVE '1'              TO END-OF-INFILE-SW            CAT580  
LRM003             GO TO 3000-EXIT                                      CAT580  
LRM003     END-IF.                                                              
           READ INFILE                                                  CAT580  
                AT END                                                  CAT580  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT580  
                   DISPLAY 'CAT580: END OF INPUT REACHED'               CAT580  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT580  
                   GO TO 3000-EXIT                                      CAT580  
           END-READ.                                                    CAT580  
                                                                        CAT580  
           ADD  1                        TO W-INFILE-CNT.               CAT580  
                                                                        CAT580  
           IF  INFILE-OKAY                                              CAT580  
               MOVE IN-RECORD       (1 : W-REC-LEN-IN) TO               CAT580  
                    NSCCF-RECORD                                        CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: ERROR READING INFILE'                   CAT580  
               DISPLAY 'CAT580: READ STATUS = ' INFILE-STAT             CAT580  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT580  
               DISPLAY 'CAT580: U3007 - ABENDING ON BAD FILE STATUS'    CAT580  
               MOVE +3007 TO ABEND-CODE                                 CAT580  
               PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       3000-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
       3500-EDIT-HEADER SECTION.                                        CAT580  
                                                                        CAT580  
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                 CAT580  
               IF  W-CURR-HDR-SW = 'Y'                                  CAT580  
                   DISPLAY 'CAT580: DUPLICATE HEADER'                   CAT580  
                                  ' FOR BROKER ' W-CURR-BRK-NBR         CAT580  
                   IF  L-BYP-FILECHK                                    CAT580  
                     DISPLAY 'CAT580: BYPASSING BAD FILE PER JCL'       CAT580  
                   ELSE                                                 CAT580  
                     DISPLAY 'CAT580: U3009 - ABENDING ON DUP BRK HDR'  CAT580  
                     MOVE +3009 TO ABEND-CODE                           CAT580  
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT          CAT580  
                   END-IF                                               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE ' '                         TO W-BRK-SW                 CAT580  
           SET TAB-X TO 1.                                              CAT580  
           SEARCH W-TAB VARYING TAB-X                                   CAT580  
               AT END                                                   CAT580  
                    MOVE ' '             TO W-BRK-SW                    CAT580  
                    MOVE ' '             TO W-CURR-TAB                  CAT580  
                    MOVE 0               TO W-CURR-ITEM-CNT             CAT580  
                    MOVE 0               TO W-CURR-TOT-CNT              CAT580  
               WHEN W-TAB-BRK-NBR (TAB-X) =                             CAT580  
                                            NSCCMHDR-BROKER-CLR-NBR     CAT580  
                    MOVE 'Y'             TO W-BRK-SW                    CAT580  
                    MOVE W-TAB (TAB-X)   TO W-CURR-TAB                  CAT580  
           END-SEARCH.                                                  CAT580  
                                                                        CAT580  
           IF   W-BRK-SW = 'Y'                                          CAT580  
                DISPLAY '======> BROKER FOUND  ' NSCCMHDR-BROKER-CLR-NBRCAT580  
                          ' INPUT-CNT=' W-INFILE-CNT                    CAT580  
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR           CAT580  
                             ' STREAM=' W-CURR-STREAM-CD                CAT580  
                                ' CLT=' W-CURR-CLIENT-NBR               CAT580  
           ELSE                                                         CAT580  
                MOVE NSCCMHDR-BROKER-CLR-NBR TO W-CURR-BRK-NBR          CAT580  
                DISPLAY 'BYPASS: BROKER NOTFND ' NSCCMHDR-BROKER-CLR-NBRCAT580  
                          ' INPUT-CNT=' W-INFILE-CNT                    CAT580  
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR           CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
LRM008***  IF W-CURR-STREAM-CD = 'Q'                                            
LRM008***     IF (NSCCMHDR-PROC-DATE = WS-BPD-PROC-DATE                         
LRM008***     OR L-BYP-DATECHK)                                         CAT580  
LRM008***        CONTINUE                                                       
LRM008***     ELSE                                                              
LRM008***        DISPLAY 'QA STREAM WITH WRONG SIAC 720 FILE'                   
LRM008***        DISPLAY '   IGNORE THIS FILE'                                  
LRM008***        SET SKIP-ALL-INPUT TO TRUE                                     
LRM008***  ELSE                                                                 
           IF  NSCCMHDR-PROC-DATE = WS-BPD-PROC-DATE                    CAT580  
               CONTINUE                                                 CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: NSCCMHDR-PROC-DATE('                    CAT580  
                                NSCCMHDR-PROC-DATE ') NOT = '           CAT580  
                       'BPD-PROC-DATE(' WS-BPD-PROC-DATE ')'            CAT580  
               IF L-BYP-DATECHK                                         CAT580  
                   DISPLAY 'CAT580: BYPASSING DATECHK PER JCLPARM'      CAT580  
               ELSE                                                     CAT580  
                   IF  L-BYP-FILECHK                                    CAT580  
                     DISPLAY 'CAT580: BYPASSING BAD DATE FILE PER JCL'  CAT580  
                   ELSE                                                 CAT580  
                     DISPLAY 'CAT580: U3009 - ABENDING ON BAD DATE'     CAT580  
                     MOVE +3009 TO ABEND-CODE                           CAT580  
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT          CAT580  
                   END-IF                                               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           IF  NSCCMHDR-VAR-LEN-REC-IND = '*'                           CAT580  
               CONTINUE                                                 CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: NSCCMHDR-VAR-LEN-REC-IND '              CAT580  
                            '(' NSCCMHDR-VAR-LEN-REC-IND ')'            CAT580  
                            ' NOT = *'                                  CAT580  
               IF  L-BYP-FILECHK                                        CAT580  
                   DISPLAY 'CAT580: BYPASSING BAD VAR-LEN-REC-IND'      CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: U3013 - ABENDING ON BAD VAR IND'    CAT580  
                   MOVE +3013 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE 'Y'                       TO W-CURR-HDR-SW              CAT580  
           MOVE NSCCMHDR-PROC-DATE        TO W-CURR-HDR-DATE.           CAT580  
      ***  MOVE NSCCMHDR-MULTI-CYCLE-NBR  TO W-CURR-HDR-CYCLE.          CAT580  
                                                                        CAT580  
           MOVE 'H'               TO W-HDR-TRL-SW.                      CAT580  
                                                                        CAT580  
       3500-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
      ******************************************************************CAT580  
      *                                                                 CAT580  
      *     1. UPDATE THE ACTIVE-TABLE.                                 CAT580  
      *                                                                 CAT580  
      ******************************************************************CAT580  
       4000-LOAD                 SECTION.                               CAT580  
           MOVE '4000-LOAD                  ' TO W-ROUTINE-1.           CAT580  
                                                                        CAT580  
           ADD 1 TO W-LOAD-CNT                                          CAT580  
                                                                        CAT580  
           PERFORM 4100-FNDSRVS-UPDATE        THRU 4100-EXIT            CAT580  
                                                                        CAT580  
           ADD +1 TO W-COMMIT-CTR                                       CAT580  
           IF  W-COMMIT-CTR > +9                                        CAT580  
               PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                   CAT580  
               MOVE 0 TO W-COMMIT-CTR                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       4000-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       4100-FNDSRVS-UPDATE       SECTION.                               CAT580  
           MOVE '4100-FNDSRVS-UPDATE        ' TO W-ROUTINE-1.           CAT580  
                                                                        CAT580  
           PERFORM 5100-MOVE-NSCC-TO-ACTIVE THRU 5100-EXIT              CAT580  
                                                                        CAT580  
           PERFORM 6050-UPDATE-VMF THRU 6050-EXIT                       CAT580  
                                                                        CAT580  
           IF  SQLCODE  =  +0                                           CAT580  
               ADD 1 TO W-VMF-UPD-CNT                                   CAT580  
           ELSE                                                         CAT580  
               ADD 1 TO W-VMF-NOT-UPD-CNT                               CAT580  
               IF  SQLCODE  NOT =  +100                                 CAT580  
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           PERFORM 6100-UPDATE-VFNDSRVS THRU 6100-EXIT                  CAT580  
                                                                        CAT580  
           IF  SQLCODE  =  +0                                           CAT580  
               ADD 1 TO W-VFNDSRVS-UPD-CNT                              CAT580  
           ELSE                                                         CAT580  
               ADD 1 TO W-VFNDSRVS-NOT-UPD-CNT                          CAT580  
               IF  SQLCODE  =  +100                                     CAT580  
DJ0001             PERFORM 4150-FNDSRVS-NOTFND THRU 4150-EXIT           CAT580  
DJ0001             IF  SQLCODE  =  0 OR -803                            CAT580  
DJ0001                 CONTINUE                                         CAT580  
                   ELSE                                                 CAT580  
                       PERFORM 4105-CREATE-STAT-SEQ THRU 4105-EXIT      CAT580  
ENP004*                DISPLAY 'INP=' W-INFILE-CNT                      CAT580  
ENP004*                     ' CLT=' W-TAB-CLIENT-NBR (TAB-X)            CAT580  
ENP004*                     ' CTL=' NSCCF-ACATS-CTRL-NBR                CAT580  
ENP004*                     ' SEQ=' NSCCF-ASSET-SEQ-NBR                 CAT580  
ENP004*                     ' FUND REG DOES NOT EXIST'                  CAT580  
                   END-IF                                               CAT580  
               ELSE                                                     CAT580  
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       4100-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       4105-CREATE-STAT-SEQ      SECTION.                               CAT580  
           MOVE SPACES                    TO WS-STAT-RECORD.            CAT580  
           MOVE W-CURR-CLIENT-NBR         TO WS-STAT-CLIENT.            CAT580  
           MOVE NSCCF-ACATS-CTRL-NBR      TO WS-STAT-ACATS-CTRL-NBR.    CAT580  
           MOVE NSCCF-ASSET-SEQ-NBR       TO WS-STAT-ASSET-SEQ-NBR.     CAT580  
           MOVE '10'                      TO WS-STAT-LCTN-CD.           CAT580  
           MOVE NSCCF-RECORD              TO WS-STAT-DATA.              CAT580  
                                                                        CAT580  
           WRITE STAT-RECORD    FROM WS-STAT-RECORD.                    CAT580  
           ADD  1                         TO W-OUTFILE-CNT.             CAT580  
                                                                        CAT580  
       4105-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       4150-FNDSRVS-NOTFND       SECTION.                               CAT580  
           MOVE '4150-FNDSRVS-NOTFND        ' TO W-ROUTINE-1.           CAT580  
                                                                        CAT580  
           PERFORM 6120-INSERT-VFNDSRVS  THRU 6120-EXIT                 CAT580  
                                                                        CAT580  
           IF  SQLCODE  =  +0                                           CAT580  
               ADD 1 TO W-VFNDSRVS-ADD-CNT                              CAT580  
           ELSE                                                         CAT580  
               ADD 1 TO W-VFNDSRVS-NOT-ADD-CNT                          CAT580  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT580  
                            ' CLT=' W-TAB-CLIENT-NBR (TAB-X)            CAT580  
                            ' CTL=' NSCCF-ACATS-CTRL-NBR                CAT580  
                            ' SEQ=' NSCCF-ASSET-SEQ-NBR                 CAT580  
                            ' VFNDSRVS NOT INSERTED'                    CAT580  
                            ' SQLCODE=' W-DB2-SQLCODE                   CAT580  
               IF  SQLCODE  =  -803                                     CAT580  
                   CONTINUE                                             CAT580  
               ELSE                                                     CAT580  
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       4150-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
      ***************************************************************** CAT580  
      *  MOVE NSCC FIELDS TO ACTIVE TABLE,                              CAT580  
      ***************************************************************** CAT580  
       5100-MOVE-NSCC-TO-ACTIVE  SECTION.                               CAT580  
                                                                        CAT580  
           MOVE SPACES                                   TO DCLVFNDSRVS CAT580  
           MOVE W-CURR-CLIENT-NBR                                       CAT580  
                                    TO CLIENT-NBR        OF DCLVFNDSRVS CAT580  
LRM004*** FORCE ALL WM ACCOUNTS INTO CLIENT 1235                        CAT580  
LRM006***  DISPLAY 'FUND SERV CONTROL ' NSCCF-ACATS-CTRL-NBR                    
LRM006***          ' CL ' W-CURR-CLIENT-NBR                             CAT580  
LRM006***          ' OMNI B1 ' BH-REQ-WEALTH-MGMT-OMNI-ACCT                     
LRM006***          ' DSTRB ' NSCCF-DSTRB-PART                                   
LRM006***          ' DEL-CUST ' NSCCF-DEL-CUST-ACT-NBR (1 : 8)                  
LRM006***          ' RCV CUST ' NSCCF-RCV-CUST-ACT-NBR (1 : 8)                  
                                                                                
LRM006***  IF W-CURR-CLIENT-NBR = '0235'                                CAT580  
LRM006***  AND BH-REQ-WEALTH-MGMT-OMNI-ACCT > SPACES                            
LRM006***    IF (BH-REQ-WEALTH-MGMT-OMNI-ACCT =                                 
LRM006***                        NSCCF-DEL-CUST-ACT-NBR (1 : 8)                 
LRM006***    OR BH-REQ-WEALTH-MGMT-OMNI-ACCT =                                  
LRM006***                        NSCCF-RCV-CUST-ACT-NBR (1 : 8))                
LRM006***      MOVE '1235'          TO CLIENT-NBR        OF DCLVFNDSRVS CAT580  
LRM006***      DISPLAY 'FOUND WM FUND SERV ' NSCCF-ACATS-CTRL-NBR               
LRM006***  END-IF.                                                              
                                                                                
           MOVE NSCCF-ACATS-CTRL-NBR                                    CAT580  
                                    TO ACAT-CONTROL-NBR  OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ASSET-SEQ-NBR                                     CAT580  
                                    TO ASSET-SEQ-NBR     OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ACCT-TYP-IND-TO                                   CAT580  
                                    TO ACCT-TYPE-CD      OF DCLVFNDSRVS CAT580  
                                                                        CAT580  
ENP001     IF  NSCCF-ACTION-TYP = 'S'                                   CAT580  
ENP001         MOVE 'R'            TO ACTION-TYPE-CD     OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
               MOVE NSCCF-ACTION-TYP                                    CAT580  
                                   TO ACTION-TYPE-CD     OF DCLVFNDSRVS CAT580  
           END-IF                                                       CAT580  
                                                                        CAT580  
           IF  NSCCF-PROCESS-DATE > ZEROES                              CAT580  
           AND NSCCF-PROCESS-DATE IS NUMERIC                            CAT580  
LRM007         IF PARM-STREAM-IND = 'Q'                                         
LRM007            PERFORM 6000-INCRIMENT-PRCS-DT THRU 6000-EXIT                 
LRM007         END-IF                                                           
               MOVE NSCCF-PROCESS-DATE                                  CAT580  
                                       TO W-NSCC-DATE                   CAT580  
               MOVE W-NSCC-DATE-YEAR                                    CAT580  
                                       TO W-DATE-YEAR                   CAT580  
               MOVE W-NSCC-DATE-MM                                      CAT580  
                                       TO W-DATE-MM                     CAT580  
               MOVE W-NSCC-DATE-DD                                      CAT580  
                                       TO W-DATE-DD                     CAT580  
               MOVE W-DATE                                              CAT580  
                                       TO PRCS-DT        OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
JPC00X***      DISPLAY 'NSCCF-PROCESS-DATE: ' NSCCF-PROCESS-DATE        CAT580  
               MOVE '0001-01-01'                                        CAT580  
                                       TO PRCS-DT        OF DCLVFNDSRVS CAT580  
           END-IF                                                       CAT580  
           MOVE NSCCF-DSTRB-SIDE                                        CAT580  
                                   TO DSTBN-SIDE-CD      OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-FND-CUST-ACT-NBR                                  CAT580  
                                   TO FNBR               OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-NTWRK-CNTL-IND                                    CAT580  
                                   TO NTWRK-CNTL-CD      OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-PI-DEL-IND                                        CAT580  
                                   TO PI-DLRVY-CD        OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-FND-SRV-CNTL-NBR                                  CAT580  
                                   TO FND-SERV-CNTL-NBR  OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ACCT-TYP-IND-TO                                   CAT580  
                                   TO RCV-ACCT-TYPE-CD   OF DCLVFNDSRVS CAT580  
      ***  MOVE ??????????????                                          CAT580  
      ***                          TO RCV-CUST-NM        OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-CRTF-NBR                                          CAT580  
                                   TO CERT-NBR           OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ACTUAL-QNTY                                       CAT580  
                                   TO W-QTY-X                           CAT580  
           PERFORM 5101-REFORMAT-ASSET-QTY THRU 5101-EXIT.              CAT580  
           MOVE W-QTY-N                                                 CAT580  
                                   TO ASSET-QTY          OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ORG-QNTY                                          CAT580  
                                   TO W-QTY-X                           CAT580  
           PERFORM 5101-REFORMAT-ASSET-QTY THRU 5101-EXIT.              CAT580  
           MOVE W-QTY-N                                                 CAT580  
                                   TO ASSET-ORGNL-QTY    OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ISO-CURCY-CD                                      CAT580  
                                   TO ISO-CRNCY-CD       OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-AMOUNT                                            CAT580  
                                   TO W-QTY-X                           CAT580  
           PERFORM 5103-REFORMAT-ASSET-AMT THRU 5103-EXIT               CAT580  
           MOVE W-QTY-N                                                 CAT580  
                                   TO ASSET-AMT          OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-DEB-CRD-IND                                       CAT580  
                                   TO DB-CR-CD           OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ISIN-CNTRY-CD                                     CAT580  
                                   TO ISIN-CNTRY-CD      OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ISIN-SEC-ID                                       CAT580  
                                   TO ISIN-SEC-ISSUE-CD  OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ISIN-SEC-CHKDGT                                   CAT580  
                                   TO ISIN-SEC-CDG-CD    OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ASSET-DESC                                        CAT580  
                                   TO ASSET-DESC-TXT     OF DCLVFNDSRVS CAT580  
           IF  NSCCF-CRTF-DT > ZEROES                                   CAT580  
           AND NSCCF-CRTF-DT IS NUMERIC                                 CAT580  
               MOVE NSCCF-CRTF-DT                                       CAT580  
                                       TO W-CERT-DATE                   CAT580  
               MOVE W-CERT-DATE-YEAR                                    CAT580  
                                       TO W-DATE-YEAR                   CAT580  
               MOVE W-CERT-DATE-MM                                      CAT580  
                                       TO W-DATE-MM                     CAT580  
               MOVE W-CERT-DATE-DD                                      CAT580  
                                       TO W-DATE-DD                     CAT580  
               MOVE W-DATE                                              CAT580  
                                       TO CERT-DT        OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
JPC00X***      DISPLAY 'NSCCF-CRTF-DT     : ' NSCCF-CRTF-DT             CAT580  
               MOVE '0001-01-01'                                        CAT580  
                                       TO CERT-DT        OF DCLVFNDSRVS CAT580  
           END-IF                                                       CAT580  
           IF  NSCCF-ORG-SETLMNT-DT > ZEROES                            CAT580  
           AND NSCCF-ORG-SETLMNT-DT IS NUMERIC                          CAT580  
               MOVE NSCCF-ORG-SETLMNT-DT                                CAT580  
                                       TO W-NSCC-DATE                   CAT580  
               MOVE W-NSCC-DATE-YEAR                                    CAT580  
                                       TO W-DATE-YEAR                   CAT580  
               MOVE W-NSCC-DATE-MM                                      CAT580  
                                       TO W-DATE-MM                     CAT580  
               MOVE W-NSCC-DATE-DD                                      CAT580  
                                       TO W-DATE-DD                     CAT580  
               MOVE W-DATE                                              CAT580  
                                       TO STTLM-ORGNL-DT OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
JPC00X***      DISPLAY 'NSCCF-ORG-SETLMNT-DT: ' NSCCF-ORG-SETLMNT-DT    CAT580  
               MOVE '0001-01-01'                                        CAT580  
                                       TO STTLM-ORGNL-DT OF DCLVFNDSRVS CAT580  
           END-IF                                                       CAT580  
           IF  NSCCF-CUR-SETLMNT-DT > ZEROES                            CAT580  
           AND NSCCF-CUR-SETLMNT-DT IS NUMERIC                          CAT580  
               MOVE NSCCF-CUR-SETLMNT-DT                                CAT580  
                                       TO W-NSCC-DATE                   CAT580  
               MOVE W-NSCC-DATE-YEAR                                    CAT580  
                                       TO W-DATE-YEAR                   CAT580  
               MOVE W-NSCC-DATE-MM                                      CAT580  
                                       TO W-DATE-MM                     CAT580  
               MOVE W-NSCC-DATE-DD                                      CAT580  
                                       TO W-DATE-DD                     CAT580  
               MOVE W-DATE                                              CAT580  
                                       TO STTLM-DT       OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
JPC00X***      DISPLAY 'NSCCF-CUR-SETLMNT-DT: ' NSCCF-CUR-SETLMNT-DT    CAT580  
               MOVE '0001-01-01'                                        CAT580  
                                       TO STTLM-DT       OF DCLVFNDSRVS CAT580  
           END-IF                                                       CAT580  
           MOVE NSCCF-REJ-CD                                            CAT580  
                                   TO RJCT-CD            OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ATD-ACCR-CD                                       CAT580  
                                   TO DSBMT-ACCRL-CD     OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ATD-FRAC-CD                                       CAT580  
                                   TO DSBMT-FRCTN-CSH-CD OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-ATD-RSDU-CD                                       CAT580  
                                   TO DSBMT-RSDL-CD      OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-DIVIDEND-CD                                       CAT580  
                                   TO DVDND-CD           OF DCLVFNDSRVS CAT580  
           MOVE NSCCF-CUST-NAME                                         CAT580  
                                   TO CUST-NM            OF DCLVFNDSRVS CAT580  
                                                                        CAT580  
           MOVE W-PGM-NAME           TO PRGM-NM          OF DCLVFNDSRVS CAT580  
           MOVE ' '                  TO CICS-TERM-ID-CD  OF DCLVFNDSRVS CAT580  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP        OF DCLVFNDSRVS CAT580  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP       OF DCLVFNDSRVS CAT580  
                                                                        CAT580  
           PERFORM 5150-GETMSDC THRU 5150-EXIT                          CAT580  
                                                                        CAT580  
           IF  GETMSD-RETURN-VALID                                      CAT580  
               ADD 1 TO W-MSD-FND-CNT                                   CAT580  
               MOVE 'N'            TO W-MSD-NOTFND-SW                   CAT580  
               MOVE MS-ADP-NO      TO SECURITY-ADP-NBR   OF DCLVFNDSRVS CAT580  
           ELSE                                                         CAT580  
               ADD 1 TO W-MSD-NOTFND-CNT                                CAT580  
               MOVE 'Y'            TO W-MSD-NOTFND-SW                   CAT580  
               MOVE ' '            TO SECURITY-ADP-NBR   OF DCLVFNDSRVS CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       5100-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       5101-REFORMAT-ASSET-QTY  SECTION.                                CAT580  
                                                                        CAT580  
           MOVE 0                        TO W-INT                       CAT580  
                                            W-DEC                       CAT580  
                                            W-QTY-N                     CAT580  
           MOVE ' '                      TO W-COMMA-FND-SW              CAT580  
                                                                        CAT580  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT580  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT580  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT580  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT580  
                        END-IF                                          CAT580  
           END-PERFORM                                                  CAT580  
                                                                        CAT580  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT580  
               MOVE 17                   TO W-INT-PTR                   CAT580  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT580  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT580  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT580  
                       UNTIL W-QTY-PTR = 0                              CAT580  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT580  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT580  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT580  
               END-PERFORM                                              CAT580  
               MOVE 1                    TO W-DEC-PTR                   CAT580  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT580  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT580  
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            CAT580  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT580  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT580  
                       ADD 1        TO W-DEC-PTR                        CAT580  
               END-PERFORM                                              CAT580  
           ELSE                                                         CAT580  
               MOVE W-QTY                TO W-INT                       CAT580  
           END-IF.                                                      CAT580  
           MOVE W-INT                    TO W-QTY-INT.                  CAT580  
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT580  
                                                                        CAT580  
       5101-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
      ***************************************************************** CAT580  
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                    CAT580  
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL      CAT580  
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL      CAT580  
      ***************************************************************** CAT580  
       5103-REFORMAT-ASSET-AMT  SECTION.                                CAT580  
                                                                        CAT580  
           MOVE 0                        TO W-INT                       CAT580  
                                            W-DEC                       CAT580  
                                            W-QTY-N                     CAT580  
           MOVE ' '                      TO W-COMMA-FND-SW              CAT580  
                                                                        CAT580  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT580  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT580  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT580  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT580  
                        END-IF                                          CAT580  
           END-PERFORM                                                  CAT580  
                                                                        CAT580  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT580  
               MOVE 17                   TO W-INT-PTR                   CAT580  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT580  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT580  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT580  
                       UNTIL W-QTY-PTR = 0                              CAT580  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT580  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT580  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT580  
               END-PERFORM                                              CAT580  
               MOVE 1                    TO W-DEC-PTR                   CAT580  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT580  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT580  
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            CAT580  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT580  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT580  
                       ADD 1        TO W-DEC-PTR                        CAT580  
               END-PERFORM                                              CAT580  
           ELSE                                                         CAT580  
               MOVE W-QTY                TO W-INT                       CAT580  
           END-IF.                                                      CAT580  
           MOVE W-INT                    TO W-QTY-INT.                  CAT580  
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT580  
                                                                        CAT580  
       5103-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       5150-GETMSDC         SECTION.                                    CAT580  
                                                                        CAT580  
           MOVE 'D'                    TO   GETMSD-DEVICE-IND.          CAT580  
           MOVE 'R'                    TO   GETMSD-ACCESS-IND.          CAT580  
           MOVE 'E'                    TO   GETMSD-FORMAT-IND.          CAT580  
DJ0003     MOVE LOW-VALUES             TO   GETMSD-SEARCH-KEY-AREA.     CAT580  
           MOVE NSCCF-ISIN-SEC-ID      TO   GETMSD-SEARCH-KEY.          CAT580  
           MOVE ALL ZERO               TO   GETMSD-WI-CODE              CAT580  
DJ0003     MOVE W-CURR-CLIENT-NUM      TO   GETMSD-CLIENT-PL2           CAT580  
                                                                        CAT580  
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.     CAT580  
                                                                        CAT580  
       5150-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
LRM007 6000-INCRIMENT-PRCS-DT   SECTION.                                        
LRM007     SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                              
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US' TO  BPDATES-CALENDAR-TYPE.                                 
CSG001     MOVE '  ' TO  BPDATES-CALENDAR-TYPE.                                 
LRM007     MOVE NSCCF-PROCESS-DATE TO BPDATES-BASE-DATE.                        
LRM007     SET BPD-DISP-PLUS TO TRUE.                                           
LRM007     SET BPD-DISP-CALENDAR TO TRUE.                                       
LRM007     MOVE '0' TO BPD-DT-DAY-TYPE                                          
LRM007     PERFORM VARYING DAY-SUB FROM 1 BY 1                                  
LRM007        UNTIL DAY-SUB > 20                                                
LRM007            OR BPD-DT-TD-AND-SD                                           
LRM007        MOVE DAY-SUB TO BPDATES-DTSEARCH-DISP                             
LRM007        CALL  BPDATES  USING BPDATES-PARAMETERS                           
LRM007        END-CALL                                                          
LRM007     END-PERFORM.                                                         
LRM007     IF NOT BPD-VALID-RETURN                                              
LRM007        DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                    
LRM007        DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE                  
LRM007        DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                   
LRM007        DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                    
LRM007        MOVE +6000 TO ABEND-CODE                                          
LRM007        CALL ABEND USING ABEND-CODE                                       
LRM007     ELSE                                                                 
LRM007        MOVE BPD-DT-CALDATE TO NSCCF-PROCESS-DATE                         
LRM007        DISPLAY 'CHANGING PRCS FROM ' BPDATES-BASE-DATE                   
LRM007                               ' TO ' BPD-DT-CALDATE                      
LRM007     END-IF.                                                              
                                                                        CAT580  
       6000-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
ENP001 6050-UPDATE-VMF           SECTION.                               CAT580  
           MOVE '6050-UPDATE-VMF                 ' TO W-ROUTINE-1.      CAT580  
                                                                        CAT580  
           EXEC SQL                                                     CAT580  
             UPDATE VMF                                                 CAT580  
                SET                                                     CAT580  
                   MF_FUL_PRTL_STS_CD  = :DCLVFNDSRVS.ACTION-TYPE-CD    CAT580  
                  ,UPDT_TMSTP          = :DCLVFNDSRVS.UPDT-TMSTP        CAT580  
                  ,CICS_TERM_ID_CD     = :DCLVFNDSRVS.CICS-TERM-ID-CD   CAT580  
                  ,PRGM_NM             = :DCLVFNDSRVS.PRGM-NM           CAT580  
             WHERE CLIENT_NBR          = :DCLVFNDSRVS.CLIENT-NBR        CAT580  
               AND ACAT_CONTROL_NBR    = :DCLVFNDSRVS.ACAT-CONTROL-NBR  CAT580  
               AND ASSET_SEQ_NBR       = :DCLVFNDSRVS.ASSET-SEQ-NBR     CAT580  
           END-EXEC.                                                    CAT580  
                                                                        CAT580  
           ADD 1 TO W-SQL-CNT                                           CAT580  
                                                                        CAT580  
           MOVE 'VMF'                    TO W-DB2-TABLE-NAME            CAT580  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT580  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT580  
           .                                                            CAT580  
       6050-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       6100-UPDATE-VFNDSRVS      SECTION.                               CAT580  
           MOVE '6100-UPDATE-VFNDSRVS            ' TO W-ROUTINE-1.      CAT580  
                                                                        CAT580  
           EXEC SQL                                                     CAT580  
             UPDATE VFNDSRVS                                            CAT580  
                SET                                                     CAT580  
                   CLIENT_NBR          = :DCLVFNDSRVS.CLIENT-NBR        CAT580  
                  ,ACAT_CONTROL_NBR    = :DCLVFNDSRVS.ACAT-CONTROL-NBR  CAT580  
                  ,ASSET_SEQ_NBR       = :DCLVFNDSRVS.ASSET-SEQ-NBR     CAT580  
                  ,ACCT_TYPE_CD        = :DCLVFNDSRVS.ACCT-TYPE-CD      CAT580  
                  ,ACTION_TYPE_CD      = :DCLVFNDSRVS.ACTION-TYPE-CD    CAT580  
                  ,PRCS_DT             = :DCLVFNDSRVS.PRCS-DT           CAT580  
                  ,DSTBN_SIDE_CD       = :DCLVFNDSRVS.DSTBN-SIDE-CD     CAT580  
                  ,FNBR                = :DCLVFNDSRVS.FNBR              CAT580  
                  ,NTWRK_CNTL_CD       = :DCLVFNDSRVS.NTWRK-CNTL-CD     CAT580  
                  ,PI_DLRVY_CD         = :DCLVFNDSRVS.PI-DLRVY-CD       CAT580  
                  ,FND_SERV_CNTL_NBR   = :DCLVFNDSRVS.FND-SERV-CNTL-NBR CAT580  
                  ,RCV_ACCT_TYPE_CD    = :DCLVFNDSRVS.RCV-ACCT-TYPE-CD  CAT580  
                  ,RCV_CUST_NM         = :DCLVFNDSRVS.RCV-CUST-NM       CAT580  
                  ,CERT_NBR            = :DCLVFNDSRVS.CERT-NBR          CAT580  
                  ,ASSET_QTY           = :DCLVFNDSRVS.ASSET-QTY         CAT580  
                  ,ASSET_ORGNL_QTY     = :DCLVFNDSRVS.ASSET-ORGNL-QTY   CAT580  
                  ,ASSET_AMT           = :DCLVFNDSRVS.ASSET-AMT         CAT580  
                  ,STTLM_ORGNL_DT      = :DCLVFNDSRVS.STTLM-ORGNL-DT    CAT580  
                  ,STTLM_DT            = :DCLVFNDSRVS.STTLM-DT          CAT580  
                  ,RJCT_CD             = :DCLVFNDSRVS.RJCT-CD           CAT580  
                  ,DVDND_CD            = :DCLVFNDSRVS.DVDND-CD          CAT580  
                  ,CICS_TERM_ID_CD     = :DCLVFNDSRVS.CICS-TERM-ID-CD   CAT580  
                  ,UPDT_TMSTP          = :DCLVFNDSRVS.UPDT-TMSTP        CAT580  
                  ,PRGM_NM             = :DCLVFNDSRVS.PRGM-NM           CAT580  
                  ,SECURITY_ADP_NBR    = :DCLVFNDSRVS.SECURITY-ADP-NBR  CAT580  
             WHERE CLIENT_NBR          = :DCLVFNDSRVS.CLIENT-NBR        CAT580  
               AND ACAT_CONTROL_NBR    = :DCLVFNDSRVS.ACAT-CONTROL-NBR  CAT580  
               AND ASSET_SEQ_NBR       = :DCLVFNDSRVS.ASSET-SEQ-NBR     CAT580  
           END-EXEC.                                                    CAT580  
                                                                        CAT580  
           ADD 1 TO W-SQL-CNT                                           CAT580  
                                                                        CAT580  
           MOVE 'VFNDSRVS'               TO W-DB2-TABLE-NAME            CAT580  
           MOVE 'UPDATE'                 TO W-DB2-ACTION                CAT580  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT580  
           .                                                            CAT580  
       6100-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       6120-INSERT-VFNDSRVS      SECTION.                               CAT580  
           MOVE '6120-INSERT-VFNDSRVS           ' TO W-ROUTINE-1.       CAT580  
                                                                        CAT580  
           EXEC SQL                                                     CAT580  
               INSERT INTO VFNDSRVS                                     CAT580  
                 (                                                      CAT580  
                   CLIENT_NBR                                           CAT580  
                  ,ACAT_CONTROL_NBR                                     CAT580  
                  ,ASSET_SEQ_NBR                                        CAT580  
                  ,ACCT_TYPE_CD                                         CAT580  
                  ,ACTION_TYPE_CD                                       CAT580  
                  ,PRCS_DT                                              CAT580  
                  ,DSTBN_SIDE_CD                                        CAT580  
                  ,FNBR                                                 CAT580  
                  ,NTWRK_CNTL_CD                                        CAT580  
                  ,PI_DLRVY_CD                                          CAT580  
                  ,FND_SERV_CNTL_NBR                                    CAT580  
                  ,RCV_ACCT_TYPE_CD                                     CAT580  
                  ,RCV_CUST_NM                                          CAT580  
                  ,CERT_NBR                                             CAT580  
                  ,ASSET_QTY                                            CAT580  
                  ,ASSET_ORGNL_QTY                                      CAT580  
                  ,ISO_CRNCY_CD                                         CAT580  
                  ,ASSET_AMT                                            CAT580  
                  ,DB_CR_CD                                             CAT580  
                  ,ISIN_CNTRY_CD                                        CAT580  
                  ,ISIN_SEC_ISSUE_CD                                    CAT580  
                  ,ISIN_SEC_CDG_CD                                      CAT580  
                  ,ASSET_DESC_TXT                                       CAT580  
                  ,CERT_DT                                              CAT580  
                  ,STTLM_ORGNL_DT                                       CAT580  
                  ,STTLM_DT                                             CAT580  
                  ,RJCT_CD                                              CAT580  
                  ,DSBMT_ACCRL_CD                                       CAT580  
                  ,DSBMT_FRCTN_CSH_CD                                   CAT580  
                  ,DSBMT_RSDL_CD                                        CAT580  
                  ,DVDND_CD                                             CAT580  
                  ,CUST_NM                                              CAT580  
                  ,CICS_TERM_ID_CD                                      CAT580  
                  ,PRGM_NM                                              CAT580  
                  ,CRT_TMSTP                                            CAT580  
                  ,UPDT_TMSTP                                           CAT580  
                  ,SECURITY_ADP_NBR                                     CAT580  
                 )                                                      CAT580  
                 VALUES                                                 CAT580  
                 (                                                      CAT580  
                   :DCLVFNDSRVS.CLIENT-NBR                              CAT580  
                  ,:DCLVFNDSRVS.ACAT-CONTROL-NBR                        CAT580  
                  ,:DCLVFNDSRVS.ASSET-SEQ-NBR                           CAT580  
                  ,:DCLVFNDSRVS.ACCT-TYPE-CD                            CAT580  
                  ,:DCLVFNDSRVS.ACTION-TYPE-CD                          CAT580  
                  ,:DCLVFNDSRVS.PRCS-DT                                 CAT580  
                  ,:DCLVFNDSRVS.DSTBN-SIDE-CD                           CAT580  
                  ,:DCLVFNDSRVS.FNBR                                    CAT580  
                  ,:DCLVFNDSRVS.NTWRK-CNTL-CD                           CAT580  
                  ,:DCLVFNDSRVS.PI-DLRVY-CD                             CAT580  
                  ,:DCLVFNDSRVS.FND-SERV-CNTL-NBR                       CAT580  
                  ,:DCLVFNDSRVS.RCV-ACCT-TYPE-CD                        CAT580  
                  ,:DCLVFNDSRVS.RCV-CUST-NM                             CAT580  
                  ,:DCLVFNDSRVS.CERT-NBR                                CAT580  
                  ,:DCLVFNDSRVS.ASSET-QTY                               CAT580  
                  ,:DCLVFNDSRVS.ASSET-ORGNL-QTY                         CAT580  
                  ,:DCLVFNDSRVS.ISO-CRNCY-CD                            CAT580  
                  ,:DCLVFNDSRVS.ASSET-AMT                               CAT580  
                  ,:DCLVFNDSRVS.DB-CR-CD                                CAT580  
                  ,:DCLVFNDSRVS.ISIN-CNTRY-CD                           CAT580  
                  ,:DCLVFNDSRVS.ISIN-SEC-ISSUE-CD                       CAT580  
                  ,:DCLVFNDSRVS.ISIN-SEC-CDG-CD                         CAT580  
                  ,:DCLVFNDSRVS.ASSET-DESC-TXT                          CAT580  
                  ,:DCLVFNDSRVS.CERT-DT                                 CAT580  
                  ,:DCLVFNDSRVS.STTLM-ORGNL-DT                          CAT580  
                  ,:DCLVFNDSRVS.STTLM-DT                                CAT580  
                  ,:DCLVFNDSRVS.RJCT-CD                                 CAT580  
                  ,:DCLVFNDSRVS.DSBMT-ACCRL-CD                          CAT580  
                  ,:DCLVFNDSRVS.DSBMT-FRCTN-CSH-CD                      CAT580  
                  ,:DCLVFNDSRVS.DSBMT-RSDL-CD                           CAT580  
                  ,:DCLVFNDSRVS.DVDND-CD                                CAT580  
                  ,:DCLVFNDSRVS.CUST-NM                                 CAT580  
                  ,:DCLVFNDSRVS.CICS-TERM-ID-CD                         CAT580  
                  ,:DCLVFNDSRVS.PRGM-NM                                 CAT580  
                  ,:DCLVFNDSRVS.CRT-TMSTP                               CAT580  
                  ,:DCLVFNDSRVS.UPDT-TMSTP                              CAT580  
                  ,:DCLVFNDSRVS.SECURITY-ADP-NBR                        CAT580  
                 )                                                      CAT580  
           END-EXEC.                                                    CAT580  
                                                                        CAT580  
           ADD 1 TO W-SQL-CNT                                           CAT580  
                                                                        CAT580  
           MOVE 'VFNDSRVS'               TO W-DB2-TABLE-NAME            CAT580  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT580  
           MOVE SQLCODE                  TO W-DB2-SQLCODE               CAT580  
           .                                                            CAT580  
       6120-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       7000-EDIT-TRAILER SECTION.                                       CAT580  
                                                                        CAT580  
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                 CAT580  
               IF  W-CURR-TRL-SW = 'Y'                                  CAT580  
                   DISPLAY 'CAT580: DUPLICATE TRAILER'                  CAT580  
                                  ' FOR BROKER ' W-CURR-BRK-NBR         CAT580  
                   IF  L-BYP-FILECHK                                    CAT580  
                       DISPLAY 'CAT580: BYPASSING DUPLICATE TRAILER'    CAT580  
                   ELSE                                                 CAT580  
                       MOVE +3001 TO ABEND-CODE                         CAT580  
                       PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT        CAT580  
                   END-IF                                               CAT580  
               ELSE                                                     CAT580  
                   IF  W-CURR-HDR-SW NOT = 'Y'                          CAT580  
                       DISPLAY 'CAT580: MISSING HEADER'                 CAT580  
                   IF  L-BYP-FILECHK                                    CAT580  
                       DISPLAY 'CAT580: BYPASSING MISSING HEADER'       CAT580  
                   ELSE                                                 CAT580  
                       MOVE +3001 TO ABEND-CODE                         CAT580  
                       PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT        CAT580  
                   END-IF                                               CAT580  
                   END-IF                                               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE 'Y'                       TO W-CURR-TRL-SW              CAT580  
           MOVE NSCCMTRL-PROC-DATE        TO W-CURR-TRL-DATE            CAT580  
           MOVE NSCCMTRL-MULTI-CYCLE-NBR  TO W-CURR-TRL-CYCLE.          CAT580  
           MOVE NSCCMTRL-ITEM-CNT         TO W-CURR-ITEM-CNT.           CAT580  
                                                                        CAT580  
LRM007     IF  NSCCMTRL-PROC-DATE = WS-BPD-PROC-DATE                    CAT580  
               CONTINUE                                                 CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: NSCCMTRL-PROC-DATE('                    CAT580  
                                NSCCMTRL-PROC-DATE ') NOT = '           CAT580  
                       'BPD-PROC-DATE(' WS-BPD-PROC-DATE ')'            CAT580  
               IF L-BYP-DATECHK                                         CAT580  
                   DISPLAY 'CAT580: BYPASSING DATECHK PER JCLPARM'      CAT580  
               ELSE                                                     CAT580  
                   IF  L-BYP-FILECHK                                    CAT580  
                     DISPLAY 'CAT580: BYPASSING BAD DATE FILE PER JCL'  CAT580  
                   ELSE                                                 CAT580  
                     DISPLAY 'CAT580: U3014 - ABENDING ON BAD DATE'     CAT580  
                     MOVE +3014 TO ABEND-CODE                           CAT580  
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT          CAT580  
                   END-IF                                               CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
                                                                        CAT580  
           IF  NSCCMTRL-VAR-LEN-REC-IND = '*'                           CAT580  
               CONTINUE                                                 CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: NSCCMTRL-VAR-LEN-REC-IND '              CAT580  
                            '(' NSCCMTRL-VAR-LEN-REC-IND ')'            CAT580  
                            ' NOT = *'                                  CAT580  
               IF  L-BYP-FILECHK                                        CAT580  
                   DISPLAY 'CAT580: BYPASSING BAD VAR-LEN-REC-IND'      CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: U3018 - ABENDING ON BAD VAR IND'    CAT580  
                   MOVE +3018 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           IF  NSCCMTRL-ITEM-CNT NOT = W-CURR-TOT-CNT                   CAT580  
               DISPLAY 'CAT580: NSCCMTRL-ITEM-CNT '                     CAT580  
                            '(' NSCCMTRL-ITEM-CNT ')'                   CAT580  
                           ' NOT = W-CURR-TOT-CNT '                     CAT580  
                            '(' W-CURR-TOT-CNT ')'                      CAT580  
               IF  L-BYP-FILECHK                                        CAT580  
                   DISPLAY 'CAT580: BYPASSING BAD ITEM COUNT'           CAT580  
               ELSE                                                     CAT580  
                   DISPLAY 'CAT580: U3019 - ABENDING ON BAD ITEM COUNT' CAT580  
                   MOVE +3019 TO ABEND-CODE                             CAT580  
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT            CAT580  
               END-IF                                                   CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           IF  W-BRK-SW = 'Y'                                           CAT580  
               MOVE W-CURR-TAB           TO W-TAB (TAB-X)               CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE 'T'               TO W-HDR-TRL-SW.                      CAT580  
                                                                        CAT580  
       7000-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
LRM006 7050-LOOKUP-PTF-QTY SECTION.                                             
LRM006     EXEC SQL OPEN AT_CRSR END-EXEC                                       
LRM006     IF SQLCODE NOT = +0                                                  
LRM006        DISPLAY 'CAT580 AT_CRSR OPEN ERROR '                              
LRM006        MOVE SQLCODE                  TO W-DB2-SQLCODE            CAT580  
LRM006        PERFORM  8000-SQL-ERROR THRU 9000-EXIT                    CAT580  
LRM006     END-IF.                                                              
LRM006                                                                          
LRM006     PERFORM UNTIL STOP-VASSET                                            
LRM006        EXEC SQL                                                          
LRM006           FETCH AT_CRSR                                                  
LRM006             INTO                                                         
LRM006            :DCLVASSET.CLIENT-NBR                                         
LRM006           ,:DCLVASSET.ACAT-CONTROL-NBR                                   
LRM006           ,:DCLVASSET.ASSET-SEQ-NBR                                      
LRM006        END-EXEC                                                          
LRM006                                                                          
LRM006        MOVE SQLCODE TO W-DB2-SQLCODE                                     
LRM006                                                                          
LRM006        EVALUATE SQLCODE                                                  
LRM006           WHEN +100                                                      
LRM006             SET STOP-VASSET TO TRUE                                      
LRM006           WHEN +0                                                        
LRM006             DISPLAY 'FETCHED PTF ASSET W/ZERO QTY '                      
LRM006                  CLIENT-NBR        OF DCLVASSET                          
LRM006              ' ' ACAT-CONTROL-NBR  OF DCLVASSET                          
LRM006              ' ' ASSET-SEQ-NBR     OF DCLVASSET                          
LRM006             PERFORM 7060-SELECT-VFNDSRVS                                 
LRM006           WHEN  OTHER                                                    
LRM006                DISPLAY 'CAT580 AT_CRSR FETCH ERROR '                     
LRM006                MOVE SQLCODE                  TO W-DB2-SQLCODE    CAT580  
LRM006                PERFORM  8000-SQL-ERROR THRU 9000-EXIT            CAT580  
LRM006        END-EVALUATE                                                      
LRM006     END-PERFORM.                                                         
LRM006                                                                          
LRM006 7060-SELECT-VFNDSRVS SECTION.                                            
LRM006        EXEC SQL                                                          
LRM006           SELECT                                                         
LRM006             ASSET_QTY                                                    
LRM006           INTO                                                           
LRM006             :DCLVFNDSRVS.ASSET-QTY                                       
LRM006           FROM VFNDSRVS                                                  
LRM006           WHERE (CLIENT_NBR = :DCLVASSET.CLIENT-NBR    AND               
LRM006            ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR AND            
LRM006            ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR)                  
LRM006     END-EXEC.                                                            
LRM006                                                                          
LRM006     MOVE SQLCODE TO W-DB2-SQLCODE                                        
LRM006                                                                          
LRM006     EVALUATE SQLCODE                                                     
LRM006        WHEN +100                                                         
LRM006             CONTINUE                                                     
LRM006        WHEN +0                                                           
LRM006             IF ASSET-QTY OF DCLVFNDSRVS NOT = ZERO                       
LRM006                PERFORM 7070-REPLACE-VASSET-QTY                           
LRM006             END-IF                                                       
LRM006        WHEN  OTHER                                                       
LRM006             DISPLAY 'CAT580 VFNDSRVS SELECT ERROR '                      
LRM006             MOVE SQLCODE                  TO W-DB2-SQLCODE       CAT580  
LRM006             PERFORM  8000-SQL-ERROR THRU 9000-EXIT               CAT580  
LRM006     END-EVALUATE.                                                        
LRM006                                                                          
LRM006 7070-REPLACE-VASSET-QTY SECTION.                                         
LRM006     EXEC SQL                                                             
LRM006        UPDATE VASSET                                                     
LRM006           SET ASSET_QTY = :DCLVFNDSRVS.ASSET-QTY                         
LRM006        WHERE CLIENT_NBR       = :DCLVASSET.CLIENT-NBR  AND               
LRM006              ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR AND          
LRM006              ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR                 
LRM006     END-EXEC.                                                            
LRM006                                                                          
LRM006     EVALUATE SQLCODE                                                     
LRM006        WHEN +0                                                           
LRM006             DISPLAY 'PTF REPL VASSET QTY '                               
LRM006                  CLIENT-NBR        OF DCLVASSET                          
LRM006              ' ' ACAT-CONTROL-NBR  OF DCLVASSET                          
LRM006              ' ' ASSET-SEQ-NBR     OF DCLVASSET                          
LRM006              ' ' ASSET-QTY         OF DCLVFNDSRVS                        
LRM006        WHEN  OTHER                                                       
LRM006             DISPLAY 'CAT580 VASSET QTY UPDATE ERROR '                    
LRM006             MOVE SQLCODE                  TO W-DB2-SQLCODE       CAT580  
LRM006             PERFORM  8000-SQL-ERROR THRU 9000-EXIT               CAT580  
LRM006     END-EVALUATE.                                                        
      /                                                                 CAT580  
       7100-SQL-COMMIT     SECTION.                                     CAT580  
                                                                        CAT580  
           EXEC SQL COMMIT                                              CAT580  
           END-EXEC                                                     CAT580  
                                                                        CAT580  
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT580  
           MOVE SQLCODE TO COMMIT-RETURN                                CAT580  
                                                                        CAT580  
           IF  COMMIT-AB                                                CAT580  
               ACCEPT W-SYS-TIME            FROM TIME                   CAT580  
               DISPLAY 'TIME ' W-SYS-TIME                               CAT580  
                  ' SQL COMMIT FAILED.'                                 CAT580  
                          ' RC= '           COMMIT-RETURN               CAT580  
                     ' INP-CNT= '           W-INFILE-CNT                CAT580  
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT    CAT580  
                    ' LOAD-CNT= '           W-LOAD-CNT                  CAT580  
                     ' SQL-CNT= '           W-SQL-CNT                   CAT580  
           ELSE                                                         CAT580  
               CONTINUE                                                 CAT580  
***************ACCEPT*W-SYS-TIME************FROM*TIME*******************CAT580  
***************DISPLAY*'TIME*'*W-SYS-TIME*******************************CAT580  
******************'*SQL*COMMIT*OK.'*************************************CAT580  
*********************'*INP-CNT=*'***********W-INFILE-CNT****************CAT580  
********************'*PREV-CNT=*'***********W-LAST-COMMIT-INFILE-CNT****CAT580  
********************'*LOAD-CNT=*'***********W-LOAD-CNT******************CAT580  
*********************'*SQL-CNT=*'***********W-SQL-CNT*******************CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.   CAT580  
       7100-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       7200-SQL-ROLLBACK   SECTION.                                     CAT580  
           DISPLAY '7200-SQL-ROLLBACK'                                  CAT580  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT580  
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT580  
                                            W-LAST-COMMIT-INFILE-CNT    CAT580  
                                                                        CAT580  
           EXEC SQL ROLLBACK WORK                                       CAT580  
           END-EXEC                                                     CAT580  
                                                                        CAT580  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT580  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT580  
                                                                        CAT580  
           IF ROLLBACK-AB                                               CAT580  
               DISPLAY 'CAT580: '                                       CAT580  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT580  
                   ROLLBACK-RETURN                                      CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: '                                       CAT580  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT580  
                   ROLLBACK-RETURN                                      CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       7200-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       8000-SQL-ERROR            SECTION.                               CAT580  
           DISPLAY ' '                                                  CAT580  
           DISPLAY '8000-SQL-ERROR'                                     CAT580  
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT580  
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT580  
                                                                        CAT580  
           PERFORM 8200-DISPLAY-DB2-MSG THRU 8200-EXIT                  CAT580  
           DISPLAY ' '                                                  CAT580  
                                                                        CAT580  
           PERFORM 7200-SQL-ROLLBACK THRU 7200-EXIT                     CAT580  
                                                                        CAT580  
           IF  L-BYP-FILECHK                                            CAT580  
               DISPLAY 'CAT580: FILE CHECK WILL BE BYPASSED PER JCL'    CAT580  
           ELSE                                                         CAT580  
               DISPLAY 'CAT580: U3999 - ABENDING ON BAD DB2 STATUS'     CAT580  
               MOVE +3999    TO ABEND-CODE                              CAT580  
               CALL ABEND USING ABEND-CODE                              CAT580  
           END-IF.                                                      CAT580  
                                                                        CAT580  
       8000-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       8200-DISPLAY-DB2-MSG  SECTION.                                   CAT580  
                                                                        CAT580  
           DISPLAY ' '                                                  CAT580  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT580  
                                    W-DB2-MESSAGE-LEN.                  CAT580  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT580  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT580  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT580  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT580  
                   END-IF                                               CAT580  
           END-PERFORM.                                                 CAT580  
                                                                        CAT580  
       8200-EXIT. EXIT.                                                 CAT580  
      /                                                                 CAT580  
       9000-ABEND-ROUTINE SECTION.                                      CAT580  
                                                                        CAT580  
           DISPLAY ' '                                                  CAT580  
           DISPLAY 'CAT580: INPUT-CNT = ' W-INFILE-CNT                  CAT580  
           DISPLAY 'CAT580: W-CURR-STREAM-CD  = '                       CAT580  
                            W-CURR-STREAM-CD                            CAT580  
           DISPLAY 'CAT580: W-CURR-CLIENT-NBR = '                       CAT580  
                            W-CURR-CLIENT-NBR                           CAT580  
           DISPLAY 'CAT580: W-CURR-BRK-NBR    = '                       CAT580  
                            W-CURR-BRK-NBR                              CAT580  
           DISPLAY 'CAT580: W-CURR-HDR-SW     = '                       CAT580  
                            W-CURR-HDR-SW                               CAT580  
           DISPLAY 'CAT580: W-CURR-HDR-DATE   = '                       CAT580  
                            W-CURR-HDR-DATE                             CAT580  
           DISPLAY 'CAT580: W-CURR-HDR-CYCLE  = '                       CAT580  
                            W-CURR-HDR-CYCLE                            CAT580  
           DISPLAY 'CAT580: W-CURR-TRL-SW     = '                       CAT580  
                            W-CURR-TRL-SW                               CAT580  
           DISPLAY 'CAT580: W-CURR-TRL-DATE   = '                       CAT580  
                            W-CURR-TRL-DATE                             CAT580  
           DISPLAY 'CAT580: W-CURR-ITEM-CNT   = '                       CAT580  
                            W-CURR-ITEM-CNT                             CAT580  
           DISPLAY 'CAT580: W-CURR-TOT-CNT    = '                       CAT580  
                            W-CURR-TOT-CNT                              CAT580  
                                                                        CAT580  
           CALL ABEND USING ABEND-CODE.                                 CAT580  
                                                                        CAT580  
       9000-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      /                                                                 CAT580  
       9100-CLOSE-ROUTINE SECTION.                                      CAT580  
                                                                        CAT580  
           DISPLAY 'CAT580: W-TABLE = '                                 CAT580  
           PERFORM VARYING TAB-X FROM 1 BY 1 UNTIL TAB-X > 100          CAT580  
                   IF  W-TAB-STREAM-CD (TAB-X) > SPACES                 CAT580  
                       DISPLAY                                          CAT580  
                       ' STR='      W-TAB-STREAM-CD  (TAB-X)            CAT580  
                       ' CLT='      W-TAB-CLIENT-NBR (TAB-X)            CAT580  
                       ' BRK='      W-TAB-BRK-NBR    (TAB-X)            CAT580  
                       ' HDR='      W-TAB-HDR-SW     (TAB-X)            CAT580  
                                    W-TAB-HDR-DATE   (TAB-X)            CAT580  
                                    W-TAB-HDR-CYCLE  (TAB-X)            CAT580  
                       ' TRL='      W-TAB-TRL-SW     (TAB-X)            CAT580  
                                    W-TAB-TRL-DATE   (TAB-X)            CAT580  
                                    W-TAB-TRL-CYCLE  (TAB-X)            CAT580  
                       ' CNT='      W-TAB-ITEM-CNT   (TAB-X)            CAT580  
                       ' TOT='      W-TAB-TOT-CNT    (TAB-X)            CAT580  
                   END-IF                                               CAT580  
           END-PERFORM.                                                 CAT580  
                                                                        CAT580  
           DISPLAY ' '.                                                 CAT580  
           CLOSE INFILE                                                 CAT580  
                 STAT-SEQ-FILE.                                         CAT580  
                                                                        CAT580  
           DISPLAY 'CAT580: INFILE   CLOSED. STATUS = '                 CAT580  
                                             INFILE-STAT.               CAT580  
                                                                        CAT580  
           DISPLAY 'CAT580: INFILE   COUNT = ' W-INFILE-CNT             CAT580  
DJ0001                    ' (BZZZ.SIAC0720.ACAT.FUND)'                  CAT580  
DJ0001     DISPLAY 'CAT580: BYPASS   COUNT = ' W-NON-DETAIL-CNT         CAT580  
DJ0001     DISPLAY 'CAT580: LOAD     COUNT = ' W-LOAD-CNT               CAT580  
           DISPLAY 'CAT580: OUTFILE  COUNT = ' W-OUTFILE-CNT            CAT580  
DJ0001                    ' (BZZZ.CAT580.STATFL)'                       CAT580  
DJ0001     DISPLAY 'CAT580: VMF      UPD   = ' W-VMF-UPD-CNT            CAT580  
DJ0001     DISPLAY 'CAT580: VMF      NOTUPD= ' W-VMF-NOT-UPD-CNT        CAT580  
DJ0001     DISPLAY 'CAT580: VFNDSRVS UPD   = ' W-VFNDSRVS-UPD-CNT       CAT580  
DJ0001     DISPLAY 'CAT580: VFNDSRVS NOTUPD= ' W-VFNDSRVS-NOT-UPD-CNT   CAT580  
DJ0001     DISPLAY 'CAT580: VFNDSRVS ADD   = ' W-VFNDSRVS-ADD-CNT       CAT580  
DJ0001     DISPLAY 'CAT580: VFNDSRVS NOTADD= ' W-VFNDSRVS-NOT-ADD-CNT   CAT580  
           DISPLAY ' '.                                                 CAT580  
LRM005     IF W-INFILE-CNT < 100                                        CAT580  
LRM005        DISPLAY 'CAT580: FUNDSERV FILE CONTAINS LESS 100 RECS '   CAT580  
LRM005        DISPLAY '.  INPUT-CNT = ' W-INFILE-CNT                    CAT580  
LRM005        IF L-BYP-REC-CNT                                          CAT580  
LRM005           DISPLAY 'CAT580 BYPASS ABEND DUE TO PARM'              CAT580  
LRM005        ELSE                                                      CAT580  
LRM005           MOVE 12 TO RETURN-CODE                                 CAT580  
LRM005           DISPLAY 'CAT580 ISSUES RETURN CODE 12'                 CAT580  
LRM005           DISPLAY '*-------------------------------------------*'CAT580  
LRM005           DISPLAY 'PLEASE ALERT HELP DESK THAT ACATS FUNDESRV   'CAT580  
LRM005           DISPLAY 'FILE BZZZ.SIAC0720.ACAT.FUND(0) HAS VERY FEW 'CAT580  
LRM005           DISPLAY 'RECORDS, AND TO INVESTIGATE THE CAUSE.       'CAT580  
LRM005           DISPLAY 'IF FILE IS DETERMINED TO BE CORRECT, THIS MAY'CAT580  
LRM005           DISPLAY 'BE FORCE COMPLETED, ALL PROCESSING WAS DONE. 'CAT580  
LRM005           DISPLAY '*-------------------------------------------*'CAT580  
LRM005        END-IF                                                            
LRM005     END-IF.                                                              
           DISPLAY 'CAT580: PROGRAM ENDED SUCCESSFULLY'.                CAT580  
                                                                        CAT580  
       9100-EXIT.                                                       CAT580  
           EXIT.                                                        CAT580  
      *################################################################ CAT580  
