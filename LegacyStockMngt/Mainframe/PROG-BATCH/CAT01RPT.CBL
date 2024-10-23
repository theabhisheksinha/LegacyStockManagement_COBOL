000001* PDX    - CAT01RPT C0283336 07/09/09 07:38:17 TBLAMUR            00001000
000001* PDX    - CAT01RPT C0150647 09/26/08 14:36:45 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT527  
       PROGRAM-ID.    CAT01RPT.                                         CAT527  
      ***************************************************************** CAT527  
      *    ACATS - LEHMAN DELIVERY SIDE RECON W/ MARGIN                 CAT527  
      *                                                                 CAT527  
      *    USE B1 TO GET CLIENT NAME                                    CAT527  
      *                                                                 CAT527  
      *    INPUT   : CAT01    EXTRTACT OF SPECIFC DELIVERIES            CAT527  
      *              CALL GETVHOL FOR MARGIN POSN TYPE=1 QTY 097-50074  CAT527  
      *    OUTPUT  :                                                    CAT527  
      *            1) TBD                      O/P - REPORT             CAT527  
      *                                                                 CAT527  
      *---------------------------------------------------------------* CAT527  
      * 09/03/08 LM  - NEW ACATS PROGRAM                              * CAT527  
      *---------------------------------------------------------------* CAT527  
      /                                                                 CAT527  
       ENVIRONMENT DIVISION.                                            CAT527  
       INPUT-OUTPUT SECTION.                                            CAT527  
       FILE-CONTROL.                                                    CAT527  
                                                                        CAT527  
           SELECT PENDING-FILE           ASSIGN TO UT-S-INFILE          00660001
                                         FILE STATUS IS INFILE-STAT.    CAT527  
           SELECT REPT-FILE              ASSIGN TO UT-S-REPORT          CAT527  
                                         FILE STATUS IS REPT-STAT.      CAT527  
      /                                                                 CAT527  
       DATA DIVISION.                                                   CAT527  
       FILE SECTION.                                                    CAT527  
       FD  PENDING-FILE                                                 00740000
           RECORDING MODE IS F                                          00750008
           BLOCK CONTAINS 0 RECORDS.                                    00760000
       01  PEND-RECORD.                                                         
           05  IN-CLIENT                 PIC  X(03).                            
           05  IN-BRANCH-CD              PIC  X(03).                            
           05  IN-ACCT-CD                PIC  X(05).                            
           05  IN-CSH-MGN-SHRT-CD        PIC  X(01).                            
           05  IN-STTS-CD                PIC  X(03).                            
           05  IN-SECURITY-ADP-NBR       PIC  X(07).                            
           05  IN-PSTN-CD                PIC  X(01).                            
           05  IN-ASSET-QTY              PIC  S9(12)V9(5).                      
           05  IN-ACAT-CONTROL-NBR       PIC  X(14).                            
           05  IN-ASSET-SEQ-NBR          PIC  9(04).                            
           05  IN-ISIN-CNTRY-CD          PIC  X(02).                            
           05  IN-ISIN-SEC-ISSUE-CD      PIC  X(09).                            
           05  IN-ISIN-SEC-CDG-CD        PIC  X(01).                            
           05  IN-ASSET-PRC-CTGY-CD      PIC  X(04).                            
           05  IN-STTLM-LCTN-CD          PIC  X(02).                            
           05  IN-STTLM-RSN-CD           PIC  X(04).                            
           05  IN-ASSET-DESC-TXT         PIC  X(140).                           
                                                                                
                                                                        00780000
       FD  REPT-FILE                                                    CAT527  
           RECORDING MODE IS F.                                         CAT527  
                                                                        CAT527  
       01  REPT-REC.                                                    CAT527  
           03 REPT-LINE             PIC  X(133).                        CAT527  
           03 REPT-CLT              PIC S9(003) COMP-3.                 CAT527  
           03 REPT-FIL              PIC  X(008).                        CAT527  
      /                                                                 CAT527  
       WORKING-STORAGE SECTION.                                         CAT527  
       COPY PDXIDCOB.                                                   CAT527  
                                                                        CAT527  
       01  W-FIELDS.                                                    CAT527  
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.          CAT527  
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.          CAT527  
               88 NOT-FIRST-TIME                    VALUE '1'.          CAT527  
           05  INFILE-STAT               PIC  X(02) VALUE '00'.         CAT527  
               88  INFILE-OKAY           VALUE '00'.                    CAT527  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT527  
           05  POSVSAM-STATUS            PIC X(002).                            
               88 POSVSAM-OKAY           VALUE '00' THRU '09', '97'.            
               88 POSVSAM-END-OF-FILE    VALUE '10'.                            
               88 POSVSAM-NOT-FOUND      VALUE '23'.                            
               88 POSVSAM-EMPTY-MISSING  VALUE '35'.                            
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT527  
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT527  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT527  
               88 END-OF-INFILE                     VALUE '1'.          CAT527  
           05  REPT-STAT                 PIC  X(02) VALUE '00'.         CAT527  
               88 REPT-OKAY                         VALUE '00'.         CAT527  
           05  W-INFILE-CNT              PIC  9(11) VALUE 0.            CAT527  
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            CAT527  
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           CAT527  
           05  LD-PROC-DATE.                                            CAT527  
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT527  
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT527  
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT527  
           05  W-PROC-DATE.                                             CAT527  
               10 W-PROC-DATE-CC         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-YY         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-MM         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-DD         PIC  X(02).                    CAT527  
           05  W-PROC-DATE-N REDEFINES                                  CAT527  
               W-PROC-DATE               PIC  9(008).                   CAT527  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT527  
           05  FILLER  REDEFINES                                        CAT527  
               W-SYS-DATE.                                              CAT527  
               10  W-SYS-YY              PIC  X(002).                   CAT527  
               10  W-SYS-MM              PIC  X(002).                   CAT527  
               10  W-SYS-DD              PIC  X(002).                   CAT527  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT527  
           05  FILLER  REDEFINES                                        CAT527  
               W-SYS-TIME.                                              CAT527  
               10  W-SYS-HH              PIC  X(002).                   CAT527  
               10  W-SYS-MN              PIC  X(002).                   CAT527  
               10  W-SYS-SS              PIC  X(002).                   CAT527  
               10  W-SYS-MS              PIC  X(002).                   CAT527  
           05  W-REPT-CLT                PIC  9(03) VALUE 0.            CAT527  
           05  W-REPT-LINE               PIC  X(133).                   CAT527  
           05  W-CLT-CNT                 PIC  9(11) VALUE 0.            CAT527  
           05  WS-TOTAL-QTY              PIC S9(12)V9(5) VALUE +0.      CAT527  
           05  WS-MARGIN-QTY             PIC S9(12)V9(5) VALUE +0.      CAT527  
                                                                                
           05  W-POS-KEY.                                                       
               10  W-POS-KEY-A.                                                 
                   15  W-POS-CLT         PIC 9(05) COMP-3.                      
                   15  W-POS-BR          PIC X(03).                             
                   15  W-POS-ACCT        PIC X(05).                             
               10  W-POS-CUR             PIC X(06).                             
               10  W-POS-CUR-N REDEFINES W-POS-CUR                              
                                         PIC 9(06).                             
               10  W-POS-REC-TYPE        PIC X(02).                             
               10  W-POS-ACCT-TYPE       PIC X(02).                             
               10  W-POS-ACCT-TYPE-N REDEFINES                                  
                   W-POS-ACCT-TYPE       PIC 9(02).                             
               10  W-POS-SEC-NBR         PIC X(15).                             
               10  W-POS-WI              PIC X(01).                             
               10  W-POS-FILLER          PIC X(01).                             
               10  W-POS-SEQ             PIC 9(04).                             
       01  W-PREV-AREA.                                                 CAT527  
           05  W-PREV-CLIENT-NBR         PIC X(0003) VALUE SPACES.      CAT527  
           05  W-PREV-CONTROL-NBR        PIC X(0014).                   CAT527  
           05  W-PREV-RCV-NBR            PIC X(0004).                   CAT527  
           05  W-PREV-RCV-ACCT           PIC X(0020).                   CAT527  
                                                                        CAT527  
                                                                        CAT527  
       01  W-CURRENT-FIELDS.                                            CAT527  
           05  W-CURR-CLIENT             PIC X(03).                     CAT527  
           05  W-CURR-CLIENT-N REDEFINES                                CAT527  
               W-CURR-CLIENT             PIC 9(003).                    CAT527  
                                                                        CAT527  
      /                                                                 CAT527  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT527  
       01  B1-TABLE-AREA.                                               CAT527  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT527  
               05  B1-CLT-NBR               PIC 9(03).                  CAT527  
               05  B1-CLT-NAME              PIC X(30).                  CAT527  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT527  
               05  B1-STREAM                PIC X(01).                  CAT527  
               05  B1-STATUS                PIC X(01).                  CAT527  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT527  
               05  B1-PRINT                 PIC X(01).                  CAT527  
       01  B1-WORK-FIELEDS.                                             CAT527  
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT527  
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT527  
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.          CAT527  
           03  B1-PRT-SUB                   PIC 9(03) VALUE 0.          CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * B1 HEADER                                                      *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT527  
           COPY BHINFO.                                                 CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * B1 ACAT SECTION                                                *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT527  
           COPY BHACAT.                                                 CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * BPDATE COMMAREA                                                *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT527  
                                                                        CAT527  
           COPY BPDATESC.                                               CAT527  
      /                                                                 CAT527  
       01  W-HDR1-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT527  
           05  FILLER                       PIC  X(08) VALUE            CAT527  
               'CAT01RPT'.                                              CAT527  
           05  W-HDR1-CLT                   PIC  Z999.                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(42) VALUE            CAT527  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT527  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(13) VALUE            CAT527  
               'PROCESS DATE '.                                         CAT527  
           05  W-HDR1-MM                    PIC  X(02).                 CAT527  
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR1-DD                    PIC  X(02).                 CAT527  
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR1-YY                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(05) VALUE            CAT527  
               'PAGE '.                                                 CAT527  
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT527  
                                                                        CAT527  
       01  W-HDR2-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(57) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(42) VALUE            CAT527  
               'ACAT DELIVERY RECON REPORT W/ 097-50074'.               CAT527  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(09) VALUE            CAT527  
               'RUN TIME '.                                             CAT527  
           05  W-HDR2-MM                    PIC  X(02).                 CAT527  
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR2-DD                    PIC  X(02).                 CAT527  
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR2-YY                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-HDR2-HH                    PIC  X(02).                 CAT527  
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT527  
           05  W-HDR2-MN                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
                                                                        CAT527  
       01  W-HDR3-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT527  
           05  FILLER                       PIC  X(60) VALUE            CAT527  
              'SECURITY  ACCOUNT      ACAT-STTS     ACAT-QTY'.          CAT527  
           05  FILLER                       PIC  X(34) VALUE            CAT527  
              'OMNI-QTY              DIFFERENCE'.                       CAT527  
                                                                        CAT527  
       01  W-DTL1-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-DTL1-SECURITY              PIC  X(07) VALUE SPACES.    CAT527  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT527  
           05  W-DTL1-BRANCH                PIC  X(03).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE '-'.       CAT527  
           05  W-DTL1-ACCOUNT               PIC  X(05).                 CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
           05  W-DTL1-STATUS                PIC  X(03).                 CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
           05  W-DTL1-QTY                   PIC  ZZZ,ZZZ,ZZZ,ZZ9.99999-.CAT527  
           05  FILLER                       PIC  X(51) VALUE ' '.       CAT527  
           05  W-DTL1-CONTROL-NBR           PIC  X(14).                         
                                                                        CAT527  
       01  W-TOTAL-REC.                                                 CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-TOTAL-SECURITY             PIC  X(07).                 CAT527  
           05  FILLER                       PIC  X(22) VALUE            CAT527  
               '   *** TOTAL ***'.                                              
           05  W-TOTAL-QTY                  PIC  ZZZ,ZZZ,ZZZ,ZZ9.99999-.CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-TOTAL-OMNI-QTY             PIC  ZZZ,ZZZ,ZZZ,ZZ9.99999-.CAT527  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT527  
           05  W-TOTAL-DIFF                 PIC  ZZZ,ZZZ,ZZZ,ZZ9.99999-.CAT527  
                                                                        CAT527  
       01  FILLER                           PIC X(08) VALUE 'GETVHOL-'.         
       01  GETVOL-AREA.                                                         
           05 W-CUSHOL-KEY.                                                     
              10  W-CUSHOL-CLIENT              PIC X(03).                       
              10  W-CUSHOL-CLIENT-N REDEFINES                                   
                  W-CUSHOL-CLIENT              PIC 9(03).                       
              10  W-CUSHOL-BRANCH              PIC X(03).                       
              10  W-CUSHOL-ACCOUNT             PIC X(05).                       
              10  W-CUSHOL-FRGN-CURR-CODE      PIC 9(03).                       
              10  W-CUSHOL-FILLER              PIC X(31).                       
       01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.                 
           COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.                
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'HOLDAVSM'.            
           COPY HOLDAVSM.                                                       
      /                                                                         
      /                                                                 CAT527  
      ***--->COBOL LE                                                   CAT527  
       01  W-ABEND-AREA.                                                CAT527  
           03  ABEND-CD                  PIC S9(04) COMP SYNC.          CAT527  
                                                                        CAT527  
           COPY STUBCPY.                                                CAT527  
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT527  
      ***<---COBOL LE                                                   CAT527  
                                                                        CAT527  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT527  
      /                                                                 CAT527  
      ***************************************************************** CAT527  
      *    LINKAGE SECTION                                            * CAT527  
      ***************************************************************** CAT527  
       LINKAGE SECTION.                                                 CAT527  
       01  L-JCL-PARMS.                                                 CAT527  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT527  
           05  L-STREAM                  PIC  X(001).                   CAT527  
                                                                        CAT527  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT527  
      *                         ===========                             CAT527  
       0000-MAIN SECTION.                                               CAT527  
                                                                        CAT527  
           DISPLAY 'CAT01RPT - ACATS RECON W/097-50074'.                        
           DISPLAY ' '.                                                 CAT527  
           COPY MSGCOBO.                                                CAT527  
           DISPLAY ' '.                                                 CAT527  
                                                                        CAT527  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT527  
                                                                        CAT527  
           PERFORM 7000-PROCESS THRU 7000-EXIT                          CAT527  
              UNTIL INFILE-END-OF-FILE                                  CAT527  
                                                                        CAT527  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT527  
                                                                        CAT527  
       0000-FINI.                                                       CAT527  
                                                                        CAT527  
           GOBACK.                                                      CAT527  
      /                                                                 CAT527  
       1000-INIT SECTION.                                               CAT527  
                                                                        CAT527  
           DISPLAY 'CAT01RPT: L-STREAM         = '                      CAT527  
                              L-STREAM.                                 CAT527  
                                                                        CAT527  
           MOVE 'CAT01RPT'               TO BPDATES-CALLING-PGM.        CAT527  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT527  
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT527  
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT527  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT527  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT527  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT527  
                                                                        CAT527  
           DISPLAY 'CAT01RPT: PROC-DATE= ' BPD-PROC-DATE                CAT527  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT527  
                                                                        CAT527  
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT527  
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT527  
                                                                        CAT527  
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT527  
                                                                        CAT527  
           OPEN INPUT PENDING-FILE.                                     CAT527  
           IF INFILE-OKAY                                               CAT527  
               CONTINUE                                                 CAT527  
           ELSE                                                         CAT527  
               MOVE 3000                  TO  ABEND-CD                  CAT527  
               DISPLAY ' '                                              CAT527  
               DISPLAY 'CAT01RPT: U3000 - DD ACATMSDE OPEN ERROR, '     CAT527  
                       ' FILE STATUS = ' INFILE-STAT                    CAT527  
               CALL  ABEND  USING ABEND-CD                              CAT527  
           END-IF.                                                      CAT527  
                                                                                
           MOVE LOW-VALUES TO GETVHOL-PARM                                      
           MOVE 'CAT01RPT' TO GETVHOL-CALLING-PROGRAM                           
           MOVE 'O'        TO GETVHOL-FILE                                      
           MOVE 'O'        TO GETVHOL-FUNC                                      
           PERFORM 7650-CALL-GETVHOL THRU 7650-EXIT                             
           DISPLAY 'CAT01RPT: POSVSAM  OPENED FOR INPUT.  STATUS = '            
                                              POSVSAM-STATUS                    
                                                                                
           IF  POSVSAM-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT01RPT: ERROR OPENING POSVSAM'                        
               DISPLAY 'CAT01RPT: OPEN STATUS = ' POSVSAM-STATUS                
               DISPLAY 'CAT01RPT: U3001 - ABENDING ON BAD FILE STATUS'          
               MOVE +3001    TO ABEND-CD                                        
               CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
           OPEN OUTPUT REPT-FILE.                                       CAT527  
           DISPLAY 'CAT01RPT: REPORT   OPENED FOR OUTPUT '              CAT527  
                       ' FILE STATUS = ' REPT-STAT.                     CAT527  
                                                                        CAT527  
           IF  REPT-OKAY                                                CAT527  
               CONTINUE                                                 CAT527  
           ELSE                                                         CAT527  
               MOVE 3003                  TO  ABEND-CD                  CAT527  
               DISPLAY ' '                                              CAT527  
               DISPLAY 'CAT01RPT: U3003 - DD REPORT OPEN ERR, '         CAT527  
                       ' FILE STATUS = ' REPT-STAT                      CAT527  
               CALL  ABEND  USING ABEND-CD                              CAT527  
           END-IF.                                                      CAT527  
                                                                        CAT527  
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT527  
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
                                                                        CAT527  
       1000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       1500-LOAD-B1 SECTION.                                            CAT527  
           DISPLAY 'CAT01RPT: 1500-LOAD-B1'.                            CAT527  
                                                                        CAT527  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT527  
           MOVE 0                        TO  B1-TBL-CNT.                CAT527  
                                                                        CAT527  
           MOVE 10 TO  B1-SUB                                           CAT527  
           MOVE 1 TO B1-PRT-SUB                                                 
                                                                        CAT527  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT527  
                                             BH-ACAT-INFO               CAT527  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT527  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT527  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT527  
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT527  
                                             BH-ACAT-INFO               CAT527  
             IF   BH-BROKER-ACTIVE                                      CAT527  
                   ADD 1 TO B1-TBL-CNT                                  CAT527  
                   MOVE B1-SUB      TO  B1-CLT-NBR    (B1-TBL-CNT)      CAT527  
                   MOVE  BH-BROKER-NAME                                 CAT527  
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT527  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT527  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT527  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT527  
                   ELSE                                                 CAT527  
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT527  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT527  
                   END-IF                                               CAT527  
                   MOVE  BH-BROKER-STATUS                               CAT527  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT527  
                   IF BH-ACAT-ACTIVE                                    CAT527  
                   AND  B1-STREAM (B1-TBL-CNT) = L-STREAM               CAT527  
                   ADD 1 TO B1-ACTIVE-CNT                               CAT527  
                       MOVE 'A'         TO B1-ACAT-STATUS(B1-TBL-CNT)   CAT527  
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT527  
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT527  
                   ELSE                                                 CAT527  
                       MOVE ' '         TO B1-ACAT-STATUS(B1-TBL-CNT)   CAT527  
                   END-IF                                               CAT527  
             END-IF.                                                    CAT527  
                                                                        CAT527  
       1500-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       5500-READ-EXTRACT-RTN SECTION.                                   CAT527  
                                                                        CAT527  
           READ PENDING-FILE                                            CAT527  
               AT END                                                   CAT527  
                     GO TO 5500-EXIT.                                   CAT527  
                                                                        CAT527  
           ADD  1                        TO W-INFILE-CNT.               CAT527  
                                                                        CAT527  
       5500-EXIT.                                                       CAT527  
           EXIT.                                                        CAT527  
                                                                        CAT527  
      /                                                                 CAT527  
       7000-PROCESS SECTION.                                            CAT527  
                                                                        CAT527  
           PERFORM 5500-READ-EXTRACT-RTN THRU 5500-EXIT.                        
           IF INFILE-END-OF-FILE                                        CAT527  
               PERFORM 7500-WRITE-TOTAL-RTN                                     
           GO TO 7000-EXIT.                                                     
                                                                        CAT527  
                                                                        CAT527  
                                                                        CAT527  
           IF W-DTL1-SECURITY > SPACES                                  CAT527  
           AND IN-SECURITY-ADP-NBR NOT = W-DTL1-SECURITY                        
               PERFORM 7500-WRITE-TOTAL-RTN                                     
               MOVE ZERO TO WS-TOTAL-QTY.                                       
                                                                                
********** MOVE IN-CLIENT                   TO                          CAT527  
           MOVE IN-BRANCH-CD                TO  W-DTL1-BRANCH           CAT527  
           MOVE IN-ACCT-CD                  TO  W-DTL1-ACCOUNT          CAT527  
           MOVE IN-STTS-CD                  TO  W-DTL1-STATUS           CAT527  
           MOVE IN-SECURITY-ADP-NBR         TO  W-DTL1-SECURITY                 
           MOVE IN-ASSET-QTY                TO  W-DTL1-QTY              CAT527  
           ADD  IN-ASSET-QTY TO WS-TOTAL-QTY.                           CAT527  
           MOVE IN-ACAT-CONTROL-NBR         TO  W-DTL1-CONTROL-NBR              
                                                                        CAT527  
           MOVE W-DTL1-REC               TO W-REPT-LINE.                CAT527  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       CAT527  
           ADD 1                         TO W-LINE-CNT.                 CAT527  
                                                                        CAT527  
       7000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7500-WRITE-TOTAL-RTN SECTION.                                            
           MOVE W-DTL1-SECURITY TO W-TOTAL-SECURITY                     CAT527  
           PERFORM 7600-READ-POSITION THRU 7600-EXIT.                           
           MOVE WS-TOTAL-QTY TO  W-TOTAL-QTY                            CAT527  
           MOVE WS-MARGIN-QTY TO W-TOTAL-OMNI-QTY                       CAT527  
           SUBTRACT WS-TOTAL-QTY FROM WS-MARGIN-QTY                     CAT527  
                    GIVING W-TOTAL-DIFF                                 CAT527  
           MOVE W-TOTAL-REC              TO W-REPT-LINE.                CAT527  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       CAT527  
           ADD 1                         TO W-LINE-CNT.                 CAT527  
                                                                                
       7600-READ-POSITION SECTION.                                              
           MOVE ZERO TO WS-MARGIN-QTY                                   CAT527  
                                                                                
           MOVE SPACES                      TO W-POS-KEY                        
           MOVE 010                         TO W-POS-CLT                        
           MOVE '097'                       TO W-POS-BR                         
           MOVE '50074'                     TO W-POS-ACCT                       
           MOVE ZEROS                       TO W-POS-CUR                        
           MOVE '01'                        TO W-POS-REC-TYPE                   
           MOVE '01'                        TO W-POS-ACCT-TYPE                  
           MOVE W-DTL1-SECURITY             TO W-POS-SEC-NBR                    
      **   MOVE W-POS-KEY                   TO POSVSAM-KEY                      
           MOVE LOW-VALUES             TO W-CUSHOL-KEY                          
           MOVE 010                    TO W-CUSHOL-CLIENT                       
           MOVE '097'                  TO W-CUSHOL-BRANCH                       
           MOVE '50074'                TO W-CUSHOL-ACCOUNT                      
           MOVE ZEROS                  TO W-CUSHOL-FRGN-CURR-CODE               
      *****MOVE W-CUSHOL-KEY           TO GETVHOL-KEY                           
           MOVE W-POS-KEY              TO GETVHOL-OLD-KEY                       
           MOVE SPACES                 TO GETVHOL-FILLER1.                      
           MOVE SPACES                 TO GETVHOL-RETURN-PARAMETERS.            
                                                                                
      **---RETURN THE OLD RECORD LAYOUT(HOLDAVSM)                               
           MOVE 'O'                    TO GETVHOL-FILE.                         
                                                                                
      **---DO A RANDOM READ TO GET RECORD FOR THAT ACCOUNT.                     
           MOVE 'R'                    TO GETVHOL-FUNC.                         
           MOVE SPACES                 TO GETVHOL-PREV-KEY.                     
                                                                                
      **---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                        
                                                                                
           PERFORM 7650-CALL-GETVHOL THRU 7650-EXIT                             
                                                                                
           IF GETVHOL-NOT-FOUND                                                 
                DISPLAY 'GETVHOL NOT FOUND ' W-POS-KEY                          
                GO TO 7600-EXIT                                                 
           END-IF.                                                              
                                                                                
           IF NOT GETVHOL-SUCCESSFUL                                            
                DISPLAY 'CAT01RPT: CUSHOLV VSAM FILE, READ ERROR'               
                DISPLAY 'CAT01RPT: GETVHOL-RETURN-CODE = '                      
                                GETVHOL-RETURN-CODE                             
                DISPLAY 'CAT01RPT: GETVHOL-FILE-STATUS = '                      
                                  GETVHOL-FILE-STATUS                           
                MOVE +3999    TO ABEND-CD                                       
                CALL ABEND USING ABEND-CD                                       
           END-IF.                                                              
                                                                                
      **---MOVE THE OLD RECORD FROM THE PARM AREA                               
           MOVE GETVHOL-OLD-RECORD   TO CHLD-SUMMARY-SEGMENT.                   
                                                                                
           IF CHLD-KEY(1 : 31) NOT = W-POS-KEY(1 : 31)                          
              DISPLAY 'CHLD-KEY  NF ' CHLD-KEY(1 : 31)                          
                      ' POS-KEY ' W-POS-KEY(1 : 31)                             
              GO TO 7600-EXIT.                                                  
                                                                                
           DISPLAY 'CHLD-KEY FND ' CHLD-KEY(1 : 31)                             
                      ' POS-KEY ' W-POS-KEY(1 : 31)                             
                                                                                
           IF CHLD-RECORD-TYPE = HIGH-VALUES                                    
               DISPLAY 'FAIL ON HV'                                             
               GO TO 7600-EXIT                                                  
           END-IF                                                               
                                                                                
                                                                                
      ** MAKE SURE QUANTITY IS GREATER THAN ZERO                                
           DISPLAY 'POSN READ ' CHLD-KEY                                        
           IF  (CHLD-YESTERDAY-TOTAL-UNITS NUMERIC)                             
              MOVE CHLD-YESTERDAY-TOTAL-UNITS TO WS-MARGIN-QTY                  
           END-IF.                                                              
       7600-EXIT. EXIT.                                                 CAT527  
                                                                                
       7650-CALL-GETVHOL.                                                       
           CALL GETVHOL USING GETVHOL-PARM.                                     
           MOVE GETVHOL-FILE-STATUS TO       POSVSAM-STATUS.                    
       7650-EXIT. EXIT.                                                         
      /                                                                 CAT527  
       7700-WRITE-LINE SECTION.                                         CAT527  
                                                                        CAT527  
           IF   W-LINE-CNT > 56                                         CAT527  
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  CAT527  
                                                                        CAT527  
           MOVE W-REPT-LINE              TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT.                   CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
       7700-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7800-WRITE-HDR    SECTION.                                       CAT527  
                                                                        CAT527  
           ADD  1                        TO W-PAGE-CNT.                 CAT527  
                                                                        CAT527  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT527  
                                                                        CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO W-HDR1-CLT.                 CAT527  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT527  
                                         TO W-HDR1-CLT-NAME.            CAT527  
                                                                        CAT527  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT527  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT527  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT527  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT527  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT527  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT527  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-HDR3-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE 6                        TO W-LINE-CNT.                 CAT527  
                                                                        CAT527  
       7800-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       9000-CLOSE-ROUTINE SECTION.                                      CAT527  
                                                                        CAT527  
           CLOSE PENDING-FILE.                                          CAT527  
           CLOSE REPT-FILE.                                             CAT527  
           DISPLAY 'CAT01RPT: REPORT   CLOSED. STATUS = '               CAT527  
                                               REPT-STAT.               CAT527  
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
           DISPLAY 'CAT01RPT: INFILE CNT = ' W-INFILE-CNT               CAT527  
**********     ' INCLUDES HEADER RECORD'.                                       
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
           DISPLAY 'CAT01RPT: PROGRAM ENDED SUCCESSFULLY'.              CAT527  
                                                                        CAT527  
       9000-EXIT.                                                       CAT527  
           EXIT.                                                        CAT527  
