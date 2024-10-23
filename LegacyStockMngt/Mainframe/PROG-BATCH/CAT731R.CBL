000001* PDX    - CAT731R  C0266770 06/27/08 13:39:43 TBLAMUR            00001000
000001* LRM002 SSR#55171 DO NOT REPORT MMF ROWS                         00001000
000001* PDX    - CAT731R  C0252012 08/13/07 10:33:20 TBDOJUN            00001000
000001* DJ0001 SSR#51272 REMOVE "ADP" FROM HEADING                      00001000
000001* PDX    - CAT731R  C0179727 11/04/02 13:50:14 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT731R 
       PROGRAM-ID.    CAT731R.                                          CAT731R 
      ***************************************************************** CAT731R 
      * THIS PROGRAM CONTAINS DB2.                                    * CAT731R 
      ***************************************************************** CAT731R 
      *    ACATS - RESCIND BLOCK    REPORTS                             CAT731R 
      *                                                                 CAT731R 
      *    SORT                                                         CAT731R 
      *                                                                 CAT731R 
      *    B1 434XXX TO PRODUCE REPORT.                                 CAT731R 
      *                                                                 CAT731R 
      *    INPUT   :                                                    CAT731R 
      *            1) ACATS RESCIND BLOCK TABLE   I/P - DB2 DATABASE    CAT731R 
      *            2) ACATS RESCIND BLOCK HSTY    I/P - DB2 DATABASE    CAT731R 
      *            3) ACATS LOG FILE OF LAST RPT  I/P - QSAM            CAT731R 
      *    OUTPUT  :                                                    CAT731R 
      *            1) BXXX.CAT731R.RBPI        O/P - REPORT             CAT731R 
      *                                                                 CAT731R 
      *---------------------------------------------------------------* CAT731R 
      * 09/19/02 LRM - NEW ACATS PROGRAM                              * CAT731R 
      *---------------------------------------------------------------* CAT731R 
      /                                                                 CAT731R 
       ENVIRONMENT DIVISION.                                            CAT731R 
       INPUT-OUTPUT SECTION.                                            CAT731R 
       FILE-CONTROL.                                                    CAT731R 
                                                                        CAT731R 
           SELECT LOG-FILE-IN            ASSIGN TO UT-S-LOGIN.                  
           SELECT REPT-FILE              ASSIGN TO UT-S-REPT            CAT731R 
                                         FILE STATUS IS REPT-STAT.      CAT731R 
           SELECT REPT2-FILE             ASSIGN TO UT-S-REPT2           CAT731R 
                                         FILE STATUS IS REPT2-STAT.     CAT731R 
           SELECT REPT3-FILE             ASSIGN TO UT-S-REPT3           CAT731R 
                                         FILE STATUS IS REPT3-STAT.     CAT731R 
                                                                        CAT731R 
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.      CAT731R 
      /                                                                 CAT731R 
       DATA DIVISION.                                                   CAT731R 
       FILE SECTION.                                                    CAT731R 
       FD  LOG-FILE-IN                                                          
           RECORDING MODE IS F.                                                 
                                                                                
       01  LOG-RECORD-IN            PIC X(80).                                  
                                                                                
       FD  REPT-FILE                                                    CAT731R 
           RECORDING MODE IS F.                                         CAT731R 
                                                                        CAT731R 
       01  REPT-REC.                                                    CAT731R 
           03 REPT-LINE             PIC  X(133).                        CAT731R 
           03 REPT-CLT              PIC S9(003) COMP-3.                 CAT731R 
           03 REPT-FIL              PIC  X(008).                        CAT731R 
       FD  REPT2-FILE                                                   CAT731R 
           RECORDING MODE IS F.                                         CAT731R 
                                                                        CAT731R 
       01  REPT2-REC.                                                   CAT731R 
           03 REPT2-LINE            PIC  X(133).                        CAT731R 
           03 REPT2-CLT             PIC S9(003) COMP-3.                 CAT731R 
           03 REPT2-FIL             PIC  X(008).                        CAT731R 
       FD  REPT3-FILE                                                   CAT731R 
           RECORDING MODE IS F.                                         CAT731R 
                                                                        CAT731R 
       01  REPT3-REC.                                                   CAT731R 
           03 REPT3-LINE            PIC  X(133).                        CAT731R 
           03 REPT3-CLT             PIC S9(003) COMP-3.                 CAT731R 
           03 REPT3-FIL             PIC  X(008).                        CAT731R 
      /                                                                 CAT731R 
       SD  SORT-FILE.                                                   CAT731R 
                                                                        CAT731R 
       01  SORT-RECORD.                                                 CAT731R 
           03 SORT-KEY              PIC  X(027).                        CAT731R 
           03 SORT-BODY             PIC  X(198).                        CAT731R 
      /                                                                 CAT731R 
       WORKING-STORAGE SECTION.                                         CAT731R 
       COPY PDXIDCOB.                                                   CAT731R 
                                                                        CAT731R 
       01  W-FIELDS.                                                    CAT731R 
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.          CAT731R 
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.          CAT731R 
               88 NOT-FIRST-TIME                    VALUE '1'.          CAT731R 
           05  INFILE-STAT               PIC  X(02) VALUE '00'.         CAT731R 
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT731R 
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT731R 
               88  INFILE-DUPE-REC       VALUE '22'.                    CAT731R 
               88  INFILE-NOTFND         VALUE '23'.                    CAT731R 
               88  INFILE-EMPTY          VALUE '35'.                    CAT731R 
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT731R 
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT731R 
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT731R 
               88 END-OF-INFILE                     VALUE '1'.          CAT731R 
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.          CAT731R 
               88 END-OF-SORT                       VALUE '1'.          CAT731R 
           05  REPT-STAT                 PIC  X(02) VALUE '00'.         CAT731R 
               88 REPT-OKAY                         VALUE '00'.         CAT731R 
           05  REPT2-STAT                PIC  X(02) VALUE '00'.         CAT731R 
               88 REPT3-OKAY                        VALUE '00'.         CAT731R 
           05  REPT3-STAT                PIC  X(02) VALUE '00'.         CAT731R 
               88 REPT3-OKAY                        VALUE '00'.         CAT731R 
           05  W-INFILE-CNT              PIC  9(11) VALUE 0.            CAT731R 
           05  W-CLIENT-ACTIVE-CNT       PIC  9(11) VALUE 0.            CAT731R 
           05  W-CLIENT-DELETE-CNT       PIC  9(11) VALUE 0.            CAT731R 
           05  W-CLIENT-ADD-CNT          PIC  9(11) VALUE 0.            CAT731R 
           05  W-INFILE-HSTY-CNT         PIC  9(11) VALUE 0.            CAT731R 
           05  W-RELEASE-CNT             PIC  9(11) VALUE 0.            CAT731R 
           05  W-RETURN-CNT              PIC  9(11) VALUE 0.            CAT731R 
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            CAT731R 
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           CAT731R 
           05  W-LOAD-CNT                PIC  9(11) VALUE 60.           CAT731R 
           05  LD-PROC-DATE.                                            CAT731R 
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT731R 
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT731R 
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT731R 
           05  W-PROC-DATE.                                             CAT731R 
               10 W-PROC-DATE-CC         PIC  X(02).                    CAT731R 
               10 W-PROC-DATE-YY         PIC  X(02).                    CAT731R 
               10 W-PROC-DATE-MM         PIC  X(02).                    CAT731R 
               10 W-PROC-DATE-DD         PIC  X(02).                    CAT731R 
           05  W-PROC-DATE-N REDEFINES                                  CAT731R 
               W-PROC-DATE               PIC  9(008).                   CAT731R 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT731R 
           05  FILLER  REDEFINES                                        CAT731R 
               W-SYS-DATE.                                              CAT731R 
               10  W-SYS-YY              PIC  X(002).                   CAT731R 
               10  W-SYS-MM              PIC  X(002).                   CAT731R 
               10  W-SYS-DD              PIC  X(002).                   CAT731R 
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT731R 
           05  FILLER  REDEFINES                                        CAT731R 
               W-SYS-TIME.                                              CAT731R 
               10  W-SYS-HH              PIC  X(002).                   CAT731R 
               10  W-SYS-MN              PIC  X(002).                   CAT731R 
               10  W-SYS-SS              PIC  X(002).                   CAT731R 
               10  W-SYS-MS              PIC  X(002).                   CAT731R 
           05  W-REPT-CLT                PIC  9(03) VALUE 0.            CAT731R 
           05  W-REPT-LINE               PIC  X(133).                   CAT731R 
       01  W-PREV-AREA.                                                 CAT731R 
           05  W-PREV-CLIENT-NBR         PIC X(0004).                   CAT731R 
           05  W-PREV-REPORT-IND         PIC X(0001).                   CAT731R 
                                                                        CAT731R 
       01  W-CURRENT-FIELDS.                                            CAT731R 
           05  W-CURR-CLIENT             PIC X(004).                    CAT731R 
           05  W-CURR-CLIENT-N REDEFINES                                CAT731R 
               W-CURR-CLIENT             PIC 9(004).                    CAT731R 
           05  W-CURR-STREAM             PIC X(001).                    CAT731R 
                                                                        CAT731R 
      /                                                                 CAT731R 
       01  FILLER                        PIC X(008) VALUE 'W-SORT'.     CAT731R 
                                                                        CAT731R 
       01  W-SORT-RECORD.                                               CAT731R 
        03  W-SORT-REC.                                                 CAT731R 
         05  W-SORT-KEY.                                                CAT731R 
           10  W-SORT-CLIENT-NBR               PIC X(0004).             CAT731R 
           10  W-SORT-CLIENT-NBR-N REDEFINES                            CAT731R 
               W-SORT-CLIENT-NBR               PIC 9(0004).             CAT731R 
           10  W-SORT-REPORT-ID                PIC X(1).                        
               88  W-SORT-ADDS-RPT                VALUE '1'.                    
               88  W-SORT-DELETE-RPT              VALUE '2'.                    
               88  W-SORT-ACTIVE-RPT              VALUE '3'.                    
           10  W-SORT-BRANCH-CD                PIC X(3).                        
           10  W-SORT-ACCT-CD                  PIC X(5).                        
           10  W-SORT-BLOCK-CD                 PIC X(1).                        
           10  W-SORT-RCV-NBR                  PIC X(4).                        
           10  W-SORT-ISIN-SEC-ISSUE-CD        PIC X(9).                        
         05  W-SORT-DATA.                                               CAT731R 
           10  W-SORT-SECURITY-ADP-NBR PIC X(7).                                
           10  W-SORT-CRT-TMSTP        PIC X(26).                               
           10  W-SORT-UPDT-TMSTP       PIC X(26).                               
           10  W-SORT-EXPIRE-DT        PIC X(10).                               
           10  W-SORT-ACTION-CD        PIC X(1).                                
               88  W-SORT-ACTION-DELETE             VALUE 'D'.                  
               88  W-SORT-ACTION-EXPIRE             VALUE 'E'.                  
               88  W-SORT-ACTION-MISSING            VALUE 'M'.                  
           10  W-SORT-CICS-SNON-ID     PIC X(4).                                
           10  W-SORT-CICS-TERM-ID-CD  PIC X(4).                                
           10  W-SORT-CMNT-TXT         PIC X(120).                              
                                                                        CAT731R 
      /                                                                 CAT731R 
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT731R 
       01  B1-TABLE-AREA.                                               CAT731R 
           03  B1-TABLE OCCURS 500 TIMES.                               CAT731R 
               05  B1-CLT-NBR               PIC 9(04).                  CAT731R 
               05  B1-CLT-NAME              PIC X(30).                  CAT731R 
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT731R 
               05  B1-STREAM                PIC X(01).                  CAT731R 
               05  B1-STATUS                PIC X(01).                  CAT731R 
               05  B1-ACAT-STATUS           PIC X(01).                  CAT731R 
               05  B1-PRINT                 PIC X(01).                  CAT731R 
       01  B1-WORK-FIELEDS.                                             CAT731R 
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT731R 
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT731R 
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.          CAT731R 
           03  B1-PRT-SUB                   PIC 9(04) VALUE 0.          CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      * B1 HEADER                                                      *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT731R 
           COPY BHINFO.                                                 CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      * B1 ACAT SECTION                                                *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT731R 
           COPY BHACAT.                                                 CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      * BPDATE COMMAREA                                                *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT731R 
                                                                        CAT731R 
           COPY BPDATESC.                                               CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      * ACTIVE RESCIND BLOCK TABLE                                     *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'VRSDBLK'.    CAT731R 
           EXEC SQL INCLUDE VRSDBLK      END-EXEC.                      CAT731R 
                                                                        CAT731R 
      ******************************************************************CAT731R 
      * HISTORICAL RESCIND BLOCK TABLE                                 *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'VACTRBHY'.   CAT731R 
           EXEC SQL INCLUDE VACTRBHY     END-EXEC.                      CAT731R 
                                                                        CAT731R 
      ******************************************************************CAT731R 
      * DB2 COMMAREA                                                   *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   CAT731R 
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      CAT731R 
                                                                        CAT731R 
      ******************************************************************CAT731R 
      * DB2 ERROR MESSAGE AREA                                         *CAT731R 
      ******************************************************************CAT731R 
       01  W-DB2-MESSAGE-AREA.                                          CAT731R 
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT731R 
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT731R 
                   INDEXED BY W-DB2-IDX.                                CAT731R 
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT731R 
                                                                        CAT731R 
       01  W-DB2-WORKAREA.                                              CAT731R 
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT731R 
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT731R 
               88  ROLLBACK-OK                VALUE +0.                 CAT731R 
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT731R 
                                                    +1   THRU +999.     CAT731R 
           05  COMMIT-SQLCA              PIC  X(122).                   CAT731R 
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT731R 
               88  COMMIT-OK                  VALUE +0.                 CAT731R 
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT731R 
                                                    +1   THRU +999.     CAT731R 
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT731R 
                                              VALUE 0.                  CAT731R 
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           CAT731R 
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT731R 
           05  W-DB2-ACTION              PIC  X(008).                   CAT731R 
           05  W-DB2-SQLCODE             PIC ---9.                      CAT731R 
                                                                        CAT731R 
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT731R 
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      * DECLARE CURSOR FOR RESIND BLOCK HISTORY TABLE                  *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'CURSOR '.    CAT731R 
           EXEC SQL                                                     CAT731R 
                DECLARE VACTRBHY_CURSOR CURSOR WITH HOLD FOR            CAT731R 
                SELECT                                                  CAT731R 
                    CLIENT_NBR                                          CAT731R 
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
                FROM    VACTRBHY                                        CAT731R 
                WHERE   CLIENT_NBR    = :W-CURR-CLIENT                  CAT731R 
LRM002          AND NOT BLOCK_CD      = 'M'                                     
           END-EXEC.                                                    CAT731R 
                                                                        CAT731R 
      ******************************************************************CAT731R 
      * DECLARE CURSOR FOR RESIND BLOCK    TABLE                       *CAT731R 
      ******************************************************************CAT731R 
       01  FILLER                        PIC X(008) VALUE 'CURSOR '.    CAT731R 
           EXEC SQL                                                     CAT731R 
                DECLARE VRSDBLK_CURSOR CURSOR WITH HOLD FOR             CAT731R 
                SELECT                                                  CAT731R 
                    CLIENT_NBR                                          CAT731R 
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
                FROM    VRSDBLK                                         CAT731R 
                WHERE   CLIENT_NBR    = :W-CURR-CLIENT                  CAT731R 
           END-EXEC.                                                    CAT731R 
                                                                        CAT731R 
      /                                                                 CAT731R 
       01  W-HDR1-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT731R 
           05  FILLER                       PIC  X(08) VALUE            CAT731R 
               'CAT731R '.                                              CAT731R 
           05  W-HDR1-CLT                   PIC  Z999.                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT731R 
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(42) VALUE            CAT731R 
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT731R 
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(13) VALUE            CAT731R 
               'PROCESS DATE '.                                         CAT731R 
           05  W-HDR1-MM                    PIC  X(02).                 CAT731R 
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT731R 
           05  W-HDR1-DD                    PIC  X(02).                 CAT731R 
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT731R 
           05  W-HDR1-YY                    PIC  X(02).                 CAT731R 
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(05) VALUE            CAT731R 
               'PAGE '.                                                 CAT731R 
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT731R 
                                                                        CAT731R 
       01  W-HDR2-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(08) VALUE            CAT731R 
               'BROKER  '.                                              CAT731R 
           05  W-HDR2-BKR                   PIC  X(04).                 CAT731R 
           05  FILLER                       PIC  X(45) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(42).                 CAT731R 
               88  ADDS-RPT  VALUE                                      CAT731R 
                   ' RESCIND/BLOCKS ADDED TODAY REPORT'.                CAT731R 
               88  DETETE-RPT VALUE                                     CAT731R 
                   'RESCIND/BLOCKS DELETED/EXPIRED REPORT'.             CAT731R 
               88  ACTIVE-RPT VALUE                                     CAT731R 
                   ' RESCIND/BLOCK ACTIVE ITEMS REPORT'.                CAT731R 
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(09) VALUE            CAT731R 
               'RUN TIME '.                                             CAT731R 
           05  W-HDR2-MM                    PIC  X(02).                 CAT731R 
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT731R 
           05  W-HDR2-DD                    PIC  X(02).                 CAT731R 
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT731R 
           05  W-HDR2-YY                    PIC  X(02).                 CAT731R 
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT731R 
           05  W-HDR2-HH                    PIC  X(02).                 CAT731R 
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT731R 
           05  W-HDR2-MN                    PIC  X(02).                 CAT731R 
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT731R 
                                                                        CAT731R 
       01  W-HDR3-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT731R 
           05  FILLER                       PIC  X(50) VALUE            CAT731R 
DJ0001         'ACCOUNT NO.  TYPE   RCV-BRK   CUSIP    SEC-NO     '.    CAT731R 
           05  FILLER                       PIC  X(54) VALUE            CAT731R 
               'CREATED     LAST UPDATE   EXPIRES     SNON TERMID'.     CAT731R 
           05  W-HDR3-ACTION                PIC  X(08) VALUE ' '.       CAT731R 
                                                                        CAT731R 
                                                                        CAT731R 
       01  W-DTL1-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT731R 
           05  W-DTL1-BRANCH                PIC  X(03) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(01) VALUE '-'.       CAT731R 
           05  W-DTL1-ACCT-CD               PIC  X(05) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(05) VALUE ' '.       CAT731R 
           05  W-DTL1-BLOCK-CD              PIC  X(01).                 CAT731R 
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT731R 
           05  W-DTL1-RCV-NBR               PIC  X(04).                 CAT731R 
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT731R 
           05  W-DTL1-CUSIP                 PIC  X(09).                 CAT731R 
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT731R 
DJ0001     05  W-DTL1-SEC-NO                PIC  X(07).                 CAT731R 
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT731R 
           05  W-DTL1-CRT-TMSTP             PIC  X(10).                 CAT731R 
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT731R 
           05  W-DTL1-UPDT-TMSTP            PIC  X(10).                 CAT731R 
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT731R 
           05  W-DTL1-EXPIRE-DT             PIC  X(10).                 CAT731R 
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT731R 
           05  W-DTL1-CICS-SNON             PIC  X(04).                 CAT731R 
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT731R 
           05  W-DTL1-CICS-TERM             PIC  X(04).                 CAT731R 
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT731R 
           05  W-DTL1-ACTION                PIC  X(08).                 CAT731R 
                                                                        CAT731R 
       01  W-DTL2-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(12) VALUE            CAT731R 
               '    COMMENT:'.                                                  
           05  W-DTL2-COMMENT               PIC  X(120).                CAT731R 
                                                                        CAT731R 
       01  W-DTLX-REC.                                                  CAT731R 
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT731R 
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT731R 
           05  FILLER                       PIC  X(40) VALUE            CAT731R 
           'NO DETAILS TODAY'.                                          CAT731R 
                                                                        CAT731R 
       01  WS-LOG-RECORD.                                                       
           03 PRIOR-RUN-TMSTP       PIC  X(26).                                 
           03 CURRENT-RUN-TMSTP     PIC  X(26).                                 
           03 FILLER                PIC  X(28).                                 
      /                                                                 CAT731R 
      ***--->COBOL LE                                                   CAT731R 
       01  W-ABEND-AREA.                                                CAT731R 
           03  ABEND-CD                  PIC S9(04) COMP SYNC.          CAT731R 
                                                                        CAT731R 
           COPY STUBCPY.                                                CAT731R 
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT731R 
      ***<---COBOL LE                                                   CAT731R 
                                                                        CAT731R 
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT731R 
      /                                                                 CAT731R 
      ***************************************************************** CAT731R 
      *    LINKAGE SECTION                                            * CAT731R 
      ***************************************************************** CAT731R 
       LINKAGE SECTION.                                                 CAT731R 
       01  L-JCL-PARMS.                                                 CAT731R 
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT731R 
           05  L-STREAM                  PIC  X(001).                   CAT731R 
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT731R 
               88  L-BYP-DATECHK                     VALUE '1'.         CAT731R 
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT731R 
               88  L-BYP-FILECHK                     VALUE '1'.         CAT731R 
                                                                        CAT731R 
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT731R 
      *                         ===========                             CAT731R 
       0000-MAIN SECTION.                                               CAT731R 
                                                                        CAT731R 
           DISPLAY 'CAT731R - ACATS RESCIND BLOCK REPORT'.              CAT731R 
           DISPLAY ' '.                                                 CAT731R 
           COPY MSGCOBO.                                                CAT731R 
           DISPLAY ' '.                                                 CAT731R 
                                                                        CAT731R 
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT731R 
                                                                        CAT731R 
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT731R 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT731R 
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT731R 
                                                                        CAT731R 
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT731R 
                                                                        CAT731R 
       0000-FINI.                                                       CAT731R 
                                                                        CAT731R 
           GOBACK.                                                      CAT731R 
      /                                                                 CAT731R 
       1000-INIT SECTION.                                               CAT731R 
                                                                        CAT731R 
           DISPLAY 'CAT731R: L-STREAM         = '                       CAT731R 
                            L-STREAM.                                   CAT731R 
           DISPLAY 'CAT731R: L-BYP-DATECHK-SW = '                       CAT731R 
                            L-BYP-DATECHK-SW.                           CAT731R 
           DISPLAY 'CAT731R: L-BYP-FILECHK-SW = '                       CAT731R 
                            L-BYP-FILECHK-SW.                           CAT731R 
           IF  L-BYP-DATECHK                                            CAT731R 
               DISPLAY 'CAT731R: DATE CHECK WILL BE BYPASSED'           CAT731R 
           ELSE                                                         CAT731R 
               DISPLAY 'CAT731R: DATE CHECK WILL BE PERFORMED'          CAT731R 
           END-IF.                                                      CAT731R 
           IF  L-BYP-FILECHK                                            CAT731R 
               DISPLAY 'CAT731R: FILE CHECK WILL BE BYPASSED'           CAT731R 
           ELSE                                                         CAT731R 
               DISPLAY 'CAT731R: FILE CHECK WILL BE PERFORMED'          CAT731R 
           END-IF.                                                      CAT731R 
                                                                        CAT731R 
           MOVE 'CAT731R'                TO BPDATES-CALLING-PGM.        CAT731R 
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT731R 
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT731R 
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT731R 
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT731R 
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT731R 
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT731R 
                                                                        CAT731R 
           DISPLAY 'CAT731R: PROC-DATE= ' BPD-PROC-DATE                 CAT731R 
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT731R 
                                                                        CAT731R 
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT731R 
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT731R 
                                                                        CAT731R 
           EXEC SQL                                                     CAT731R 
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT731R 
           END-EXEC                                                     CAT731R 
                                                                        CAT731R 
           IF  SQLCODE = +0                                             CAT731R 
               DISPLAY ' '                                              CAT731R 
               DISPLAY 'CAT731R: W-CURRENT-TIMESTAMP = '                CAT731R 
                                                    W-CURRENT-TIMESTAMP CAT731R 
               DISPLAY ' '                                              CAT731R 
           ELSE                                                         CAT731R 
               DISPLAY 'CAT731R: W-CURRENT-TIMESTAMP NOT SET'           CAT731R 
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT731R 
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       CAT731R 
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT731R 
           END-IF.                                                      CAT731R 
                                                                        CAT731R 
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT731R 
                                                                        CAT731R 
           OPEN INPUT LOG-FILE-IN.                                              
           READ LOG-FILE-IN INTO WS-LOG-RECORD                                  
              AT END                                                            
                MOVE SPACES TO WS-LOG-RECORD                                    
                MOVE '0001-01-01-08.15.11.000000' TO PRIOR-RUN-TMSTP            
           END-READ.                                                            
           CLOSE LOG-FILE-IN.                                                   
                                                                                
           OPEN OUTPUT REPT-FILE.                                       CAT731R 
           OPEN OUTPUT REPT2-FILE.                                      CAT731R 
           OPEN OUTPUT REPT3-FILE.                                      CAT731R 
           DISPLAY 'CAT731R: REPORTS  OPENED FOR OUTPUT '               CAT731R 
                       ' FILE STATUS = ' REPT-STAT                      CAT731R 
                       ' FILE2 STATUS = ' REPT2-STAT                    CAT731R 
                       ' FILE3 STATUS = ' REPT3-STAT.                   CAT731R 
                                                                        CAT731R 
           IF  REPT-OKAY                                                CAT731R 
               CONTINUE                                                 CAT731R 
           ELSE                                                         CAT731R 
               MOVE 3003                  TO  ABEND-CD                  CAT731R 
               DISPLAY ' '                                              CAT731R 
               DISPLAY 'CAT731R: U3003 - DD REPORT OPEN ERR, '          CAT731R 
                       ' FILE STATUS = ' REPT-STAT                      CAT731R 
               CALL  ABEND  USING ABEND-CD                              CAT731R 
           END-IF.                                                      CAT731R 
                                                                        CAT731R 
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT731R 
                                                                        CAT731R 
           DISPLAY ' '.                                                 CAT731R 
                                                                        CAT731R 
       1000-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       1500-LOAD-B1 SECTION.                                            CAT731R 
           DISPLAY 'CAT731R: 1500-LOAD-B1'.                             CAT731R 
                                                                        CAT731R 
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT731R 
           MOVE 0                        TO  B1-TBL-CNT.                CAT731R 
                                                                        CAT731R 
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT731R 
                                                                        CAT731R 
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT731R 
                                             BH-ACAT-INFO               CAT731R 
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT731R 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT731R 
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT731R 
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT731R 
                                             BH-ACAT-INFO               CAT731R 
             ADD 1 TO B1-TBL-CNT                                        CAT731R 
             IF   BH-BROKER-ACTIVE                                      CAT731R 
                   MOVE  BH-BROKER-NUMBER-N                             CAT731R 
                                         TO B1-CLT-NBR (B1-TBL-CNT)     CAT731R 
                   MOVE  BH-BROKER-NAME                                 CAT731R 
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT731R 
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT731R 
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT731R 
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT731R 
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT731R 
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT731R 
                   ELSE                                                 CAT731R 
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT731R 
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT731R 
                   END-IF                                               CAT731R 
                   MOVE  BH-BROKER-STATUS                               CAT731R 
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT731R 
                   MOVE  BH-ACAT-RESCIND-BLOCK-RPT                              
                                         TO B1-PRINT (B1-TBL-CNT)       CAT731R 
               IF  L-STREAM = 'Z'                                       CAT731R 
                  MOVE 'Z' TO  B1-STREAM (B1-TBL-CNT)                   CAT731R 
               END-IF                                                           
               IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                    CAT731R 
               AND BH-ACAT-ACTIVE                                       CAT731R 
                   ADD 1 TO B1-ACTIVE-CNT                               CAT731R 
                   MOVE  BH-ACAT-STATUS                                 CAT731R 
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT731R 
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT731R 
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT731R 
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT731R 
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT731R 
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT731R 
                                  ' PRINT ' B1-PRINT      (B1-TBL-CNT)  CAT731R 
               ELSE                                                     CAT731R 
                   MOVE ' '              TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT731R 
               END-IF                                                   CAT731R 
             END-IF                                                     CAT731R 
                                                                        CAT731R 
           END-PERFORM.                                                 CAT731R 
                                                                        CAT731R 
           DISPLAY ' '.                                                 CAT731R 
                                                                        CAT731R 
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                 CAT731R 
           DISPLAY ' '.                                                 CAT731R 
       1500-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                CAT731R 
      ******************************************************************CAT731R 
       2000-SORT-INPUT SECTION.                                         CAT731R 
           MOVE '2000-SORT-INPUT         ' TO W-ROUTINE-1.              CAT731R 
                                                                        CAT731R 
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT731R 
              UNTIL B1-SUB > 500                                        CAT731R 
                                                                        CAT731R 
              IF  B1-STREAM      (B1-SUB) = L-STREAM                    CAT731R 
              AND B1-STATUS      (B1-SUB) = 'A'                         CAT731R 
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                         CAT731R 
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                         CAT731R 
              AND B1-PRINT       (B1-SUB) = '1'                                 
                  MOVE B1-CLT-NBR    (B1-SUB) TO W-CURR-CLIENT-N        CAT731R 
                  MOVE B1-STREAM     (B1-SUB) TO W-CURR-STREAM          CAT731R 
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT             CAT731R 
              END-IF                                                    CAT731R 
                                                                        CAT731R 
           END-PERFORM.                                                 CAT731R 
                                                                        CAT731R 
       2000-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
      ******************************************************************CAT731R 
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,            CAT731R 
      *     LOAD ASSETS                                                 CAT731R 
      ******************************************************************CAT731R 
       3000-FETCH-TRANFER SECTION.                                      CAT731R 
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.           CAT731R 
                                                                        CAT731R 
           EXEC SQL OPEN VACTRBHY_CURSOR END-EXEC                       CAT731R 
                                                                        CAT731R 
           IF SQLCODE NOT = +0                                          CAT731R 
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT731R 
              DISPLAY 'VACTRBHY CURSOR OPEN ERROR '                     CAT731R 
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT731R 
           END-IF                                                       CAT731R 
                                                                        CAT731R 
           MOVE ZERO TO W-CLIENT-DELETE-CNT                             CAT731R 
                        W-CLIENT-ADD-CNT                                CAT731R 
           PERFORM UNTIL SQLCODE NOT = +0                               CAT731R 
                                                                        CAT731R 
              EXEC SQL                                                  CAT731R 
                   FETCH VACTRBHY_CURSOR                                CAT731R 
               INTO                                                     CAT731R 
                    :DCLVACTRBHY.CLIENT-NBR                             CAT731R 
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
                   ,:DCLVACTRBHY.SECURITY-ADP-NBR                               
                   ,:DCLVACTRBHY.EXPIRE-DT                                      
                   ,:DCLVACTRBHY.ACTION-CD                                      
                   ,:DCLVACTRBHY.CICS-SNON-ID                                   
              END-EXEC                                                  CAT731R 
                                                                        CAT731R 
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT731R 
              EVALUATE SQLCODE                                          CAT731R 
                  WHEN +0                                               CAT731R 
                       IF UPDT-TMSTP OF DCLVACTRBHY > PRIOR-RUN-TMSTP           
                          ADD 1 TO W-INFILE-HSTY-CNT                    CAT731R 
                          PERFORM 4000-LOAD-HSTY THRU 4000-EXIT         CAT731R 
                       END-IF                                                   
                  WHEN +100                                             CAT731R 
                       DISPLAY 'INP=' W-INFILE-HSTY-CNT                 CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' ADDS ' W-CLIENT-ADD-CNT                 CAT731R 
                              ' DLET ' W-CLIENT-DELETE-CNT              CAT731R 
                              ' VACTRBHY CURSOR FETCH NOT FOUND '       CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
                       IF W-CLIENT-DELETE-CNT = ZERO                    CAT731R 
                          PERFORM 4020-LOAD-DELETE-DUMMY                        
                       END-IF                                                   
                       IF W-CLIENT-ADD-CNT = ZERO                       CAT731R 
                          PERFORM 4030-LOAD-ADD-DUMMY                           
                       END-IF                                                   
                  WHEN OTHER                                            CAT731R 
                       DISPLAY 'INP=' W-INFILE-HSTY-CNT                 CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' VACTRBHY CURSOR FETCH ERROR '           CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT731R 
              END-EVALUATE                                              CAT731R 
                                                                        CAT731R 
           END-PERFORM.                                                 CAT731R 
                                                                        CAT731R 
           EXEC SQL                                                     CAT731R 
                CLOSE VACTRBHY_CURSOR                                   CAT731R 
           END-EXEC                                                     CAT731R 
                                                                        CAT731R 
           IF  SQLCODE NOT = +0                                         CAT731R 
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT731R 
               DISPLAY 'INP=' W-INFILE-CNT                              CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' VACTRBHY CURSOR CLOSE ERROR '           CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT731R 
           END-IF.                                                      CAT731R 
                                                                        CAT731R 
           EXEC SQL OPEN VRSDBLK_CURSOR END-EXEC                        CAT731R 
                                                                        CAT731R 
           IF SQLCODE NOT = +0                                          CAT731R 
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT731R 
              DISPLAY 'VRSDBLK CURSOR OPEN ERROR '                      CAT731R 
                            'SQLCODE = ' W-DB2-SQLCODE                  CAT731R 
           END-IF                                                       CAT731R 
           MOVE ZERO TO W-CLIENT-ACTIVE-CNT.                            CAT731R 
           PERFORM UNTIL SQLCODE NOT = +0                               CAT731R 
                                                                        CAT731R 
              EXEC SQL                                                  CAT731R 
                   FETCH VRSDBLK_CURSOR                                 CAT731R 
               INTO                                                     CAT731R 
                    :DCLVRSDBLK.CLIENT-NBR                              CAT731R 
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
              END-EXEC                                                  CAT731R 
                                                                        CAT731R 
              MOVE SQLCODE      TO W-DB2-SQLCODE                        CAT731R 
              EVALUATE SQLCODE                                          CAT731R 
                  WHEN +0                                               CAT731R 
                       ADD 1 TO W-INFILE-CNT                            CAT731R 
                                W-CLIENT-ACTIVE-CNT                     CAT731R 
                       PERFORM 4100-LOAD-ACTIVE THRU 4100-EXIT          CAT731R 
                  WHEN +100                                             CAT731R 
                       DISPLAY 'TOT INP=' W-INFILE-CNT                  CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' INP ' W-CLIENT-ACTIVE-CNT               CAT731R 
                              ' VRSDBLK CURSOR FETCH NOT FOUND '        CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
                       IF W-CLIENT-ACTIVE-CNT = ZERO                    CAT731R 
                          PERFORM 4120-LOAD-ACTIVE-DUMMY                        
                       END-IF                                                   
                  WHEN OTHER                                            CAT731R 
                       DISPLAY 'INP=' W-INFILE-CNT                      CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' VRSDBLK CURSOR FETCH ERROR '            CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT           CAT731R 
              END-EVALUATE                                              CAT731R 
                                                                        CAT731R 
           END-PERFORM                                                  CAT731R 
                                                                        CAT731R 
           EXEC SQL                                                     CAT731R 
                CLOSE VRSDBLK_CURSOR                                    CAT731R 
           END-EXEC                                                     CAT731R 
                                                                        CAT731R 
           IF  SQLCODE NOT = +0                                         CAT731R 
               MOVE SQLCODE      TO W-DB2-SQLCODE                       CAT731R 
               DISPLAY 'INP=' W-INFILE-CNT                              CAT731R 
                              ' CLT=' W-CURR-CLIENT                     CAT731R 
                              ' VRSDBLK CURSOR CLOSE ERROR '            CAT731R 
                              ' SQLCODE=' W-DB2-SQLCODE                 CAT731R 
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   CAT731R 
           END-IF.                                                      CAT731R 
                                                                        CAT731R 
       3000-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       4000-LOAD-HSTY           SECTION.                                CAT731R 
           MOVE '4000-LOAD-HSTY       ' TO W-ROUTINE-1.                 CAT731R 
                                                                        CAT731R 
           ADD 1 TO W-LOAD-CNT.                                         CAT731R 
                                                                        CAT731R 
           MOVE SPACES            TO W-SORT-RECORD                      CAT731R 
           MOVE CLIENT-NBR OF DCLVACTRBHY TO                            CAT731R 
                                            W-SORT-CLIENT-NBR           CAT731R 
           MOVE SECURITY-ADP-NBR OF DCLVACTRBHY TO                              
                                            W-SORT-SECURITY-ADP-NBR             
           MOVE BRANCH-CD OF DCLVACTRBHY TO                             CAT731R 
                                            W-SORT-BRANCH-CD                    
           MOVE ACCT-CD OF DCLVACTRBHY TO                               CAT731R 
                                            W-SORT-ACCT-CD                      
           MOVE BLOCK-CD OF DCLVACTRBHY TO                              CAT731R 
                                            W-SORT-BLOCK-CD                     
           MOVE RCV-NBR  OF DCLVACTRBHY TO                              CAT731R 
                                            W-SORT-RCV-NBR                      
           MOVE ISIN-SEC-ISSUE-CD OF DCLVACTRBHY TO                     CAT731R 
                                            W-SORT-ISIN-SEC-ISSUE-CD            
           MOVE CMNT-TXT OF DCLVACTRBHY TO                              CAT731R 
                                            W-SORT-CMNT-TXT                     
           MOVE CICS-SNON-ID    OF DCLVACTRBHY TO                       CAT731R 
                                            W-SORT-CICS-SNON-ID                 
           MOVE CICS-TERM-ID-CD OF DCLVACTRBHY TO                       CAT731R 
                                            W-SORT-CICS-TERM-ID-CD              
           MOVE CRT-TMSTP OF DCLVACTRBHY TO                             CAT731R 
                                            W-SORT-CRT-TMSTP                    
           MOVE UPDT-TMSTP OF DCLVACTRBHY TO                            CAT731R 
                                            W-SORT-UPDT-TMSTP                   
           MOVE EXPIRE-DT  OF DCLVACTRBHY TO                            CAT731R 
                                            W-SORT-EXPIRE-DT                    
           MOVE ACTION-CD  OF DCLVACTRBHY TO                            CAT731R 
                                            W-SORT-ACTION-CD                    
           IF ACTION-CD OF DCLVACTRBHY = 'D' OR 'E'                     CAT731R 
              SET W-SORT-DELETE-RPT TO TRUE                                     
              ADD 1 TO W-CLIENT-DELETE-CNT                              CAT731R 
           ELSE                                                                 
              SET W-SORT-ADDS-RPT TO TRUE                                       
              ADD 1 TO W-CLIENT-ADD-CNT                                 CAT731R 
           END-IF.                                                              
                                                                        CAT731R 
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT731R 
                                                                        CAT731R 
           RELEASE SORT-RECORD                                          CAT731R 
           ADD  1             TO W-RELEASE-CNT                          CAT731R 
           .                                                            CAT731R 
       4000-EXIT.                                                       CAT731R 
           EXIT.                                                        CAT731R 
       4020-LOAD-DELETE-DUMMY   SECTION.                                        
           MOVE '4020-LOAD-DETETE DUMM' TO W-ROUTINE-1.                 CAT731R 
                                                                        CAT731R 
           ADD 1 TO W-LOAD-CNT.                                         CAT731R 
                                                                        CAT731R 
           MOVE SPACES            TO W-SORT-RECORD                      CAT731R 
           MOVE W-CURR-CLIENT     TO W-SORT-CLIENT-NBR                  CAT731R 
           MOVE 'M'               TO W-SORT-ACTION-CD                           
           SET W-SORT-DELETE-RPT TO TRUE.                                       
                                                                        CAT731R 
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT731R 
                                                                        CAT731R 
           RELEASE SORT-RECORD                                          CAT731R 
           ADD  1             TO W-RELEASE-CNT                          CAT731R 
           .                                                            CAT731R 
       4030-LOAD-ADD-DUMMY      SECTION.                                        
           MOVE '4030-LOAD-ADD-DUMMY  ' TO W-ROUTINE-1.                 CAT731R 
                                                                        CAT731R 
           ADD 1 TO W-LOAD-CNT.                                         CAT731R 
                                                                        CAT731R 
           MOVE SPACES            TO W-SORT-RECORD                      CAT731R 
           MOVE W-CURR-CLIENT     TO W-SORT-CLIENT-NBR                  CAT731R 
           MOVE 'M'               TO W-SORT-ACTION-CD                           
           SET W-SORT-ADDS-RPT TO TRUE.                                         
                                                                        CAT731R 
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT731R 
                                                                        CAT731R 
           RELEASE SORT-RECORD                                          CAT731R 
           ADD  1             TO W-RELEASE-CNT                          CAT731R 
           .                                                            CAT731R 
      /                                                                 CAT731R 
       4100-LOAD-ACTIVE         SECTION.                                CAT731R 
           MOVE '4100-LOAD-ACTIVE     ' TO W-ROUTINE-1.                 CAT731R 
                                                                        CAT731R 
           ADD 1 TO W-LOAD-CNT.                                         CAT731R 
                                                                        CAT731R 
           MOVE SPACES            TO W-SORT-RECORD                      CAT731R 
           MOVE CLIENT-NBR OF DCLVRSDBLK TO                             CAT731R 
                                            W-SORT-CLIENT-NBR           CAT731R 
           MOVE SECURITY-ADP-NBR OF DCLVRSDBLK TO                               
                                            W-SORT-SECURITY-ADP-NBR             
           MOVE BRANCH-CD OF DCLVRSDBLK TO                              CAT731R 
                                            W-SORT-BRANCH-CD                    
           MOVE ACCT-CD OF DCLVRSDBLK TO                                CAT731R 
                                            W-SORT-ACCT-CD                      
           MOVE BLOCK-CD OF DCLVRSDBLK TO                               CAT731R 
                                            W-SORT-BLOCK-CD                     
           MOVE RCV-NBR  OF DCLVRSDBLK TO                               CAT731R 
                                            W-SORT-RCV-NBR                      
           MOVE ISIN-SEC-ISSUE-CD OF DCLVRSDBLK TO                      CAT731R 
                                            W-SORT-ISIN-SEC-ISSUE-CD            
           MOVE CMNT-TXT OF DCLVRSDBLK TO                               CAT731R 
                                            W-SORT-CMNT-TXT                     
           MOVE CICS-SNON-ID    OF DCLVRSDBLK TO                        CAT731R 
                                            W-SORT-CICS-SNON-ID                 
           MOVE CICS-TERM-ID-CD OF DCLVRSDBLK TO                        CAT731R 
                                            W-SORT-CICS-TERM-ID-CD              
           MOVE CRT-TMSTP OF DCLVRSDBLK TO                              CAT731R 
                                            W-SORT-CRT-TMSTP                    
           MOVE UPDT-TMSTP OF DCLVRSDBLK TO                             CAT731R 
                                            W-SORT-UPDT-TMSTP                   
           MOVE EXPIRE-DT  OF DCLVRSDBLK TO                             CAT731R 
                                            W-SORT-EXPIRE-DT                    
           MOVE ACTION-CD  OF DCLVRSDBLK TO                             CAT731R 
                                            W-SORT-ACTION-CD                    
           SET W-SORT-ACTIVE-RPT TO TRUE.                                       
                                                                        CAT731R 
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT731R 
                                                                        CAT731R 
           RELEASE SORT-RECORD                                          CAT731R 
           ADD  1             TO W-RELEASE-CNT                          CAT731R 
           .                                                            CAT731R 
       4100-EXIT.                                                       CAT731R 
           EXIT.                                                        CAT731R 
       4120-LOAD-ACTIVE-DUMMY  SECTION.                                         
           MOVE '4120-LOAD-ACTIVE DUMM' TO W-ROUTINE-1.                 CAT731R 
                                                                        CAT731R 
           ADD 1 TO W-LOAD-CNT.                                         CAT731R 
                                                                        CAT731R 
           MOVE SPACES            TO W-SORT-RECORD                      CAT731R 
           MOVE W-CURR-CLIENT     TO W-SORT-CLIENT-NBR                  CAT731R 
           MOVE 'M'               TO W-SORT-ACTION-CD                           
           SET W-SORT-ACTIVE-RPT TO TRUE.                                       
                                                                        CAT731R 
           MOVE W-SORT-RECORD            TO SORT-RECORD.                CAT731R 
                                                                        CAT731R 
           RELEASE SORT-RECORD                                          CAT731R 
           ADD  1             TO W-RELEASE-CNT                          CAT731R 
           .                                                            CAT731R 
      /                                                                 CAT731R 
       5000-SORT-OUTPUT SECTION.                                        CAT731R 
                                                                        CAT731R 
           DISPLAY 'CAT731R: PERFORMING 5000-SORT-OUTPUT'.              CAT731R 
                                                                        CAT731R 
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT.                     CAT731R 
                                                                        CAT731R 
           PERFORM UNTIL END-OF-SORT                                    CAT731R 
                                                                        CAT731R 
               MOVE W-SORT-CLIENT-NBR-N TO B1-PRT-SUB                   CAT731R 
               PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                CAT731R 
               PERFORM 5500-RETURN-SORT   THRU 5500-EXIT                CAT731R 
                                                                        CAT731R 
           END-PERFORM.                                                 CAT731R 
                                                                        CAT731R 
       5000-EXIT.                                                       CAT731R 
           EXIT.                                                        CAT731R 
      /                                                                 CAT731R 
       5500-RETURN-SORT SECTION.                                        CAT731R 
                                                                        CAT731R 
           RETURN SORT-FILE                                             CAT731R 
               AT END                                                   CAT731R 
                     MOVE 999 TO W-SORT-CLIENT-NBR-N                    CAT731R 
                     MOVE '1'              TO END-OF-SORT-SW            CAT731R 
                     DISPLAY 'CAT731R: SORT-EOF '                       CAT731R 
                                   ' RET=' W-RETURN-CNT                 CAT731R 
                     GO TO 5500-EXIT.                                   CAT731R 
                                                                        CAT731R 
           ADD  1                        TO W-RETURN-CNT.               CAT731R 
           MOVE SORT-RECORD              TO W-SORT-RECORD.              CAT731R 
                                                                        CAT731R 
       5500-EXIT.                                                       CAT731R 
           EXIT.                                                        CAT731R 
      /                                                                 CAT731R 
       7000-WRITE-REPORT SECTION.                                       CAT731R 
                                                                        CAT731R 
           IF  (W-SORT-CLIENT-NBR       NOT = W-PREV-CLIENT-NBR)        CAT731R 
               MOVE 0                    TO W-PAGE-CNT                  CAT731R 
               MOVE 60                   TO W-LINE-CNT                  CAT731R 
           END-IF                                                       CAT731R 
           MOVE W-SORT-CLIENT-NBR          TO W-PREV-CLIENT-NBR         CAT731R 
                                                                                
           IF  (W-SORT-REPORT-ID        NOT = W-PREV-REPORT-IND)                
               MOVE 0                    TO W-PAGE-CNT                  CAT731R 
               MOVE 60                   TO W-LINE-CNT                  CAT731R 
           END-IF                                                       CAT731R 
           MOVE W-SORT-REPORT-ID           TO W-PREV-REPORT-IND.                
                                                                                
           INITIALIZE W-DTL1-REC                                        CAT731R 
           MOVE W-SORT-BRANCH-CD          TO W-DTL1-BRANCH              CAT731R 
           MOVE W-SORT-ACCT-CD            TO W-DTL1-ACCT-CD             CAT731R 
           MOVE W-SORT-BLOCK-CD           TO W-DTL1-BLOCK-CD            CAT731R 
           MOVE W-SORT-RCV-NBR            TO W-DTL1-RCV-NBR             CAT731R 
           MOVE W-SORT-ISIN-SEC-ISSUE-CD  TO W-DTL1-CUSIP               CAT731R 
DJ0001     MOVE W-SORT-SECURITY-ADP-NBR   TO W-DTL1-SEC-NO              CAT731R 
           MOVE W-SORT-CRT-TMSTP          TO W-DTL1-CRT-TMSTP           CAT731R 
           IF W-SORT-EXPIRE-DT = '0001-01-01'                                   
              MOVE 'N/A'                     TO W-DTL1-EXPIRE-DT        CAT731R 
           ELSE                                                                 
              MOVE W-SORT-EXPIRE-DT          TO W-DTL1-EXPIRE-DT        CAT731R 
           END-IF.                                                              
           MOVE W-SORT-UPDT-TMSTP         TO W-DTL1-UPDT-TMSTP          CAT731R 
           MOVE W-SORT-CICS-SNON-ID       TO W-DTL1-CICS-SNON           CAT731R 
           MOVE W-SORT-CICS-TERM-ID-CD    TO W-DTL1-CICS-TERM           CAT731R 
           IF W-SORT-ACTION-DELETE                                      CAT731R 
              MOVE 'DELETED' TO  W-DTL1-ACTION                          CAT731R 
           ELSE                                                         CAT731R 
           IF W-SORT-ACTION-EXPIRE                                      CAT731R 
              MOVE 'EXPIRED' TO  W-DTL1-ACTION                          CAT731R 
           ELSE                                                         CAT731R 
              MOVE SPACES    TO  W-DTL1-ACTION                          CAT731R 
           END-IF.                                                              
           IF W-SORT-ACTION-MISSING                                             
              MOVE W-DTLX-REC               TO W-REPT-LINE              CAT731R 
           ELSE                                                                 
              MOVE W-DTL1-REC               TO W-REPT-LINE.             CAT731R 
                                                                                
           IF   W-LINE-CNT > 56                                         CAT731R 
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  CAT731R 
                                                                                
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      CAT731R 
           ADD 2                         TO W-LINE-CNT.                 CAT731R 
                                                                                
           IF W-SORT-CMNT-TXT NOT = SPACES                                      
              MOVE W-SORT-CMNT-TXT TO  W-DTL2-COMMENT                   CAT731R 
              MOVE W-DTL2-REC      TO  W-REPT-LINE                      CAT731R 
              PERFORM 7700-WRITE-LINE THRU 7700-EXIT                    CAT731R 
              ADD 1                      TO W-LINE-CNT.                 CAT731R 
                                                                        CAT731R 
       7000-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       7700-WRITE-LINE SECTION.                                         CAT731R 
                                                                        CAT731R 
           MOVE W-REPT-LINE              TO REPT-LINE.                  CAT731R 
           MOVE B1-PRT-SUB               TO REPT-CLT.                   CAT731R 
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT731R 
           IF W-SORT-ADDS-RPT                                                   
              WRITE REPT-REC                                            CAT731R 
           ELSE                                                                 
           IF W-SORT-DELETE-RPT                                                 
              WRITE REPT2-REC FROM REPT-REC                             CAT731R 
           ELSE                                                                 
              WRITE REPT3-REC FROM REPT-REC.                            CAT731R 
                                                                        CAT731R 
       7700-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       7800-WRITE-HDR    SECTION.                                       CAT731R 
                                                                        CAT731R 
           ADD  1                        TO W-PAGE-CNT.                 CAT731R 
                                                                        CAT731R 
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT731R 
                                                                        CAT731R 
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT731R 
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT731R 
                                         TO W-HDR1-CLT-NAME.            CAT731R 
                                                                        CAT731R 
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT731R 
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT731R 
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT731R 
                                                                        CAT731R 
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT731R 
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT731R 
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT731R 
           IF W-SORT-ADDS-RPT                                                   
              WRITE REPT-REC                                            CAT731R 
           ELSE                                                                 
           IF W-SORT-DELETE-RPT                                                 
              WRITE REPT2-REC FROM REPT-REC                             CAT731R 
           ELSE                                                                 
              WRITE REPT3-REC FROM REPT-REC.                            CAT731R 
                                                                        CAT731R 
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT731R 
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT731R 
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT731R 
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT731R 
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT731R 
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT731R 
******** USE THE CORRESPONDING HEADER MESSAGE:                          CAT731R 
           IF W-SORT-ADDS-RPT                                                   
             SET ADDS-RPT TO TRUE                                       CAT731R 
           ELSE                                                                 
           IF W-SORT-DELETE-RPT                                                 
             SET DETETE-RPT TO TRUE                                     CAT731R 
           ELSE                                                                 
             SET ACTIVE-RPT TO TRUE                                     CAT731R 
           END-IF.                                                              
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT731R 
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT731R 
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT731R 
           IF W-SORT-ADDS-RPT                                                   
              WRITE REPT-REC                                            CAT731R 
           ELSE                                                                 
           IF W-SORT-DELETE-RPT                                                 
              WRITE REPT2-REC FROM REPT-REC                             CAT731R 
           ELSE                                                                 
              WRITE REPT3-REC FROM REPT-REC.                            CAT731R 
           MOVE W-HDR3-REC               TO REPT-LINE.                  CAT731R 
           MOVE B1-PRT-SUB               TO REPT-CLT                    CAT731R 
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT731R 
           IF W-SORT-ADDS-RPT                                                   
              WRITE REPT-REC                                            CAT731R 
           ELSE                                                                 
           IF W-SORT-DELETE-RPT                                                 
              WRITE REPT2-REC FROM REPT-REC                             CAT731R 
           ELSE                                                                 
              WRITE REPT3-REC FROM REPT-REC.                            CAT731R 
                                                                        CAT731R 
           MOVE 4                        TO W-LINE-CNT.                 CAT731R 
                                                                        CAT731R 
       7800-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       8500-SQL-ERROR      SECTION.                                     CAT731R 
           DISPLAY ' '                                                  CAT731R 
           DISPLAY '8500-SQL-ERROR'                                     CAT731R 
                  ' INFILE-CNT = ' W-INFILE-CNT                         CAT731R 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        CAT731R 
                                                                        CAT731R 
           DISPLAY ' '                                                  CAT731R 
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT731R 
                                    W-DB2-MESSAGE-LEN.                  CAT731R 
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT731R 
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT731R 
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT731R 
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT731R 
                   END-IF                                               CAT731R 
           END-PERFORM.                                                 CAT731R 
           DISPLAY ' '                                                  CAT731R 
                                                                        CAT731R 
           DISPLAY 'CAT731R: U3999 - ABENDING ON BAD DB2 STATUS'        CAT731R 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                      CAT731R 
           DISPLAY 'CAT731R: PROGRAM ENDED ABNORMALLY'                  CAT731R 
           MOVE +3999 TO ABEND-CD                                       CAT731R 
           CALL  ABEND  USING ABEND-CD.                                 CAT731R 
                                                                        CAT731R 
       8500-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       8900-DISPLAY-CNT   SECTION.                                      CAT731R 
           DISPLAY ' '                                                  CAT731R 
           DISPLAY 'CAT731R: INFILE  COUNT      = ' W-INFILE-CNT        CAT731R 
                 ' (VTRNFR)'                                            CAT731R 
           DISPLAY 'CAT731R: INFILE HSTY COUNT  = ' W-INFILE-HSTY-CNT   CAT731R 
                 ' (VTRNFR)'                                            CAT731R 
           DISPLAY 'CAT731R: W-LOAD-CNT         = ' W-LOAD-CNT          CAT731R 
           .                                                            CAT731R 
       8900-EXIT. EXIT.                                                 CAT731R 
      /                                                                 CAT731R 
       9000-CLOSE-ROUTINE SECTION.                                      CAT731R 
                                                                        CAT731R 
           CLOSE REPT-FILE.                                             CAT731R 
           CLOSE REPT2-FILE.                                            CAT731R 
           CLOSE REPT3-FILE.                                            CAT731R 
           DISPLAY 'CAT731R: REPORT   CLOSED. STATUS = ' REPT-STAT      CAT731R 
                ' REPT2= ' REPT2-STAT ' REPT3= ' REPT3-STAT.            CAT731R 
                                                                        CAT731R 
           DISPLAY ' '.                                                 CAT731R 
           DISPLAY 'CAT731R: INFILE CNT      = ' W-INFILE-CNT.          CAT731R 
           DISPLAY 'CAT731R: INFILE HSTY CNT = ' W-INFILE-HSTY-CNT.     CAT731R 
                                                                        CAT731R 
           DISPLAY ' '.                                                 CAT731R 
           DISPLAY 'CAT731R: PROGRAM ENDED SUCCESSFULLY'.               CAT731R 
                                                                        CAT731R 
       9000-EXIT.                                                       CAT731R 
           EXIT.                                                        CAT731R 
      *################################################################ CAT731R 
