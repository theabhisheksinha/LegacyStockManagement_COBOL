000001* PDX    - CAT05    C0182051 02/20/03 14:23:32 TBLAMUR            00001000
      * DJ0002 - MARGIN REWRITE: USE ZGETVHOL                           00001000
000001* PDX    - CAT05    C0158444 05/07/01 10:51:42 TBLAMUR            00001000
000001* PDX    - CAT05    C0129261 08/16/99 10:23:19 TBDOJUN            00001000
      * DJ0001 - ALPHA BRANCH                                           00001000
000001* PDX    - CAT05    C0108018 02/27/98 11:10:26 TQCHSCA            00001000
000001* PDX    - CAT05    C0105041 01/16/98 10:01:02 TQCHSCA            00001000
000001* PDX    - CAT05    C0077602 06/28/96 14:27:40 TBJUCAS            00001000
000001* PDX    - CAT05    C0061484 04/04/95 10:00:34 TQCHSCA            00001000
000001* PDX    - CAT05    C0058117 03/17/95 15:15:27 TBJUCAS            00001000
00001  IDENTIFICATION DIVISION.                                         03/07/91
00002  PROGRAM-ID.     CAT05.                                           CAT0509 
00003  DATE-WRITTEN.   MAR. 1986.                                          LV009
00004  DATE-COMPILED.                                                   CAT0509 
00005  REMARKS.                                                         CAT0509 
00006          * 3/18/86   'ACAT' DATA EXTRACTION                       CAT0509 
00007          1. READ ACAT FILE                                        CAT0509 
00008          2. EXTRACT POS-RECORD (VSAM SKIP SEQUENTIAL)             CAT0509 
00009          3. CREATES O/P FILE FOR CAT10.                           CAT0509 
      *----------------------------------------------------------------*00003901
      *    CHANGE HISTORY:                                             *        
      *                                                                *        
      *      DATE    PGMR   SSR     CHANGE                             *        
      *    --------  ----  ------   -----------------------------------*        
      *    03/25/95  JPC          - ADDED CODE TO HANDLE NEW POSITION  *        
      *                             FILE FOR CLIENT 024 AND 63         *        
      *                           - CHANGED INCLUDE COMMAND TO COPY    *        
      *                             (JPC001)                           *        
      *    05/13/96  JPC          - PROVIDE OPTION TO EXCLUDE CERTAIN  *        
      *                             MEMOS USING B1 CARD#511200 FOR     *        
      *                             CREATING POSITION RECORDS.         *        
      *                             (JPC002)                           *        
C05041*    105041 - POPULATE NEW FIELD ON POSRECOB OUTPUT FILE IF THE           
C05041*             POSITION CONTAINS AN RN/RS MEMO ON IT. IF IT DOES           
C05041*             THEN CAT10 MUST SEND OUT AS 'RESTRICTED' IN D/M.            
      *----------------------------------------------------------------*00003901
00010      EJECT                                                        CAT0509 
00011  ENVIRONMENT DIVISION.                                            CAT0509 
00012  INPUT-OUTPUT SECTION.                                            CAT0509 
00013  FILE-CONTROL.                                                    CAT0509 
00014      SELECT ACAT-ASSET-FILE   ASSIGN TO UT-S-ASSETFLE.            CAT0509 
00020      SELECT POSITION-FILE     ASSIGN TO UT-S-POSIT.               CAT0509 
JPC002     SELECT SRMAS-VSAM        ASSIGN TO SRMAS                     CAT0509 
JPC002            ACCESS            DYNAMIC                             CAT0509 
JPC002            ORGANIZATION      INDEXED                             CAT0509 
JPC002            RECORD KEY IS     SRMAS-KEY                           CAT0509 
JPC002            FILE STATUS IS    SRMAS-STATUS.                       CAT0509 
00021      EJECT                                                        CAT0509 
00022  DATA DIVISION.                                                   CAT0509 
00023      SKIP1                                                        CAT0509 
00024  FILE SECTION.                                                    CAT0509 
00025  FD  ACAT-ASSET-FILE                                              CAT0509 
00026      RECORDING MODE IS V                                          CAT0509 
00027      LABEL RECORDS ARE STANDARD                                   CAT0509 
00028      BLOCK CONTAINS 0 RECORDS.                                    CAT0509 
00029  01  ASSET-REC                       PIC X(300).                  CAT0509 
00041      SKIP3                                                        CAT0509 
00042  FD  POSITION-FILE                                                CAT0509 
00043      LABEL RECORDS ARE STANDARD                                   CAT0509 
00044      RECORDING MODE IS V                                          CAT0509 
00045      BLOCK CONTAINS 0 RECORDS.                                    CAT0509 
00046  01  POS-REC                         PIC X(230).                  CAT0509 
00047      EJECT                                                        CAT0509 
JPC002 FD  SRMAS-VSAM                                                   CAT0509 
JPC002     RECORD IS VARYING.                                           CAT0509 
JPC002 01  SRMAS-REC.                                                   CAT0509 
JPC002     05  SRMAS-KEY.                                               07911000
JPC002         10  SRMAS-KEY-51.                                        07911000
JPC002             15  SRMAS-KEY-15     PIC X(15).                      07911000
JPC002             15  FILLER           PIC X(36).                      07911000
JPC002         10  FILLER               PIC X(06).                      07911000
JPC002     05  FILLER                   PIC X(1162).                    07911000
00048  WORKING-STORAGE SECTION.                                         CAT0509 
00049  77  FILLER               PIC X(16)      VALUE '** CAT05 W-S'.    CAT0509 
00050  77  ABEND-CODE           PIC S9(04) COMP SYNC VALUE ZERO.        CAT0509 
00052  77  SPIEEXIT-KEY-LENGTH  PIC S9(08)     COMP SYNC VALUE ZERO.    CAT0509 
00053  77  SPIEEXIT-GROUP-ID    PIC X(04)      VALUE 'BTS '.            CAT0509 
JPC002 77  SRMAS-STATUS         PIC X(2)       VALUE ' '.               CAT0509 
JPC002     88  VALID-SRMAS-STATUS VALUE        '00' '04' '10' '23'.             
00055  77  PREV-ACAT-ACTKEY     PIC X(11)      VALUE ' '.               CAT0509 
           COPY STUBCPY.                                                        
DJ0001 01  W-SRMAS-CNT          PIC 9(09)      VALUE 0.                 CAT0509 
00056      SKIP2                                                        CAT0509 
00057  01  WORK-FIELDS.                                                 CAT0509 
00058    05  WS-VSAM-KEY.                                               CAT0509 
00059      10  WS-ACTKEY.                                               CAT0509 
DJ0001       15  WS-CLT          PIC 9(05) COMP-3.                      CAT0509 
DJ0001       15  WS-BR           PIC X(03).                             CAT0509 
DJ0001       15  WS-ACCT         PIC X(05).                             CAT0509 
00063        15  WS-CURR         PIC X(6).                              CAT0509 
DJ0001     10  WS-REMAIN         PIC X(27).                             CAT0509 
00065    05  WS-ACAT-KEY.                                               CAT0509 
00066        15  WS-ACAT-CLT     PIC 9(3) COMP-3.                       CAT0509 
00067        15  WS-ACAT-BR      PIC 9(3).                              CAT0509 
00068        15  WS-ACAT-ACCT    PIC 9(5).                              CAT0509 
00069        15  WS-ACAT-CURR    PIC X.                                 CAT0509 
00070    05  WK-FIELDS.                                                 CAT0509 
00071        10  WS-ACCT-TYPE.                                          CAT0509 
00072          15  WS-FILLER      PIC X.                                CAT0509 
00073          15  WS-TYPE        PIC 9.                                CAT0509 
00074        10  WS-WI            PIC 9  COMP-3 VALUE 1.                CAT0509 
JPC002   05  WS-ACCT-ID           PIC 9(10).                                    
JPC002   05  FILLER REDEFINES WS-ACCT-ID.                                       
JPC002       10  FILLER           PIC X(02).                                    
JPC002       10  WS-ACCT-BRANCH   PIC 9(03).                                    
JPC002       10  WS-ACCT-NO       PIC 9(05).                                    
JPC002   05  RCRD-IND-SRMAS       PIC X(01).                                    
JPC002       88  RCRD-FOUND-SRMAS VALUE '1'.                                    
JPC002   05  EOF-IND-SRMAS        PIC X(01).                                    
JPC002       88  END-OF-FILE-SRMAS VALUE '1'.                                   
JPC002   05  WS-MEMO-IND          PIC X(01).                                    
JPC002       88  MEMO-NOT-FOUND    VALUE ' '.                                   
JPC002       88  MEMO-FOUND        VALUE '1'.                                   
JPC002   05  WS-MEMO3-IND         PIC X(01).                                    
JPC002       88  MEMO3-NOT-FOUND   VALUE ' '.                                   
JPC002       88  MEMO3-FOUND       VALUE '1'.                                   
JPC002   05  SUB                  PIC S9(04) COMP VALUE 0.                      
JPC002   05  SUB2                 PIC S9(04) COMP VALUE 0.                      
JPC002   05  SUB3                 PIC S9(04) COMP VALUE 0.                      
JPC002   05  SAVE-SRMAS-KEY-51    PIC X(51)  VALUE SPACES.              07911000
JPC002   05  WORK-MEMO-QTY        PIC S9(12)V9(5)  COMP-3.              07911000
00075  01  FILLER            PIC X(16)  VALUE 'ACAT-RECORD'.            CAT0509 
00076      SKIP1                                                        CAT0509 
JPC001 COPY ACATRECC.                                                   CAT0509 
00078      EJECT                                                        CAT0509 
JPC001 COPY RECDATZC.                                                   CAT0509 
      /                                                                 CAT0509 
DJ0002 01 GETVHOL-AREA.                                                 CAT0509 
DJ0002   05  W-POS3-CNT           PIC 9(09)      VALUE 0.               CAT0509 
DJ0002   05  W-OUTPUT-CNT         PIC 9(09)      VALUE 0.               CAT0509 
DJ0002 01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.         CAT0509 
DJ0002     COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.        CAT0509 
DJ0002 01  POS3-VSAM-REC.                                               CAT0509 
DJ0002     05  POS3-VSAM-RECKEY.                                        CAT0509 
DJ0002         10  POS3-VSAM-KEY-A.                                             
DJ0002             15  POS3-VSAM-CLT             PIC 9(05) COMP-3.              
DJ0002             15  POS3-VSAM-BRN             PIC X(03).                     
DJ0002             15  POS3-VSAM-ACCT            PIC X(05).                     
DJ0002         10  POS3-VSAM-CUR                 PIC X(06).                     
DJ0002         10  POS3-VSAM-CUR-N REDEFINES POS3-VSAM-CUR                      
DJ0002                                           PIC 9(06).                     
DJ0002         10  POS3-VSAM-REC-TYPE            PIC X(02).                     
DJ0002         10  POS3-VSAM-ACCT-TYPE           PIC X(02).                     
DJ0002         10  POS3-VSAM-ACCT-TYPE-N REDEFINES                              
DJ0002             POS3-VSAM-ACCT-TYPE           PIC 9(02).                     
DJ0002         10  POS3-VSAM-SEC-NBR             PIC X(15).                     
DJ0002         10  POS3-VSAM-WI                  PIC X(01).                     
DJ0002         10  POS3-VSAM-FILLER              PIC X(01).                     
DJ0002         10  POS3-VSAM-SEQ                 PIC 9(04).                     
DJ0002     05  POS3-VSAM-DATA1             PIC X(200).                  CAT0509 
DJ0002     05  POS3-VSAM-DATA-IND          PIC S9(1) COMP-3.            CAT0509 
DJ0002     05  POS3-VSAM-DATA2             PIC X(127).                  CAT0509 
           EJECT                                                        CAT0509 
DJ0001 COPY HOLDAVSM.                                                   CAT0509 
00082      EJECT                                                        CAT0509 
JPC001 COPY POSRECOB.                                                   CAT0509 
00084      EJECT                                                        CAT0509 
JPC002 COPY BHINFO.                                                     CAT0509 
JPC002     EJECT                                                        CAT0509 
JPC002 COPY BHBTS2.                                                     CAT0509 
JPC002     EJECT                                                        CAT0509 
JPC002 COPY SRMASREC.                                                   CAT0509 
JPC002     EJECT                                                        CAT0509 
00085  LINKAGE SECTION.                                                 CAT0509 
00086  01  PROGPARM.                                                    CAT0509 
00087      05  PARMLENGTH           PIC S9(4)   COMP  SYNC.             CAT0509 
00088      05  FILLER               PIC X(09).                          CAT0509 
00089          88  PARM-DATE-CHK    VALUE 'DATE-CHK='.                  CAT0509 
00090      05  PARM-DATE-CHK-ID     PIC X(01).                          CAT0509 
00091      EJECT                                                        CAT0509 
00092  PROCEDURE DIVISION USING PROGPARM.                               CAT0509 
00093      SKIP1                                                        CAT0509 
00094  COPY MSGCOBO.                                                    CAT0509 
00095      SKIP2                                                        CAT0509 
00096      CALL  SPIEEXIT  USING ACAT-RECORD                            CAT0509 
00097                            SPIEEXIT-KEY-LENGTH                    CAT0509 
00098                            SPIEEXIT-GROUP-ID.                     CAT0509 
00099      SKIP2                                                        CAT0509 
00100      CALL  LNKDATZ   USING LINK-DATES-AREA.                       CAT0509 
00101      SKIP1                                                        CAT0509 
00102 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAT0509 
00103 *                        MAIN LINE                                CAT0509 
00104 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAT0509 
00105      SKIP1                                                        CAT0509 
00106      OPEN INPUT  ACAT-ASSET-FILE                                  CAT0509 
JPC001                 SRMAS-VSAM                                       CAT0509 
00108           OUTPUT POSITION-FILE.                                   CAT0509 
00109      SKIP1                                                        CAT0509 
JPC002     IF  NOT VALID-SRMAS-STATUS                                           
JPC002         DISPLAY ' ** CAT05 - SRMAS VSAM FILE, OPEN ERROR'        CAT0509 
JPC002                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
JPC002         MOVE +1103              TO ABEND-CODE                    CAT0509 
DJ0001         GO TO CALL-ABEND-RTN                                     CAT0509 
DJ0001     ELSE                                                         CAT0509 
DJ0001         DISPLAY 'CAT05: SRMAS VSAM FILE, OPENED'                 CAT0509 
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
DJ0001     END-IF                                                       CAT0509 
                                                                        CAT0509 
DJ0002**---OPEN CUSBALV/BALNC FILE AND SPECIFY OLD LAYOUT               CAT0509 
DJ0002     MOVE LOW-VALUES       TO GETVHOL-PARM                        CAT0509 
DJ0002     MOVE 'CAT05   '       TO GETVHOL-CALLING-PROGRAM             CAT0509 
DJ0002     SET GETVHOL-FUNC-OPEN TO TRUE                                CAT0509 
DJ0002     SET GETVHOL-FILE-OLD  TO TRUE                                CAT0509 
DJ0002     CALL GETVHOL USING GETVHOL-PARM                              CAT0509 
DJ0002     IF GETVHOL-SUCCESSFUL                                        CAT0509 
DJ0002        CONTINUE                                                  CAT0509 
DJ0002     ELSE                                                         CAT0509 
DJ0002          DISPLAY 'CAT05: GETVHOL OPEN ERROR'                     CAT0509 
DJ0002          DISPLAY 'CAT05: GETVHOL-RETURN-CODE = '                 CAT0509 
DJ0002                          GETVHOL-RETURN-CODE                     CAT0509 
DJ0002          DISPLAY 'CAT05: GETVHOL-FILE-STATUS = '                 CAT0509 
DJ0002                          GETVHOL-FILE-STATUS                     CAT0509 
DJ0002          DISPLAY 'CAT05: U3101 ABEND ON CALL GETVHOL ERROR'      CAT0509 
DJ0002          MOVE +3101    TO ABEND-CODE                             CAT0509 
DJ0002          GO TO CALL-ABEND-RTN                                    CAT0509 
DJ0002     END-IF.                                                      CAT0509 
                                                                        CAT0509 
00115      SKIP1                                                        CAT0509 
DJ0001     DISPLAY 'CAT05: PERFORM SELECT-TRANSFER-ACCOUNT'             CAT0509 
00116      PERFORM SELECT-TRANSFER-ACCOUNT                              CAT0509 
00117         THRU SELECT-TRANSFER-ACCOUNT-EXIT.                        CAT0509 
00118      SKIP1                                                        CAT0509 
DJ0001     DISPLAY 'CAT05: CLOSING FILES'                               CAT0509 
00119      CLOSE ACAT-ASSET-FILE                                        CAT0509 
JPC001           SRMAS-VSAM                                             CAT0509 
00121            POSITION-FILE.                                         CAT0509 
                                                                        CAT0509 
DJ0002**---CALL GETVHOL TO CLOSE CUSHOLV/DPHLD1 FILE                    CAT0509 
DJ0002     SET GETVHOL-FUNC-CLOSE TO TRUE                               CAT0509 
DJ0002     CALL GETVHOL USING GETVHOL-PARM.                             CAT0509 
                                                                        CAT0509 
DJ0001     IF  NOT VALID-SRMAS-STATUS                                           
DJ0001         DISPLAY ' ** CAT05 - SRMAS VSAM FILE, CLOSE ERROR'       CAT0509 
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
DJ0001         MOVE +1103              TO ABEND-CODE                    CAT0509 
DJ0001         GO TO CALL-ABEND-RTN                                     CAT0509 
DJ0001     ELSE                                                         CAT0509 
DJ0001         DISPLAY 'CAT05: SRMAS VSAM FILE, CLOSED'                 CAT0509 
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
DJ0001     END-IF                                                       CAT0509 
00128      SKIP1                                                        CAT0509 
DJ0002     DISPLAY 'CAT05: W-POS3-CNT  = '  W-POS3-CNT                  CAT0509 
DJ0001     DISPLAY 'CAT05: W-SRMAS-CNT = '  W-SRMAS-CNT                 CAT0509 
DJ0001     DISPLAY 'CAT05: W-OUTPUT-CNT= '  W-OUTPUT-CNT                CAT0509 
DJ0001     DISPLAY 'CAT05: JOB ENDED SUCCESSFULLY'                      CAT0509 
00129      MOVE ZERO                   TO RETURN-CODE.                  CAT0509 
00130      STOP RUN.                                                    CAT0509 
00131      SKIP2                                                        CAT0509 
00132  CALL-ABEND-RTN.                                                  CAT0509 
00133      CALL  ABEND  USING ABEND-CODE.                               CAT0509 
00134      EJECT                                                        CAT0509 
00135  SELECT-TRANSFER-ACCOUNT.                                         CAT0509 
00136                                                                   CAT0509 
00137 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT0509 
00138 * * *                                                             CAT0509 
00139 * * *    1. READ ACAT-ASSET-FILE (VARIABLE LENGTH REC)            CAT0509 
00140 * * *    2. DATE-CHECK                                            CAT0509 
00141 * * *    3. BYPASS FILE-CODE = '1'                                CAT0509 
00142 * * *                                                             CAT0509 
00143 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT0509 
00144                                                                   CAT0509 
00145  READ-ACAT-ASSET-FILE.                                            CAT0509 
00146      READ ACAT-ASSET-FILE INTO ACAT-RECORD-DATA                   CAT0509 
DJ0002          AT END DISPLAY 'CAT05: END OF ACAT-ASSET-FILE REACHED'  CAT0509 
00147                  GO TO SELECT-TRANSFER-ACCOUNT-EXIT.              CAT0509 
00148                                                                   CAT0509 
00149      IF ACAT-VSAM-RECKEY = LOW-VALUE                              CAT0509 
00150          IF (ACAT-DATE-MMDDYY NOT = LD-PRIOR-PROC-DATE            CAT0509 
00151                  AND                                              CAT0509 
00152              PARM-DATE-CHK-ID NOT = 'N')                          CAT0509 
00153              DISPLAY ' ** CAT05 - DATE ERROR, ACATFL-DATE = '     CAT0509 
00154                      ACAT-DATE-MMDDYY, ', LD-PRIOR-PROC-DATE = '  CAT0509 
00155                      LD-PRIOR-PROC-DATE, ' '                      CAT0509 
00156              MOVE +1105          TO ABEND-CODE                    CAT0509 
00157              GO TO CALL-ABEND-RTN                                 CAT0509 
00158          ELSE                                                     CAT0509 
00159              GO TO READ-ACAT-ASSET-FILE.                          CAT0509 
00160      SKIP1                                                        CAT0509 
00161      IF ACAT-FILE-CODE = '1' OR '2'                               CAT0509 
00162          GO TO READ-ACAT-ASSET-FILE.                              CAT0509 
00163      SKIP1                                                        CAT0509 
00164      IF ACAT-ACTKEY NOT = PREV-ACAT-ACTKEY                        CAT0509 
DJ0001         DISPLAY 'ACAT-ACTKEY= ' ACAT-CLT                         CAT0509 
DJ0001                             ' ' ACAT-BR                          CAT0509 
DJ0001                             ' ' ACAT-ACCT                        CAT0509 
DJ0001                             ' ' ACAT-CURR                        CAT0509 
00165          MOVE ACAT-ACTKEY        TO PREV-ACAT-ACTKEY              CAT0509 
JPC001         IF  ACAT-CLT IS NUMERIC                                          
DJ0002                 PERFORM SELECT-POS3-RECORD                       CAT0509 
DJ0002                    THRU SELECT-POS3-RECORD-EXIT                  CAT0509 
DJ0002         END-IF.                                                          
00168      SKIP1                                                        CAT0509 
00169      GO TO READ-ACAT-ASSET-FILE.                                  CAT0509 
00170      SKIP1                                                        CAT0509 
00171  SELECT-TRANSFER-ACCOUNT-EXIT.   EXIT.                            CAT0509 
00172      EJECT                                                        CAT0509 
00173 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT0509 
00174 * * *    1. SETUP POS3-VSAM-RECKEY                                CAT0509 
00175 * * *    2. READ  POSITION-FILE SKIP SEQUENTIAL                   CAT0509 
00176 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT0509 
00177                                                                   CAT0509 
DJ0002 SELECT-POS3-RECORD.                                              CAT0509 
DJ0002     MOVE ACAT-CLT               TO WS-CLT.                       CAT0509 
DJ0002     MOVE ACAT-BR                TO WS-BR.                        CAT0509 
DJ0002     MOVE ACAT-ACCT              TO WS-ACCT.                      CAT0509 
DJ0002     MOVE ZEROS                  TO WS-CURR.                      CAT0509 
DJ0002     MOVE SPACES                 TO WS-REMAIN.                    CAT0509 
DJ0002     MOVE WS-VSAM-KEY            TO POS3-VSAM-RECKEY.             CAT0509 
DJ0002                                                                  CAT0509 
DJ0002**---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.   CAT0509 
DJ0002     MOVE 'S'                    TO GETVHOL-FUNC.                 CAT0509 
DJ0002     MOVE WS-VSAM-KEY            TO GETVHOL-KEY                   CAT0509 
DJ0002     MOVE SPACES                 TO GETVHOL-PREV-KEY.             CAT0509 
DJ0002                                                                  CAT0509 
DJ0002 READ-POS3-NEXT.                                                  CAT0509 
DJ0002**---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     CALL GETVHOL USING GETVHOL-PARM.                             CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     IF GETVHOL-END-OF-FILE                                       CAT0509 
DJ0002        GO TO SELECT-POS3-RECORD-EXIT.                            CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     IF NOT GETVHOL-SUCCESSFUL                                    CAT0509 
DJ0002         DISPLAY 'CAT05: GETVHOL READ ERROR'                      CAT0509 
DJ0002         DISPLAY 'CAT05: GETVHOL-RETURN-CODE = '                  CAT0509 
DJ0002                         GETVHOL-RETURN-CODE                      CAT0509 
DJ0002         DISPLAY 'CAT05: GETVHOL-FILE-STATUS = '                  CAT0509 
DJ0002                         GETVHOL-FILE-STATUS                      CAT0509 
DJ0002         DISPLAY 'CAT05: U3102 ABEND ON CALL GETVHOL ERROR'       CAT0509 
DJ0002         MOVE +3102    TO ABEND-CODE                              CAT0509 
DJ0002         GO TO CALL-ABEND-RTN                                     CAT0509 
DJ0002     END-IF.                                                      CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     ADD 1 TO W-POS3-CNT                                          CAT0509 
DJ0002                                                                  CAT0509 
DJ0002**---MOVE THE OLD RECORD FROM THE PARM AREA                       CAT0509 
DJ0002     MOVE GETVHOL-OLD-RECORD   (1:370)                            CAT0509 
DJ0002                               TO POS3-VSAM-REC (1:370)           CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     IF POS3-VSAM-REC-TYPE = HIGH-VALUES                          CAT0509 
DJ0002        GO TO READ-POS3-NEXT.                                     CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     IF POS3-VSAM-ACCT-TYPE NOT NUMERIC                           CAT0509 
DJ0002*****DISPLAY 'POS3: BYPASS ACCT TYPE NOT NUMERIC'                 CAT0509 
DJ0002*****        ' POS3-VSAM-RECKEY= ' POS3-VSAM-RECKEY               CAT0509 
DJ0002        GO TO READ-POS3-NEXT.                                     CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     MOVE POS3-VSAM-DATA-IND TO CHLD-NUMBER-OF-DESCRIPT.          CAT0509 
DJ0002     MOVE POS3-VSAM-REC      TO CHLD-SUMMARY-SEGMENT.             CAT0509 
DJ0002                                                                  CAT0509 
DJ0002**---REFORMAT THE KEY FOR COMPARING                               CAT0509 
DJ0002     MOVE CHLD-COMPANY-CODE       TO  WS-ACAT-CLT.                CAT0509 
DJ0002     MOVE CHLD-OFFICE-CODE        TO  WS-ACAT-BR.                 CAT0509 
DJ0002     MOVE CHLD-ACCOUNT-NUMBER     TO  WS-ACAT-ACCT.               CAT0509 
DJ0002     MOVE LOW-VALUES              TO  WS-ACAT-CURR.               CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     IF WS-ACAT-KEY NOT = PREV-ACAT-ACTKEY                        CAT0509 
DJ0002         GO TO SELECT-POS3-RECORD-EXIT.                           CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     PERFORM FORMAT-POS-REC                                       CAT0509 
DJ0002        THRU FORMAT-POS-REC-EXIT.                                 CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     GO TO READ-POS3-NEXT.                                        CAT0509 
DJ0002                                                                  CAT0509 
DJ0002 SELECT-POS3-RECORD-EXIT. EXIT.                                   CAT0509 
      /                                                                 CAT0509 
DJ0002 FORMAT-POS-REC.                                                  CAT0509 
DJ0002                                                                  CAT0509 
DJ0002     MOVE SPACES                   TO  POS-RECORD.                CAT0509 
DJ0002     MOVE ZEROS                    TO  POS-DLA                    CAT0509 
DJ0002                                       POS-TOT-MKT-VALUE          CAT0509 
DJ0002                                       POS-REST-UNIT              CAT0509 
DJ0002                                       POS-MEMO-QTY(1)            CAT0509 
DJ0002                                       POS-MEMO-QTY(2)            CAT0509 
DJ0002                                       POS-MEMO-QTY(3)            CAT0509 
DJ0002                                       POS-MEMO-QTY(4).           CAT0509 
DJ0002     MOVE LOW-VALUE                TO POS-MEMO-CODE(1)            CAT0509 
DJ0002                                      POS-MEMO-CODE(2)            CAT0509 
DJ0002                                      POS-MEMO-CODE(3)            CAT0509 
DJ0002                                      POS-MEMO-CODE(4).           CAT0509 
DJ0002     MOVE  WS-ACAT-CLT             TO  POS-CLT.                   CAT0509 
DJ0002     MOVE  WS-ACAT-BR              TO  POS-BR.                    CAT0509 
DJ0002     MOVE  WS-ACAT-ACCT            TO  POS-ACCT.                  CAT0509 
DJ0002     MOVE  LOW-VALUE               TO  POS-CURR.                  CAT0509 
DJ0002     MOVE  CHLD-ACCOUNT-TYPE       TO  WS-ACCT-TYPE.              CAT0509 
DJ0002     MOVE  WS-TYPE                 TO  POS-TYPE.                  CAT0509 
DJ0002     MOVE  CHLD-SECURITY-NUMBER    TO  POS-SEC.                   CAT0509 
DJ0002     IF    CHLD-WI-KEY = 1                                        CAT0509 
DJ0002           MOVE WS-WI              TO  POS-WI                     CAT0509 
DJ0002     ELSE                                                         CAT0509 
DJ0002           MOVE LOW-VALUE          TO  POS-WI.                    CAT0509 
DJ0002     MOVE  CHLD-SEQ-KEY            TO  POS-SEQ-NO.                CAT0509 
DJ0002     MOVE  CHLD-YESTERDAY-TOTAL-UNITS  TO POS-QTY.                CAT0509 
DJ0002     MOVE CHLD-CLOSING-PRICE       TO  POS-PRICE-PRT-FORMAT.      CAT0509 
DJ0002     MOVE CHLD-EXCHANGE-CODE       TO  POS-EXCH.                  CAT0509 
DJ0002     MOVE CHLD-TRAILER-CODE        TO  POS-TRL-CODE.              CAT0509 
DJ0002     MOVE CHLD-LAST-ACTIVITY-DATE  TO  POS-DLA.                   CAT0509 
DJ0002     MOVE CHLD-MARKET-VALUE        TO  POS-TOT-MKT-VALUE.         CAT0509 
DJ0002     MOVE CHLD-HOUSE-PRICE-INDIC   TO  POS-HOUSE-PRC-IND.         CAT0509 
DJ0002     MOVE CHLD-NUMBER-RESTRICT-UNITS TO  POS-REST-UNIT.           CAT0509 
DJ0002                                                                          
DJ0002     IF BH-BROKER-NUMBER-N IS NOT NUMERIC                         CAT0509 
DJ0002     OR WS-ACAT-CLT NOT = BH-BROKER-NUMBER-N                      CAT0509 
DJ0002         MOVE WS-ACAT-CLT         TO BH-BROKER-NUMBER-N                   
DJ0002         MOVE '015'               TO BH-LOGICAL-RECORD-CODE               
DJ0002         MOVE '511000'            TO BH-B2-INFO-ID-AREA                   
DJ0002         CALL   GETB1V            USING BH-BROKER-HEADER-INFO             
DJ0002                                        BH-BTS2-INFO                      
DJ0002         END-CALL.                                                        
DJ0002     MOVE ZEROES                   TO POS-MEMO-QTY-EXCLUDED               
DJ0002     IF  BH-BTS2-ACAT-MEMO-CODE-EXCL-NO NUMERIC                           
DJ0002     AND BH-BTS2-ACAT-MEMO-CODE-EXCL-NO > 0                               
DJ0002         PERFORM CHECK-MEMO-RTN.                                  CAT0509 
DJ0002                                                                          
DJ0002     IF  BH-BTS2-ACAT-RESTRT-RN-RS-MEMO  =  '1'                           
DJ0002         PERFORM  CHECK-FOR-RN-RS-MEMO                                    
DJ0002     END-IF.                                                              
DJ0002                                                                          
DJ0002     IF   CHLD-MEMO-CODE(1) NOT = SPACES                          CAT0509 
DJ0002        MOVE CHLD-MEMO-CODE(1)     TO POS-MEMO-CODE(1).           CAT0509 
DJ0002     MOVE CHLD-MEMO-UNITS(1)       TO POS-MEMO-QTY(1).            CAT0509 
DJ0002     IF   CHLD-MEMO-CODE(2) NOT = SPACES                          CAT0509 
DJ0002       MOVE CHLD-MEMO-CODE(2)        TO POS-MEMO-CODE(2).         CAT0509 
DJ0002     MOVE CHLD-MEMO-UNITS(2)       TO POS-MEMO-QTY(2).            CAT0509 
DJ0002     IF   CHLD-MEMO-CODE(3) NOT = SPACES                          CAT0509 
DJ0002     MOVE CHLD-MEMO-CODE(3)        TO POS-MEMO-CODE(3).           CAT0509 
DJ0002     MOVE CHLD-MEMO-UNITS(3)       TO POS-MEMO-QTY(3).            CAT0509 
DJ0002     IF   CHLD-MEMO-CODE(4) NOT = SPACES                          CAT0509 
DJ0002     MOVE CHLD-MEMO-CODE(4)        TO POS-MEMO-CODE(4).           CAT0509 
DJ0002     MOVE CHLD-MEMO-UNITS(4)       TO POS-MEMO-QTY(4).            CAT0509 
DJ0002     PERFORM MOVE-DESC  THRU MOVE-DESC-EXIT.                      CAT0509 
DJ0002     ADD 1 TO W-OUTPUT-CNT.                                       CAT0509 
DJ0002     WRITE POS-REC     FROM    POS-RECORD.                        CAT0509 
DJ0002 FORMAT-POS-REC-EXIT. EXIT.                                       CAT0509 
      /                                                                 CAT0509 
00265  MOVE-DESC.                                                       CAT0509 
00266       IF CHLD-NUMBER-OF-DESCRIPT = 0                              CAT0509 
00267          GO TO MOVE-DESC-EXIT.                                    CAT0509 
00268       IF CHLD-NUMBER-OF-DESCRIPT = 1                              CAT0509 
00269          MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT0509 
00270       ELSE                                                        CAT0509 
00271        IF CHLD-NUMBER-OF-DESCRIPT = 2                             CAT0509 
00272          MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT0509 
00273          MOVE CHLD-SECURITY-DESC-OCCURS(2)     TO   POS-DESC2     CAT0509 
00274       ELSE                                                        CAT0509 
00275 ***    IF CHLD-NUMBER-OF-DESCRIPT = 3                             CAT0509 
00276          MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT0509 
00277          MOVE CHLD-SECURITY-DESC-OCCURS(2)     TO   POS-DESC2     CAT0509 
00278          MOVE CHLD-SECURITY-DESC-OCCURS(3)     TO   POS-DESC3.    CAT0509 
00279  MOVE-DESC-EXIT.                                                  CAT0509 
JPC002     EXIT.                                                        CAT0509 
JPC002 CHECK-MEMO-RTN.                                                  CAT0509 
JPC002     COMPUTE WORK-MEMO-QTY = CHLD-MEMO-UNITS(1)                   07911000
JPC002                           + CHLD-MEMO-UNITS(2)                   CAT0509 
JPC002                           + CHLD-MEMO-UNITS(3)                   CAT0509 
JPC002                           + CHLD-MEMO-UNITS(4)                   CAT0509 
JPC002     IF  WORK-MEMO-QTY > CHLD-YESTERDAY-TOTAL-UNITS               07911000
JPC002         SET MEMO-EXCLUDED-GREATER       TO TRUE                  CAT1029 
JPC002     ELSE                                                         07911000
JPC002         SET MEMO-EXCLUDED-LESS-OR-EQUAL TO TRUE                  CAT1029 
JPC002     END-IF                                                       07911000
JPC002     MOVE ZEROES                   TO POS-MEMO-QTY-EXCLUDED               
JPC002     MOVE LOW-VALUES               TO SR-WS-SEQ.                  07911000
JPC002     MOVE WS-ACAT-CLT              TO SR-WS-CLIENT-N.             07912000
JPC002     MOVE SPACES                   TO SR-WS-CUSIP-1-2             07913000
JPC002                                      SR-WS-CUSIP-12.             07914000
JPC002     MOVE CHLD-CUSIP-NUMBER        TO SR-WS-CUSIP-3-11.           07915000
JPC002     MOVE SR-WS-SEQ (1:15)         TO SRMAS-KEY-15                07922000
JPC002     SET RCRD-FOUND-SRMAS          TO TRUE                                
JPC002     SET MEMO-NOT-FOUND            TO TRUE                                
JPC002     START SRMAS-VSAM KEY >= SRMAS-KEY-15                         07911000
JPC002           INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS               07911000
JPC002     END-START                                                    07911000
JPC002     IF VALID-SRMAS-STATUS                                                
JPC002      IF RCRD-FOUND-SRMAS                                                 
JPC002         READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD                    
JPC002                      AT END SET END-OF-FILE-SRMAS TO TRUE                
JPC002         END-READ                                                         
JPC002         MOVE ZEROES               TO SR-WS-BRANCH                07919000
JPC002         MOVE WS-ACAT-BR           TO SR-WS-BRANCH-N              07920000
JPC002         MOVE '00000'              TO SR-WS-ACCOUNT-1-5           07921000
JPC002         MOVE WS-ACAT-ACCT         TO SR-WS-ACCOUNT-6-10          07922000
JPC002         MOVE SR-WS-SEQ (1:51) TO SRMAS-KEY-51                    07922000
JPC002                                  SAVE-SRMAS-KEY-51               07922000
JPC002         SET RCRD-FOUND-SRMAS      TO TRUE                                
JPC002         START SRMAS-VSAM KEY = SRMAS-KEY-51                      07911000
JPC002               INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS           07911000
JPC002         END-START                                                07911000
JPC002         IF  RCRD-FOUND-SRMAS                                             
JPC002             READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD                
JPC002                          AT END SET END-OF-FILE-SRMAS TO TRUE            
JPC002             END-READ                                                     
DJ0001             ADD 1 TO W-SRMAS-CNT                                         
JPC002             PERFORM UNTIL END-OF-FILE-SRMAS                              
JPC002                        OR SR-WS-SEQ (1:51) > SAVE-SRMAS-KEY-51           
JPC002                        OR MEMO-FOUND                                     
JPC002                 IF  VALID-SRMAS-STATUS                                   
JPC002                     IF  SR-WS-TRID = '5'                                 
JPC002                     AND SR-WS-BRANCH-N = WS-ACAT-BR                      
JPC002                     AND SR-WS-ACCOUNT-6-10 = WS-ACAT-ACCT        07922000
JPC002                     AND SR-WS-TYPE = WS-TYPE                     07922000
JPC002                         PERFORM VARYING SUB FROM 1 BY 1 UNTIL            
JPC002                              SUB > BH-BTS2-ACAT-MEMO-CODE-EXCL-NO        
JPC002                           OR SUB > 20                                    
JPC002                             SET M-X TO 1                                 
JPC002                             SEARCH SR-WS-MEMO-QTYS VARYING M-X           
JPC002                                 AT END CONTINUE                          
JPC002                               WHEN SR-WS-MEMO-IND (M-X) =                
JPC002                                    BH-BTS2-ACAT-MEMO-CODE (SUB)          
JPC002                                 IF SR-WS-MEMO-IND (M-X) > SPACES         
JPC002                                    ADD SR-WS-MEMO-QTY (M-X)              
JPC002                                     TO POS-MEMO-QTY-EXCLUDED             
JPC002                                 END-IF                                   
JPC002                             END-SEARCH                                   
JPC002                         END-PERFORM                                      
JPC002                     END-IF                                               
JPC002                 ELSE                                                     
JPC002                     DISPLAY ' ** CAT05 - SRMAS FILE, READ ERROR' CAT0509 
JPC002                             ' FILE-STATUS = ' SRMAS-STATUS       CAT0509 
JPC002                     DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY         CAT0509 
JPC002                             'ACAT-CLT    = ' ACAT-CLT            CAT0509 
JPC002                     MOVE +1202  TO ABEND-CODE                    CAT0509 
JPC002                     GO TO CALL-ABEND-RTN                         CAT0509 
JPC002                 END-IF                                                   
JPC002                 READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD            
JPC002                          AT END SET END-OF-FILE-SRMAS TO TRUE            
JPC002                 END-READ                                                 
DJ0001                 ADD 1 TO W-SRMAS-CNT                                     
JPC002             END-PERFORM                                                  
JPC002         ELSE                                                             
JPC002          DISPLAY 'RCRD NOT FOUND SRMAS 2: ' SR-WS-SEQ (1:57)             
JPC002      ELSE                                                                
JPC002          DISPLAY 'RCRD NOT FOUND SRMAS 1: ' SR-WS-SEQ (1:57)             
JPC002     ELSE                                                                 
JPC002         DISPLAY ' ** CAT05 - SRMAS FILE, START ERROR'            CAT0509 
JPC002                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
JPC002         DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY                     CAT0509 
JPC002                 'ACAT-CLT    = ' ACAT-CLT                        CAT0509 
JPC002         MOVE +1201              TO ABEND-CODE                    CAT0509 
JPC002         GO TO CALL-ABEND-RTN.                                    CAT0509 
C05041                                                                          
C05041 CHECK-FOR-RN-RS-MEMO.                                            CAT0509 
C05041     MOVE ' '                      TO POS-MEMO-IS-RESTRICTED.             
C05041     MOVE LOW-VALUES               TO SR-WS-SEQ.                  07911000
C05041     MOVE WS-ACAT-CLT              TO SR-WS-CLIENT-N.             07912000
C05041     MOVE SPACES                   TO SR-WS-CUSIP-1-2             07913000
C05041                                      SR-WS-CUSIP-12.             07914000
C05041     MOVE CHLD-CUSIP-NUMBER        TO SR-WS-CUSIP-3-11.           07915000
C05041     MOVE SR-WS-SEQ (1:15)         TO SRMAS-KEY-15                07922000
C05041     SET RCRD-FOUND-SRMAS          TO TRUE                                
C05041     SET MEMO-NOT-FOUND            TO TRUE                                
C05041     START SRMAS-VSAM KEY >= SRMAS-KEY-15                         07911000
C05041           INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS               07911000
C05041     END-START                                                    07911000
C05041     IF VALID-SRMAS-STATUS                                                
C05041      IF RCRD-FOUND-SRMAS                                                 
C05041         READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD                    
C05041                      AT END SET END-OF-FILE-SRMAS TO TRUE                
C05041         END-READ                                                         
C05041         MOVE ZEROES               TO SR-WS-BRANCH                07919000
C05041         MOVE WS-ACAT-BR           TO SR-WS-BRANCH-N              07920000
C05041         MOVE '00000'              TO SR-WS-ACCOUNT-1-5           07921000
C05041         MOVE WS-ACAT-ACCT         TO SR-WS-ACCOUNT-6-10          07922000
C05041         MOVE SR-WS-SEQ (1:51) TO SRMAS-KEY-51                    07922000
C05041                                  SAVE-SRMAS-KEY-51               07922000
C05041         SET RCRD-FOUND-SRMAS      TO TRUE                                
C05041         START SRMAS-VSAM KEY = SRMAS-KEY-51                      07911000
C05041               INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS           07911000
C05041         END-START                                                07911000
C05041         IF  RCRD-FOUND-SRMAS                                             
C05041             READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD                
C05041                          AT END SET END-OF-FILE-SRMAS TO TRUE            
C05041             END-READ                                                     
DJ0001                 ADD 1 TO W-SRMAS-CNT                                     
C05041             PERFORM UNTIL END-OF-FILE-SRMAS                              
C05041                        OR SR-WS-SEQ (1:51) > SAVE-SRMAS-KEY-51           
C05041                        OR MEMO-FOUND                                     
C05041                 IF  VALID-SRMAS-STATUS                                   
C05041                     IF  SR-WS-TRID = '5'                                 
C05041                     AND SR-WS-BRANCH-N = WS-ACAT-BR                      
C05041                     AND SR-WS-ACCOUNT-6-10 = WS-ACAT-ACCT        07922000
C05041                     AND SR-WS-TYPE = WS-TYPE                     07922000
C05041                       SET M-X TO 1                                       
C05041                       SEARCH SR-WS-MEMO-QTYS VARYING M-X                 
C05041                           AT END CONTINUE                                
C05041                         WHEN (SR-WS-MEMO-IND (M-X) = 'RN'                
C05041                           OR  SR-WS-MEMO-IND (M-X) = 'RS')               
C05041                           IF SR-WS-MEMO-IND (M-X) > SPACES               
C05041                              MOVE 'Y' TO POS-MEMO-IS-RESTRICTED          
C05041                           END-IF                                         
C05041                       END-SEARCH                                         
C05041                     END-IF                                               
C05041                 ELSE                                                     
C05041                     DISPLAY ' ** CAT05 - SRMAS FILE, READ ERROR' CAT0509 
C05041                             ' FILE-STATUS = ' SRMAS-STATUS       CAT0509 
C05041                     DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY         CAT0509 
C05041                             'ACAT-CLT    = ' ACAT-CLT            CAT0509 
C05041                     MOVE +1202  TO ABEND-CODE                    CAT0509 
C05041                     GO TO CALL-ABEND-RTN                         CAT0509 
C05041                 END-IF                                                   
C05041                 READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD            
C05041                          AT END SET END-OF-FILE-SRMAS TO TRUE            
C05041                 END-READ                                                 
DJ0001                 ADD 1 TO W-SRMAS-CNT                                     
C05041             END-PERFORM                                                  
C05041         ELSE                                                             
C05041          DISPLAY 'RCRD NOT FOUND SRMAS 2: ' SR-WS-SEQ (1:57)             
C05041      ELSE                                                                
C05041          DISPLAY 'RCRD NOT FOUND SRMAS 1: ' SR-WS-SEQ (1:57)             
C05041     ELSE                                                                 
C05041         DISPLAY ' ** CAT05 - SRMAS FILE, START ERROR'            CAT0509 
C05041                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT0509 
C05041         DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY                     CAT0509 
C05041                 'ACAT-CLT    = ' ACAT-CLT                        CAT0509 
C05041         MOVE +1201              TO ABEND-CODE                    CAT0509 
C05041         GO TO CALL-ABEND-RTN.                                    CAT0509 
