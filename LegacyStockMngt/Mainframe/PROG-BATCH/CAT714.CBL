000001* PDX    - CAT714   C0348882 12/06/13 06:49:15 TBCHKOP            00001000
000001* CSG001 - SSR# 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.               
000001* PDX    - CAT714   C0272583 12/08/08 09:48:19 TBDOJUN            00001000
000001* DJ0003 - SSR# 61164 POSITION TRANSFER FUND(PTF)                         
000001* PDX    - CAT714   C0221827 06/10/05 15:57:02 TBEDTAK            00001000
000001* ET0001 - SSR 42932 MIP REDUCTION (DELETE AGED FUND RECORDS).            
000001* PDX    - CAT714   C0210373 11/08/04 09:11:44 TBDOJUN            00001000
000001* DJ0002 - SSR# 29647 CREATE A FILE OF ACCOUNTS THAT WERE DELETED         
000001* DJ0002 - FROM HISTORY DATABASE FOR FULL TRANSFERS.                      
000001* DJ0002 - INPUT TO CAT610 TO PURGE N/A INDICATOR.                        
000001* PDX    - CAT714   C0211805 09/30/04 08:54:48 TBLAMUR            00001000
000001* LRM001 SSR 0034535 EXPAND HISTORY ASSET PERIOD TO 180 DAYS              
000001* PDX    - CAT714   C0151178 12/18/00 08:41:46 TBDOJUN            00001000
      * DJ0001 COBOL LE                                                 CAT714  
000001* PDX    - CAT714   C0124189 04/12/99 11:16:53 TBDOJUN            CAT714  
000001* PDX    - CAT714   C0122248 02/24/99 14:52:33 TBDOJUN            CAT714  
000001* PDX    - CAT714   C0121541 02/09/99 13:14:51 TBDOJUN            CAT714  
000001* PDX    - CAT714   C0120784 01/25/99 19:11:33 TBDOJUN            CAT714  
       IDENTIFICATION DIVISION.                                         CAT714  
       PROGRAM-ID.  CAT714.                                             CAT714  
      *REMARK.                                                          CAT714  
      *  ACATS REDESIGN -                                               CAT714  
      *        THIS PROGRAM DOES ACAT DATABASE MAINTENACE -             CAT714  
LRM001*        DELETE ASSET HISTORY THAT IS 180 DAYS OLD                CAT714  
      *        DELETE TRANSFER HISTORY THAT IS 6 MONTHS OLD             CAT714  
      *                                                                 CAT714  
      ******************************************************************CAT714  
      * 01/24/99 DJ   - NEW PROGRAM                                     CAT714  
      ******************************************************************CAT714  
       ENVIRONMENT DIVISION.                                            CAT714  
       INPUT-OUTPUT SECTION.                                            CAT714  
       FILE-CONTROL.                                                    CAT714  
DJ0002     SELECT  ACCTDEL-FILE        ASSIGN  TO ACCTDEL.              CAT714  
       DATA DIVISION.                                                   CAT714  
DJ0002 FILE SECTION.                                                    CAT714  
DJ0002***OUTPUT TO CAT610 LRECL=30                                      CAT714  
DJ0002 FD  ACCTDEL-FILE                                                 CAT714  
DJ0002     LABEL RECORDS STANDARD                                       CAT714  
DJ0002     RECORDING MODE IS F                                          CAT714  
DJ0002     BLOCK CONTAINS 0 RECORDS.                                    CAT714  
DJ0002 01  ACCTDEL-RECORD.                                              CAT714  
DJ0002   03  ACCTDEL-REC.                                               CAT714  
DJ0002     05  ACCTDEL-KEY.                                             CAT714  
DJ0002         10  ACCTDEL-CLT-NBR       PIC X(04).                     CAT714  
DJ0002         10  ACCTDEL-BRANCH-NBR    PIC X(03).                     CAT714  
DJ0002         10  ACCTDEL-ACCT-NBR      PIC X(05).                     CAT714  
DJ0002     05  ACCTDEL-DATA              PIC X(18).                     CAT714  
DJ0002   03  ACCTDEL-DATE-REC REDEFINES ACCTDEL-REC.                    CAT714  
DJ0002     05  ACCTDEL-DATE-KEY          PIC X(12).                     CAT714  
DJ0002         88  ACCTDEL-DATEREC       VALUE LOW-VALUES.              CAT714  
DJ0002     05  ACCTDEL-DATE-LIT          PIC X(05).                     CAT714  
DJ0002         88  ACCTDEL-DATELIT       VALUE 'DATE='.                 CAT714  
DJ0002     05  ACCTDEL-DATE-CYMD         PIC X(08).                     CAT714  
DJ0002     05  FILLER                    PIC X(05).                     CAT714  
DJ0002   03  ACCTDEL-TRLR-REC REDEFINES ACCTDEL-DATE-REC.               CAT714  
DJ0002     05  ACCTDEL-TRLR-KEY          PIC X(12).                     CAT714  
DJ0002         88  ACCTDEL-TRLRREC       VALUE HIGH-VALUES.             CAT714  
DJ0002     05  ACCTDEL-TRLR-LIT          PIC X(06).                     CAT714  
DJ0002         88  ACCTDEL-TRLRLIT       VALUE 'COUNT='.                CAT714  
DJ0002     05  ACCTDEL-TRLR-COUNT        PIC 9(11).                     CAT714  
DJ0002     05  FILLER                    PIC X(01).                     CAT714  
      /                                                                 CAT714  
      ******************************************************************CAT714  
       WORKING-STORAGE SECTION.                                         CAT714  
      ******************************************************************CAT714  
           COPY PDXIDCOB.                                               CAT714  
                                                                        CAT714  
DJ0001***===> COBOL LE                                                  CAT714  
DJ0001 01  W-ABEND-AREA.                                                CAT714  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT714  
DJ0001 01  CALL-MODULES.                                                CAT714  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT714  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT714  
DJ0001     COPY STUBCPY.                                                CAT714  
DJ0001***<=== COBOL LE                                                  CAT714  
                                                                        CAT714  
       01  W-WORK-AREA.                                                 CAT714  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT714'.    CAT714  
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT714  
ET0001     05  W-TBL-NAME                PIC  X(008).                   CAT714  
ET0001     05  W-CLT                     PIC  X(004).                   CAT714  
ET0001     05  W-ACAT-CNTL               PIC  X(014).                   CAT714  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT714  
           05  FILLER  REDEFINES                                        CAT714  
               W-SYS-DATE.                                              CAT714  
               10  W-UPD-DATE            PIC  X(006).                   CAT714  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT714  
           05  FILLER  REDEFINES                                        CAT714  
               W-SYS-TIME.                                              CAT714  
               10  W-UPD-TIME            PIC  X(006).                   CAT714  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT714  
           05  W-PROC-DT.                                               CAT714  
               10 W-PROC-DT-YEAR         PIC  X(004).                   CAT714  
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.         CAT714  
               10 W-PROC-DT-MM           PIC  X(002).                   CAT714  
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.         CAT714  
               10 W-PROC-DT-DD           PIC  X(002).                   CAT714  
           05  W-BPD-PROC-DATE           PIC  9(008).                   CAT714  
           05  W-BPD-PROC-DATE-X REDEFINES                              CAT714  
               W-BPD-PROC-DATE           PIC  X(008).                   CAT714  
           05  PROC-DATE-MINUS-180DAYS.                                 CAT714  
               10  PD180-CC              PIC X(2).                      CAT714  
               10  PD180-YY              PIC X(2).                      CAT714  
               10  PD180-MM              PIC X(2).                      CAT714  
               10  PD180-DD              PIC X(2).                      CAT714  
           05  W-DB2-PD180-DATE          PIC X(10).                     CAT714  
           05  FILLER REDEFINES W-DB2-PD180-DATE.                       CAT714  
               07  W-DB2-PD180-YEAR.                                    CAT714  
                   09  W-DB2-PD180-CC    PIC X(2).                      CAT714  
                   09  W-DB2-PD180-YY    PIC X(2).                      CAT714  
               07  W-DB2-PD180-S1        PIC X(1).                      CAT714  
               07  W-DB2-PD180-MM        PIC X(2).                      CAT714  
               07  W-DB2-PD180-S2        PIC X(1).                      CAT714  
               07  W-DB2-PD180-DD        PIC X(2).                      CAT714  
ET0001     05  W-CRT-DATE-TIME.                                         CAT714  
ET0001         07  W-CRT-DATE            PIC X(10).                     CAT714  
ET0001         07  W-CRT-TIME            PIC X(16).                     CAT714  
           05  W-DB2-COMPARE-DATE        PIC X(10).                     CAT714  
           05  W-PD180-READ-CNT          PIC  9(011) VALUE 0.           CAT714  
           05  W-PD180-FETCH-CNT         PIC  9(011) VALUE 0.           CAT714  
           05  W-AST-DELETE-CNT          PIC  9(011) VALUE 0.           CAT714  
           05  W-PD180-DELETE-CNT        PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FSRVS-READ-CNT          PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FSRVS-FETCH-CNT         PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FSRVS-DELETE-CNT        PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FRGST-READ-CNT          PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FRGST-FETCH-CNT         PIC  9(011) VALUE 0.           CAT714  
ET0001     05  W-FRGST-DELETE-CNT        PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-ACCTDEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-CRD-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-CRD-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-FRV-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-FRV-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-FUL-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-FUL-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-MFC-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-MFC-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-PTD-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-PTD-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-PTR-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-PTR-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-RCL-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-RCL-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-RCR-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0002     05  W-RCR-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0003     05  W-PTF-DEL-CNT             PIC  9(011) VALUE 0.           CAT714  
DJ0003     05  W-PTF-REC-CNT             PIC  9(011) VALUE 0.           CAT714  
                                                                        CAT714  
DJ0002***ACCTDEL RECORD LAYOUT LRECL=30                                 CAT714  
DJ0002 01  W-ACCTDEL-RECORD.                                            CAT714  
DJ0002   03  W-ACCTDEL-REC.                                             CAT714  
DJ0002     05  W-ACCTDEL-KEY.                                           CAT714  
DJ0002         10  W-ACCTDEL-CLT-NBR     PIC X(04).                     CAT714  
DJ0002         10  W-ACCTDEL-BRANCH-NBR  PIC X(03).                     CAT714  
DJ0002         10  W-ACCTDEL-ACCT-NBR    PIC X(05).                     CAT714  
DJ0002     05  W-ACCTDEL-DATA            PIC X(18).                     CAT714  
DJ0002   03  W-ACCTDEL-DATE-REC REDEFINES W-ACCTDEL-REC.                CAT714  
DJ0002     05  W-ACCTDEL-DATE-KEY        PIC X(12).                     CAT714  
DJ0002         88  W-ACCTDEL-DATEREC     VALUE LOW-VALUES.              CAT714  
DJ0002     05  W-ACCTDEL-DATE-LIT        PIC X(05).                     CAT714  
DJ0002         88  W-ACCTDEL-DATELIT     VALUE 'DATE='.                 CAT714  
DJ0002     05  W-ACCTDEL-DATE-CYMD       PIC X(08).                     CAT714  
DJ0002     05  FILLER                    PIC X(05).                     CAT714  
DJ0002   03  W-ACCTDEL-TRLR-REC REDEFINES W-ACCTDEL-DATE-REC.           CAT714  
DJ0002     05  W-ACCTDEL-TRLR-KEY        PIC X(12).                     CAT714  
DJ0002         88  W-ACCTDEL-TRLRREC     VALUE HIGH-VALUES.             CAT714  
DJ0002     05  W-ACCTDEL-TRLR-LIT        PIC X(06).                     CAT714  
DJ0002         88  W-ACCTDEL-TRLRLIT     VALUE 'COUNT='.                CAT714  
DJ0002     05  W-ACCTDEL-TRLR-COUNT      PIC 9(11).                     CAT714  
DJ0002     05  FILLER                    PIC X(01).                     CAT714  
      /                                                                 CAT714  
           COPY BHINFO.                                                 CAT714  
      /                                                                 CAT714  
           COPY BHACAT.                                                 CAT714  
      /                                                                 CAT714  
      ******************************************************************CAT714  
      * BPDATE COMMAREA                                                *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT714  
                                                                        CAT714  
           COPY BPDATESC.                                               CAT714  
      ******************************************************************CAT714  
      * DB2 COMMAREA                                                   *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT714  
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT714  
                                                                        CAT714  
      ******************************************************************CAT714  
      * DB2 ERROR MESSAGE AREA                                         *CAT714  
      ******************************************************************CAT714  
       01  W-DB2-MESSAGE-AREA.                                          CAT714  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT714  
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT714  
                   INDEXED BY W-DB2-IDX.                                CAT714  
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT714  
                                                                        CAT714  
       01  W-DB2-WORKAREA.                                              CAT714  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT714  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT714  
               88  ROLLBACK-OK                VALUE +0.                 CAT714  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT714  
                                                    +1   THRU +999.     CAT714  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT714  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT714  
               88  COMMIT-OK                  VALUE +0.                 CAT714  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT714  
                                                    +1   THRU +999.     CAT714  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT714  
                                              VALUE 0.                  CAT714  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT714  
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT714  
           05  W-DB2-ACTION              PIC  X(008).                   CAT714  
           05  W-DB2-SQLCODE             PIC ---9.                      CAT714  
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.              CAT714  
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.              CAT714  
ET0001     05  W-SRV-SQLCODE             PIC S9(9) COMP-4.              CAT714  
ET0001     05  W-RGS-SQLCODE             PIC S9(9) COMP-4.              CAT714  
           05  W-SQLERRD-3                   PIC  S9(9).                CAT714  
           05  W-SQL-DELETE-COUNT            PIC  --------9.            CAT714  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT714  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT714  
      /                                                                 CAT714  
      ******************************************************************CAT714  
      * TRANSFER HISTORY TABLE                                         *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'VTRNHSTY'.   CAT714  
           EXEC SQL INCLUDE VTRNHSTY     END-EXEC.                      CAT714  
      /                                                                 CAT714  
      ******************************************************************CAT714  
      * ASSET    HISTORY TABLE                                         *CAT714  
      ******************************************************************CAT714  
       01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.   CAT714  
           EXEC SQL INCLUDE VASTHSTY     END-EXEC.                      CAT714  
      /                                                                 CAT714  
ET0001******************************************************************CAT714  
ET0001*     FUND SERVER TABLE                                          *CAT714  
ET0001******************************************************************CAT714  
ET0001 01  FILLER                        PIC X(008) VALUE 'VFNDSRVS'.   CAT714  
ET0001     EXEC SQL INCLUDE VFNDSRVS     END-EXEC.                      CAT714  
ET0001/                                                                 CAT714  
ET0001******************************************************************CAT714  
ET0001*     FUND REGISTRATION TABLE                                    *CAT714  
ET0001******************************************************************CAT714  
ET0001 01  FILLER                        PIC X(008) VALUE 'VFNDRGST'.   CAT714  
ET0001     EXEC SQL INCLUDE VFNDRGST     END-EXEC.                      CAT714  
ET0001/                                                                 CAT714  
      ******************************************************************CAT714  
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *CAT714  
LRM001* FOR TRANSFER THAT ARE 180 DAYS OLD. DELETE THEIR ASSETS        *CAT714  
      ******************************************************************CAT714  
       01  FILLER                PIC X(016) VALUE 'VTRNHSTYCURSOR'.     CAT714  
           EXEC SQL                                                     CAT714  
                DECLARE VTRNHSTY_CURSOR CURSOR WITH HOLD FOR            CAT714  
                SELECT                                                  CAT714  
                    CLIENT_NBR                                          CAT714  
                   ,ACAT_CONTROL_NBR                                    CAT714  
                   ,TRNFR_TYPE_CD                                       CAT714  
                   ,PRCS_DT                                             CAT714  
                   ,DSTBN_SIDE_CD                                       CAT714  
                   ,BRANCH_CD                                           CAT714  
                   ,ACCT_CD                                             CAT714  
                FROM    VTRNHSTY                                        CAT714  
                                                                        CAT714  
                WHERE   PRCS_DT       < :W-DB2-COMPARE-DATE             CAT714  
                                                                        CAT714  
                ORDER BY                                                CAT714  
                        CLIENT_NBR                                      CAT714  
                       ,ACAT_CONTROL_NBR                                CAT714  
                                                                        CAT714  
           END-EXEC.                                                    CAT714  
      /                                                                 CAT714  
ET0001******************************************************************CAT714  
ET0001*         VFNDSRVS DECLARE CURSOR                                 CAT714  
ET0001******************************************************************CAT714  
ET0001 01  FILLER                PIC X(016) VALUE 'VFNDSRVSCURSOR'.     CAT714  
ET0001     EXEC SQL                                                     CAT714  
ET0001         DECLARE                                                  CAT714  
ET0001             VFNDSRVS_CSR CURSOR WITH HOLD FOR                    CAT714  
ET0001         SELECT                                                   CAT714  
ET0001             CLIENT_NBR                                           CAT714  
ET0001            ,ACAT_CONTROL_NBR                                     CAT714  
ET0001            ,ASSET_SEQ_NBR                                                
ET0001            ,PRCS_DT                                              CAT714  
ET0001            ,FNBR                                                         
ET0001         FROM                                                     CAT714  
ET0001             VFNDSRVS                                             CAT714  
ET0001         WHERE                                                    CAT714  
ET0001             PRCS_DT < :W-DB2-COMPARE-DATE                        CAT714  
ET0001         ORDER BY                                                 CAT714  
ET0001             CLIENT_NBR                                           CAT714  
ET0001            ,ACAT_CONTROL_NBR                                     CAT714  
ET0001     END-EXEC.                                                    CAT714  
ET0001/                                                                 CAT714  
ET0001******************************************************************CAT714  
ET0001*         VFNDRGST DECLARE CURSOR                                 CAT714  
ET0001******************************************************************CAT714  
ET0001 01  FILLER                PIC X(016) VALUE 'VFNDRGSTCURSOR'.     CAT714  
ET0001     EXEC SQL                                                     CAT714  
ET0001         DECLARE                                                  CAT714  
ET0001             VFNDRGST_CSR CURSOR WITH HOLD FOR                    CAT714  
ET0001         SELECT                                                   CAT714  
ET0001             CLIENT_NBR                                           CAT714  
ET0001            ,ACAT_CONTROL_NBR                                     CAT714  
ET0001            ,ASSET_SEQ_NBR                                                
ET0001            ,FNBR                                                         
ET0001            ,CRT_TMSTP                                            CAT714  
ET0001         FROM                                                     CAT714  
ET0001             VFNDRGST                                             CAT714  
ET0001**       WHERE                                                    CAT714  
ET0001**           PRCS_DT < :W-DB2-COMPARE-DATE                        CAT714  
ET0001**       ORDER BY                                                 CAT714  
ET0001**           CLIENT_NBR                                           CAT714  
ET0001**          ,ACAT_CONTROL_NBR                                     CAT714  
ET0001     END-EXEC.                                                    CAT714  
ET0001/                                                                 CAT714  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT714  
      ***************************************************************** CAT714  
       PROCEDURE DIVISION.                                              CAT714  
      ***************************************************************** CAT714  
       0000-MAIN SECTION.                                               CAT714  
           DISPLAY 'CAT714 - CREATE DELETED-ACCT FILE FOR FUL TFR'      CAT714  
           DISPLAY '       - PURGE ASSET HISTORY 180 DAYS OLD'          CAT714  
           DISPLAY '       - PURGE TRANSFER HISTORY 6 MONTHS OLD'       CAT714  
           DISPLAY ' '.                                                 CAT714  
           COPY MSGCOBO.                                                CAT714  
           DISPLAY ' '.                                                 CAT714  
                                                                        CAT714  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT714  
                                                                        CAT714  
           PERFORM 4000-DELETE-TRANSFER THRU 4000-EXIT                  CAT714  
ET0001     PERFORM 5000-DELETE-FND-SERV THRU 5000-EXIT.                 CAT714  
ET0001     PERFORM 6000-DELETE-FND-RGST THRU 6000-EXIT.                 CAT714  
                                                                        CAT714  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT714  
                                                                        CAT714  
           GOBACK.                                                      CAT714  
                                                                        CAT714  
       1000-INIT SECTION.                                               CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           IF  SQLCODE = +0                                             CAT714  
               DISPLAY ' '                                              CAT714  
               DISPLAY 'CAT714: W-CURRENT-TIMESTAMP = '                 CAT714  
                                                    W-CURRENT-TIMESTAMP CAT714  
               DISPLAY ' '                                              CAT714  
           ELSE                                                         CAT714  
               DISPLAY 'CAT714: W-CURRENT-TIMESTAMP NOT SET'            CAT714  
               PERFORM 8500-SQL-ERROR THRU 8500-EXIT                    CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT714  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT714  
           DISPLAY 'CAT714: SYS-DATE ' W-SYS-DATE                       CAT714  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT714  
                                                                        CAT714  
           MOVE 'CAT714'                  TO BPDATES-CALLING-PGM.       CAT714  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT714  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT714  
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.            CAT714  
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.              CAT714  
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.              CAT714  
           MOVE BPD-PROC-DATE             TO W-BPD-PROC-DATE.           CAT714  
                                                                        CAT714  
           DISPLAY ' '.                                                 CAT714  
           DISPLAY 'CAT714:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT714  
                            ' W-BPD-PROC-DATE-X= ' W-BPD-PROC-DATE-X    CAT714  
                                    ' W-PROC-DT= ' W-PROC-DT            CAT714  
           DISPLAY 'CAT714: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE  CAT714  
                                                                        CAT714  
           DISPLAY ' '.                                                 CAT714  
           MOVE  'D'                     TO  BPDATES-REQ-TYPE.          CAT714  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE  'US'                    TO  BPDATES-CALENDAR-TYPE.     CAT714  
CSG001     MOVE  '  '                    TO  BPDATES-CALENDAR-TYPE.     CAT714  
           MOVE  W-BPD-PROC-DATE         TO  BPDATES-BASE-DATE.         CAT714  
           MOVE  'M'                     TO  BPDATES-DTSEARCH-IND.      CAT714  
           MOVE  'C'                     TO  BPDATES-DTSEARCH-TYPE.     CAT714  
           MOVE  180                     TO  BPDATES-DTSEARCH-DISP.     CAT714  
           CALL BPDATES               USING  BPDATES-PARAMETERS.        CAT714  
                                                                        CAT714  
           IF  NOT BPD-VALID-RETURN                                     CAT714  
               DISPLAY 'CALL ZBPDATES FOR PROC-DATE MINUS 180 ABENDING' CAT714  
               DISPLAY 'ZBPDATES RETURN CODE = '                        CAT714  
                    BPDATES-RETURN-CODE ' ABENDING '                    CAT714  
               DISPLAY 'BASE DATE ' BPDATES-BASE-DATE                   CAT714  
                       ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP          CAT714  
               MOVE +3250    TO ABEND-CODE                              CAT714  
               CALL ABEND USING ABEND-CODE                              CAT714  
           END-IF                                                       CAT714  
                                                                        CAT714  
           MOVE BPD-DT-CALDATE TO  PROC-DATE-MINUS-180DAYS              CAT714  
           MOVE PD180-CC TO W-DB2-PD180-CC                              CAT714  
           MOVE PD180-YY TO W-DB2-PD180-YY                              CAT714  
           MOVE '-'      TO W-DB2-PD180-S1                              CAT714  
           MOVE PD180-MM TO W-DB2-PD180-MM                              CAT714  
           MOVE '-'      TO W-DB2-PD180-S2                              CAT714  
           MOVE PD180-DD TO W-DB2-PD180-DD                              CAT714  
           DISPLAY 'PROC DATE MINUS 180 DAYS = ' PROC-DATE-MINUS-180DAYSCAT714  
           DISPLAY 'W-DB2-PD180-DATE         = ' W-DB2-PD180-DATE.      CAT714  
                                                                        CAT714  
DJ0002***OPEN AND WRITE A DATE RECORD TO ACCTDEL FILE                   CAT714  
DJ0002     OPEN OUTPUT ACCTDEL-FILE.                                    CAT714  
DJ0002     MOVE ' '               TO W-ACCTDEL-DATE-REC                 CAT714  
DJ0002     SET W-ACCTDEL-DATEREC  TO TRUE                               CAT714  
DJ0002     SET W-ACCTDEL-DATELIT  TO TRUE                               CAT714  
DJ0002     MOVE W-BPD-PROC-DATE   TO W-ACCTDEL-DATE-CYMD                CAT714  
DJ0002     WRITE ACCTDEL-RECORD FROM W-ACCTDEL-DATE-REC.                CAT714  
                                                                        CAT714  
       1000-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
      ***************************************************************** CAT714  
      *  DELETE TRANSFERS THAT ARE 6 MONTHS(180 DAYS OLD)             * CAT714  
      ***************************************************************** CAT714  
       4000-DELETE-TRANSFER   SECTION.                                  CAT714  
           MOVE '4000-DELETE-TRANSFER       ' TO W-ROUTINE-1.           CAT714  
           DISPLAY ' '.                                                 CAT714  
                                                                        CAT714  
           DISPLAY 'PROCESSING 180 DAY OLD TRANSFERS'.                  CAT714  
           MOVE W-DB2-PD180-DATE TO W-DB2-COMPARE-DATE.                 CAT714  
                                                                        CAT714  
           EXEC SQL OPEN VTRNHSTY_CURSOR END-EXEC                       CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF SQLCODE = +0                                              CAT714  
              DISPLAY 'VTRNHSTY_CURSOR OPENED'                          CAT714  
           ELSE                                                         CAT714  
              DISPLAY 'VTRNHSTY_CURSOR OPEN ERROR '                     CAT714  
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT714  
           END-IF                                                       CAT714  
                                                                        CAT714  
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                         CAT714  
                                                                        CAT714  
              ADD 1 TO W-PD180-READ-CNT                                 CAT714  
                                                                        CAT714  
              EXEC SQL                                                  CAT714  
                   FETCH VTRNHSTY_CURSOR                                CAT714  
               INTO                                                     CAT714  
                    :DCLVTRNHSTY.CLIENT-NBR                             CAT714  
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                       CAT714  
                   ,:DCLVTRNHSTY.TRNFR-TYPE-CD                          CAT714  
                   ,:DCLVTRNHSTY.PRCS-DT                                CAT714  
                   ,:DCLVTRNHSTY.DSTBN-SIDE-CD                          CAT714  
                   ,:DCLVTRNHSTY.BRANCH-CD                              CAT714  
                   ,:DCLVTRNHSTY.ACCT-CD                                CAT714  
              END-EXEC                                                  CAT714  
                                                                        CAT714  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT714  
              MOVE SQLCODE      TO W-TFR-SQLCODE                        CAT714  
              EVALUATE SQLCODE                                          CAT714  
                  WHEN +0                                               CAT714  
                       PERFORM 4200-DELETE-ASSET THRU 4200-EXIT         CAT714  
                       PERFORM 8000-CHK-COMMIT   THRU 8000-EXIT         CAT714  
                       ADD 1 TO W-PD180-FETCH-CNT                       CAT714  
                       PERFORM 4500-DELETE-VTRNHSTY THRU 4500-EXIT      CAT714  
                       PERFORM 8000-CHK-COMMIT   THRU 8000-EXIT         CAT714  
                  WHEN +100                                             CAT714  
                       DISPLAY 'INP=' W-PD180-READ-CNT                  CAT714  
                              ' VTRNHSTY_CURSOR FETCH NOT FOUND '       CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                  WHEN OTHER                                            CAT714  
                       DISPLAY 'INP=' W-PD180-READ-CNT                  CAT714  
                              ' VTRNHSTY_CURSOR FETCH ERROR '           CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT714  
              END-EVALUATE                                              CAT714  
                                                                        CAT714  
           END-PERFORM                                                  CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
                CLOSE VTRNHSTY_CURSOR                                   CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-TFR-SQLCODE                           CAT714  
           IF  SQLCODE = +0                                             CAT714  
              DISPLAY 'VTRNHSTY_CURSOR CLOSED'                          CAT714  
           ELSE                                                         CAT714  
               DISPLAY 'INP=' W-PD180-READ-CNT                          CAT714  
                      ' VTRNHSTY_CURSOR CLOSE ERROR '                   CAT714  
                      ' SQLCODE = ' W-DB2-SQLCODE                       CAT714  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT714  
           END-IF.                                                      CAT714  
           DISPLAY 'W-PD180-FETCH-CNT  = ' W-PD180-FETCH-CNT            CAT714  
           DISPLAY 'W-PD180-DELETE-CNT = ' W-PD180-DELETE-CNT.          CAT714  
                                                                        CAT714  
       4000-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
      ***************************************************************** CAT714  
      *  DELETE ASSETS FOR TRANSFERS THAT ARE 180 DAYS OLD            * CAT714  
      ***************************************************************** CAT714  
       4200-DELETE-ASSET   SECTION.                                     CAT714  
           MOVE '4200-DELETE-ASSET          ' TO W-ROUTINE-1.           CAT714  
ET0001     MOVE 'VASTHSTY'  TO  W-TBL-NAME.                             CAT714  
                                                                        CAT714  
           EXEC SQL DELETE FROM VASTHSTY                                CAT714  
                WHERE  CLIENT_NBR       = :DCLVTRNHSTY.CLIENT-NBR       CAT714  
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           MOVE SQLERRD(3)          TO W-SQLERRD-3                      CAT714  
           MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT               CAT714  
           ADD  W-SQLERRD-3         TO W-AST-DELETE-CNT                 CAT714  
                                                                        CAT714  
           IF  SQLCODE = +0                                             CAT714  
                  CONTINUE                                              CAT714  
***************DISPLAY*'INP='*W-PD180-READ-CNT**************************CAT714**
*********************'*CLT='*CLIENT-NBR*******OF*DCLVTRNHSTY************CAT714**
*********************'*CTL='*ACAT-CONTROL-NBR*OF*DCLVTRNHSTY************CAT714**
**********************'*PD='*PRCS-DT**********OF*DCLVTRNHSTY************CAT714**
*********************'*VASTHSTY*DELETED*'*******************************CAT714**
**********************'COUNT*=*'*W-SQL-DELETE-COUNT*********************CAT714**
           ELSE                                                         CAT714  
               IF SQLCODE = +100                                        CAT714  
                  CONTINUE                                              CAT714  
******************DISPLAY*'INP='*W-INFILE-CNT***************************CAT714  
*************************'*CLT='*CLIENT-NBR*******OF*DCLVTRNHSTY********CAT714  
*************************'*CTL='*ACAT-CONTROL-NBR*OF*DCLVTRNHSTY********CAT714  
**************************'*PD='*PRCS-DT**********OF*DCLVTRNHSTY********CAT714  
*********************'*VASTHSTY*NOT*FOUND'******************************CAT714  
               ELSE                                                     CAT714  
                  DISPLAY 'INP=' W-PD180-READ-CNT                       CAT714  
                         ' CLT=' CLIENT-NBR       OF DCLVTRNHSTY        CAT714  
                         ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY        CAT714  
                          ' PD=' PRCS-DT          OF DCLVTRNHSTY        CAT714  
                     ' VASTHSTY DELETE ERROR'                           CAT714  
                  MOVE SQLCODE      TO W-DB2-SQLCODE                    CAT714  
                  DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                    CAT714  
                  PERFORM  8500-SQL-ERROR THRU 8500-EXIT                CAT714  
               END-IF                                                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
       4200-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       4500-DELETE-VTRNHSTY  SECTION.                                   CAT714  
                                                                        CAT714  
DJ0002     PERFORM 4510-CREATE-ACCTDEL-FILE   THRU  4510-EXIT.          CAT714  
                                                                        CAT714  
ET0001     MOVE 'VTRNHSTY'  TO  W-TBL-NAME.                             CAT714  
                                                                        CAT714  
           EXEC SQL DELETE FROM VTRNHSTY                                CAT714  
                WHERE  CLIENT_NBR       = :DCLVTRNHSTY.CLIENT-NBR       CAT714  
                  AND  ACAT_CONTROL_NBR = :DCLVTRNHSTY.ACAT-CONTROL-NBR CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           IF  SQLCODE = +0                                             CAT714  
               ADD 1 TO W-PD180-DELETE-CNT                              CAT714  
DJ0002         PERFORM 4520-COUNT-THE-DELETES THRU 4520-EXIT            CAT714  
***************DISPLAY*'INP='*W-PD180-READ-CNT**************************CAT714  
*********************'*CLT='*CLIENT-NBR*******OF*DCLVTRNHSTY************CAT714  
*********************'*CTL='*ACAT-CONTROL-NBR*OF*DCLVTRNHSTY************CAT714  
**********************'*PD='*PRCS-DT**********OF*DCLVTRNHSTY************CAT714  
*********************'*VTRNHSTY*DELETED*'*******************************CAT714  
           ELSE                                                         CAT714  
               IF SQLCODE = +100                                        CAT714  
                  CONTINUE                                              CAT714  
               ELSE                                                     CAT714  
                  DISPLAY 'INP=' W-PD180-READ-CNT                       CAT714  
                         ' CLT=' CLIENT-NBR       OF DCLVTRNHSTY        CAT714  
                         ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY        CAT714  
                          ' PD=' PRCS-DT          OF DCLVTRNHSTY        CAT714  
                     ' VTRNHSTY DELETE ERROR'                           CAT714  
                  MOVE SQLCODE      TO W-DB2-SQLCODE                    CAT714  
                  DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                    CAT714  
                  PERFORM  8500-SQL-ERROR THRU 8500-EXIT                CAT714  
               END-IF                                                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
***********MOVE*SQLERRD(3)**********TO*W-SQLERRD-3**********************CAT714  
***********MOVE*W-SQLERRD-3*********TO*W-SQL-DELETE-COUNT***************CAT714  
************************************************************************CAT714  
***********IF**SQLCODE*=*+0*********************************************CAT714  
***************DISPLAY*'VTRNHSTY*6*MONTH*OLD*DELETE*'*******************CAT714  
***********************'COUNT*=*'*W-SQL-DELETE-COUNT********************CAT714  
***********ELSE*********************************************************CAT714  
***************IF*SQLCODE*=*+100****************************************CAT714  
******************DISPLAY*'VTRNHSTY*6*MONTH*OLD*DELETE*NOT*FOUND'*******CAT714  
***************ELSE*****************************************************CAT714  
******************DISPLAY*'VTRNHSTY*6*MONTH*OLD*DELETE*ERROR'***********CAT714  
******************MOVE*SQLCODE******TO*W-DB2-SQLCODE********************CAT714  
******************DISPLAY*'SQLCODE*=*'*W-DB2-SQLCODE********************CAT714  
******************PERFORM**8500-SQL-ERROR*THRU*8500-EXIT****************CAT714  
***************END-IF***************************************************CAT714  
***********END-IF.******************************************************CAT714  
                                                                        CAT714  
                                                                        CAT714  
       4500-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
DJ0002***CREATE DELETE RECORD FOR FULL TRANSFER                         CAT714  
DJ0002 4510-CREATE-ACCTDEL-FILE.                                        CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'FUL')                   CAT714  
DJ0002     AND (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002         MOVE  SPACE                                              CAT714  
DJ0002           TO  W-ACCTDEL-REC                                      CAT714  
DJ0002         MOVE  CLIENT-NBR OF DCLVTRNHSTY                          CAT714  
DJ0002           TO  W-ACCTDEL-CLT-NBR                                  CAT714  
DJ0002         MOVE  BRANCH-CD     OF DCLVTRNHSTY                       CAT714  
DJ0002           TO  W-ACCTDEL-BRANCH-NBR                               CAT714  
DJ0002         MOVE  ACCT-CD       OF DCLVTRNHSTY                       CAT714  
DJ0002           TO  W-ACCTDEL-ACCT-NBR                                 CAT714  
DJ0002         WRITE ACCTDEL-RECORD FROM W-ACCTDEL-REC                  CAT714  
DJ0002         ADD 1 TO W-ACCTDEL-CNT                                   CAT714  
DJ0002     END-IF.                                                      CAT714  
DJ0002 4510-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
DJ0002 4520-COUNT-THE-DELETES.                                          CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'FUL')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-FUL-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-FUL-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'CRD')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-CRD-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-CRD-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'FRV')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-FRV-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-FRV-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'MFC')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-MFC-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-MFC-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'PTD')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-PTD-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-PTD-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'PTR')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-PTR-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-PTR-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'RCL')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-RCL-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-RCL-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0002     END-IF                                                       CAT714  
DJ0002     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'RCR')                   CAT714  
DJ0002      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0002          ADD 1 TO W-RCR-DEL-CNT                                  CAT714  
DJ0002      ELSE                                                        CAT714  
DJ0002          ADD 1 TO W-RCR-REC-CNT                                  CAT714  
DJ0002      END-IF                                                      CAT714  
DJ0003     END-IF                                                       CAT714  
DJ0003     IF  (TRNFR-TYPE-CD OF DCLVTRNHSTY = 'PTF')                   CAT714  
DJ0003      IF (DSTBN-SIDE-CD OF DCLVTRNHSTY = 'D')                     CAT714  
DJ0003          ADD 1 TO W-PTF-DEL-CNT                                  CAT714  
DJ0003      ELSE                                                        CAT714  
DJ0003          ADD 1 TO W-PTF-REC-CNT                                  CAT714  
DJ0003      END-IF                                                      CAT714  
DJ0002     END-IF.                                                      CAT714  
       4520-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
ET0001 5000-DELETE-FND-SERV.                                            CAT714  
           MOVE '5000-DELETE-FND-SERV       ' TO W-ROUTINE-1.           CAT714  
           DISPLAY ' '.                                                 CAT714  
                                                                        CAT714  
           MOVE 'VFNDSRVS'  TO  W-TBL-NAME.                             CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
               OPEN VFNDSRVS_CSR                                        CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-SRV-SQLCODE.                          CAT714  
           IF SQLCODE = +0                                              CAT714  
              DISPLAY 'VFNDSRVS_CSR OPENED'                             CAT714  
           ELSE                                                         CAT714  
              DISPLAY 'VFNDSRVS_CSR OPEN ERROR '                        CAT714  
                      'SQLCODE = ' W-DB2-SQLCODE                        CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           PERFORM UNTIL W-SRV-SQLCODE NOT = +0                         CAT714  
                                                                        CAT714  
              ADD 1 TO W-FSRVS-READ-CNT                                 CAT714  
                                                                        CAT714  
              EXEC SQL                                                  CAT714  
                   FETCH VFNDSRVS_CSR                                   CAT714  
               INTO                                                     CAT714  
                    :DCLVFNDSRVS.CLIENT-NBR                             CAT714  
                   ,:DCLVFNDSRVS.ACAT-CONTROL-NBR                       CAT714  
                   ,:DCLVFNDSRVS.ASSET-SEQ-NBR                                  
                   ,:DCLVFNDSRVS.PRCS-DT                                CAT714  
                   ,:DCLVFNDSRVS.FNBR                                           
              END-EXEC                                                  CAT714  
                                                                        CAT714  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT714  
              MOVE SQLCODE      TO W-SRV-SQLCODE                        CAT714  
                                                                        CAT714  
              MOVE W-FSRVS-READ-CNT     TO W-PD180-READ-CNT             CAT714  
                                                                        CAT714  
              EVALUATE SQLCODE                                          CAT714  
                  WHEN +0                                               CAT714  
                       ADD 1 TO W-FSRVS-FETCH-CNT                       CAT714  
                       PERFORM 5100-DELETE-VFNDSRVS THRU 5100-EXIT      CAT714  
                       PERFORM 8000-CHK-COMMIT      THRU 8000-EXIT      CAT714  
                  WHEN +100                                             CAT714  
                       DISPLAY 'INP=' W-FSRVS-READ-CNT                  CAT714  
                              ' VFNDSRVS_CSR FETCH NOT FOUND '          CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                  WHEN OTHER                                            CAT714  
                       DISPLAY 'INP=' W-FSRVS-READ-CNT                  CAT714  
                              ' VFNDSRVS_CSR FETCH ERROR '              CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT714  
              END-EVALUATE                                              CAT714  
                                                                        CAT714  
           END-PERFORM.                                                 CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
                CLOSE VFNDSRVS_CSR                                      CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-SRV-SQLCODE                           CAT714  
           IF  SQLCODE = +0                                             CAT714  
              DISPLAY 'VFNDSRVS_CSR CLOSED'                             CAT714  
           ELSE                                                         CAT714  
               DISPLAY 'TBL=VFNDSRVS'                                   CAT714  
                      ' INP=' W-FSRVS-READ-CNT                          CAT714  
                      ' VFNDSRVS_CSR CLOSE ERROR '                      CAT714  
                      ' SQLCODE = ' W-DB2-SQLCODE                       CAT714  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT714  
           END-IF.                                                      CAT714  
           DISPLAY 'W-FSRVS-FETCH-CNT  = ' W-FSRVS-FETCH-CNT            CAT714  
           DISPLAY 'W-FSRVS-DELETE-CNT = ' W-FSRVS-DELETE-CNT.          CAT714  
                                                                        CAT714  
ET0001 5000-EXIT.  EXIT.                                                CAT714  
       EJECT                                                            CAT714  
      *                                                                 CAT714  
ET0001 5100-DELETE-VFNDSRVS.                                            CAT714  
           EXEC SQL DELETE                                              CAT714  
               FROM                                                     CAT714  
                  VFNDSRVS                                              CAT714  
               WHERE                                                    CAT714  
                  CLIENT_NBR           = :DCLVFNDSRVS.CLIENT-NBR        CAT714  
                  AND ACAT_CONTROL_NBR = :DCLVFNDSRVS.ACAT-CONTROL-NBR  CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           IF  SQLCODE = +0                                             CAT714  
               ADD SQLERRD(3) TO W-FSRVS-DELETE-CNT                     CAT714  
           ELSE                                                         CAT714  
               IF SQLCODE = +100                                        CAT714  
                  CONTINUE                                              CAT714  
               ELSE                                                     CAT714  
                  DISPLAY 'TBL=VFNDSRVS'                                CAT714  
                         ' INP=' W-FSRVS-READ-CNT                       CAT714  
                         ' CLT=' CLIENT-NBR       OF DCLVFNDSRVS        CAT714  
                         ' CTL=' ACAT-CONTROL-NBR OF DCLVFNDSRVS        CAT714  
                         ' SEQ=' ASSET-SEQ-NBR    OF DCLVFNDSRVS        CAT714  
                     ' PROC-DT=' PRCS-DT          OF DCLVFNDSRVS        CAT714  
                     ' VFNDSRVS DELETE ERROR'                           CAT714  
                  MOVE SQLCODE      TO W-DB2-SQLCODE                    CAT714  
                  DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                    CAT714  
                  MOVE W-FSRVS-READ-CNT   TO W-PD180-READ-CNT           CAT714  
                  PERFORM  8500-SQL-ERROR THRU 8500-EXIT                CAT714  
               END-IF                                                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
ET0001 5100-EXIT.  EXIT.                                                CAT714  
       EJECT                                                            CAT714  
      *                                                                 CAT714  
ET0001 6000-DELETE-FND-RGST.                                            CAT714  
           MOVE '6000-DELETE-FND-RGST       ' TO W-ROUTINE-1.           CAT714  
           DISPLAY ' '.                                                 CAT714  
                                                                        CAT714  
           MOVE 'VFNDRGST'  TO  W-TBL-NAME.                             CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
               OPEN VFNDRGST_CSR                                        CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-RGS-SQLCODE.                          CAT714  
           IF SQLCODE = +0                                              CAT714  
              DISPLAY 'VFNDRGST_CSR OPENED'                             CAT714  
           ELSE                                                         CAT714  
              DISPLAY 'VFNDRGST_CSR OPEN ERROR '                        CAT714  
                      'SQLCODE = ' W-DB2-SQLCODE                        CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           PERFORM UNTIL W-RGS-SQLCODE NOT = +0                         CAT714  
                                                                        CAT714  
              ADD 1 TO W-FRGST-READ-CNT                                 CAT714  
                                                                        CAT714  
              EXEC SQL                                                  CAT714  
                   FETCH VFNDRGST_CSR                                   CAT714  
               INTO                                                     CAT714  
                    :DCLVFNDRGST.CLIENT-NBR                             CAT714  
                   ,:DCLVFNDRGST.ACAT-CONTROL-NBR                       CAT714  
                   ,:DCLVFNDRGST.ASSET-SEQ-NBR                                  
                   ,:DCLVFNDRGST.FNBR                                           
                   ,:DCLVFNDRGST.CRT-TMSTP                                      
              END-EXEC                                                  CAT714  
                                                                        CAT714  
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT714  
              MOVE SQLCODE      TO W-RGS-SQLCODE                        CAT714  
                                                                        CAT714  
              MOVE W-FRGST-READ-CNT     TO W-PD180-READ-CNT             CAT714  
                                                                        CAT714  
              EVALUATE SQLCODE                                          CAT714  
                  WHEN +0                                               CAT714  
                       ADD 1 TO W-FRGST-FETCH-CNT                       CAT714  
                       MOVE CRT-TMSTP OF DCLVFNDRGST TO W-CRT-DATE-TIME CAT714  
                       IF W-CRT-DATE < W-DB2-COMPARE-DATE               CAT714  
                          PERFORM 6100-DELETE-VFNDRGST THRU 6100-EXIT   CAT714  
                          PERFORM 8000-CHK-COMMIT      THRU 8000-EXIT   CAT714  
                       END-IF                                           CAT714  
                  WHEN +100                                             CAT714  
                       DISPLAY 'INP=' W-FRGST-READ-CNT                  CAT714  
                              ' VFNDRGST_CSR FETCH NOT FOUND '          CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                  WHEN OTHER                                            CAT714  
                       DISPLAY 'INP=' W-FRGST-READ-CNT                  CAT714  
                              ' VFNDRSGT_CSR FETCH ERROR '              CAT714  
                              ' SQLCODE = ' W-DB2-SQLCODE               CAT714  
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT714  
              END-EVALUATE                                              CAT714  
                                                                        CAT714  
           END-PERFORM.                                                 CAT714  
                                                                        CAT714  
           EXEC SQL                                                     CAT714  
                CLOSE VFNDRGST_CSR                                      CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           MOVE SQLCODE      TO W-DB2-SQLCODE                           CAT714  
           MOVE SQLCODE      TO W-RGS-SQLCODE                           CAT714  
           IF  SQLCODE = +0                                             CAT714  
              DISPLAY 'VFNDRGST_CSR CLOSED'                             CAT714  
           ELSE                                                         CAT714  
               DISPLAY 'TBL=VFNDRGST'                                   CAT714  
                      ' INP=' W-FRGST-READ-CNT                          CAT714  
                      ' VFNDRGST_CSR CLOSE ERROR '                      CAT714  
                      ' SQLCODE = ' W-DB2-SQLCODE                       CAT714  
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT714  
           END-IF.                                                      CAT714  
           DISPLAY 'W-FRGST-FETCH-CNT  = ' W-FRGST-FETCH-CNT            CAT714  
           DISPLAY 'W-FRGST-DELETE-CNT = ' W-FRGST-DELETE-CNT.          CAT714  
                                                                        CAT714  
ET0001 6000-EXIT.  EXIT.                                                CAT714  
       EJECT                                                            CAT714  
      *                                                                 CAT714  
ET0001 6100-DELETE-VFNDRGST.                                            CAT714  
           EXEC SQL DELETE                                              CAT714  
               FROM                                                     CAT714  
                  VFNDRGST                                              CAT714  
               WHERE                                                    CAT714  
                  CLIENT_NBR           = :DCLVFNDRGST.CLIENT-NBR        CAT714  
                  AND ACAT_CONTROL_NBR = :DCLVFNDRGST.ACAT-CONTROL-NBR  CAT714  
           END-EXEC.                                                    CAT714  
                                                                        CAT714  
           IF  SQLCODE = +0                                             CAT714  
               ADD SQLERRD(3) TO W-FRGST-DELETE-CNT                     CAT714  
           ELSE                                                         CAT714  
               IF SQLCODE = +100                                        CAT714  
                  CONTINUE                                              CAT714  
               ELSE                                                     CAT714  
                  DISPLAY 'TBL=VFNDRGST'                                CAT714  
                         ' INP=' W-FRGST-READ-CNT                       CAT714  
                         ' CLT=' CLIENT-NBR       OF DCLVFNDRGST        CAT714  
                         ' CTL=' ACAT-CONTROL-NBR OF DCLVFNDRGST        CAT714  
                   ' CRT-TMSTP=' CRT-TMSTP        OF DCLVFNDRGST        CAT714  
                     ' VFNDRGST DELETE ERROR'                           CAT714  
                  MOVE SQLCODE      TO W-DB2-SQLCODE                    CAT714  
                  DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                    CAT714  
                  MOVE W-FRGST-READ-CNT   TO W-PD180-READ-CNT           CAT714  
                  PERFORM  8500-SQL-ERROR THRU 8500-EXIT                CAT714  
               END-IF                                                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
ET0001 6100-EXIT.  EXIT.                                                CAT714  
       EJECT                                                            CAT714  
      *                                                                 CAT714  
       8000-CHK-COMMIT     SECTION.                                     CAT714  
                                                                        CAT714  
           ADD +1 TO W-COMMIT-CTR                                       CAT714  
           IF  W-COMMIT-CTR > +9                                        CAT714  
               PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                   CAT714  
               MOVE 0 TO W-COMMIT-CTR                                   CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
       8000-EXIT. EXIT.                                                 CAT714  
                                                                        CAT714  
       8120-SQL-COMMIT     SECTION.                                     CAT714  
                                                                        CAT714  
           EXEC SQL COMMIT                                              CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT714  
           MOVE SQLCODE TO COMMIT-RETURN                                CAT714  
                                                                        CAT714  
           IF  COMMIT-AB                                                CAT714  
ET0001         IF  W-TBL-NAME = 'VTRNHSTY' OR 'VASTHSTY'                CAT714  
ET0001             MOVE  CLIENT-NBR OF DCLVTRNHSTY   TO  W-CLT          CAT714  
ET0001             MOVE  ACAT-CONTROL-NBR OF DCLVTRNHSTY TO W-ACAT-CNTL CAT714  
ET0001         END-IF                                                   CAT714  
ET0001         IF  W-TBL-NAME = 'VFNDSRVS'                              CAT714  
ET0001             MOVE  CLIENT-NBR OF DCLVFNDSRVS   TO  W-CLT          CAT714  
ET0001             MOVE  ACAT-CONTROL-NBR OF DCLVFNDSRVS TO W-ACAT-CNTL CAT714  
ET0001         END-IF                                                   CAT714  
ET0001         IF  W-TBL-NAME = 'VFNDRGST'                              CAT714  
ET0001             MOVE  CLIENT-NBR OF DCLVFNDRGST   TO  W-CLT          CAT714  
ET0001             MOVE  ACAT-CONTROL-NBR OF DCLVFNDRGST TO W-ACAT-CNTL CAT714  
ET0001         END-IF                                                   CAT714  
               DISPLAY 'CAT714: '                                       CAT714  
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                 CAT714  
                    COMMIT-RETURN                                       CAT714  
ET0001            ' TBL=' W-TBL-NAME                                    CAT714  
                  ' INFILE-CNT='           W-PD180-READ-CNT             CAT714  
ET0001**                 ' CLT=' CLIENT-NBR       OF DCLVTRNHSTY        CAT714  
ET0001**                 ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY        CAT714  
ET0001                   ' CLT=' W-CLT                                  CAT714  
ET0001                   ' CTL=' W-ACAT-CNTL                            CAT714  
                    ' PREV-CNT='           W-LAST-COMMIT-INFILE-CNT     CAT714  
           ELSE                                                         CAT714  
               CONTINUE                                                 CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
           MOVE W-PD180-READ-CNT         TO W-LAST-COMMIT-INFILE-CNT    CAT714  
           .                                                            CAT714  
       8120-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       8500-SQL-ERROR      SECTION.                                     CAT714  
           DISPLAY ' '                                                  CAT714  
           DISPLAY '8500-SQL-ERROR'                                     CAT714  
ET0001            ' TBL = ' W-TBL-NAME                                  CAT714  
                  ' INFILE-CNT = ' W-PD180-READ-CNT                     CAT714  
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT714  
                                                                        CAT714  
           DISPLAY ' '                                                  CAT714  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT714  
                                    W-DB2-MESSAGE-LEN.                  CAT714  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT714  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT714  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT714  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT714  
                   END-IF                                               CAT714  
           END-PERFORM.                                                 CAT714  
           DISPLAY ' '                                                  CAT714  
                                                                        CAT714  
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT.                    CAT714  
           DISPLAY 'CAT714: U3999 - ABENDING ON BAD DB2 STATUS'         CAT714  
           DISPLAY 'CAT714: PROGRAM ENDED ABNORMALLY'                   CAT714  
           MOVE +3999    TO ABEND-CODE                                  CAT714  
           CALL ABEND USING ABEND-CODE.                                 CAT714  
                                                                        CAT714  
       8500-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       8700-SQL-ROLLBACK   SECTION.                                     CAT714  
           DISPLAY '8700-SQL-ROLLBACK'                                  CAT714  
ET0001            ' TBL = ' W-TBL-NAME                                  CAT714  
                  ' INFILE-CNT = ' W-PD180-READ-CNT                     CAT714  
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT714  
                                            W-LAST-COMMIT-INFILE-CNT    CAT714  
                                                                        CAT714  
           EXEC SQL ROLLBACK WORK                                       CAT714  
           END-EXEC                                                     CAT714  
                                                                        CAT714  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT714  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT714  
                                                                        CAT714  
           IF ROLLBACK-AB                                               CAT714  
               DISPLAY                                                  CAT714  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT714  
                   ROLLBACK-RETURN                                      CAT714  
           ELSE                                                         CAT714  
               DISPLAY                                                  CAT714  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT714  
                   ROLLBACK-RETURN                                      CAT714  
           END-IF.                                                      CAT714  
                                                                        CAT714  
       8700-EXIT. EXIT.                                                 CAT714  
      /                                                                 CAT714  
       9000-CLOSE-ROUTINE SECTION.                                      CAT714  
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.        CAT714  
                                                                        CAT714  
DJ0002***WRITE A TRAILER RECORD AND CLOSE ACCTDEL FILE                  CAT714  
DJ0002     MOVE ' '               TO W-ACCTDEL-TRLR-REC                 CAT714  
DJ0002     SET W-ACCTDEL-TRLRREC  TO TRUE                               CAT714  
DJ0002     SET W-ACCTDEL-TRLRLIT  TO TRUE                               CAT714  
DJ0002     MOVE W-ACCTDEL-CNT     TO W-ACCTDEL-TRLR-COUNT.              CAT714  
DJ0002     WRITE ACCTDEL-RECORD FROM W-ACCTDEL-TRLR-REC.                CAT714  
DJ0002     CLOSE ACCTDEL-FILE.                                          CAT714  
                                                                        CAT714  
           DISPLAY ' '.                                                 CAT714  
           DISPLAY '180 DAY OLD TRANSFERS         = ' W-PD180-FETCH-CNT CAT714  
           DISPLAY '180 DAY OLD TRANSFERS DELETED = ' W-PD180-DELETE-CNTCAT714  
           DISPLAY '180 DAY OLD ASSETS DELETED    = ' W-AST-DELETE-CNT  CAT714  
DJ0002     DISPLAY 'DELETED FULL DELVRY ACCT CNT  = ' W-ACCTDEL-CNT     CAT714  
ET0001     DISPLAY 'DELETED FUND/SERV CNT         = ' W-FSRVS-DELETE-CNTCAT714  
ET0001     DISPLAY 'DELETED FUND RGST CNT         = ' W-FRGST-DELETE-CNTCAT714  
DJ0002     DISPLAY 'W-CRD-DEL-CNT                 = ' W-CRD-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-CRD-REC-CNT                 = ' W-CRD-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-FRV-DEL-CNT                 = ' W-FRV-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-FRV-REC-CNT                 = ' W-FRV-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-FUL-DEL-CNT                 = ' W-FUL-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-FUL-REC-CNT                 = ' W-FUL-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-MFC-DEL-CNT                 = ' W-MFC-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-MFC-REC-CNT                 = ' W-MFC-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-PTD-DEL-CNT                 = ' W-PTD-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-PTD-REC-CNT                 = ' W-PTD-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-PTR-DEL-CNT                 = ' W-PTR-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-PTR-REC-CNT                 = ' W-PTR-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-RCL-DEL-CNT                 = ' W-RCL-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-RCL-REC-CNT                 = ' W-RCL-REC-CNT     CAT714  
DJ0002     DISPLAY 'W-RCR-DEL-CNT                 = ' W-RCR-DEL-CNT     CAT714  
DJ0002     DISPLAY 'W-RCR-REC-CNT                 = ' W-RCR-REC-CNT     CAT714  
DJ0003     DISPLAY 'W-PTF-DEL-CNT                 = ' W-PTF-DEL-CNT     CAT714  
DJ0003     DISPLAY 'W-PTF-REC-CNT                 = ' W-PTF-REC-CNT     CAT714  
           DISPLAY ' '.                                                 CAT714  
           DISPLAY 'CAT714: PROGRAM ENDED SUCCESSFULLY'.                CAT714  
                                                                        CAT714  
       9000-EXIT. EXIT.                                                 CAT714  
      *################################################################ CAT714  
