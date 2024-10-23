000001* PDX    - CAT710WM C0231606 02/22/06 07:48:34 TBLAMUR            00001000
      * LRM008 - SSR 0037158 UBS CL 235 (WM) UPD CONTRA PARTICIPANT             
000001* PDX    - CAT710WM C0222541 08/23/05 20:34:47 TBLAMUR            00001000
      * DJ0004 - SSR 39848 BOOKING OF 866* OF ORIG VAL FOR RCL/FRV              
000001* PDX    - CAT710WM C0203711 03/29/05 16:17:21 TBLAMUR            00001000
      * LRM007 - SSR 0037159 UBS CL 235 (WM) WEALTH MNGT ACCOUNTS:              
      * ID BY PARM RUN = WM;  COPIED FROM CAT710.                               
000001* PDX    - CAT710   C0206964 06/07/04 13:33:54 TBLAMUR            00001000
      * LRM006 SSR 38232 FORCE S/D TO BE PLUS ONE IN Q STREAM.                  
000001* PDX    - CAT710   C0197067 10/20/03 08:26:17 TBLAMUR            00001000
000001* LRM005 - NSCC REGULATORY CHANGE, FUND RE-REG DATE FOR MFC               
000001* PDX    - CAT710   C0187502 03/10/03 09:41:12 TBLAMUR            00001000
      * LRM004 - RETURN CODE 12 WHEN LESS THAN 100 PROD INPUT DETAILS           
000001* PDX    - CAT710   C0177507 07/18/02 14:32:57 TBYOHON            00001000
000001* PDX    - CAT710   C0176464 06/13/02 15:39:04 TBLAMUR            00001000
000001* PDX    - CAT710   C0160782 07/24/01 15:27:03 TBLAMUR            00001000
000001* DJ0003 SSR# R        FUND-CUST-ACCT-RCV                         CAT710  
000001*                      OPT-DEC-FRAC-IND                           CAT710  
000001* PDX    - CAT710   C0155175 05/03/01 14:00:28 TBLAMUR            CAT710  
000001* PDX    - CAT710   C0156226 03/21/01 23:08:44 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0151178 12/18/00 08:40:21 TBDOJUN            CAT710  
000001* DJ0002 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE     CAT710  
000001* PDX    - CAT710   C0141412 08/28/00 10:14:35 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0127169 06/19/99 11:04:34 TBDOJUN            CAT710  
000001* DJ0001 - DOUBLE-CHECK OPTION SYMBOL RETURNED FROM MSD WITH NSCC CAT710  
000001* PDX    - CAT710   C0124431 05/14/99 12:10:18 TBTIKUO            CAT710  
000001* PDX    - CAT710   C0124189 04/12/99 11:15:18 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122870 03/17/99 22:33:08 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122736 03/11/99 15:09:10 TBDOJUN            CAT710  
000001* DJ     - RECOMPILED FOR EXPANDED RECMDIDX                       CAT710  
000001* PDX    - CAT710   C0122542 03/05/99 11:44:28 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122392 02/26/99 14:30:13 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122248 02/24/99 14:32:11 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122194 02/23/99 11:46:58 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0122069 02/21/99 15:18:33 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0121866 02/17/99 14:23:47 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0120784 01/27/99 12:41:15 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0120203 01/22/99 10:07:07 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0119526 12/23/98 08:16:30 TBLAMUR            CAT710  
000001* PDX    - CAT710   C0118401 12/10/98 14:11:51 TBDOJUN            CAT710  
000001* PDX    - CAT710   C0115343 11/13/98 13:48:24 TBDOJUN            CAT710  
      ***************************************************************** CAT710  
       IDENTIFICATION DIVISION.                                         CAT710  
      ***************************************************************** CAT710  
       PROGRAM-ID.  CAT710WM                                            CAT710  
       AUTHOR.      T. KUO.                                             CAT710  
       DATE-WRITTEN.  SEPT 1998.                                        CAT710  
      ***************************************************************** CAT710  
      *                                                                 CAT710  
      * ACATS - AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM              CAT710  
      *         EOD POSITION RECONCILIATION                             CAT710  
      *                                                                 CAT710  
      * --------------------------------------------------------------- CAT710  
      * 5/99  - MOVE NSCCP-VALUE-FREE-IND TO ASSET_AMT_STTS_CD (VASSET) CAT710  
      *                                                                 CAT710  
      ******************************************************************CAT710  
       ENVIRONMENT DIVISION.                                            CAT710  
       CONFIGURATION SECTION.                                           CAT710  
                                                                        CAT710  
       INPUT-OUTPUT SECTION.                                            CAT710  
       FILE-CONTROL.                                                    CAT710  
                                                                        CAT710  
           SELECT  NSCC-POSITION-FILE    ASSIGN  TO  ACATPOSN           CAT710  
                                         FILE STATUS IS ACATPOSN-STAT.  CAT710  
                                                                        CAT710  
           SELECT MSDINF           ASSIGN       TO MSDINF               CAT710  
                                   ACCESS          DYNAMIC              CAT710  
                                   ORGANIZATION    INDEXED              CAT710  
                                   RECORD KEY   IS MSDINF-FILE-KEY      CAT710  
                                   FILE STATUS  IS MSDINF-STAT.         CAT710  
                                                                        CAT710  
           SELECT MSDIDX           ASSIGN       TO MSDIDX               CAT710  
                                   ACCESS          DYNAMIC              CAT710  
                                   ORGANIZATION    INDEXED              CAT710  
                                   RECORD KEY   IS MSDIDX-FILE-KEY      CAT710  
                                   FILE STATUS  IS MSDIDX-STAT.         CAT710  
                                                                                
           SELECT PRNGFL            ASSIGN TO PRNGFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     PRNGKEY                                     
                  FILE STATUS IS    PRNGFL-STAT.                                
                                                                                
                                                                                
      /                                                                 CAT710  
       DATA DIVISION.                                                   CAT710  
       FILE SECTION.                                                    CAT710  
       FD  NSCC-POSITION-FILE                                           CAT710  
           RECORDING MODE IS V                                          CAT710  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT710  
              DEPENDING ON W-REC-LEN-IN                                 CAT710  
           BLOCK CONTAINS 0 RECORDS.                                    CAT710  
                                                                        CAT710  
       01  NSCCP-DUMMY-RECORD             PIC X(4000).                  CAT710  
                                                                        CAT710  
       01  NSCCP-RECORD.                                                CAT710  
           05  NSCCP-REC-TYPE             PIC X(01).                    CAT710  
               88  NSCCP-HEADER                     VALUE 'H'.          CAT710  
               88  NSCCP-POSITION-MRO               VALUE 'P'.          CAT710  
               88  NSCCP-SETTLMNT-MRO               VALUE 'S'.          CAT710  
               88  NSCCP-TRAILER                    VALUE 'T'.          CAT710  
           05  NSCCP-REC-SUBTYPE          PIC X(01).                    CAT710  
               88  NSCCP-XFER                       VALUE 'T'.          CAT710  
               88  NSCCP-ASSET                      VALUE 'A'.          CAT710  
               88  NSCCP-FND-RGS                    VALUE 'F'.          CAT710  
           05  FILLER                     PIC X(3266).                  CAT710  
      /                                                                 CAT710  
       FD  MSDINF.                                                      CAT710  
       01  MSDINF-FILE-RECORD.                                          CAT710  
           05  MSDINF-FILE-KEY              PIC X(4).                   CAT710  
           05  MSDINF-FILE-DATA             PIC X(156).                 CAT710  
      /                                                                 CAT710  
       FD  MSDIDX.                                                      CAT710  
       01  MSDIDX-FILE-RECORD.                                          CAT710  
           05  MSDIDX-FILE-KEY              PIC X(21).                  CAT710  
           05  MSDIDX-FILE-DATA             PIC X(79).                  CAT710  
      /                                                                 CAT710  
       FD  PRNGFL.                                                              
           COPY PRNGRECC.                                                       
                                                                                
      /                                                                 CAT710  
       WORKING-STORAGE SECTION.                                         CAT710  
           COPY PDXIDCOB.                                               CAT710  
                                                                        CAT710  
       01  W-ROUTINE                     PIC X(32) VALUE ' '.           CAT710  
       01  W-BRANCH-ACCT.                                               CAT710  
           05 W-BRANCH-CD    PIC XXX.                                   CAT710  
           05 W-ACCT-CD      PIC X(5).                                  CAT710  
                                                                        CAT710  
       01  CAT710-WORKING-AREA.                                         CAT710  
           05  W-REC-LEN-IN              PIC 9(005) VALUE 0.            CAT710  
           05  WS-REC-LEN                PIC 9(05)  VALUE 0.            CAT710  
           05  W-INFILE-CNT              PIC 9(07)  VALUE 0.            CAT710  
           05  FILLER                    PIC X(10)  VALUE 'VTRNFR CNT'. CAT710  
           05  VTRNFR-CNT.                                              CAT710  
               10  FILLER               PIC X(10)  VALUE 'VTRNFR FND'.  CAT710  
               10  VTRNFR-FND-CNT       PIC 9(07)  VALUE 0.             CAT710  
               10  FILLER               PIC X(12)  VALUE 'VTRNFR NOTFN'.CAT710  
               10  VTRNFR-NOTFND-CNT    PIC 9(07)  VALUE 0.             CAT710  
               10  FILLER               PIC X(11)  VALUE 'VTRNFR UPDT'. CAT710  
               10  VTRNFR-UPDT-CNT      PIC 9(07)  VALUE 0.             CAT710  
               10  FILLER               PIC X(12)  VALUE 'VTRNFR NOTUP'.CAT710  
               10  VTRNFR-NOTUPD-CNT    PIC 9(07)  VALUE 0.             CAT710  
               10  NSCC-TIF-CNT         PIC 9(07)  VALUE 0.             CAT710  
               10  NSCC-ASSET-CNT       PIC 9(07)  VALUE 0.             CAT710  
               10  NSCC-OPTION-CNT      PIC 9(07)  VALUE 0.             CAT710  
               10  NSCC-MF-CNT          PIC 9(07)  VALUE 0.             CAT710  
               10  NSCC-REG-ASSET-CNT   PIC 9(07)  VALUE 0.             CAT710  
               10  VASSET-FND-CNT       PIC 9(07)  VALUE 0.             CAT710  
               10  VASSET-UPDT-CNT      PIC 9(07)  VALUE 0.             CAT710  
               10  VASSET-NOTFND-CNT    PIC 9(07)  VALUE 0.             CAT710  
               10  VASSET-NOT-UPDATED-CNT PIC 9(07) VALUE 0.            CAT710  
               10  VOPTN-FND-CNT        PIC 9(07)  VALUE 0.             CAT710  
               10  VOPTN-NOTFND-CNT     PIC 9(07)  VALUE 0.             CAT710  
               10  VMF-FND-CNT          PIC 9(07)  VALUE 0.             CAT710  
               10  VMF-NOTFND-CNT       PIC 9(07)  VALUE 0.             CAT710  
           05  WS-SETTLED-CNT            PIC 9(07)  VALUE 0.            CAT710  
TCKNEW     05  WS-VALUE-FREE-CNT         PIC 9(07)  VALUE 0.            CAT710  
           05  WS-BROKER-NBR             PIC X(04)  VALUE SPACES.       CAT710  
           05  WS-ADP-CLIENT             PIC X(04)  VALUE SPACES.       CAT710  
           05  SV-CLIENT-NBR             PIC X(04).                     CAT710  
           05  SV-ACAT-CNTL-NBR          PIC X(14)  VALUE SPACES.       CAT710  
DJ0004     05  W-SAVE-CNTL-ASTD-NBR      PIC X(014) VALUE ' '.          CAT710  
           05  WS-CLNT-NO                PIC S9(3)  COMP-3 VALUE +0.    CAT710  
           05  WS-RECONCILED-TIF.                                       CAT710  
               10 WS-RECONCILED-TIF-CLT  PIC X(04).                     CAT710  
               10 WS-RECONCILED-TIF-ACAT PIC X(14).                     CAT710  
           05  ACATPOSN-STAT             PIC X(02).                     CAT710  
               88 ACATPOSN-OKAY          VALUE '00' THRU '09', '97'.    CAT710  
               88 ACATPOSN-EOF           VALUE '10'.                    CAT710  
               88 ACATPOSN-EMPTY         VALUE '35'.                    CAT710  
           05  END-OF-ACATPOSN-SW        PIC X(01) VALUE 'N'.           CAT710  
               88  END-OF-ACATPOSN       VALUE 'Y'.                     CAT710  
           05  FILLER         PIC X(14)  VALUE 'VTRNFR RETURN:'.        CAT710  
           05  VTRNFR-SW                 PIC X(01)  VALUE ' '.          CAT710  
               88  VTRNFR-UPDT           VALUE 'U'.                     CAT710  
               88  VTRNFR-NOT-UPDT       VALUE 'X'.                     CAT710  
           05  VTRNFR-FOUND-SW           PIC X(01)  VALUE ' '.          CAT710  
               88  VTRNFR-FOUND          VALUE 'Y'.                     CAT710  
               88  VTRNFR-NOT-FOUND      VALUE 'N'.                     CAT710  
           05  ASSET-FOUND-SW            PIC X(01)  VALUE ' '.          CAT710  
               88  ASSET-FOUND           VALUE 'F'.                     CAT710  
           05  OPTION-FOUND-SW           PIC X(01)  VALUE ' '.          CAT710  
               88  OPTION-FOUND          VALUE 'F'.                     CAT710  
           05  MUTUAL-FUND-FOUND-SW      PIC X(01)  VALUE ' '.          CAT710  
               88  MUTUAL-FUND-FOUND     VALUE 'F'.                     CAT710  
DJ0004     05  W-VASTHSTY-FND-SW         PIC  X(001) VALUE ' '.         CAT710  
DJ0004         88 W-VASTHSTY-FOUND                   VALUE 'Y'.         CAT710  
           05  DIFFERENCE-FOUND-SW       PIC X(01)  VALUE ' '.          CAT710  
               88  DIFFERENCE-FOUND      VALUE 'F'.                     CAT710  
           05  WS-STRIKE-PRICE-INT       PIC X(05).                     CAT710  
           05  WS-STRIKE-PRICE-INT-N REDEFINES WS-STRIKE-PRICE-INT      CAT710  
                                         PIC 9(05).                     CAT710  
           05  WS-STRIKE-PRICE-FRC       PIC X(02).                     CAT710  
           05  WS-STRIKE-PRICE-FRC-N REDEFINES WS-STRIKE-PRICE-FRC      CAT710  
                                         PIC 9(02).                     CAT710  
           05  WS-ASSET-QTY              USAGE COMP-2.                  CAT710  
           05  WS-ASSET-PCT              USAGE COMP-2.                  CAT710  
           05  WS-ASSET-AMT              USAGE COMP-2.                  CAT710  
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           CAT710  
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           CAT710  
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           CAT710  
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           CAT710  
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         CAT710  
                                                                        CAT710  
           05  W-QTY-X.                                                 CAT710  
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         CAT710  
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     CAT710  
                                                                        CAT710  
           05  W-QTY-N                   PIC 9(13)V9(4).                CAT710  
           05  FILLER REDEFINES W-QTY-N.                                CAT710  
               07  W-QTY-INT             PIC 9(13).                     CAT710  
               07  W-QTY-DEC             PIC 9(04).                     CAT710  
                                                                        CAT710  
           05  W-INT                     PIC 9(17).                     CAT710  
           05  W-INT-X REDEFINES W-INT.                                 CAT710  
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         CAT710  
                                                                        CAT710  
           05  W-DEC                     PIC 9(04).                     CAT710  
           05  W-DEC-X REDEFINES W-DEC.                                 CAT710  
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         CAT710  
      *                                                                 CAT710  
           05  WK-DATE.                                                 CAT710  
               10  WK-DT-YYYY            PIC X(04).                     CAT710  
               10  WK-DT-MM              PIC X(02).                     CAT710  
               10  WK-DT-DD              PIC X(02).                     CAT710  
           05  WK-FMT-DATE.                                             CAT710  
               10  WK-DT-1               PIC X(04).                     CAT710  
               10  FILLER                PIC X  VALUE '-'.              CAT710  
               10  WK-DT-2               PIC X(02).                     CAT710  
               10  FILLER                PIC X  VALUE '-'.              CAT710  
               10  WK-DT-3               PIC X(02).                     CAT710  
      *                                                                 CAT710  
           05  WS-QTY-9                  PIC 9(03)  VALUE 0.            CAT710  
           05  WS-QTY-9-PACK             PIC S9(03) COMP-3 VALUE +0.    CAT710  
      *                                                                 CAT710  
           05  W-NO-CLT-CNT              PIC  9(007) VALUE 0.           CAT710  
           05  W-MSD-FND-CNT             PIC  9(007) VALUE 0.           CAT710  
           05  W-MSD-NOTFND-CNT          PIC  9(007) VALUE 0.           CAT710  
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.         CAT710  
               88 W-MSD-NOTFND                       VALUE 'Y'.         CAT710  
           05  W-XRF-FND-CNT             PIC  9(007) VALUE 0.           CAT710  
           05  W-XRF-NOTFND-CNT          PIC  9(007) VALUE 0.           CAT710  
           05  W-BOND-FND-CNT            PIC  9(007) VALUE 0.           CAT710  
           05  W-BOND-NOTFND-CNT         PIC  9(007) VALUE 0.           CAT710  
           05  W-BLANK-SEC-CNT           PIC  9(007) VALUE 0.           CAT710  
           05  W-NSET-CNT                PIC  9(007) VALUE 0.           CAT710  
           05  W-VTRNFR-INSERTED-CNT     PIC  9(007) VALUE 0.           CAT710  
           05  W-VTRNFR-NOT-INSERTED-CNT PIC  9(007) VALUE 0.           CAT710  
           05  W-VASSET-INSERTED-CNT     PIC  9(007) VALUE 0.           CAT710  
           05  W-VASSET-NOT-INSERTED-CNT PIC  9(007) VALUE 0.           CAT710  
           05  W-VOPTN-INSERTED-CNT      PIC  9(007) VALUE 0.           CAT710  
           05  W-VOPTN-NOT-INSERTED-CNT  PIC  9(007) VALUE 0.           CAT710  
           05  W-VMF-INSERTED-CNT        PIC  9(007) VALUE 0.           CAT710  
           05  W-VMF-NOT-INSERTED-CNT    PIC  9(007) VALUE 0.           CAT710  
           05  W-DESC                    PIC  X(030) VALUE ' '.         CAT710  
           05  WK-POS-DESC5.                                            CAT710  
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.      CAT710  
               10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.             CAT710  
               10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.             CAT710  
           05  W-STPRC-INTEGER-AMT       PIC 9(05).                     CAT710  
           05  W-STPRC-FRCTN.                                           CAT710  
               07  W-STPRC-FRCTN-AMT     PIC 9(02).                     CAT710  
           05  W-OPT-DESC.                                              CAT710  
               07  W-OPT-BUY-SELL        PIC X(04) VALUE ' '.           CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-CALL-PUT        PIC X(04) VALUE ' '.           CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-OPEN-CLOSE      PIC X(04) VALUE ' '.           CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-SYMBOL          PIC X(06) VALUE ' '.           CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-MS-SYMBOL       PIC X(08) VALUE ' '.           CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-EXPTN-MM        PIC X(02) VALUE ' '.           CAT710  
               07  W-OPT-EXPTN-S1        PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-EXPTN-CC        PIC X(02) VALUE ' '.           CAT710  
               07  W-OPT-EXPTN-YY        PIC X(02) VALUE ' '.           CAT710  
               07  FILLER                PIC X(02) VALUE ' '.           CAT710  
               07  W-OPT-STRIKE-PRIC     PIC ZZZZ9.                     CAT710  
               07  FILLER                PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-STRIKE-FRAC     PIC X(01) VALUE ' '.           CAT710  
               07  W-OPT-SLASH-8         PIC X(02) VALUE ' '.           CAT710  
               07  FILLER                PIC X(11) VALUE ' '.           CAT710  
      *                                                                 CAT710  
           05  W-DATE.                                                  CAT710  
               07  W-DATE-YEAR.                                         CAT710  
                   09  W-DATE-CC         PIC X(2) VALUE ' '.            CAT710  
                   09  W-DATE-YY         PIC X(2) VALUE ' '.            CAT710  
               07  FILLER                PIC X(1) VALUE '-'.            CAT710  
               07  W-DATE-MM             PIC X(2) VALUE ' '.            CAT710  
               07  FILLER                PIC X(1) VALUE '-'.            CAT710  
               07  W-DATE-DD             PIC X(2) VALUE ' '.            CAT710  
           05  WS-DATE-CCYYMMDD          PIC X(08).                     CAT710  
           05  FILLER REDEFINES WS-DATE-CCYYMMDD.                       CAT710  
               07  WS-DATE-CC            PIC X(2).                      CAT710  
               07  WS-DATE-YY            PIC X(2).                      CAT710  
               07  WS-DATE-MM            PIC X(2).                      CAT710  
               07  WS-DATE-DD            PIC X(2).                      CAT710  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT710  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT710  
           05  PRNGFL-STAT               PIC X(002).                            
               88 VALID-PRNGFL-STAT      VALUE '00' '04' '10' '23'.             
               88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.            
               88 PRNGFL-END-OF-FILE     VALUE '10'.                            
               88 PRNGFL-NOT-FOUND       VALUE '23'.                            
               88 PRNGFL-EMPTY-MISSING   VALUE '35'.                            
           05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
               88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
                                                                                
      /                                                                 CAT710  
      ******************************************************************CAT710  
      * OPTION SYMBOL LOOK UP                                          *CAT710  
      ******************************************************************CAT710  
       01  MSD-OPT-AREA.                                                CAT710  
           05  MSDINF-STAT               PIC X(002).                    CAT710  
               88 VALID-MSDINF-STAT      VALUE '00' '04' '10' '23'.     CAT710  
               88 MSDINF-OKAY            VALUE '00' THRU '09', '97'.    CAT710  
               88 MSDINF-END-OF-FILE     VALUE '10'.                    CAT710  
               88 MSDINF-NOT-FOUND       VALUE '23'.                    CAT710  
               88 MSDINF-EMPTY-MISSING   VALUE '35'.                    CAT710  
           05  MSDIDX-STAT               PIC X(002).                    CAT710  
               88 VALID-MSDIDX-STAT      VALUE '00' '04' '10' '23'.     CAT710  
               88 MSDIDX-OKAY            VALUE '00' THRU '09', '97'.    CAT710  
               88 MSDIDX-END-OF-FILE     VALUE '10'.                    CAT710  
               88 MSDIDX-NOT-FOUND       VALUE '23'.                    CAT710  
               88 MSDIDX-EMPTY-MISSING   VALUE '35'.                    CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      * OPTION SYMBOL LOOK UP                                          *CAT710  
      ******************************************************************CAT710  
       01  FMT-OPT-AREA.                                                CAT710  
           03  FMT-OPT-AREA.                                            CAT710  
               05  FMT-OPT-SYMBOL         PIC X(6).                     CAT710  
               05  FMT-OPT-ACT-TYPE       PIC X.                        CAT710  
               05  FMT-OPT-PUT-CALL       PIC X.                        CAT710  
                   88  FMT-PUT            VALUE 'P'.                    CAT710  
                   88  FMT-CALL           VALUE 'C'.                    CAT710  
               05  FMT-BUY-SELL-IND       PIC X.                        CAT710  
                   88  FMT-BUY            VALUE 'B'.                    CAT710  
                   88  FMT-SELL           VALUE 'S'.                    CAT710  
               05  FMT-OPEN-CLOSE         PIC X.                        CAT710  
                   88  FMT-OPEN           VALUE 'O'.                    CAT710  
                   88  FMT-CLOSE          VALUE 'C'.                    CAT710  
               05  FMT-OPT-EXP-DATE.                                    CAT710  
                   10 FMT-OPT-EXP-CC      PIC X(2).                     CAT710  
                   10 FMT-OPT-EXP-YY      PIC X(2).                     CAT710  
                   10 FMT-OPT-EXP-MM      PIC X(2).                     CAT710  
                   10 FMT-OPT-EXP-DD      PIC X(2).                     CAT710  
               05  FMT-OPT-PRICE.                                       CAT710  
                   10 FMT-OPT-PRICE-POS1  PIC X(1).                     CAT710  
                   10 FMT-OPT-PRICE-POS2-3.                             CAT710  
                      15 FMT-OPT-PRICE-POS2 PIC X(1).                   CAT710  
                      15 FMT-OPT-PRICE-POS3 PIC X(1).                   CAT710  
               05  FMT-OPT-1-8TH-PRCE     PIC X.                        CAT710  
               05  FMT-ADP-SEC-NO         PIC X(7).                     CAT710  
               05  FMT-CUSIP-NO           PIC X(9).                     CAT710  
               05  FMT-SEC-SYMBOL         PIC X(8).                     CAT710  
               05  FMT-DESC1              PIC X(30).                    CAT710  
               05  FMT-DESC2              PIC X(30).                    CAT710  
               05  FMT-DESC3              PIC X(30).                    CAT710  
                                                                        CAT710  
       01  SEARCH-SYMBOL-FLAG               PIC X(01).                  CAT710  
           88  ENTER-SYMBOL-SEARCH          VALUE 'E'.                  CAT710  
           88  EXIT-SYMBOL-SEARCH           VALUE 'X'.                  CAT710  
                                                                        CAT710  
       01  SYMBOL-SW                        PIC X.                      CAT710  
           88  SYMBOL-IS-FOUND              VALUE 'Y'.                  CAT710  
           88  SYMBOL-NOT-FOUND             VALUE 'N'.                  CAT710  
                                                                        CAT710  
       01  WS-ADP-SYMBOL.                                               CAT710  
           05 WS-ADP-SYMBOL-CHAR OCCURS 13 TIMES PIC X.                 CAT710  
                                                                        CAT710  
       01  WS-FMT-SYMBOL.                                               CAT710  
           05 WS-FMT-SYMBOL-CHAR OCCURS 6 TIMES PIC X.                  CAT710  
                                                                        CAT710  
       01  SUBS.                                                        CAT710  
           05  ADP-SYMBOL-SUB               PIC S9(4) COMP SYNC.        CAT710  
           05  FMT-SYMBOL-SUB               PIC S9(4) COMP SYNC.        CAT710  
                                                                        CAT710  
       01  EXP-MONTH-TABLE.                                             CAT710  
           05  FILLER                       PIC X(4) VALUE '01AM'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '02BN'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '03CO'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '04DP'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '05EQ'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '06FR'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '07GS'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '08HT'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '09IU'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '10JV'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '11KW'.      CAT710  
           05  FILLER                       PIC X(4) VALUE '12LX'.      CAT710  
                                                                        CAT710  
       01  FILLER REDEFINES EXP-MONTH-TABLE.                            CAT710  
           05  EXP-MONTH-ENTRY OCCURS 12 TIMES                          CAT710  
                               ASCENDING KEY IS EXP-MONTH               CAT710  
                               INDEXED BY EXP-MONTH-IND.                CAT710  
               10  EXP-MONTH                PIC X(2).                   CAT710  
               10  EXP-MONTH-CALL           PIC X(1).                   CAT710  
               10  EXP-MONTH-PUT            PIC X(1).                   CAT710  
                                                                        CAT710  
       01  STR-PRICE-TABLE.                                             CAT710  
           05  FILLER                       PIC X(3) VALUE 'T00'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'A05'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'U07'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'B10'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'V12'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'C15'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'W17'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'D20'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'X22'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'E25'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'F30'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'G35'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'H40'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'I45'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'J50'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'K55'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'L60'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'M65'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'N70'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'O75'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'P80'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'Q85'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'R90'.       CAT710  
           05  FILLER                       PIC X(3) VALUE 'S95'.       CAT710  
                                                                        CAT710  
       01  FILLER REDEFINES STR-PRICE-TABLE.                            CAT710  
           05  STR-PRICE-ENTRY OCCURS 24 TIMES                          CAT710  
                               ASCENDING KEY IS STR-PRICE               CAT710  
                               INDEXED BY STR-PRICE-IND.                CAT710  
               10  STR-PRICE-A              PIC X(1).                   CAT710  
               10  STR-PRICE                PIC X(2).                   CAT710  
                                                                        CAT710  
       01  W-OPTION-LOOKUP-FIELDS.                                      CAT710  
           05  W-MSDINF-FND-CNT          PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDINF-NOTFND-CNT       PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDINF-MONTH-CNT        PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDINF-SYMBOL-CNT       PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDINF-EXP-DATE-UNPACK  PIC  9(09).                    CAT710  
           05  FILLER REDEFINES                                         CAT710  
               W-MSDINF-EXP-DATE-UNPACK.                                CAT710  
               10 FILLER                 PIC  X(01).                    CAT710  
               10 W-MSDINF-EXP-CCYYMM    PIC  X(06).                    CAT710  
               10 W-MSDINF-EXP-DD        PIC  X(02).                    CAT710  
           05  W-MSDIDX-LEN              PIC  9(005) VALUE 0.           CAT710  
           05  W-MSDIDX-FND-CNT          PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDIDX-NOTFND-CNT       PIC  9(009) VALUE 0.           CAT710  
           05  W-MSDINF-SYMBOL-SW        PIC  X(001) VALUE ' '.         CAT710  
               88 W-MSDINF-SYMBOL-FOUND              VALUE 'Y'.         CAT710  
           05  W-MSDINF-MONTH-SW         PIC  X(001) VALUE ' '.         CAT710  
               88 W-MSDINF-MONTH-FOUND               VALUE 'Y'.         CAT710  
           05  W-MSDINF-SEC-NUM          PIC  X(007) VALUE ' '.         CAT710  
           05  W-MSDINF-MONTH-CODE       PIC  X(001) VALUE ' '.         CAT710  
           05  W-MSDINF-EXP-DATE         PIC  9(008) VALUE 0.           CAT710  
           05  W-MSDIDX-FND-SW           PIC  X(001) VALUE ' '.         CAT710  
               88 W-MSDIDX-FOUND                     VALUE 'Y'.         CAT710  
           05  WS-MSDIDX-KEY-AREA.                                      CAT710  
               10 WS-MSDIDX-KEY-1        PIC S9(9) COMP-3.              CAT710  
               10 WS-MSDIDX-KEY-2 REDEFINES WS-MSDIDX-KEY-1.            CAT710  
                  15 WS-MSDIDX-KEY-3     PIC X(4).                      CAT710  
                  15 FILLER              PIC X.                         CAT710  
           05  WS-MSDIDX-KEY-AREA-2.                                    CAT710  
                  15 WS-MSDIDX-KEY-4     PIC S9(8) COMP.                CAT710  
                  15 WS-MSDIDX-KEY-5 REDEFINES WS-MSDIDX-KEY-4 PIC X(4).CAT710  
           05  WS-SAVE-MSDIDX-KEY.                                      CAT710  
             07  WS-COMP-MSDIDX-KEY.                                    CAT710  
               10  WS-SAVE-MSDIDX-TYPE        PIC  X(01).               CAT710  
               10  WS-SAVE-MSDIDX-OPT-XREF    PIC  9(07)      COMP-3.   CAT710  
               10  WS-SAVE-MSDIDX-OPT-EXP     PIC  X(04).               CAT710  
               10  WS-SAVE-MSDIDX-OPT-STRK-PR PIC S9(03)V9(4) COMP-3.   CAT710  
               10  WS-SAVE-MSDIDX-OPT-TYPE    PIC  X.                   CAT710  
             07  WS-SAVE-MSDIDX-SEC           PIC  X(07).               CAT710  
           05  WS-MSDIDX-EXP-DATE        PIC S9(9).                     CAT710  
           05  ED-OPT-PRC-OUT            PIC 9(4)V9(7).                 CAT710  
           05  FILLER REDEFINES ED-OPT-PRC-OUT.                         CAT710  
               10  ED-OPT-PRC-WHOLE      PIC 9(4).                      CAT710  
               10  ED-OPT-PRC-FRAC       PIC V9(7).                     CAT710  
           05  WS-STRIKE-PRICE11         PIC 9(4)V9(7).                 CAT710  
           05  WS-STRIKE-PRICE12 REDEFINES WS-STRIKE-PRICE11.           CAT710  
               10  FILLER                PIC X(1).                      CAT710  
               10  WS-STRIKE-PRC10       PIC 9(3)V9(7).                 CAT710  
           05  WS-STR-PRC REDEFINES WS-STRIKE-PRICE12.                  CAT710  
               10  WS-STR-DOL123         PIC 9(3).                      CAT710  
               10  WS-STR-DOL4           PIC 9(1).                      CAT710  
               10  WS-STR-CENT           PIC 9(7).                      CAT710  
           05  WS-STR-PRC7               PIC 9(3)V9(4).                 CAT710  
                                                                        CAT710  
DJ0001 01  OPT-WORK-AREA.                                               CAT710  
DJ0001     05  SUB2               PIC 9(02).                            CAT710  
DJ0001     05  SUB3               PIC 9(02).                            CAT710  
DJ0001     05  OPT-SYMBOL         PIC X(03).                            CAT710  
DJ0001     05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                     CAT710  
DJ0001                            PIC X(01) OCCURS 3 TIMES.             CAT710  
DJ0001     05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.             CAT710  
DJ0001     05  OPT-WORK1          PIC X(12).                            CAT710  
DJ0001     05  OPT-WORK2   REDEFINES  OPT-WORK1.                        CAT710  
DJ0001       10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.            CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'RECMDINF'.    CAT710  
           COPY RECMDINF.                                               CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'RECMDIDX'.    CAT710  
           COPY RECMDIDX.                                               CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'GETXRFC '.    CAT710  
           COPY GETXRFC.                                                CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      * GETMSD COMMAREA                                                *CAT710  
      ******************************************************************CAT710  
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    CAT710  
           COPY GETMSDCE.                                               CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
       01  FILLER                        PIC X(16) VALUE 'WS-VTRNFR=='. CAT710  
       01  DB2-IO-AREA.                                                 CAT710  
           05  WS-VTRNFR.                                               CAT710  
               10 WS-CLIENT-NBR          PIC X(4).                      CAT710  
               10 WS-ACAT-CNTL-NBR       PIC X(14).                     CAT710  
               10 WS-SBMTG-PRTCP-NBR     PIC X(4).                      CAT710  
               10 WS-DLVR-NBR            PIC X(4).                      CAT710  
               10 WS-ACCT-DLVR-NBR       PIC X(20).                     CAT710  
               10 WS-RCV-NBR             PIC X(4).                      CAT710  
               10 WS-ACCT-RCV-NBR        PIC X(20).                     CAT710  
               10 WS-TRNFR-TYPE-CD       PIC X(3).                      CAT710  
               10 WS-TRANS-TYPE-CD       PIC X(1).                      CAT710  
               10 WS-RCV-CUST-NM         PIC X(60).                     CAT710  
               10 WS-RCV-SS-PRIM-NBR     PIC X(9).                      CAT710  
               10 WS-RCV-SS-SCNDY-NBR    PIC X(9).                      CAT710  
               10 WS-RCV-ACCT-TYPE-CD    PIC X(2).                      CAT710  
               10 WS-RCV-OCC-BRKR-NBR    PIC X(5).                      CAT710  
               10 WS-RCV-CRSPN-NBR       PIC X(4).                      CAT710  
               10 WS-ACAT-CNTL-ASTD-NBR  PIC X(14).                     CAT710  
               10 WS-CMNT-TXT            PIC X(120).                    CAT710  
               10 WS-PRCS-DT             PIC X(10).                     CAT710  
               10 WS-STTS-CD             PIC X(3).                      CAT710  
               10 WS-STTLM-TM-CD         PIC X(1).                      CAT710  
               10 WS-VAL-FREE-CD         PIC X(1).                      CAT710  
               10 WS-TRANS-RFRN-ID-CD    PIC X(20).                     CAT710  
               10 WS-DB-CR-CD            PIC X(1).                      CAT710  
               10 WS-DSTBN-SIDE-CD       PIC X(1).                      CAT710  
               10 WS-SYS-RJCT-RSN-CD     PIC X(2).                      CAT710  
               10 WS-TRNFR-TYPE-RJCT-CD  PIC X(2).                      CAT710  
               10 WS-PHSCL-SEQ-NBR       PIC S9(4) USAGE COMP.          CAT710  
               10 WS-LGCL-SEQ-NBR        PIC S9(4) USAGE COMP.          CAT710  
               10 WS-RR-CD               PIC X(3).                      CAT710  
               10 WS-BRANCH-CD           PIC X(3).                      CAT710  
               10 WS-DAYS-STTS-QTY       PIC S9(4) USAGE COMP.          CAT710  
               10 WS-STTLM-DT            PIC X(10).                     CAT710  
               10 WS-ACCT-CD             PIC X(5).                      CAT710  
               10 WS-STTLM-ASCTD-DT      PIC X(10).                     CAT710  
      *        10 WS-PRGM-NM             PIC X(8).                      CAT710  
      *        10 WS-CRT-TMSTP           PIC X(26).                     CAT710  
      *        10 WS-UPDT-TMSTP          PIC X(26).                     CAT710  
      ******************************************************************CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'HDR-REC='.    CAT710  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:==  BY ==WS-HDR==.       CAT710  
      *----------------------------------------------------------------*CAT710  
       01  FILLER                        PIC X(08) VALUE 'POS-REC='.    CAT710  
       01  WS-POS-REC                    PIC X(475).                    CAT710  
       01  FILLER                        PIC X(08) VALUE 'TI-REC '.     CAT710  
           COPY NSCCP    REPLACING ==:NSCCP:==     BY ==W-NSCC==.       CAT710  
      *----------------------------------------------------------------*CAT710  
       01  FILLER                        PIC X(08) VALUE 'TRL-REC='.    CAT710  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:==  BY ==WS-TRL==.       CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'BHINFO=='.    CAT710  
           COPY BHINFO.                                                 CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'BHACAT=='.    CAT710  
           COPY BHACAT.                                                 CAT710  
                                                                                
LRM007     COPY BHREQ.                                                  CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'B1-AREA='.    CAT710  
       01  WS-B1-TABLE-AREA.                                            CAT710  
           05  WS-CLIENT-TABLE-ENTRY  OCCURS 500 TIMES                  CAT710  
               INDEXED BY SUB.                                          CAT710  
               07  WS-TBL-ADP-CLIENT-NBR     PIC 9(04).                 CAT710  
               07  WS-TBL-BROKER-NBR         PIC X(04).                 CAT710  
               07  WS-TBL-BROKER-NAME        PIC X(30).                 CAT710  
               07  WS-TBL-STREAM             PIC X(01).                 CAT710  
               07  WS-TBL-BROKER-STATUS      PIC X(01).                 CAT710  
               07  WS-TBL-ACAT-STATUS        PIC X(01).                 CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'SQLCA   '.    CAT710  
           EXEC SQL                                                     CAT710  
               INCLUDE SQLCA                                            CAT710  
           END-EXEC.                                                    CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'VTRNFR  '.    CAT710  
           EXEC SQL                                                     CAT710  
               INCLUDE VTRNFR                                           CAT710  
           END-EXEC.                                                    CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'VASSET  '.    CAT710  
           EXEC SQL                                                     CAT710  
               INCLUDE VASSET                                           CAT710  
           END-EXEC.                                                    CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'VOPTN   '.    CAT710  
           EXEC SQL                                                     CAT710  
               INCLUDE VOPTN                                            CAT710  
           END-EXEC.                                                    CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'VMF     '.    CAT710  
           EXEC SQL                                                     CAT710  
               INCLUDE VMF                                              CAT710  
           END-EXEC.                                                    CAT710  
      /                                                                 CAT710  
DJ0004 01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.   CAT710  
DJ0004     EXEC SQL INCLUDE VASTHSTY     END-EXEC.                      CAT710  
      /                                                                 CAT710  
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    CAT710  
       01  DB2-ABEND-WORK-AREA.                                         CAT710  
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           CAT710  
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   CAT710  
           03  WS-DB2-MESSAGE-AREA.                                     CAT710  
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.CAT710  
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES CAT710  
                   INDEXED BY WS-ERROR-INDEX.                           CAT710  
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. CAT710  
           03  W-DB2-TABLE-NAME          PIC  X(008).                   CAT710  
           03  W-DB2-ACTION              PIC  X(008).                   CAT710  
           03  W-DB2-SQLCODE             PIC  -999.                     CAT710  
                                                                        CAT710  
       01  W-DB2-WORKAREA.                                              CAT710  
           05  ROLLBACK-SQLCA            PIC  X(122).                   CAT710  
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              CAT710  
               88  ROLLBACK-OK                VALUE +0.                 CAT710  
               88  ROLLBACK-AB                VALUE -999 THRU -1        CAT710  
                                                    +1   THRU +999.     CAT710  
           05  COMMIT-SQLCA              PIC  X(122).                   CAT710  
           05  COMMIT-RETURN             PIC S9(009) COMP.              CAT710  
               88  COMMIT-OK                  VALUE +0.                 CAT710  
               88  COMMIT-AB                  VALUE -999 THRU -1        CAT710  
                                                    +1   THRU +999.     CAT710  
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             CAT710  
                                              VALUE 0.                  CAT710  
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           CAT710  
                                                                        CAT710  
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  CAT710  
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   CAT710  
LRM006 01  DAY-SUB                       PIC  S9(04) COMP.                      
LRM006     COPY BPDATESC.                                                       
      /                                                                 CAT710  
DJ0002***===> COBOL LE                                                  CAT710  
DJ0002 01  W-ABEND-AREA.                                                CAT710  
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT710  
DJ0002 01  CALL-MODULES.                                                CAT710  
DJ0002     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT710  
DJ0002     05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.   CAT710  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT710  
DJ0002     COPY STUBCPY.                                                CAT710  
DJ0002***<=== COBOL LE                                                  CAT710  
                                                                        CAT710  
       01  FILLER                        PIC X(08) VALUE 'END-O-WS'.    CAT710  
      /                                                                 CAT710  
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH              PIC  S9(4) COMP.                        
           05  PARM-STREAM-IND          PIC  X(01).                             
LRM007     05  PARM-SPECIAL-RUN         PIC  X(02).                             
LRM007         88  PARM-WM-RUN                      VALUE 'WM'.                 
      /                                                                 CAT710  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT710  
       0000-MAIN-ROUTINE.                                               CAT710  
           DISPLAY 'CAT710WM - ACATS EOD POSITION RECONCILIATION'       CAT710  
           DISPLAY '         INPUT = BZZZ.SIAC0718.ACAT.POSN'           CAT710  
           DISPLAY '         UPDATE ACTIVE TIF AND ASSET TABLES'        CAT710  
           DISPLAY ' '.                                                 CAT710  
           COPY MSGCOBO.                                                CAT710  
           DISPLAY ' '.                                                 CAT710  
           INITIALIZE WS-REC-LEN,                                       CAT710  
                      W-INFILE-CNT,                                     CAT710  
                      VTRNFR-CNT,                                       CAT710  
                      WS-BROKER-NBR,                                    CAT710  
                      WS-ADP-CLIENT,                                    CAT710  
                      SV-CLIENT-NBR,                                    CAT710  
                      WS-CLNT-NO,                                       CAT710  
                      SV-ACAT-CNTL-NBR,                                 CAT710  
                      ACATPOSN-STAT,                                    CAT710  
                      END-OF-ACATPOSN-SW,                               CAT710  
                      VTRNFR-SW,                                        CAT710  
                      WS-QTY-9,                                         CAT710  
                      WS-QTY-9-PACK.                                    CAT710  
                                                                        CAT710  
           PERFORM 1000-OPEN-ACATPOSN THRU 1000-EXIT.                   CAT710  
           DISPLAY ' '                                                  CAT710  
           PERFORM 1500-LOAD-B1-RTN.                                    CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY                                                      CAT710  
           '**** CAT710WM --- BEGIN TO READ POSITION FILE *****'.       CAT710  
           PERFORM 2000-PROCESS-ACATPOSN THRU 2000-EXIT                 CAT710  
              UNTIL END-OF-ACATPOSN.                                    CAT710  
           PERFORM 9000-CLOSE-ACATPOSN THRU 9000-EXIT.                  CAT710  
LRM004     IF PARM-LENGTH > ZERO                                                
LRM004     AND PARM-STREAM-IND = 'Z'                                            
LRM004     AND W-INFILE-CNT LESS 100                                    CAT710  
LRM004        MOVE 12 TO RETURN-CODE                                            
LRM004        DISPLAY 'CAT710WM - CHECK INPUT FILE ACATPOSN '                   
LRM004        DISPLAY 'CALL NSCC AND VERIFY INPUT RECORD COUNT'                 
LRM004        DISPLAY 'SIAC 0718 FILE HAD LOW RECORD COUNT = '                  
LRM004                      W-INFILE-CNT                                CAT710  
LRM004        DISPLAY 'RETURN-CODE SET TO STOP PROCESSING'                      
LRM004     END-IF.                                                              
           GOBACK.                                                      CAT710  
                                                                        CAT710  
       1000-OPEN-ACATPOSN.                                              CAT710  
                                                                        CAT710  
           DISPLAY ' '.                                                 CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             CAT710  
           END-EXEC                                                     CAT710  
                                                                        CAT710  
           IF  SQLCODE = +0                                             CAT710  
               DISPLAY ' '                                              CAT710  
               DISPLAY 'CAT710WM: W-CURRENT-TIMESTAMP = '               CAT710  
                                                    W-CURRENT-TIMESTAMP CAT710  
               DISPLAY ' '                                              CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'CAT710WM: W-CURRENT-TIMESTAMP NOT SET'          CAT710  
               PERFORM 8500-SQL-ERROR-ROUTINE                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           OPEN INPUT NSCC-POSITION-FILE.                               CAT710  
           DISPLAY 'CAT710WM: ACATPOSN OPENED FOR INPUT.  STATUS = '    CAT710  
                                                 ACATPOSN-STAT          CAT710  
                                                                        CAT710  
           IF ACATPOSN-OKAY                                             CAT710  
                CONTINUE                                                CAT710  
           ELSE                                                         CAT710  
                DISPLAY 'CAT710WM: ERROR OPENING ACATPOSN'              CAT710  
                DISPLAY 'CAT710WM: OPEN STATUS = ' ACATPOSN-STAT        CAT710  
                        '.  INPUT RECORD COUNT  = ' W-INFILE-CNT        CAT710  
                DISPLAY 'CAT710WM: U3001 - ABENDING ON BAD OPEN STATUS' CAT710  
                MOVE +3001    TO ABEND-CODE                             CAT710  
                CALL ABEND USING ABEND-CODE.                            CAT710  
                                                                        CAT710  
           OPEN INPUT MSDINF.                                           CAT710  
           DISPLAY 'CAT710WM: MSDINF   OPENED FOR INPUT.  STATUS = '    CAT710  
                                              MSDINF-STAT               CAT710  
                                                                        CAT710  
           IF  MSDINF-OKAY                                              CAT710  
               CONTINUE                                                 CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'CAT710WM: ERROR OPENING MSDINF'                 CAT710  
               DISPLAY 'CAT710WM: OPEN STATUS = ' MSDINF-STAT           CAT710  
               DISPLAY 'CAT710WM: U3001 - ABENDING ON BAD FILE STATUS'  CAT710  
               MOVE +3002    TO ABEND-CODE                              CAT710  
               CALL ABEND USING ABEND-CODE                              CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           OPEN INPUT MSDIDX.                                           CAT710  
           DISPLAY 'CAT710WM: MSDIDX   OPENED FOR INPUT.  STATUS = '    CAT710  
                                              MSDIDX-STAT               CAT710  
                                                                        CAT710  
           IF  MSDIDX-OKAY                                              CAT710  
               CONTINUE                                                 CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'CAT710WM: ERROR OPENING MSDIDX'                 CAT710  
               DISPLAY 'CAT710WM: OPEN STATUS = ' MSDIDX-STAT           CAT710  
               DISPLAY 'CAT710WM: U3001 - ABENDING ON BAD FILE STATUS'  CAT710  
               MOVE +3003    TO ABEND-CODE                              CAT710  
               CALL ABEND USING ABEND-CODE                              CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           OPEN INPUT PRNGFL.                                                   
           DISPLAY 'CAT710WM: PRNGFL   OPENED FOR INPUT.  STATUS = '            
                                              PRNGFL-STAT                       
                                                                                
           IF  PRNGFL-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT710WM: ERROR OPENING PRNGFL'                         
               DISPLAY 'CAT710WM: OPEN STATUS = ' PRNGFL-STAT                   
               DISPLAY 'CAT710WM: U3004 - ABENDING ON BAD FILE STATUS'          
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
           MOVE 'D'              TO GETMSD-DEVICE-IND                   CAT710  
           MOVE 'R'              TO GETMSD-ACCESS-IND                   CAT710  
           MOVE 'E'              TO GETMSD-FORMAT-IND                   CAT710  
           DISPLAY ' '.                                                 CAT710  
                                                                        CAT710  
       1000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       1500-LOAD-B1-RTN.                                                CAT710  
           PERFORM VARYING WS-CLNT-NO FROM 1 BY 1                       CAT710  
                    UNTIL WS-CLNT-NO > 500                              CAT710  
                                                                        CAT710  
              MOVE SPACES TO WS-CLIENT-TABLE-ENTRY(WS-CLNT-NO)          CAT710  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO     CAT710  
                                              BH-ACAT-INFO              CAT710  
              MOVE  WS-CLNT-NO            TO  BH-BROKER-NUMBER-N        CAT710  
                                  WS-TBL-ADP-CLIENT-NBR(WS-CLNT-NO)     CAT710  
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE    CAT710  
              MOVE  '434500'              TO  BH-B2-INFO-ID             CAT710  
              CALL  GETB1V              USING BH-BROKER-HEADER-INFO     CAT710  
                                              BH-ACAT-INFO              CAT710  
                                                                        CAT710  
              IF BH-BROKER-ACTIVE                                       CAT710  
                 MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                   CAT710  
                                  TO WS-TBL-BROKER-NBR(WS-CLNT-NO)      CAT710  
                 MOVE BH-BROKER-NAME                                    CAT710  
                                  TO WS-TBL-BROKER-NAME(WS-CLNT-NO)     CAT710  
                 MOVE BH-BROKER-STATUS                                  CAT710  
                                  TO WS-TBL-BROKER-STATUS(WS-CLNT-NO)   CAT710  
                 MOVE BH-ACAT-STATUS                                    CAT710  
                                  TO WS-TBL-ACAT-STATUS(WS-CLNT-NO)     CAT710  
                 IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                 CAT710  
                     MOVE BH-BROKER-MINI-MAXI-SUBGROUP                  CAT710  
                                  TO WS-TBL-STREAM(WS-CLNT-NO)          CAT710  
                 ELSE                                                   CAT710  
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                  CAT710  
                                  TO WS-TBL-STREAM(WS-CLNT-NO)          CAT710  
                 END-IF                                                 CAT710  
                 IF BH-ACAT-ACTIVE                                      CAT710  
                    DISPLAY 'B1-CLT=' WS-CLNT-NO                        CAT710  
                                  ' ' WS-TBL-BROKER-NAME   (WS-CLNT-NO) CAT710  
                              ' BKR ' WS-TBL-BROKER-NBR    (WS-CLNT-NO) CAT710  
                              ' STR ' WS-TBL-STREAM        (WS-CLNT-NO) CAT710  
                              ' STA ' WS-TBL-BROKER-STATUS (WS-CLNT-NO) CAT710  
                             ' ACAT ' WS-TBL-ACAT-STATUS   (WS-CLNT-NO) CAT710  
                 END-IF                                                 CAT710  
              END-IF                                                    CAT710  
           END-PERFORM.                                                 CAT710  
                                                                                
LRM007     MOVE  235                 TO  BH-BROKER-NUMBER-N                     
LRM007     MOVE  '114'               TO  BH-LOGICAL-RECORD-CODE                 
LRM007     CALL   GETB1V           USING BH-BROKER-HEADER-INFO,                 
LRM007                                   BH-REQ-INFO                            
LRM007     END-CALL                                                             
LRM007     IF NOT BH-REQ-ACTIVE                                                 
LRM007        MOVE SPACES TO BH-REQ-WEALTH-MGMT-OMNI-ACCT               CAT710  
LRM007     END-IF.                                                      CAT710  
LRM007***** HARD CODING UNTIL SOME DAY IN THE FUTURE.                   CAT710  
LRM007     MOVE '11111111' TO BH-REQ-WEALTH-MGMT-OMNI-ACCT.             CAT710  
LRM007     DISPLAY 'B1-CLT=235 / WM ACCOUNT '                           CAT710  
LRM007                         BH-REQ-WEALTH-MGMT-OMNI-ACCT.            CAT710  
      /                                                                 CAT710  
       2000-PROCESS-ACATPOSN.                                           CAT710  
                                                                        CAT710  
           PERFORM 3000-READ-ACATPOSN  THRU 3000-EXIT.                  CAT710  
                                                                        CAT710  
           IF  END-OF-ACATPOSN                                          CAT710  
               GO 2000-EXIT                                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF W-NSCC-DIST-PARTICIPANT NOT = WS-BROKER-NBR               CAT710  
              MOVE W-NSCC-DIST-PARTICIPANT TO WS-BROKER-NBR             CAT710  
                                                                        CAT710  
              SET SUB  TO  +1                                           CAT710  
              SEARCH WS-CLIENT-TABLE-ENTRY                              CAT710  
                 VARYING SUB                                            CAT710  
                AT END                                                  CAT710  
                   MOVE '0000'                      TO WS-ADP-CLIENT    CAT710  
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                     CAT710  
                          ' BAD BROKER NUMBER FROM NSCC -'              CAT710  
                          ' NOT FOUND IN B1 -'                          CAT710  
                          ' CLT=' WS-ADP-CLIENT                         CAT710  
               WHEN                                                     CAT710  
                   WS-BROKER-NBR = WS-TBL-BROKER-NBR (SUB)              CAT710  
                   MOVE WS-TBL-ADP-CLIENT-NBR (SUB) TO WS-ADP-CLIENT    CAT710  
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                     CAT710  
                          ' CLT=' WS-TBL-ADP-CLIENT-NBR(SUB)            CAT710  
                              ' ' WS-TBL-BROKER-NAME   (SUB)            CAT710  
                          ' STR ' WS-TBL-STREAM        (SUB)            CAT710  
                          ' STA ' WS-TBL-BROKER-STATUS (SUB)            CAT710  
                         ' ACAT ' WS-TBL-ACAT-STATUS   (SUB)            CAT710  
              END-SEARCH                                                CAT710  
           END-IF.                                                      CAT710  
           IF  WS-ADP-CLIENT NOT = '0000'                               CAT710  
               PERFORM 4000-PROCESS-RTN  THRU 4000-EXIT                 CAT710  
           ELSE                                                         CAT710  
               ADD 1 TO W-NO-CLT-CNT                                    CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       2000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       3000-READ-ACATPOSN.                                              CAT710  
                                                                        CAT710  
           READ NSCC-POSITION-FILE                                      CAT710  
                AT END                                                  CAT710  
                   MOVE 'Y'   TO END-OF-ACATPOSN-SW                     CAT710  
                   DISPLAY 'CAT710WM: END OF NSCC POSTION FILE, '       CAT710  
                           'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT   CAT710  
                   GO TO 3000-EXIT                                      CAT710  
           END-READ.                                                    CAT710  
                                                                        CAT710  
           ADD  1   TO W-INFILE-CNT.                                    CAT710  
                                                                        CAT710  
           IF  ACATPOSN-OKAY                                            CAT710  
               CONTINUE                                                 CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'CAT710WM: ERROR READING ACATPOSN'               CAT710  
               DISPLAY 'CAT710WM: READ STATUS = ' ACATPOSN-STAT         CAT710  
                  '.  NSCC POSTISION REC-CNT = ' W-INFILE-CNT           CAT710  
               DISPLAY 'CAT710WM: U3002 - ABENDING ON BAD READ STATUS'  CAT710  
               MOVE +3004 TO ABEND-CODE                                 CAT710  
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
      **<< SKIP RECORD IF NSCCP-REC-TYPE = '1' (UNKNOWN HEADER REC)>>   CAT710  
           IF NSCCP-REC-TYPE = '1'                                      CAT710  
              DISPLAY ' '                                               CAT710  
              DISPLAY 'FILE HEADER:'                                    CAT710  
              DISPLAY  NSCCP-RECORD (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY ' '                                               CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF NSCCP-HEADER                                              CAT710  
              MOVE ' '           TO  WS-HDR-RECORD                      CAT710  
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO              CAT710  
                   WS-HDR-RECORD    (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY ' '                                               CAT710  
              DISPLAY 'BRK-HDR:' WS-HDR-RECORD                          CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-POSITION-MRO                                        CAT710  
              IF (NSCCP-XFER OR NSCCP-ASSET)                            CAT710  
                 MOVE ' '          TO W-NSCC-RECORD                     CAT710  
                 MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO           CAT710  
                      W-NSCC-RECORD    (1 : W-REC-LEN-IN)               CAT710  
##               GO TO 3000-EXIT                                        CAT710  
              ELSE                                                      CAT710  
                 GO TO 3000-READ-ACATPOSN                               CAT710  
              END-IF                                                    CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-SETTLMNT-MRO                                        CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF NSCCP-TRAILER                                             CAT710  
              MOVE ' '           TO  WS-TRL-RECORD                      CAT710  
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO              CAT710  
                   WS-TRL-RECORD    (1 : W-REC-LEN-IN)                  CAT710  
              DISPLAY 'BRK-TRL:' WS-TRL-RECORD                          CAT710  
              DISPLAY 'CAT710WM: END OF BROKER. '                       CAT710  
                      'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT        CAT710  
              GO TO 3000-READ-ACATPOSN                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY ' CAT710WM - BAD RECORD TYPE'                     CAT710  
              DISPLAY '  NSCCP-REC-TYPE = '  NSCCP-REC-TYPE             CAT710  
              DISPLAY '  NSCCP-REC-SUBTYPE = '  NSCCP-REC-SUBTYPE       CAT710  
              DISPLAY '  NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT      CAT710  
              MOVE +3005 TO ABEND-CODE                                  CAT710  
              PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                 CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       3000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       4000-PROCESS-RTN.                                                CAT710  
           MOVE SPACES  TO SV-ACAT-CNTL-NBR.                            CAT710  
                                                                        CAT710  
LRM007     IF  W-NSCC-DIST-PARTICIPANT = '0642'                         CAT710  
LRM007     AND BH-REQ-WEALTH-MGMT-OMNI-ACCT > SPACES                    CAT710  
LRM007       IF W-NSCC-REC-SUBTYPE = 'T'                                CAT710  
LRM007          IF (W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR         CAT710  
LRM007          AND (W-NSCC-TI-DEL-ACCT-NBR (1 : 8) =                   CAT710  
LRM007                       BH-REQ-WEALTH-MGMT-OMNI-ACCT)              CAT710  
LRM007          OR (W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR         CAT710  
LRM007          AND W-NSCC-TI-RCV-ACCT-NBR (1 : 8) =                    CAT710  
LRM007                       BH-REQ-WEALTH-MGMT-OMNI-ACCT))             CAT710  
LRM007                MOVE 1235 TO WS-ADP-CLIENT                        CAT710  
LRM007          ELSE                                                    CAT710  
LRM007              MOVE 0235 TO WS-ADP-CLIENT                          CAT710  
LRM007          END-IF                                                  CAT710  
LRM007       ELSE                                                       CAT710  
LRM007       IF (W-NSCC-REC-SUBTYPE = 'A' OR 'F')                       CAT710  
LRM007          MOVE '1235'              TO  SV-CLIENT-NBR              CAT710  
LRM007          MOVE W-NSCC-ACAT-CTL-NBR TO  SV-ACAT-CNTL-NBR           CAT710  
LRM007          PERFORM 5000-RETRIEVE-VTRNFR THRU 5000-EXIT             CAT710  
LRM007          IF VTRNFR-FOUND                                         CAT710  
LRM007          AND WS-BRANCH-CD = BH-REQ-WEALTH-MGMT-OMNI-ACCT (1 : 3) CAT710  
LRM007          AND WS-ACCT-CD   = BH-REQ-WEALTH-MGMT-OMNI-ACCT (4 : 5) CAT710  
LRM007              MOVE 1235 TO WS-ADP-CLIENT                          CAT710  
LRM007                           SV-CLIENT-NBR                                  
LRM007                           WS-CLIENT-NBR                                  
LRM007          ELSE                                                    CAT710  
LRM007              MOVE 0235 TO WS-ADP-CLIENT                          CAT710  
LRM007                           SV-CLIENT-NBR                                  
LRM007                           WS-CLIENT-NBR                                  
LRM007          END-IF                                                  CAT710  
LRM007       END-IF                                                     CAT710  
LRM007     END-IF.                                                      CAT710  
                                                                                
           IF W-NSCC-REC-SUBTYPE = 'T'                                  CAT710  
              ADD  1 TO NSCC-TIF-CNT                                    CAT710  
              MOVE W-NSCC-ACAT-CTL-NBR  TO  SV-ACAT-CNTL-NBR            CAT710  
              MOVE WS-ADP-CLIENT        TO  SV-CLIENT-NBR               CAT710  
              MOVE SV-CLIENT-NBR        TO  WS-CLIENT-NBR               CAT710  
LRM006        IF PARM-STREAM-IND = 'Q'                                          
LRM006        AND W-NSCC-SETTLEMENT-DATE       > '00000000'             CAT710  
LRM006           PERFORM 4020-INCRIMENT-STTLM-DT                                
LRM006        END-IF                                                            
              PERFORM 5000-RETRIEVE-VTRNFR THRU 5000-EXIT               CAT710  
              IF VTRNFR-FOUND                                           CAT710  
                 MOVE SV-CLIENT-NBR    TO WS-RECONCILED-TIF-CLT         CAT710  
                 MOVE SV-ACAT-CNTL-NBR TO WS-RECONCILED-TIF-ACAT        CAT710  
                 PERFORM 5010-CHECK-TIF-DIFFERNCE                       CAT710  
*****************IF DIFFERENCE-FOUND                                    CAT710  
                    PERFORM 6000-RECONCILE-TIF                          CAT710  
                    PERFORM 6100-UPDATE-TIF THRU 6100-EXIT              CAT710  
*****************END-IF                                                 CAT710  
              ELSE                                                      CAT710  
                 IF  SV-CLIENT-NBR NOT = '0000'                         CAT710  
                      DISPLAY 'TIF   NOTFND: '                          CAT710  
                        'CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' SV-ACAT-CNTL-NBR                         CAT710  
                       ' TFR=' W-NSCC-TI-TFR-TYPE                       CAT710  
                       ' STA=' W-NSCC-STATUS                            CAT710  
                        ' SD=' W-NSCC-SETTLEMENT-DATE                   CAT710  
                       ' SQL=' W-DB2-SQLCODE                            CAT710  
                     PERFORM 7600-INSERT-VTRNFR THRU 7600-EXIT          CAT710  
                     MOVE SV-CLIENT-NBR    TO WS-RECONCILED-TIF-CLT     CAT710  
                     MOVE SV-ACAT-CNTL-NBR TO WS-RECONCILED-TIF-ACAT    CAT710  
                 END-IF                                                 CAT710  
              END-IF                                                    CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
      **<< RECONCILIATE ASSET  >>**                                     CAT710  
           IF W-NSCC-REC-SUBTYPE = 'A'                                  CAT710  
              ADD 1 TO NSCC-ASSET-CNT                                   CAT710  
              IF  W-NSCC-AT-OPT-CATG > '00'                             CAT710  
                    ADD 1 TO NSCC-OPTION-CNT                            CAT710  
                    MOVE W-NSCC-ATO-OPT-COMMENT      TO W-DESC          CAT710  
              ELSE                                                      CAT710  
                  IF W-NSCC-AT-STL-LOC = '10'                           CAT710  
                     ADD 1 TO NSCC-MF-CNT                               CAT710  
                     MOVE W-NSCC-AT-ASSET-DESC (1:30) TO W-DESC         CAT710  
                  ELSE                                                  CAT710  
                     ADD 1 TO NSCC-REG-ASSET-CNT                        CAT710  
                     MOVE W-NSCC-AT-ASSET-DESC (1:30) TO W-DESC         CAT710  
                  END-IF                                                CAT710  
              END-IF                                                    CAT710  
              MOVE WS-ADP-CLIENT        TO  SV-CLIENT-NBR               CAT710  
              MOVE W-NSCC-ACAT-CTL-NBR  TO  SV-ACAT-CNTL-NBR            CAT710  
              IF  SV-CLIENT-NBR     = WS-RECONCILED-TIF-CLT  AND        CAT710  
                  SV-ACAT-CNTL-NBR  = WS-RECONCILED-TIF-ACAT            CAT710  
                  MOVE SPACE TO ASSET-FOUND-SW                          CAT710  
                  PERFORM 7000-RETRIEVE-ASSET THRU 7000-EXIT            CAT710  
##                PERFORM 7010-CHECK-ASSET-DIFFERNCE                    CAT710  
                  IF ASSET-FOUND                                        CAT710  
                      ADD 1 TO VASSET-FND-CNT                           CAT710  
                      IF  WS-ASSET-QTY NOT = 0                          CAT710  
                           PERFORM 7680-GET-ADP-NO THRU 7680-EXIT       CAT710  
                      END-IF                                            CAT710  
**********************IF DIFFERENCE-FOUND                               CAT710  
                         PERFORM 7100-UPDATE-ASSET THRU 7100-EXIT       CAT710  
                         ADD 1 TO VASSET-UPDT-CNT                       CAT710  
**********************END-IF                                            CAT710  
                      PERFORM 4100-UPDATE-OTHER-DATABASE THRU 4100-EXIT CAT710  
                   ELSE                                                 CAT710  
                       IF SV-CLIENT-NBR NOT = '0000'                    CAT710  
                          ADD 1 TO VASSET-NOTFND-CNT                    CAT710  
                          DISPLAY 'ASSET NOTFND: '                      CAT710  
                           'CLT=' SV-CLIENT-NBR                         CAT710  
                          ' CTL=' W-NSCC-ACAT-CTL-NBR                   CAT710  
                          ' TFR=' W-NSCC-AT-TFR-TYPE                    CAT710  
                          ' STA=' W-NSCC-STATUS                         CAT710  
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR               CAT710  
                          ' STL=' W-NSCC-AT-STL-LOC                     CAT710  
                          ' ' W-NSCC-AT-OPT-CATG                        CAT710  
                          ' ' W-DESC                                    CAT710  
                          PERFORM 7610-INSERT-VASSET THRU 7610-EXIT     CAT710  
                       END-IF                                           CAT710  
                   END-IF                                               CAT710  
              ELSE                                                      CAT710  
                   ADD 1 TO VASSET-NOT-UPDATED-CNT                      CAT710  
                      DISPLAY 'ASSET NOT UPD:'                          CAT710  
                        'CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' TFR=' W-NSCC-AT-TFR-TYPE                       CAT710  
                       ' STA=' W-NSCC-STATUS                            CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' STL=' W-NSCC-AT-STL-LOC                        CAT710  
                       ' ' W-NSCC-AT-OPT-CATG                           CAT710  
                       ' ' W-DESC                                       CAT710  
              END-IF.                                                   CAT710  
                                                                        CAT710  
           ADD +1 TO W-COMMIT-CTR                                       CAT710  
           IF  W-COMMIT-CTR > +19                                       CAT710  
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                   CAT710  
               MOVE 0 TO W-COMMIT-CTR                                   CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       4000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      *                                                                 CAT710  
LRM006 4020-INCRIMENT-STTLM-DT.                                                 
LRM006     SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                              
LRM006     MOVE 'US' TO  BPDATES-CALENDAR-TYPE.                                 
LRM006     MOVE W-NSCC-SETTLEMENT-DATE TO BPDATES-BASE-DATE.                    
LRM006     SET BPD-DISP-PLUS TO TRUE.                                           
LRM006     SET BPD-DISP-CALENDAR TO TRUE.                                       
LRM006     MOVE '0' TO BPD-DT-DAY-TYPE                                          
LRM006     PERFORM VARYING DAY-SUB FROM 1 BY 1                                  
LRM006        UNTIL DAY-SUB > 20                                                
LRM006            OR BPD-DT-TD-AND-SD                                           
LRM006        MOVE DAY-SUB TO BPDATES-DTSEARCH-DISP                             
LRM006        CALL  BPDATES  USING BPDATES-PARAMETERS                           
LRM006        END-CALL                                                          
LRM006     END-PERFORM.                                                         
LRM006     IF NOT BPD-VALID-RETURN                                              
LRM006        DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                    
LRM006        DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE                  
LRM006        DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                   
LRM006        DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                    
LRM006        MOVE +4020 TO ABEND-CODE                                          
LRM006        CALL ABEND USING ABEND-CODE                                       
LRM006     ELSE                                                                 
LRM006        MOVE BPD-DT-CALDATE TO W-NSCC-SETTLEMENT-DATE                     
LRM006        DISPLAY 'CHANGING S/D  FROM ' BPDATES-BASE-DATE                   
LRM006                               ' TO ' BPD-DT-CALDATE                      
LRM006     END-IF.                                                              
      *                                                                 CAT710  
       4100-UPDATE-OTHER-DATABASE.                                      CAT710  
           IF W-NSCC-AT-OPT-CATG > '00'                                 CAT710  
              MOVE SPACE TO OPTION-FOUND-SW                             CAT710  
              PERFORM 7200-RETRIEVE-OPTION THRU 7200-EXIT               CAT710  
              IF OPTION-FOUND                                           CAT710  
                 PERFORM 7210-CHECK-OPTION-DIFFERENCE                   CAT710  
*****************IF DIFFERENCE-FOUND                                    CAT710  
                    PERFORM 7300-UPDATE-OPTION THRU 7300-EXIT           CAT710  
*****************END-IF                                                 CAT710  
              ELSE                                                      CAT710  
                      DISPLAY 'OPT   NOTFND: '                          CAT710  
                        'CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' TFR=' W-NSCC-AT-TFR-TYPE                       CAT710  
                       ' STL=' W-NSCC-AT-STL-LOC                        CAT710  
                       ' ' W-NSCC-AT-OPT-CATG                           CAT710  
                       ' ' W-DESC                                       CAT710  
                      PERFORM 7620-INSERT-VOPTN THRU 7620-EXIT          CAT710  
              END-IF                                                    CAT710  
           ELSE                                                         CAT710  
           IF W-NSCC-AT-STL-LOC = '10'                                  CAT710  
              MOVE SPACE TO MUTUAL-FUND-FOUND-SW                        CAT710  
              PERFORM 7400-RETRIEVE-MUTUAL THRU 7400-EXIT               CAT710  
              IF MUTUAL-FUND-FOUND                                      CAT710  
                 PERFORM 7410-CHECK-MUTUAL-DIFFERENCE                   CAT710  
*****************IF DIFFERENCE-FOUND                                    CAT710  
                    PERFORM 7500-UPDATE-MUTUAL THRU 7500-EXIT           CAT710  
*****************END-IF                                                 CAT710  
              ELSE                                                      CAT710  
                      DISPLAY 'MF    NOTFND: '                          CAT710  
                        'CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' TFR=' W-NSCC-AT-TFR-TYPE                       CAT710  
                       ' STL=' W-NSCC-AT-STL-LOC                        CAT710  
                       ' ' W-NSCC-AT-OPT-CATG                           CAT710  
                       ' ' W-DESC                                       CAT710  
                      PERFORM 7630-INSERT-VMF THRU 7630-EXIT            CAT710  
              END-IF.                                                   CAT710  
       4100-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       5000-RETRIEVE-VTRNFR.                                            CAT710  
                                                                        CAT710  
           MOVE +0 TO SQLCODE                                           CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
                SELECT                                                  CAT710  
                       CLIENT_NBR                                       CAT710  
                     , ACAT_CONTROL_NBR                                 CAT710  
                     , SBMTG_PRTCP_NBR                                  CAT710  
                     , DLVR_NBR                                         CAT710  
                     , ACCT_DLVR_NBR                                    CAT710  
                     , RCV_NBR                                          CAT710  
                     , ACCT_RCV_NBR                                     CAT710  
                     , TRNFR_TYPE_CD                                    CAT710  
                     , TRANS_TYPE_CD                                    CAT710  
                     , RCV_CUST_NM                                      CAT710  
                     , RCV_SS_PRIM_NBR                                  CAT710  
                     , RCV_SS_SCNDY_NBR                                 CAT710  
                     , RCV_ACCT_TYPE_CD                                 CAT710  
                     , RCV_OCC_BRKR_NBR                                 CAT710  
                     , RCV_CRSPN_NBR                                    CAT710  
                     , ACAT_CNTL_ASTD_NBR                               CAT710  
                     , CMNT_TXT                                         CAT710  
                     , STTLM_TM_CD                                      CAT710  
                     , VAL_FREE_CD                                      CAT710  
                     , TRANS_RFRN_ID_CD                                 CAT710  
                     , DB_CR_CD                                         CAT710  
                     , DSTBN_SIDE_CD                                    CAT710  
                     , SYS_RJCT_RSN_CD                                  CAT710  
                     , TRNFR_TYPE_RJCT_CD                               CAT710  
                     , PHSCL_SEQ_NBR                                    CAT710  
                     , LGCL_SEQ_NBR                                     CAT710  
                     , RR_CD                                            CAT710  
                     , BRANCH_CD                                        CAT710  
                     , ACCT_CD                                          CAT710  
                     , DAYS_STTS_QTY                                    CAT710  
                     , STTS_CD                                          CAT710  
                     , PRCS_DT                                          CAT710  
                     , STTLM_DT                                         CAT710  
                     , STTLM_ASCTD_DT                                   CAT710  
                INTO                                                    CAT710  
                       :WS-CLIENT-NBR                                   CAT710  
                     , :WS-ACAT-CNTL-NBR                                CAT710  
                     , :WS-SBMTG-PRTCP-NBR                              CAT710  
                     , :WS-DLVR-NBR                                     CAT710  
                     , :WS-ACCT-DLVR-NBR                                CAT710  
                     , :WS-RCV-NBR                                      CAT710  
                     , :WS-ACCT-RCV-NBR                                 CAT710  
                     , :WS-TRNFR-TYPE-CD                                CAT710  
                     , :WS-TRANS-TYPE-CD                                CAT710  
                     , :WS-RCV-CUST-NM                                  CAT710  
                     , :WS-RCV-SS-PRIM-NBR                              CAT710  
                     , :WS-RCV-SS-SCNDY-NBR                             CAT710  
                     , :WS-RCV-ACCT-TYPE-CD                             CAT710  
                     , :WS-RCV-OCC-BRKR-NBR                             CAT710  
                     , :WS-RCV-CRSPN-NBR                                CAT710  
                     , :WS-ACAT-CNTL-ASTD-NBR                           CAT710  
                     , :WS-CMNT-TXT                                     CAT710  
                     , :WS-STTLM-TM-CD                                  CAT710  
                     , :WS-VAL-FREE-CD                                  CAT710  
                     , :WS-TRANS-RFRN-ID-CD                             CAT710  
                     , :WS-DB-CR-CD                                     CAT710  
                     , :WS-DSTBN-SIDE-CD                                CAT710  
                     , :WS-SYS-RJCT-RSN-CD                              CAT710  
                     , :WS-TRNFR-TYPE-RJCT-CD                           CAT710  
                     , :WS-PHSCL-SEQ-NBR                                CAT710  
                     , :WS-LGCL-SEQ-NBR                                 CAT710  
                     , :WS-RR-CD                                        CAT710  
                     , :WS-BRANCH-CD                                    CAT710  
                     , :WS-ACCT-CD                                      CAT710  
                     , :WS-DAYS-STTS-QTY                                CAT710  
                     , :WS-STTS-CD                                      CAT710  
                     , :WS-PRCS-DT                                      CAT710  
                     , :WS-STTLM-DT                                     CAT710  
                     , :WS-STTLM-ASCTD-DT                               CAT710  
                FROM VTRNFR                                             CAT710  
                WHERE CLIENT_NBR       = :SV-CLIENT-NBR                 CAT710  
                 AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR              CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           MOVE SQLCODE                  TO W-DB2-SQLCODE.              CAT710  
                                                                        CAT710  
           EVALUATE SQLCODE                                             CAT710  
              WHEN +0                                                   CAT710  
                   SET VTRNFR-FOUND TO TRUE                             CAT710  
                   ADD    1   TO  VTRNFR-FND-CNT                        CAT710  
              WHEN +100                                                 CAT710  
                   SET VTRNFR-NOT-FOUND TO TRUE                         CAT710  
                   ADD    1   TO  VTRNFR-NOTFND-CNT                     CAT710  
              WHEN OTHER                                                CAT710  
                   SET VTRNFR-NOT-FOUND TO TRUE                         CAT710  
                   DISPLAY 'INP=' W-INFILE-CNT                          CAT710  
                          ' CLT=' SV-CLIENT-NBR,                        CAT710  
                          ' CTL=' SV-ACAT-CNTL-NBR                      CAT710  
                          ' VTRNFR ERROR '                              CAT710  
                          ' SQL=' W-DB2-SQLCODE                         CAT710  
                          ' ' W-NSCC-COMMON-AREA                        CAT710  
                   PERFORM 8500-SQL-ERROR-ROUTINE                       CAT710  
           END-EVALUATE.                                                CAT710  
                                                                        CAT710  
       5000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       5010-CHECK-TIF-DIFFERNCE.                                        CAT710  
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                           CAT710  
                                                                        CAT710  
           MOVE  W-NSCC-DAYS-IN-STATUS    TO  WS-QTY-9.                 CAT710  
           IF WS-QTY-9 NOT = WS-DAYS-STTS-QTY                           CAT710  
              SET DIFFERENCE-FOUND TO TRUE.                             CAT710  
                                                                        CAT710  
           IF W-NSCC-TI-ASSC-STL-DT > SPACE                             CAT710  
              IF W-NSCC-TI-ASSC-STL-DT  > '00000000'                    CAT710  
                 MOVE  W-NSCC-TI-ASSC-STL-DT TO  WK-DATE                CAT710  
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                   CAT710  
                 MOVE  WK-DT-MM           TO  WK-DT-2                   CAT710  
                 MOVE  WK-DT-DD           TO  WK-DT-3                   CAT710  
              ELSE                                                      CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
              END-IF                                                    CAT710  
           ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
           IF WK-FMT-DATE NOT = WS-STTLM-ASCTD-DT                       CAT710  
              SET DIFFERENCE-FOUND TO TRUE.                             CAT710  
                                                                        CAT710  
           IF W-NSCC-PROC-DATE > SPACE                                  CAT710  
              IF W-NSCC-PROC-DATE > '00000000'                          CAT710  
                 MOVE  W-NSCC-PROC-DATE     TO  WK-DATE                 CAT710  
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                   CAT710  
                 MOVE  WK-DT-MM           TO  WK-DT-2                   CAT710  
                 MOVE  WK-DT-DD           TO  WK-DT-3                   CAT710  
              ELSE                                                      CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
              END-IF                                                    CAT710  
           ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
           IF WK-FMT-DATE NOT = WS-PRCS-DT                              CAT710  
              SET DIFFERENCE-FOUND TO TRUE.                             CAT710  
                                                                        CAT710  
           IF W-NSCC-STATUS > 299 AND                                   CAT710  
              W-NSCC-SETTLEMENT-DATE       > '00000000'                 CAT710  
              MOVE W-NSCC-SETTLEMENT-DATE TO  WK-DATE                   CAT710  
                    MOVE WK-DT-YYYY       TO  WK-DT-1                   CAT710  
                    MOVE WK-DT-MM         TO  WK-DT-2                   CAT710  
                    MOVE WK-DT-DD         TO  WK-DT-3                   CAT710  
           ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF WK-FMT-DATE NOT = WS-STTLM-DT                             CAT710  
              SET DIFFERENCE-FOUND TO TRUE.                             CAT710  
                                                                        CAT710  
      /                                                                 CAT710  
       6000-RECONCILE-TIF.                                              CAT710  
      *-------------------------------------------------------------*   CAT710  
***********DISPLAY '6000-RECONCILE-TIF.       '                         CAT710  
      *-------------------------------------------------------------*   CAT710  
                                                                        CAT710  
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR              CAT710  
               MOVE 'D'                   TO  W-NSCC-DIST-SIDE          CAT710  
           ELSE                                                         CAT710  
               MOVE 'R'                   TO  W-NSCC-DIST-SIDE          CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR            CAT710  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(1:3) TO W-BRANCH-CD          CAT710  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(4:5) TO W-ACCT-CD            CAT710  
           ELSE                                                         CAT710  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(1:3) TO W-BRANCH-CD          CAT710  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(4:5) TO W-ACCT-CD            CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE  W-NSCC-DIST-SIDE         TO  WS-DSTBN-SIDE-CD.         CAT710  
                                                                        CAT710  
           MOVE  W-NSCC-DIST-PARTICIPANT  TO  WS-SBMTG-PRTCP-NBR.       CAT710  
           IF    W-NSCC-STATUS > ' '                                    CAT710  
                 MOVE  W-NSCC-STATUS      TO  WS-STTS-CD                CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' W-NSCC-STATUS = ' W-NSCC-STATUS                 CAT710  
           END-IF.                                                      CAT710  
           MOVE  W-NSCC-SETTLEMENT-TIMING TO  WS-STTLM-TM-CD.           CAT710  
           MOVE  W-NSCC-VALUE-FREE-IND    TO  WS-VAL-FREE-CD.           CAT710  
           MOVE  W-NSCC-DEBIT-CREDIT-IND  TO  WS-DB-CR-CD.              CAT710  
           MOVE  W-NSCC-TI-TFR-TYPE       TO  WS-TRNFR-TYPE-CD.         CAT710  
           MOVE  W-NSCC-TI-RCV-NBR        TO  WS-RCV-NBR.               CAT710  
           MOVE  W-NSCC-TI-DEL-NBR        TO  WS-DLVR-NBR.              CAT710  
           MOVE  W-NSCC-TI-RCV-ACCT-NBR   TO  WS-ACCT-RCV-NBR.          CAT710  
           MOVE  W-NSCC-TI-RCV-CUST-NAME  TO  WS-RCV-CUST-NM.           CAT710  
           MOVE  W-NSCC-TI-RCV-SSN-PRM    TO  WS-RCV-SS-PRIM-NBR.       CAT710  
           MOVE  W-NSCC-TI-RCV-SSN-SEC    TO  WS-RCV-SS-SCNDY-NBR.      CAT710  
           MOVE  W-NSCC-TI-RCV-ACCT-TYPE  TO  WS-RCV-ACCT-TYPE-CD.      CAT710  
           MOVE  W-NSCC-TI-RCV-OCC-BRKR   TO  WS-RCV-OCC-BRKR-NBR.      CAT710  
           MOVE  W-NSCC-TI-RCV-CRSPN-NBR  TO  WS-RCV-CRSPN-NBR.         CAT710  
           MOVE  W-NSCC-TI-DEL-ACCT-NBR   TO  WS-ACCT-DLVR-NBR.         CAT710  
           MOVE  W-NSCC-TI-TFR-TYPE-REJ   TO  WS-TRNFR-TYPE-RJCT-CD.    CAT710  
           MOVE  W-NSCC-TI-ASSC-CTL-NBR   TO  WS-ACAT-CNTL-ASTD-NBR.    CAT710  
           MOVE  W-NSCC-TI-TRAN-REF-ID    TO  WS-TRANS-RFRN-ID-CD.      CAT710  
           MOVE  W-NSCC-TI-COMMENTS       TO  WS-CMNT-TXT.              CAT710  
                                                                        CAT710  
           MOVE  W-NSCC-DAYS-IN-STATUS    TO  WS-QTY-9.                 CAT710  
                 MOVE WS-QTY-9            TO  WS-DAYS-STTS-QTY.         CAT710  
                                                                        CAT710  
*DJ        IF  W-NSCC-TI-ASSC-STL-DT       > '00000000'                 CAT710  
*DJ            MOVE  W-NSCC-TI-ASSC-STL-DT TO  WK-DATE                  CAT710  
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                   CAT710  
                 MOVE  WK-DT-MM           TO  WK-DT-2                   CAT710  
                 MOVE  WK-DT-DD           TO  WK-DT-3                   CAT710  
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT         CAT710  
*DJ        ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT         CAT710  
*DJ        END-IF                                                       CAT710  
           IF (WK-DT-1 < '0001')                                        CAT710  
           OR (WK-DT-2 > '12'   OR                                      CAT710  
               WK-DT-2 < '01')                                          CAT710  
           OR (WK-DT-3 > '31'   OR                                      CAT710  
               WK-DT-3 < '01')                                          CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' BAD DATE W-NSCC-TI-ASSC-STL-DT = '              CAT710  
                                 W-NSCC-TI-ASSC-STL-DT                  CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
           MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT               CAT710  
                                                                        CAT710  
                                                                        CAT710  
*DJ        IF  W-NSCC-PROC-DATE            > '00000000'                 CAT710  
*              MOVE  W-NSCC-PROC-DATE     TO  WK-DATE                   CAT710  
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                   CAT710  
                 MOVE  WK-DT-MM           TO  WK-DT-2                   CAT710  
                 MOVE  WK-DT-DD           TO  WK-DT-3                   CAT710  
                 MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                CAT710  
*DJ        ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
                 MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                CAT710  
*DJ        END-IF                                                       CAT710  
           IF (WK-DT-1 < '0001')                                        CAT710  
           OR (WK-DT-2 > '12'   OR                                      CAT710  
               WK-DT-2 < '01')                                          CAT710  
           OR (WK-DT-3 > '31'   OR                                      CAT710  
               WK-DT-3 < '01')                                          CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' BAD DATE W-NSCC-PROC-DATE = '                   CAT710  
                                 W-NSCC-PROC-DATE                       CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
           MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                      CAT710  
                                                                        CAT710  
                                                                        CAT710  
           IF W-NSCC-STATUS > 299 AND                                   CAT710  
              W-NSCC-SETTLEMENT-DATE       > '00000000'                 CAT710  
              MOVE W-NSCC-SETTLEMENT-DATE TO  WK-DATE                   CAT710  
                    MOVE WK-DT-YYYY       TO  WK-DT-1                   CAT710  
                    MOVE WK-DT-MM         TO  WK-DT-2                   CAT710  
                    MOVE WK-DT-DD         TO  WK-DT-3                   CAT710  
                    MOVE WK-FMT-DATE      TO  WS-STTLM-DT               CAT710  
              ADD 1 TO WS-SETTLED-CNT                                   CAT710  
*DJ        ELSE                                                         CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-DT               CAT710  
           END-IF.                                                      CAT710  
           IF (WK-DT-1 < '0001')                                        CAT710  
           OR (WK-DT-2 > '12'   OR                                      CAT710  
               WK-DT-2 < '01')                                          CAT710  
           OR (WK-DT-3 > '31'   OR                                      CAT710  
               WK-DT-3 < '01')                                          CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' BAD DATE W-NSCC-SETTLEMENT-DATE  = '            CAT710  
                                 W-NSCC-SETTLEMENT-DATE                 CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
           MOVE  WK-FMT-DATE        TO  WS-STTLM-DT.                    CAT710  
                                                                        CAT710  
      /                                                                 CAT710  
       6100-UPDATE-TIF.                                                 CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
                UPDATE VTRNFR                                           CAT710  
                   SET                                                  CAT710  
                       SBMTG_PRTCP_NBR    = : WS-SBMTG-PRTCP-NBR        CAT710  
                     , DLVR_NBR           = : WS-DLVR-NBR               CAT710  
                     , ACCT_DLVR_NBR      = : WS-ACCT-DLVR-NBR          CAT710  
                     , RCV_NBR            = : WS-RCV-NBR                CAT710  
                     , ACCT_RCV_NBR       = : WS-ACCT-RCV-NBR           CAT710  
                     , TRNFR_TYPE_CD      = : WS-TRNFR-TYPE-CD          CAT710  
                     , TRANS_TYPE_CD      = : WS-TRANS-TYPE-CD          CAT710  
                     , RCV_CUST_NM        = : WS-RCV-CUST-NM            CAT710  
                     , RCV_SS_PRIM_NBR    = : WS-RCV-SS-PRIM-NBR        CAT710  
                     , RCV_SS_SCNDY_NBR   = : WS-RCV-SS-SCNDY-NBR       CAT710  
                     , RCV_ACCT_TYPE_CD   = : WS-RCV-ACCT-TYPE-CD       CAT710  
                     , RCV_OCC_BRKR_NBR   = : WS-RCV-OCC-BRKR-NBR       CAT710  
                     , RCV_CRSPN_NBR      = : WS-RCV-CRSPN-NBR          CAT710  
                     , ACAT_CNTL_ASTD_NBR = : WS-ACAT-CNTL-ASTD-NBR     CAT710  
                     , CMNT_TXT           = : WS-CMNT-TXT               CAT710  
                     , STTS_CD            = : WS-STTS-CD                CAT710  
                     , STTLM_TM_CD        = : WS-STTLM-TM-CD            CAT710  
                     , VAL_FREE_CD        = : WS-VAL-FREE-CD            CAT710  
                     , TRANS_RFRN_ID_CD   = : WS-TRANS-RFRN-ID-CD       CAT710  
                     , DB_CR_CD           = : WS-DB-CR-CD               CAT710  
                     , DSTBN_SIDE_CD      = : WS-DSTBN-SIDE-CD          CAT710  
                     , DAYS_STTS_QTY      = : WS-DAYS-STTS-QTY          CAT710  
                     , PRCS_DT            = : WS-PRCS-DT                CAT710  
                     , STTLM_DT           = : WS-STTLM-DT               CAT710  
                     , STTLM_ASCTD_DT     = : WS-STTLM-ASCTD-DT         CAT710  
                     , PRGM_NM            =  'CAT710WM'                 CAT710  
                     , UPDT_TMSTP         = : W-CURRENT-TIMESTAMP       CAT710  
                     , BRANCH_CD          = : W-BRANCH-CD               CAT710  
                     , ACCT_CD            = : W-ACCT-CD                 CAT710  
                WHERE CLIENT_NBR       = :WS-CLIENT-NBR                 CAT710  
                 AND  ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           EVALUATE SQLCODE                                             CAT710  
              WHEN +0                                                   CAT710  
                   SET VTRNFR-UPDT TO TRUE                              CAT710  
                   ADD 1 TO  VTRNFR-UPDT-CNT                            CAT710  
              WHEN OTHER                                                CAT710  
                   SET VTRNFR-NOT-UPDT  TO TRUE                         CAT710  
                   ADD 1 TO  VTRNFR-NOTUPD-CNT                          CAT710  
                   DISPLAY '6100-UPDATE-TIF ROUTINE ABENDING'           CAT710  
                   DISPLAY 'VTRNFR-NOT-UPDT'                            CAT710  
                   PERFORM 8500-SQL-ERROR-ROUTINE                       CAT710  
           END-EVALUATE.                                                CAT710  
                                                                        CAT710  
       6100-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
      *----------------------------------------------------------*      CAT710  
      *          ASSET RECONCILIATION                                   CAT710  
      *----------------------------------------------------------*      CAT710  
       7000-RETRIEVE-ASSET.                                             CAT710  
           INITIALIZE DCLVASSET.                                        CAT710  
           MOVE SPACE TO ASSET-FOUND-SW.                                CAT710  
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVASSET.               CAT710  
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVASSET.CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASSET.  CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               SELECT                                                   CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,ASSET_SEQ_NBR                                        CAT710  
                  ,CONTROL_NBR_STS_CD                                   CAT710  
                  ,DLVR_NBR_STTS_CD                                     CAT710  
                  ,RCV_NBR_STTS_CD                                      CAT710  
                  ,SBMTG_PRTCP_NBR                                      CAT710  
                  ,SBMT_PRT_NR_STS_CD                                   CAT710  
                  ,AST_SEQ_NBR_STS_CD                                   CAT710  
                  ,SYS_ACT_CD                                           CAT710  
                  ,SYS_RJCT_RSN_CD                                      CAT710  
                  ,TRANS_TYPE_CD                                        CAT710  
                  ,TRANS_TYPE_STTS_CD                                   CAT710  
                  ,PHSCL_SEQ_NBR                                        CAT710  
                  ,PHSCL_SEQ_STTS_CD                                    CAT710  
                  ,LGCL_SEQ_NBR                                         CAT710  
                  ,LGCL_SEQ_NR_STS_CD                                   CAT710  
                  ,ASSET_PRC_CTGY_CD                                    CAT710  
                  ,AST_PRC_CTG_STS_CD                                   CAT710  
                  ,STTLM_LCTN_CD                                        CAT710  
                  ,STTLM_LCTN_STTS_CD                                   CAT710  
                  ,STTLM_RSN_CD                                         CAT710  
                  ,STTLM_RSN_STTS_CD                                    CAT710  
                  ,ISIN_CNTRY_CD                                        CAT710  
                  ,ISIN_CNTRY_STTS_CD                                   CAT710  
                  ,ISIN_SEC_ISSUE_CD                                    CAT710  
                  ,ISIN_SEC_IS_STS_CD                                   CAT710  
                  ,ISIN_SEC_CDG_CD                                      CAT710  
                  ,ISIN_SEC_CD_STS_CD                                   CAT710  
                  ,ASSET_DESC_TXT                                       CAT710  
                  ,ASSET_DESC_STTS_CD                                   CAT710  
                  ,ASSET_RQST_QTY_CD                                    CAT710  
                  ,ASSET_RQST_STS_CD                                    CAT710  
                  ,AST_RQST_TRANS_CD                                    CAT710  
                  ,AST_RQ_TRAN_STS_CD                                   CAT710  
                  ,ASSET_QTY                                            CAT710  
                  ,ASSET_QTY_STTS_CD                                    CAT710  
                  ,ASSET_PCT                                            CAT710  
                  ,ASSET_PCT_STTS_CD                                    CAT710  
                  ,PSTN_CD                                              CAT710  
                  ,PSTN_CD_STTS_CD                                      CAT710  
                  ,ISO_CRNCY_CD                                         CAT710  
                  ,ISO_CRNCY_STTS_CD                                    CAT710  
                  ,ASSET_AMT                                            CAT710  
                  ,ASSET_AMT_STTS_CD                                    CAT710  
                  ,BEARER_BOND_CD                                       CAT710  
                  ,BEARER_BND_STTS_CD                                   CAT710  
                  ,CSH_MGN_SHRT_CD                                      CAT710  
                  ,CSH_MRG_SHT_STS_CD                                   CAT710  
                  ,WHI_CD                                               CAT710  
                  ,WHI_STTS_CD                                          CAT710  
                  ,TRNFR_TYPE_RSN_CD                                    CAT710  
                  ,TRN_TYP_RSN_STS_CD                                   CAT710  
                  ,MBS_SERIAL_NBR                                       CAT710  
                  ,MBS_SERIAL_STTS_CD                                   CAT710  
                  ,ASSET_CMNT_TXT                                       CAT710  
                  ,ASSET_CMNT_STTS_CD                                   CAT710  
                  ,NSCC_ACK_IND                                         CAT710  
                  ,NSCC_PEND_CD                                         CAT710  
                  ,FAIL_SENT_CAGE_IND                                   CAT710  
                  ,FAIL_OPEN_CAGE_IND                                   CAT710  
                  ,NSCC_NON_ADP_IND                                     CAT710  
                  ,TRANS_RFRN_ID_CD                                     CAT710  
                  ,TRANS_RFRN_STTS_CD                                   CAT710  
                  ,OPTN_CTGY_CD                                         CAT710  
                  ,OPTN_CTGY_STTS_CD                                    CAT710  
                  ,RCRD_LNGTH_STTS_CD                                   CAT710  
                  ,RCRD_STTS_CD                                         CAT710  
                  ,ISIN_SEC_EXCPT_IND                                   CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,PRGM_NM                                              CAT710  
                  ,SECURITY_ADP_NBR                                     CAT710  
                  ,RCL_SENT_NSCC_IND                                    CAT710  
                  ,FRV_SENT_NSCC_IND                                    CAT710  
                  ,TRNFR_TYPE_CD                                        CAT710  
                  ,TRNFR_TYPE_STTS_CD                                   CAT710  
               INTO                                                     CAT710  
                   :DCLVASSET.CLIENT-NBR                                CAT710  
                  ,:DCLVASSET.ACAT-CONTROL-NBR                          CAT710  
                  ,:DCLVASSET.ASSET-SEQ-NBR                             CAT710  
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                        CAT710  
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                          CAT710  
                  ,:DCLVASSET.RCV-NBR-STTS-CD                           CAT710  
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                           CAT710  
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                        CAT710  
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                        CAT710  
                  ,:DCLVASSET.SYS-ACT-CD                                CAT710  
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                           CAT710  
                  ,:DCLVASSET.TRANS-TYPE-CD                             CAT710  
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                        CAT710  
                  ,:DCLVASSET.PHSCL-SEQ-NBR                             CAT710  
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                         CAT710  
                  ,:DCLVASSET.LGCL-SEQ-NBR                              CAT710  
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                         CAT710  
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                        CAT710  
                  ,:DCLVASSET.STTLM-LCTN-CD                             CAT710  
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                        CAT710  
                  ,:DCLVASSET.STTLM-RSN-CD                              CAT710  
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                         CAT710  
                  ,:DCLVASSET.ISIN-CNTRY-CD                             CAT710  
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                        CAT710  
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                         CAT710  
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                        CAT710  
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                           CAT710  
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-DESC-TXT                            CAT710  
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                         CAT710  
                  ,:DCLVASSET.ASSET-RQST-STS-CD                         CAT710  
                  ,:DCLVASSET.AST-RQST-TRANS-CD                         CAT710  
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-QTY                                 CAT710  
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                         CAT710  
                  ,:DCLVASSET.ASSET-PCT                                 CAT710  
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                         CAT710  
                  ,:DCLVASSET.PSTN-CD                                   CAT710  
                  ,:DCLVASSET.PSTN-CD-STTS-CD                           CAT710  
                  ,:DCLVASSET.ISO-CRNCY-CD                              CAT710  
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                         CAT710  
                  ,:DCLVASSET.ASSET-AMT                                 CAT710  
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                         CAT710  
                  ,:DCLVASSET.BEARER-BOND-CD                            CAT710  
                  ,:DCLVASSET.BEARER-BND-STTS-CD                        CAT710  
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                           CAT710  
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                        CAT710  
                  ,:DCLVASSET.WHI-CD                                    CAT710  
                  ,:DCLVASSET.WHI-STTS-CD                               CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                         CAT710  
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                        CAT710  
                  ,:DCLVASSET.MBS-SERIAL-NBR                            CAT710  
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-CMNT-TXT                            CAT710  
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                        CAT710  
                  ,:DCLVASSET.NSCC-ACK-IND                              CAT710  
                  ,:DCLVASSET.NSCC-PEND-CD                              CAT710  
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                        CAT710  
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                        CAT710  
                  ,:DCLVASSET.NSCC-NON-ADP-IND                          CAT710  
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                          CAT710  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                        CAT710  
                  ,:DCLVASSET.OPTN-CTGY-CD                              CAT710  
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                         CAT710  
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                        CAT710  
                  ,:DCLVASSET.RCRD-STTS-CD                              CAT710  
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                        CAT710  
                  ,:DCLVASSET.CRT-TMSTP                                 CAT710  
                  ,:DCLVASSET.UPDT-TMSTP                                CAT710  
                  ,:DCLVASSET.CICS-TERM-ID-CD                           CAT710  
                  ,:DCLVASSET.PRGM-NM                                   CAT710  
                  ,:DCLVASSET.SECURITY-ADP-NBR                          CAT710  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                         CAT710  
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                         CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-CD                             CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                        CAT710  
               FROM                                                     CAT710  
                   VASSET                                               CAT710  
               WHERE                                                    CAT710  
                   CLIENT_NBR = :DCLVASSET.CLIENT-NBR                   CAT710  
                   AND  ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR  CAT710  
                   AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR        CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
              SET ASSET-FOUND TO TRUE                                   CAT710  
           ELSE                                                         CAT710  
           IF SQLCODE = +100                                            CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 SELECT ERR AT 7000-RETRIEVE-ASSET ROUTINE'   CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
                                                                        CAT710  
       7000-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7010-CHECK-ASSET-DIFFERNCE.                                      CAT710  
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                           CAT710  
                                                                        CAT710  
           IF W-NSCC-AT-ASSET-QTY > SPACE                               CAT710  
              PERFORM 7011-REFORMAT-ASSET-QTY THRU 7011-EXIT            CAT710  
              MOVE W-QTY-N  TO WS-ASSET-QTY                             CAT710  
           ELSE                                                         CAT710  
              MOVE ZERO TO WS-ASSET-QTY.                                CAT710  
                                                                        CAT710  
           IF W-NSCC-AT-ASSET-PCT > SPACE                               CAT710  
              PERFORM 7012-REFORMAT-ASSET-PCT THRU 7012-EXIT            CAT710  
              MOVE W-QTY-N   TO WS-ASSET-PCT                            CAT710  
           ELSE                                                         CAT710  
              MOVE ZERO      TO WS-ASSET-PCT.                           CAT710  
                                                                        CAT710  
           IF W-NSCC-AT-ASSET-AMT > SPACE                               CAT710  
              PERFORM 7013-REFORMAT-ASSET-AMT THRU 7013-EXIT            CAT710  
              MOVE W-QTY-N   TO WS-ASSET-AMT                            CAT710  
           ELSE                                                         CAT710  
              MOVE ZERO      TO WS-ASSET-AMT.                           CAT710  
                                                                        CAT710  
           IF (CSH-MGN-SHRT-CD  OF DCLVASSET  NOT =                     CAT710  
                W-NSCC-AT-CASH-MRGN-SHTCD)                              CAT710  
              IF (W-NSCC-AT-STL-LOC = '40')                             CAT710  
                  MOVE CSH-MGN-SHRT-CD  OF DCLVASSET TO                 CAT710  
                  W-NSCC-AT-CASH-MRGN-SHTCD                             CAT710  
              ELSE                                                      CAT710  
                 SET DIFFERENCE-FOUND TO TRUE                           CAT710  
              END-IF                                                    CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7010-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ***************************************************************** CAT710  
      *  REFORMAT ASSET QTY - UP TO 4 DECIMAL PLACES                    CAT710  
      ***************************************************************** CAT710  
       7011-REFORMAT-ASSET-QTY.                                         CAT710  
                                                                        CAT710  
           MOVE W-NSCC-AT-ASSET-QTY      TO W-QTY-X                     CAT710  
           MOVE 0                        TO W-INT                       CAT710  
                                            W-DEC                       CAT710  
                                            W-QTY-N                     CAT710  
           MOVE ' '                      TO W-COMMA-FND-SW              CAT710  
                                                                        CAT710  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT710  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT710  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT710  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT710  
                        END-IF                                          CAT710  
           END-PERFORM                                                  CAT710  
                                                                        CAT710  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT710  
               MOVE 17                   TO W-INT-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT710  
                       UNTIL W-QTY-PTR = 0                              CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT710  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT710  
               END-PERFORM                                              CAT710  
               MOVE 1                    TO W-DEC-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT710  
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT710  
                       ADD 1        TO W-DEC-PTR                        CAT710  
               END-PERFORM                                              CAT710  
           ELSE                                                         CAT710  
               MOVE W-QTY                TO W-INT                       CAT710  
           END-IF.                                                      CAT710  
           MOVE W-INT                    TO W-QTY-INT.                  CAT710  
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT710  
LRM        IF W-QTY-N NOT NUMERIC                                               
LRM            MOVE ZEROS TO W-QTY-N                                            
LRM            DISPLAY 'WIPED GARBAGE QTY FOR '                                 
LRM                     'CLT=' SV-CLIENT-NBR                                    
LRM                    ' CTL=' W-NSCC-ACAT-CTL-NBR                              
LRM                    ' TFR=' W-NSCC-AT-TFR-TYPE                               
LRM                    ' STA=' W-NSCC-STATUS                                    
LRM                    ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM                     ' VALUE ' W-NSCC-AT-ASSET-QTY                           
LRM        END-IF.                                                              
                                                                        CAT710  
       7011-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ***************************************************************** CAT710  
      *  REFORMAT ASSET PCT - UP TO 4 DECIMAL PLACES                    CAT710  
      ***************************************************************** CAT710  
       7012-REFORMAT-ASSET-PCT.                                         CAT710  
                                                                        CAT710  
           MOVE 0                        TO W-QTY-X                     CAT710  
           MOVE W-NSCC-AT-ASSET-PCT      TO W-QTY-X(3:15)               CAT710  
           MOVE 0                        TO W-INT                       CAT710  
                                            W-DEC                       CAT710  
                                            W-QTY-N                     CAT710  
           MOVE ' '                      TO W-COMMA-FND-SW              CAT710  
                                                                        CAT710  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT710  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT710  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT710  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT710  
                        END-IF                                          CAT710  
           END-PERFORM                                                  CAT710  
                                                                        CAT710  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT710  
               MOVE 17                   TO W-INT-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT710  
                       UNTIL W-QTY-PTR = 0                              CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT710  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT710  
               END-PERFORM                                              CAT710  
               MOVE 1                    TO W-DEC-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT710  
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT710  
                       ADD 1        TO W-DEC-PTR                        CAT710  
               END-PERFORM                                              CAT710  
           ELSE                                                         CAT710  
               MOVE W-QTY                TO W-INT                       CAT710  
           END-IF.                                                      CAT710  
           MOVE W-INT                    TO W-QTY-INT.                  CAT710  
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT710  
                                                                        CAT710  
       7012-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ***************************************************************** CAT710  
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                    CAT710  
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL      CAT710  
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL      CAT710  
      ***************************************************************** CAT710  
       7013-REFORMAT-ASSET-AMT.                                         CAT710  
                                                                        CAT710  
           MOVE W-NSCC-AT-ASSET-AMT      TO W-QTY-X                     CAT710  
           MOVE 0                        TO W-INT                       CAT710  
                                            W-DEC                       CAT710  
                                            W-QTY-N                     CAT710  
           MOVE ' '                      TO W-COMMA-FND-SW              CAT710  
                                                                        CAT710  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT710  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT710  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT710  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT710  
                        END-IF                                          CAT710  
           END-PERFORM                                                  CAT710  
                                                                        CAT710  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT710  
               MOVE 17                   TO W-INT-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT710  
                       UNTIL W-QTY-PTR = 0                              CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT710  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT710  
               END-PERFORM                                              CAT710  
               MOVE 1                    TO W-DEC-PTR                   CAT710  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT710  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT710  
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            CAT710  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT710  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT710  
                       ADD 1        TO W-DEC-PTR                        CAT710  
               END-PERFORM                                              CAT710  
           ELSE                                                         CAT710  
               MOVE W-QTY                TO W-INT                       CAT710  
           END-IF.                                                      CAT710  
           MOVE W-INT                    TO W-QTY-INT.                  CAT710  
           MOVE W-DEC                    TO W-QTY-DEC.                  CAT710  
LRM        IF W-QTY-N NOT NUMERIC                                               
LRM            MOVE ZEROS TO W-QTY-N                                            
LRM            DISPLAY 'WIPED GARBAGE AMT FOR '                                 
LRM                     'CLT=' SV-CLIENT-NBR                                    
LRM                    ' CTL=' W-NSCC-ACAT-CTL-NBR                              
LRM                    ' TFR=' W-NSCC-AT-TFR-TYPE                               
LRM                    ' STA=' W-NSCC-STATUS                                    
LRM                    ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM                     ' VALUE ' W-NSCC-AT-ASSET-AMT                           
LRM        END-IF.                                                              
                                                                        CAT710  
       7013-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7100-UPDATE-ASSET.                                               CAT710  
           MOVE WS-ASSET-QTY  TO ASSET-QTY OF DCLVASSET.                CAT710  
           MOVE WS-ASSET-PCT  TO ASSET-PCT OF DCLVASSET.                CAT710  
           MOVE WS-ASSET-AMT  TO ASSET-AMT OF DCLVASSET.                CAT710  
           IF   W-NSCC-AT-STL-LOC-RSN-CD = 'NSET'                       CAT710  
                MOVE 'XSET'          TO W-NSCC-AT-STL-LOC-RSN-CD        CAT710  
                ADD 1 TO W-NSET-CNT                                     CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE PSTN-CD OF DCLVASSET TO W-NSCC-AT-POS-CD                CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-POS-CD = 'N'                                   CAT710  
               MOVE 'L'              TO W-NSCC-AT-POS-CD                CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-OPT-CATG > '00'                                CAT710  
               IF W-NSCC-ATO-OPT-BS-IND = 'B'                           CAT710  
                  MOVE 'S'           TO W-NSCC-AT-POS-CD                CAT710  
               ELSE                                                     CAT710  
                  MOVE 'L'           TO W-NSCC-AT-POS-CD                CAT710  
               END-IF                                                   CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
              UPDATE VASSET                                             CAT710  
                 SET                                                    CAT710  
                    ASSET_PRC_CTGY_CD   = :W-NSCC-AT-ASSET-PRC-CATG     CAT710  
                   ,STTLM_LCTN_CD       = :W-NSCC-AT-STL-LOC            CAT710  
                   ,STTLM_RSN_CD        = :W-NSCC-AT-STL-LOC-RSN-CD     CAT710  
                   ,ISIN_CNTRY_CD       = :W-NSCC-AT-SEC-CNTRY-CD       CAT710  
                   ,ISIN_SEC_ISSUE_CD   = :W-NSCC-AT-SEC-ID             CAT710  
                   ,ISIN_SEC_CDG_CD     = :W-NSCC-AT-SEC-CHKDGT         CAT710  
                   ,ASSET_DESC_TXT      = :W-NSCC-AT-ASSET-DESC         CAT710  
                   ,ASSET_RQST_QTY_CD   = :W-NSCC-AT-ASSET-QTY-RQIND    CAT710  
                   ,AST_RQST_TRANS_CD   = :W-NSCC-AT-ASSET-REQ-TRNCD    CAT710  
                   ,ASSET_QTY           = :DCLVASSET.ASSET-QTY          CAT710  
                   ,ASSET_PCT           = :DCLVASSET.ASSET-PCT          CAT710  
TCKNEW             ,ASSET_AMT_STTS_CD   = :W-NSCC-VALUE-FREE-IND        CAT710  
                   ,PSTN_CD             = :W-NSCC-AT-POS-CD             CAT710  
                   ,ISO_CRNCY_CD        = :W-NSCC-AT-ISO-CURCY-CD       CAT710  
                   ,ASSET_AMT           = :DCLVASSET.ASSET-AMT          CAT710  
                   ,BEARER_BOND_CD      = :W-NSCC-AT-BEARER-BOND        CAT710  
                   ,CSH_MGN_SHRT_CD     = :W-NSCC-AT-CASH-MRGN-SHTCD    CAT710  
                   ,WHI_CD              = :W-NSCC-AT-WHN-ISS-IND        CAT710  
                   ,TRNFR_TYPE_RSN_CD   = :W-NSCC-AT-TFR-TYPE-RSN       CAT710  
                   ,MBS_SERIAL_NBR      = :W-NSCC-AT-MBS-SER-NT         CAT710  
                   ,ASSET_CMNT_TXT      = :W-NSCC-AT-ASSET-COMMENT      CAT710  
                   ,TRANS_RFRN_ID_CD    = :W-NSCC-AT-TRAN-REF-ID        CAT710  
                   ,OPTN_CTGY_CD        = :W-NSCC-AT-OPT-CATG           CAT710  
                   ,UPDT_TMSTP          = :W-CURRENT-TIMESTAMP          CAT710  
                   ,SECURITY_ADP_NBR    = :DCLVASSET.SECURITY-ADP-NBR   CAT710  
                   ,PRGM_NM             = 'CAT710WM'                    CAT710  
                   ,TRNFR_TYPE_CD       = :W-NSCC-AT-TFR-TYPE           CAT710  
                WHERE                                                   CAT710  
                   CLIENT_NBR           = :DCLVASSET.CLIENT-NBR         CAT710  
                   AND ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR   CAT710  
                   AND ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR      CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
TCKNEW        IF W-NSCC-VALUE-FREE-IND = 'F'                            CAT710  
TCKNEW           ADD  1   TO  WS-VALUE-FREE-CNT                         CAT710  
TCKNEW        END-IF                                                    CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 UPDATE ERROR AT 7100-UPDATE-ASSET ROUTINE'   CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
       7100-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      *----------------------------------------------------------*      CAT710  
      *          OPTION RECONCILIATION                                  CAT710  
      *----------------------------------------------------------*      CAT710  
       7200-RETRIEVE-OPTION.                                            CAT710  
           MOVE SPACE TO OPTION-FOUND-SW.                               CAT710  
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVOPTN.                CAT710  
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVOPTN. CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVOPTN.   CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               SELECT                                                   CAT710  
                    CLIENT_NBR                                          CAT710  
                   ,ACAT_CONTROL_NBR                                    CAT710  
                   ,ASSET_SEQ_NBR                                       CAT710  
                   ,BS_CD                                               CAT710  
                   ,BS_STTS_CD                                          CAT710  
                   ,PTCL_CD                                             CAT710  
                   ,PTCL_STTS_CD                                        CAT710  
                   ,OPTN_OPN_CLSD_CD                                    CAT710  
                   ,OPT_OPN_CLS_STS_CD                                  CAT710  
                   ,SYM_CD                                              CAT710  
                   ,SYM_STTS_CD                                         CAT710  
                   ,EXPTN_DT                                            CAT710  
                   ,STPRC_INTEGER_AMT                                   CAT710  
                   ,STPRC_INTR_STTS_CD                                  CAT710  
                   ,STPRC_FRCTN_AMT                                     CAT710  
                   ,STPRC_FRCT_STTS_CD                                  CAT710  
                   ,DLVR_OCC_NBR                                        CAT710  
                   ,OPTN_ACCT_TYPE_CD                                   CAT710  
                   ,OPT_ACT_TYP_STS_CD                                  CAT710  
                   ,ACCT_SUB_CD                                         CAT710  
                   ,ACCT_SUB_STTS_CD                                    CAT710  
                   ,OPTN_CMNT_TXT                                       CAT710  
                   ,OPTN_CMNT_STTS_CD                                   CAT710  
                   ,OPTN_EXPTN_DT_CD                                    CAT710  
                   ,OPT_OCC_DLV_STS_CD                                  CAT710  
                   ,ACCT_TYPE_MSMT_IND                                  CAT710  
                   ,CRT_TMSTP                                           CAT710  
                   ,UPDT_TMSTP                                          CAT710  
                   ,PRGM_NM                                             CAT710  
                   ,CICS_TERM_ID_CD                                     CAT710  
DJ0003             ,STPRC_DEC_FRCN_IND                                  CAT710  
                 INTO                                                   CAT710  
                   :DCLVOPTN.CLIENT-NBR                                 CAT710  
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                           CAT710  
                  ,:DCLVOPTN.ASSET-SEQ-NBR                              CAT710  
                  ,:DCLVOPTN.BS-CD                                      CAT710  
                  ,:DCLVOPTN.BS-STTS-CD                                 CAT710  
                  ,:DCLVOPTN.PTCL-CD                                    CAT710  
                  ,:DCLVOPTN.PTCL-STTS-CD                               CAT710  
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                           CAT710  
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                         CAT710  
                  ,:DCLVOPTN.SYM-CD                                     CAT710  
                  ,:DCLVOPTN.SYM-STTS-CD                                CAT710  
                  ,:DCLVOPTN.EXPTN-DT                                   CAT710  
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                          CAT710  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                         CAT710  
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                            CAT710  
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                         CAT710  
                  ,:DCLVOPTN.DLVR-OCC-NBR                               CAT710  
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                          CAT710  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                         CAT710  
                  ,:DCLVOPTN.ACCT-SUB-CD                                CAT710  
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                           CAT710  
                  ,:DCLVOPTN.OPTN-CMNT-TXT                              CAT710  
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                          CAT710  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                           CAT710  
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                         CAT710  
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                         CAT710  
                  ,:DCLVOPTN.CRT-TMSTP                                  CAT710  
                  ,:DCLVOPTN.UPDT-TMSTP                                 CAT710  
                  ,:DCLVOPTN.PRGM-NM                                    CAT710  
                  ,:DCLVOPTN.CICS-TERM-ID-CD                            CAT710  
DJ0003            ,:DCLVOPTN.STPRC-DEC-FRCN-IND                         CAT710  
                 FROM                                                   CAT710  
                    VOPTN                                               CAT710  
                WHERE                                                   CAT710  
                    CLIENT_NBR = :DCLVOPTN.CLIENT-NBR                   CAT710  
                    AND  ACAT_CONTROL_NBR = :DCLVOPTN.ACAT-CONTROL-NBR  CAT710  
                    AND  ASSET_SEQ_NBR = :DCLVOPTN.ASSET-SEQ-NBR        CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
              ADD 1 TO VOPTN-FND-CNT                                    CAT710  
              SET OPTION-FOUND TO TRUE                                  CAT710  
           ELSE                                                         CAT710  
              ADD 1 TO VOPTN-NOTFND-CNT                                 CAT710  
           IF SQLCODE = +100                                            CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 SELECT ERR AT 7200-RETRIEVE-OPTION ROUTINE'  CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
       7200-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7210-CHECK-OPTION-DIFFERENCE.                                    CAT710  
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                           CAT710  
                                                                        CAT710  
*          IF  W-NSCC-ATO-OPT-EXP-DT (5:2) = '00'                       CAT710  
*              MOVE '20' TO W-NSCC-ATO-OPT-EXP-DT (5:2)                 CAT710  
*          END-IF                                                       CAT710  
                                                                        CAT710  
           IF  W-NSCC-ATO-OPT-EXP-DT > ' '                              CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-DT (5:2) TO WK-DT-1 (1:2)        CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-DT (3:2) TO WK-DT-1 (3:2)        CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-DT (1:2) TO WK-DT-2              CAT710  
               MOVE '01'                        TO WK-DT-3              CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                          ' ' SV-CLIENT-NBR,                            CAT710  
                          ' ' W-NSCC-ACAT-CTL-NBR                       CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' OPT=' W-NSCC-ATO-OPT-SYM                        CAT710  
                      ' OPT-EXP-DT(MMYYCC) IS INVALID: '                CAT710  
                                          W-NSCC-ATO-OPT-EXP-DT         CAT710  
                      '  DEFAULT TO 0001-01-01'                         CAT710  
               MOVE '0001'                      TO WK-DT-1              CAT710  
               MOVE '01'                        TO WK-DT-2              CAT710  
               MOVE '01'                        TO WK-DT-3              CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF  W-NSCC-ATO-OPT-EXP-DT (1:2) > '12'                       CAT710  
           AND W-NSCC-ATO-OPT-EXP-DT (5:2) < '19'                       CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                          ' ' SV-CLIENT-NBR,                            CAT710  
                          ' ' W-NSCC-ACAT-CTL-NBR                       CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' OPT=' W-NSCC-ATO-OPT-SYM                        CAT710  
                        ' OPT-EXP-DT(MMYYCC) IS INVALID: '              CAT710  
                                            W-NSCC-ATO-OPT-EXP-DT       CAT710  
                        '  SWAPPING MM AND CC'                          CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-DT (1:2) TO WK-DT-1 (1:2)       CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-DT (3:2) TO WK-DT-1 (3:2)       CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-DT (5:2) TO WK-DT-2             CAT710  
                MOVE '01'                        TO WK-DT-3             CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-DATE-CC TO WS-DATE-CC                                 CAT710  
           MOVE W-DATE-YY TO WS-DATE-YY                                 CAT710  
           MOVE W-DATE-MM TO WS-DATE-MM                                 CAT710  
           MOVE W-DATE-DD TO WS-DATE-DD                                 CAT710  
           IF  (W-DATE-MM             > '12' OR                         CAT710  
                W-DATE-MM             < '01')                           CAT710  
           OR  (W-DATE-CC             < '00')                           CAT710  
           OR  (W-DATE-CC             > '99')                           CAT710  
           OR  (W-DATE-YY             < '00')                           CAT710  
           OR  (W-DATE-YY             > '99')                           CAT710  
           OR  WS-DATE-CCYYMMDD NOT NUMERIC                             CAT710  
               DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
                          ' ' SV-CLIENT-NBR,                            CAT710  
                          ' ' W-NSCC-ACAT-CTL-NBR                       CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' OPT=' W-NSCC-ATO-OPT-SYM                        CAT710  
                      ' BAD DATE W-NSCC-ATO-OPT-EXP-DT = '              CAT710  
                                 W-NSCC-ATO-OPT-EXP-DT                  CAT710  
                 MOVE  '0001'             TO  WK-DT-1                   CAT710  
                 MOVE  '01'               TO  WK-DT-2                   CAT710  
                 MOVE  '01'               TO  WK-DT-3                   CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           IF W-NSCC-ATO-OPT-STKPRC-INT > SPACE                         CAT710  
              MOVE W-NSCC-ATO-OPT-STKPRC-INT                            CAT710  
                TO WS-STRIKE-PRICE-INT                                  CAT710  
           ELSE                                                         CAT710  
              MOVE ZERO TO WS-STRIKE-PRICE-INT-N.                       CAT710  
                                                                        CAT710  
           IF W-NSCC-ATO-OPT-STKPRC-FRC > SPACE                         CAT710  
              MOVE W-NSCC-ATO-OPT-STKPRC-FRC                            CAT710  
                TO WS-STRIKE-PRICE-FRC                                  CAT710  
           ELSE                                                         CAT710  
              MOVE ZERO TO WS-STRIKE-PRICE-FRC-N.                       CAT710  
                                                                        CAT710  
       7210-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7300-UPDATE-OPTION.                                              CAT710  
           MOVE WK-FMT-DATE TO EXPTN-DT OF DCLVOPTN.                    CAT710  
           MOVE WS-STRIKE-PRICE-INT-N TO STPRC-INTEGER-AMT OF DCLVOPTN. CAT710  
           MOVE WS-STRIKE-PRICE-FRC-N TO STPRC-FRCTN-AMT   OF DCLVOPTN. CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
              UPDATE VOPTN                                              CAT710  
                 SET                                                    CAT710  
                     BS_CD              = :W-NSCC-ATO-OPT-BS-IND        CAT710  
                    ,PTCL_CD            = :W-NSCC-ATO-OPT-PC-IND        CAT710  
                    ,OPTN_OPN_CLSD_CD   = :W-NSCC-ATO-OPT-OC-IND        CAT710  
                    ,SYM_CD             = :W-NSCC-ATO-OPT-SYM           CAT710  
                    ,EXPTN_DT           = :DCLVOPTN.EXPTN-DT            CAT710  
                    ,STPRC_INTEGER_AMT  = :DCLVOPTN.STPRC-INTEGER-AMT   CAT710  
                    ,STPRC_FRCTN_AMT    = :DCLVOPTN.STPRC-FRCTN-AMT     CAT710  
                    ,DLVR_OCC_NBR       = :W-NSCC-ATO-OPT-OCC-DEL-NBR   CAT710  
                    ,OPTN_ACCT_TYPE_CD  = :W-NSCC-ATO-OPT-ACCT-TYP      CAT710  
                    ,ACCT_SUB_CD        = :W-NSCC-ATO-SUB-ACCT-ID       CAT710  
                    ,OPTN_CMNT_TXT      = :W-NSCC-ATO-OPT-COMMENT       CAT710  
                    ,UPDT_TMSTP         = :W-CURRENT-TIMESTAMP          CAT710  
                    ,PRGM_NM            = 'CAT710WM'                    CAT710  
DJ0003              ,STPRC_DEC_FRCN_IND = :W-NSCC-ATO-OPT-DEC-FRAC-IND  CAT710  
                WHERE                                                   CAT710  
                   CLIENT_NBR           = :DCLVOPTN.CLIENT-NBR          CAT710  
                   AND ACAT_CONTROL_NBR = :DCLVOPTN.ACAT-CONTROL-NBR    CAT710  
                   AND ASSET_SEQ_NBR    = :DCLVOPTN.ASSET-SEQ-NBR       CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 UPDATE ERROR AT 7300-UPDATE-OPTION ROUTINE'  CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
       7300-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7400-RETRIEVE-MUTUAL.                                            CAT710  
           MOVE SPACE TO MUTUAL-FUND-FOUND-SW                           CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVMF.     CAT710  
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVMF.                  CAT710  
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVMF.   CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVMF.     CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               SELECT                                                   CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,ASSET_SEQ_NBR                                        CAT710  
                  ,BK_PHSCL_SHR_CD                                      CAT710  
                  ,BK_PHSC_SHR_STS_CD                                   CAT710  
                  ,NTWRK_CNTL_CD                                        CAT710  
                  ,NTWRK_CNTL_STTS_CD                                   CAT710  
                  ,ACCT_TYPE_CD                                         CAT710  
                  ,ACCT_TYPE_STTS_CD                                    CAT710  
                  ,DVDND_CD                                             CAT710  
                  ,DVDND_STTS_CD                                        CAT710  
                  ,DVDND_PAYEE_CD                                       CAT710  
                  ,DVDND_PYE_STTS_CD                                    CAT710  
                  ,LTCG_CD                                              CAT710  
                  ,BRKR_EXCTG_NBR                                       CAT710  
                  ,BRKR_EXCTG_STTS_CD                                   CAT710  
                  ,STCG_CD                                              CAT710  
                  ,MF_FULL_PRTL_CD                                      CAT710  
                  ,MF_FUL_PRTL_STS_CD                                   CAT710  
                  ,RGSTN_CD                                             CAT710  
                  ,FNBR                                                 CAT710  
                  ,FND_ACT_NBR_STS_CD                                   CAT710  
                  ,DSTBN_SIDE_CD                                        CAT710  
                  ,PRCS_DT                                              CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,PRGM_NM                                              CAT710  
DJ0003            ,FCST_RCVR_STTS_CD                                    CAT710  
DJ0003            ,FCST_ACCT_RCVR_NBR                                   CAT710  
               INTO                                                     CAT710  
                   :DCLVMF.CLIENT-NBR                                   CAT710  
                  ,:DCLVMF.ACAT-CONTROL-NBR                             CAT710  
                  ,:DCLVMF.ASSET-SEQ-NBR                                CAT710  
                  ,:DCLVMF.BK-PHSCL-SHR-CD                              CAT710  
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                           CAT710  
                  ,:DCLVMF.NTWRK-CNTL-CD                                CAT710  
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                           CAT710  
                  ,:DCLVMF.ACCT-TYPE-CD                                 CAT710  
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                            CAT710  
                  ,:DCLVMF.DVDND-CD                                     CAT710  
                  ,:DCLVMF.DVDND-STTS-CD                                CAT710  
                  ,:DCLVMF.DVDND-PAYEE-CD                               CAT710  
                  ,:DCLVMF.DVDND-PYE-STTS-CD                            CAT710  
                  ,:DCLVMF.LTCG-CD                                      CAT710  
                  ,:DCLVMF.BRKR-EXCTG-NBR                               CAT710  
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                           CAT710  
                  ,:DCLVMF.STCG-CD                                      CAT710  
                  ,:DCLVMF.MF-FULL-PRTL-CD                              CAT710  
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                           CAT710  
                  ,:DCLVMF.RGSTN-CD                                     CAT710  
                  ,:DCLVMF.FNBR                                         CAT710  
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                           CAT710  
                  ,:DCLVMF.DSTBN-SIDE-CD                                CAT710  
                  ,:DCLVMF.PRCS-DT                                      CAT710  
                  ,:DCLVMF.CRT-TMSTP                                    CAT710  
                  ,:DCLVMF.UPDT-TMSTP                                   CAT710  
                  ,:DCLVMF.CICS-TERM-ID-CD                              CAT710  
                  ,:DCLVMF.PRGM-NM                                      CAT710  
DJ0003            ,:DCLVMF.FCST-RCVR-STTS-CD                            CAT710  
DJ0003            ,:DCLVMF.FCST-ACCT-RCVR-NBR                           CAT710  
                FROM                                                    CAT710  
                    VMF                                                 CAT710  
                WHERE                                                   CAT710  
                    CLIENT_NBR = :DCLVMF.CLIENT-NBR                     CAT710  
                    AND  ACAT_CONTROL_NBR = :DCLVMF.ACAT-CONTROL-NBR    CAT710  
                    AND  ASSET_SEQ_NBR = :DCLVMF.ASSET-SEQ-NBR          CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
              ADD 1 TO VMF-FND-CNT                                      CAT710  
              SET MUTUAL-FUND-FOUND TO TRUE                             CAT710  
           ELSE                                                         CAT710  
              ADD 1 TO VMF-NOTFND-CNT                                   CAT710  
           IF SQLCODE = +100                                            CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 SELECT ERROR AT 7400-RETRIEVE-MUTUAL ROUTINE'CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
       7400-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7410-CHECK-MUTUAL-DIFFERENCE.                                    CAT710  
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                           CAT710  
                                                                        CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '3' OR '4'            CAT710  
                MOVE 'C'             TO DVDND-CD           OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO DVDND-CD           OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '5' OR '7'            CAT710  
                MOVE 'C'             TO LTCG-CD            OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO LTCG-CD            OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '4' OR '5' OR '6'            CAT710  
                MOVE 'C'             TO STCG-CD            OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO STCG-CD            OF DCLVMF    CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7410-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7500-UPDATE-MUTUAL.                                              CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
              UPDATE VMF                                                CAT710  
                 SET                                                    CAT710  
                    BK_PHSCL_SHR_CD   = :W-NSCC-ATF-PHSCL-SHR-IND       CAT710  
                   ,NTWRK_CNTL_CD     = :W-NSCC-ATF-NTWRK-CTL-IND       CAT710  
                   ,ACCT_TYPE_CD      = :W-NSCC-ATF-ACCT-TYP-IND        CAT710  
                   ,DVDND_CD          = :DCLVMF.DVDND-CD                CAT710  
                   ,LTCG_CD           = :DCLVMF.LTCG-CD                 CAT710  
                   ,STCG_CD           = :DCLVMF.STCG-CD                 CAT710  
                   ,DVDND_PAYEE_CD    = :W-NSCC-ATF-DIV-PAYEE-IND       CAT710  
                   ,BRKR_EXCTG_NBR    = :W-NSCC-ATF-EXEC-BRKR           CAT710  
                   ,MF_FULL_PRTL_CD   = :W-NSCC-ATF-FULL-PART-IND       CAT710  
                   ,FNBR              = :W-NSCC-ATF-CUS-ACCT            CAT710  
                   ,UPDT_TMSTP        = :W-CURRENT-TIMESTAMP            CAT710  
                   ,PRGM_NM           = 'CAT710WM'                      CAT710  
DJ0003             ,FCST_ACCT_RCVR_NBR = :W-NSCC-ATF-FUND-CUST-ACCT-RCV CAT710  
                WHERE                                                   CAT710  
                   CLIENT_NBR           = :DCLVMF.CLIENT-NBR            CAT710  
                   AND ACAT_CONTROL_NBR = :DCLVMF.ACAT-CONTROL-NBR      CAT710  
                   AND ASSET_SEQ_NBR    = :DCLVMF.ASSET-SEQ-NBR         CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           IF SQLCODE = 0                                               CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
              DISPLAY 'DB2 UPDATE ERR AT 7500-UPDATE-MUTUAL ROUTINE'    CAT710  
              PERFORM 8500-SQL-ERROR-ROUTINE.                           CAT710  
       7500-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7600-INSERT-VTRNFR.                                              CAT710  
           MOVE '7600-INSERT-VTRNFR     ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           MOVE ' '                  TO DCLVTRNFR                       CAT710  
           MOVE SV-CLIENT-NBR        TO CLIENT-NBR         OF DCLVTRNFR CAT710  
                                                                        CAT710  
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR              CAT710  
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVTRNFR CAT710  
           ELSE                                                         CAT710  
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVTRNFR CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-NSCC-ACAT-CTL-NBR  TO ACAT-CONTROL-NBR   OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE W-NSCC-PROC-YEAR     TO W-DATE-YEAR                     CAT710  
           MOVE W-NSCC-PROC-MM       TO W-DATE-MM                       CAT710  
           MOVE W-NSCC-PROC-DD       TO W-DATE-DD                       CAT710  
           IF  (W-DATE-MM             > '12' OR                         CAT710  
                W-DATE-MM             < '01')                           CAT710  
           OR  (W-DATE-DD             > '31' OR                         CAT710  
                W-DATE-DD             < '01')                           CAT710  
           OR  (W-DATE-YEAR           < '0001')                         CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                       ' CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' W-NSCC-PROC-DATE INVALID: '                    CAT710  
                         W-NSCC-PROC-DATE                               CAT710  
                      '  DEFAULT TO 0001-01-01'                         CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-DATE               TO PRCS-DT            OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE '00'                 TO CYCLE-CD           OF DCLVTRNFR CAT710  
           MOVE '0'                  TO SYS-ACT-CD         OF DCLVTRNFR CAT710  
           MOVE '  '                 TO SYS-RJCT-RSN-CD    OF DCLVTRNFR CAT710  
           MOVE W-NSCC-STATUS        TO STTS-CD            OF DCLVTRNFR CAT710  
           MOVE W-NSCC-DAYS-IN-STATUS                                   CAT710  
                                     TO DAYS-STTS-QTY      OF DCLVTRNFR CAT710  
           MOVE 01                   TO PHSCL-SEQ-NBR      OF DCLVTRNFR CAT710  
           MOVE 01                   TO LGCL-SEQ-NBR       OF DCLVTRNFR CAT710  
           MOVE 'A'                  TO TRANS-TYPE-CD      OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-TFR-TYPE   TO TRNFR-TYPE-CD      OF DCLVTRNFR CAT710  
           MOVE W-NSCC-DIST-PARTICIPANT                                 CAT710  
                                     TO SBMTG-PRTCP-NBR    OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-NBR    TO RCV-NBR            OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-DEL-NBR    TO DLVR-NBR           OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-ACCT-NBR                                  CAT710  
                                     TO ACCT-RCV-NBR       OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-CUST-NAME                                 CAT710  
                                     TO RCV-CUST-NM        OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-SSN-PRM                                   CAT710  
                                     TO RCV-SS-PRIM-NBR    OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-SSN-SEC                                   CAT710  
                                     TO RCV-SS-SCNDY-NBR   OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-ACCT-TYPE                                 CAT710  
                                     TO RCV-ACCT-TYPE-CD   OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-OCC-BRKR                                  CAT710  
                                     TO RCV-OCC-BRKR-NBR   OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-RCV-CRSPN-NBR                                 CAT710  
                                     TO RCV-CRSPN-NBR      OF DCLVTRNFR CAT710  
LRM008     MOVE W-NSCC-TI-CONTRA-PART-TYPE                              CAT710  
LRM008                               TO PRTCP-CONTRA-CD    OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-DEL-ACCT-NBR                                  CAT710  
                                     TO ACCT-DLVR-NBR      OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-TFR-TYPE-REJ                                  CAT710  
                                     TO TRNFR-TYPE-RJCT-CD OF DCLVTRNFR CAT710  
           MOVE W-NSCC-TI-ASSC-CTL-NBR                                  CAT710  
                                     TO ACAT-CNTL-ASTD-NBR OF DCLVTRNFR CAT710  
                                                                        CAT710  
           IF   W-NSCC-TI-ASSC-STL-DT > ' '                             CAT710  
                MOVE W-NSCC-TI-ASSC-STL-YEAR TO W-DATE-YEAR             CAT710  
                MOVE W-NSCC-TI-ASSC-STL-MM   TO W-DATE-MM               CAT710  
                MOVE W-NSCC-TI-ASSC-STL-DD   TO W-DATE-DD               CAT710  
           ELSE                                                         CAT710  
                MOVE '0001'                  TO W-DATE-YEAR             CAT710  
                MOVE '01'                    TO W-DATE-MM               CAT710  
                MOVE '01'                    TO W-DATE-DD               CAT710  
           END-IF                                                       CAT710  
           IF  (W-DATE-MM             > '12' OR                         CAT710  
                W-DATE-MM             < '01')                           CAT710  
           OR  (W-DATE-DD             > '31' OR                         CAT710  
                W-DATE-DD             < '01')                           CAT710  
           OR  (W-DATE-YEAR           < '0001')                         CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                       ' CLT=' SV-CLIENT-NBR                            CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' W-NSCC-TI-ASSC-STL-DT INVALID: '               CAT710  
                         W-NSCC-TI-ASSC-STL-DT                          CAT710  
                      '  DEFAULT TO 0001-01-01'                         CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
           MOVE W-DATE               TO STTLM-ASCTD-DT     OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE W-NSCC-TI-TRAN-REF-ID                                   CAT710  
                                     TO TRANS-RFRN-ID-CD   OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE W-NSCC-TI-COMMENTS   TO CMNT-TXT           OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE 'CAT710WM'           TO PRGM-NM            OF DCLVTRNFR CAT710  
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVTRNFR CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVTRNFR CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVTRNFR CAT710  
           MOVE ' '                  TO NSCC-ACK-IND       OF DCLVTRNFR CAT710  
           MOVE ' '                  TO NSCC-PEND-CD       OF DCLVTRNFR CAT710  
           MOVE ' '                  TO TRNFR-TYPE-RJC1-CD OF DCLVTRNFR CAT710  
           MOVE ' '                  TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR CAT710  
           MOVE ' '                  TO BRANCH-CD          OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-CD            OF DCLVTRNFR CAT710  
           MOVE ' '                  TO RR-CD              OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACM-HOLDER-NAA-CD  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO CASH-SWEEP-NAA-CD  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO DVDND-NAA-CD       OF DCLVTRNFR CAT710  
           MOVE ' '                  TO SELL-INSTN-NAA-CD  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO DB-CR-CD           OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-ACTIVITY-IND  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-AST-EXCS-IND  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-BRKR-TIF-IND  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-CUST-70-IND   OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-DLRV-PRGR-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-MNGD-IND      OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-MRGN-DB-IND   OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-NA-UPDT-IND   OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-ORDERS-IND    OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-PRVT-RNG-IND  OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-QULFD-PLN-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-RJCT-RSBM-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR CAT710  
           MOVE ' '                  TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR CAT710  
           MOVE 0                    TO ACCT-EQUITY-AMT    OF DCLVTRNFR CAT710  
           MOVE 0                    TO ACCT-IRA-MAINT-AMT OF DCLVTRNFR CAT710  
           MOVE 0                    TO ACCT-IRA-TRMNT-AMT OF DCLVTRNFR CAT710  
           MOVE 0                    TO ACCT-TRNFR-FEE-AMT OF DCLVTRNFR CAT710  
LRM007     IF PARM-WM-RUN                                                       
LRM007     AND W-NSCC-STATUS > 299 AND                                  CAT710  
LRM007        W-NSCC-SETTLEMENT-DATE       > '00000000'                 CAT710  
LRM007        MOVE W-NSCC-SETTLEMENT-DATE TO  WK-DATE                   CAT710  
LRM007              MOVE WK-DT-YYYY       TO  WK-DT-1                   CAT710  
LRM007              MOVE WK-DT-MM         TO  WK-DT-2                   CAT710  
LRM007              MOVE WK-DT-DD         TO  WK-DT-3                   CAT710  
LRM007              MOVE WK-FMT-DATE TO STTLM-DT           OF DCLVTRNFR CAT710  
LRM007        MOVE  W-NSCC-VALUE-FREE-IND    TO  WS-VAL-FREE-CD         CAT710  
LRM007     ELSE                                                         CAT710  
              MOVE '0001-01-01'      TO STTLM-DT           OF DCLVTRNFR CAT710  
              MOVE 'V'               TO VAL-FREE-CD        OF DCLVTRNFR CAT710  
LRM007     END-IF.                                                              
           MOVE ' '                  TO STTLM-TM-CD        OF DCLVTRNFR CAT710  
                                                                        CAT710  
           MOVE ' '                  TO NSCC-NON-ADP-IND   OF DCLVTRNFR CAT710  
                                                                        CAT710  
           IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR            CAT710  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(1:3)                         CAT710  
                                              TO BRANCH-CD OF DCLVTRNFR CAT710  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(4:5)                         CAT710  
                                              TO ACCT-CD   OF DCLVTRNFR CAT710  
           ELSE                                                         CAT710  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(1:3)                         CAT710  
                                              TO BRANCH-CD OF DCLVTRNFR CAT710  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(4:5)                         CAT710  
                                              TO ACCT-CD   OF DCLVTRNFR CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               INSERT INTO VTRNFR                                       CAT710  
                 (                                                      CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,DSTBN_SIDE_CD                                        CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,PRCS_DT                                              CAT710  
                  ,CYCLE_CD                                             CAT710  
                  ,SYS_ACT_CD                                           CAT710  
                  ,SYS_RJCT_RSN_CD                                      CAT710  
                  ,STTS_CD                                              CAT710  
                  ,DAYS_STTS_QTY                                        CAT710  
                  ,RCRD_STTS_CD                                         CAT710  
                  ,RCRD_LNGTH_STTS_CD                                   CAT710  
                  ,PHSCL_SEQ_STTS_CD                                    CAT710  
                  ,LGCL_SEQ_NR_STS_CD                                   CAT710  
                  ,TRANS_TYPE_STTS_CD                                   CAT710  
                  ,CONTROL_NBR_STS_CD                                   CAT710  
                  ,TRNFR_TYPE_STTS_CD                                   CAT710  
                  ,SBMT_PRT_NR_STS_CD                                   CAT710  
                  ,RCV_NBR_STTS_CD                                      CAT710  
                  ,DLVR_NBR_STTS_CD                                     CAT710  
                  ,ACCT_RCV_STTS_CD                                     CAT710  
                  ,RCV_CUST_NM_STS_CD                                   CAT710  
                  ,RCV_SS_PRIM_STS_CD                                   CAT710  
                  ,RCV_SS_SCDY_STS_CD                                   CAT710  
                  ,RCV_ACT_TYP_STS_CD                                   CAT710  
                  ,RCV_OCC_STTS_CD                                      CAT710  
                  ,RCV_CRSPN_STTS_CD                                    CAT710  
                  ,ACCT_DLVR_STTS_CD                                    CAT710  
                  ,TRN_TYP_RJC_STS_CD                                   CAT710  
                  ,CNTL_ASTD_STTS_CD                                    CAT710  
                  ,STTLM_ASCTD_STS_CD                                   CAT710  
                  ,TRANS_RFRN_STTS_CD                                   CAT710  
                  ,CMNT_STTS_CD                                         CAT710  
                  ,PHSCL_SEQ_NBR                                        CAT710  
                  ,LGCL_SEQ_NBR                                         CAT710  
                  ,TRANS_TYPE_CD                                        CAT710  
                  ,TRNFR_TYPE_CD                                        CAT710  
                  ,SBMTG_PRTCP_NBR                                      CAT710  
                  ,RCV_NBR                                              CAT710  
                  ,DLVR_NBR                                             CAT710  
                  ,ACCT_RCV_NBR                                         CAT710  
                  ,RCV_CUST_NM                                          CAT710  
                  ,RCV_SS_PRIM_NBR                                      CAT710  
                  ,RCV_SS_SCNDY_NBR                                     CAT710  
                  ,RCV_ACCT_TYPE_CD                                     CAT710  
                  ,RCV_OCC_BRKR_NBR                                     CAT710  
                  ,RCV_CRSPN_NBR                                        CAT710  
                  ,PRTCP_CONTRA_CD                                      CAT710  
                  ,ACCT_DLVR_NBR                                        CAT710  
                  ,TRNFR_TYPE_RJCT_CD                                   CAT710  
                  ,ACAT_CNTL_ASTD_NBR                                   CAT710  
                  ,STTLM_ASCTD_DT                                       CAT710  
                  ,TRANS_RFRN_ID_CD                                     CAT710  
                  ,CMNT_TXT                                             CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,DB_CR_CD                                             CAT710  
                  ,NSCC_ACK_IND                                         CAT710  
                  ,NSCC_PEND_CD                                         CAT710  
                  ,PRGM_NM                                              CAT710  
                  ,TRNFR_TYPE_RJC1_CD                                   CAT710  
                  ,TRNFR_TYPE_RJC2_CD                                   CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,ACCT_ACTIVITY_IND                                    CAT710  
                  ,ACCT_AST_EXCS_IND                                    CAT710  
                  ,ACCT_BRKR_TIF_IND                                    CAT710  
                  ,ACCT_CD                                              CAT710  
                  ,ACCT_CUST_70_IND                                     CAT710  
                  ,ACCT_DB_BAL_T1_IND                                   CAT710  
                  ,ACCT_DLRV_PRGR_IND                                   CAT710  
                  ,ACCT_DPLCT_TRN_IND                                   CAT710  
                  ,ACCT_EQUITY_AMT                                      CAT710  
                  ,ACCT_IRA_MAINT_AMT                                   CAT710  
                  ,ACCT_IRA_TRMNT_AMT                                   CAT710  
                  ,ACCT_LTD_PRTNR_IND                                   CAT710  
                  ,ACCT_MNGD_IND                                        CAT710  
                  ,ACCT_MRGN_DB_IND                                     CAT710  
                  ,ACCT_NA_UPDT_IND                                     CAT710  
                  ,ACCT_OPTN_PSTN_IND                                   CAT710  
                  ,ACCT_ORDERS_IND                                      CAT710  
                  ,ACCT_PRVT_RNG_IND                                    CAT710  
                  ,ACCT_QULFD_PLN_IND                                   CAT710  
                  ,ACCT_RJCT_RSBM_IND                                   CAT710  
                  ,ACCT_SEC_RSTRD_IND                                   CAT710  
                  ,ACCT_SHRT_PSTN_IND                                   CAT710  
                  ,ACCT_TIN_MSMTH_IND                                   CAT710  
                  ,ACCT_TRNFR_FEE_AMT                                   CAT710  
                  ,ACM_HOLDER_NAA_CD                                    CAT710  
                  ,BRANCH_CD                                            CAT710  
                  ,CASH_SWEEP_NAA_CD                                    CAT710  
                  ,DVDND_NAA_CD                                         CAT710  
                  ,NSCC_NON_ADP_IND                                     CAT710  
                  ,RR_CD                                                CAT710  
                  ,SELL_INSTN_NAA_CD                                    CAT710  
                  ,STTLM_DT                                             CAT710  
                  ,STTLM_TM_CD                                          CAT710  
                  ,VAL_FREE_CD                                          CAT710  
                 )                                                      CAT710  
                 VALUES                                                 CAT710  
                 (                                                      CAT710  
                   :DCLVTRNFR.CLIENT-NBR                                CAT710  
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             CAT710  
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          CAT710  
                  ,:DCLVTRNFR.PRCS-DT                                   CAT710  
                  ,:DCLVTRNFR.CYCLE-CD                                  CAT710  
                  ,:DCLVTRNFR.SYS-ACT-CD                                CAT710  
                  ,:DCLVTRNFR.SYS-RJCT-RSN-CD                           CAT710  
                  ,:DCLVTRNFR.STTS-CD                                   CAT710  
                  ,:DCLVTRNFR.DAYS-STTS-QTY                             CAT710  
                  ,:DCLVTRNFR.RCRD-STTS-CD                              CAT710  
                  ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                        CAT710  
                  ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                         CAT710  
                  ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                        CAT710  
                  ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                        CAT710  
                  ,:DCLVTRNFR.CONTROL-NBR-STS-CD                        CAT710  
                  ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                        CAT710  
                  ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                        CAT710  
                  ,:DCLVTRNFR.RCV-NBR-STTS-CD                           CAT710  
                  ,:DCLVTRNFR.DLVR-NBR-STTS-CD                          CAT710  
                  ,:DCLVTRNFR.ACCT-RCV-STTS-CD                          CAT710  
                  ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                        CAT710  
                  ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                        CAT710  
                  ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                        CAT710  
                  ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                        CAT710  
                  ,:DCLVTRNFR.RCV-OCC-STTS-CD                           CAT710  
                  ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                         CAT710  
                  ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                         CAT710  
                  ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                        CAT710  
                  ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                         CAT710  
                  ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                        CAT710  
                  ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                        CAT710  
                  ,:DCLVTRNFR.CMNT-STTS-CD                              CAT710  
                  ,:DCLVTRNFR.PHSCL-SEQ-NBR                             CAT710  
                  ,:DCLVTRNFR.LGCL-SEQ-NBR                              CAT710  
                  ,:DCLVTRNFR.TRANS-TYPE-CD                             CAT710  
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                             CAT710  
                  ,:DCLVTRNFR.SBMTG-PRTCP-NBR                           CAT710  
                  ,:DCLVTRNFR.RCV-NBR                                   CAT710  
                  ,:DCLVTRNFR.DLVR-NBR                                  CAT710  
                  ,:DCLVTRNFR.ACCT-RCV-NBR                              CAT710  
                  ,:DCLVTRNFR.RCV-CUST-NM                               CAT710  
                  ,:DCLVTRNFR.RCV-SS-PRIM-NBR                           CAT710  
                  ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                          CAT710  
                  ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                          CAT710  
                  ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                          CAT710  
                  ,:DCLVTRNFR.RCV-CRSPN-NBR                             CAT710  
                  ,:DCLVTRNFR.PRTCP-CONTRA-CD                           CAT710  
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                             CAT710  
                  ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                        CAT710  
                  ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                        CAT710  
                  ,:DCLVTRNFR.STTLM-ASCTD-DT                            CAT710  
                  ,:DCLVTRNFR.TRANS-RFRN-ID-CD                          CAT710  
                  ,:DCLVTRNFR.CMNT-TXT                                  CAT710  
                  ,:DCLVTRNFR.CICS-TERM-ID-CD                           CAT710  
                  ,:DCLVTRNFR.CRT-TMSTP                                 CAT710  
                  ,:DCLVTRNFR.DB-CR-CD                                  CAT710  
                  ,:DCLVTRNFR.NSCC-ACK-IND                              CAT710  
                  ,:DCLVTRNFR.NSCC-PEND-CD                              CAT710  
                  ,:DCLVTRNFR.PRGM-NM                                   CAT710  
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                        CAT710  
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                        CAT710  
                  ,:DCLVTRNFR.UPDT-TMSTP                                CAT710  
                  ,:DCLVTRNFR.ACCT-ACTIVITY-IND                         CAT710  
                  ,:DCLVTRNFR.ACCT-AST-EXCS-IND                         CAT710  
                  ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                         CAT710  
                  ,:DCLVTRNFR.ACCT-CD                                   CAT710  
                  ,:DCLVTRNFR.ACCT-CUST-70-IND                          CAT710  
                  ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-EQUITY-AMT                           CAT710  
                  ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                        CAT710  
                  ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                        CAT710  
                  ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-MNGD-IND                             CAT710  
                  ,:DCLVTRNFR.ACCT-MRGN-DB-IND                          CAT710  
                  ,:DCLVTRNFR.ACCT-NA-UPDT-IND                          CAT710  
                  ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-ORDERS-IND                           CAT710  
                  ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                         CAT710  
                  ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                        CAT710  
                  ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                        CAT710  
                  ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                         CAT710  
                  ,:DCLVTRNFR.BRANCH-CD                                 CAT710  
                  ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                         CAT710  
                  ,:DCLVTRNFR.DVDND-NAA-CD                              CAT710  
                  ,:DCLVTRNFR.NSCC-NON-ADP-IND                          CAT710  
                  ,:DCLVTRNFR.RR-CD                                     CAT710  
                  ,:DCLVTRNFR.SELL-INSTN-NAA-CD                         CAT710  
                  ,:DCLVTRNFR.STTLM-DT                                  CAT710  
                  ,:DCLVTRNFR.STTLM-TM-CD                               CAT710  
                  ,:DCLVTRNFR.VAL-FREE-CD                               CAT710  
                 )                                                      CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME            CAT710  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT710  
           MOVE SQLCODE                  TO W-DB2-SQLCODE.              CAT710  
                                                                        CAT710  
           IF  SQLCODE = 0                                              CAT710  
               ADD 1 TO W-VTRNFR-INSERTED-CNT                           CAT710  
                  MOVE W-NSCC-ACAT-CTL-NBR TO SV-ACAT-CNTL-NBR          CAT710  
                  MOVE SV-CLIENT-NBR       TO WS-RECONCILED-TIF-CLT     CAT710  
                  MOVE SV-ACAT-CNTL-NBR    TO WS-RECONCILED-TIF-ACAT    CAT710  
           ELSE                                                         CAT710  
               ADD 1 TO W-VTRNFR-NOT-INSERTED-CNT                       CAT710  
               DISPLAY 'VTRNFR NOT INSERTED.'                           CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' SQL=' W-DB2-SQLCODE                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7600-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       7610-INSERT-VASSET.                                              CAT710  
           MOVE '7610-INSERT-VASSET     ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           INITIALIZE DCLVASSET                                         CAT710  
                                                                        CAT710  
           PERFORM 7680-GET-ADP-NO THRU 7680-EXIT                       CAT710  
                                                                        CAT710  
           MOVE SV-CLIENT-NBR                                           CAT710  
                                     TO CLIENT-NBR         OF DCLVASSET CAT710  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT710  
                                     TO ACAT-CONTROL-NBR   OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                 CAT710  
                                     TO ASSET-SEQ-NBR      OF DCLVASSET CAT710  
           MOVE 01                                                      CAT710  
                                     TO PHSCL-SEQ-NBR      OF DCLVASSET CAT710  
           MOVE 01                                                      CAT710  
                                     TO LGCL-SEQ-NBR       OF DCLVASSET CAT710  
?          MOVE 'A'                                                     CAT710  
                                     TO TRANS-TYPE-CD      OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-TFR-TYPE                                      CAT710  
                                     TO TRNFR-TYPE-CD      OF DCLVASSET CAT710  
           MOVE W-NSCC-DIST-PARTICIPANT                                 CAT710  
                                     TO SBMTG-PRTCP-NBR    OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-TRAN-REF-ID                                   CAT710  
                                     TO TRANS-RFRN-ID-CD   OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-PRC-CATG                                CAT710  
                                     TO ASSET-PRC-CTGY-CD  OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-OPT-CATG                                      CAT710  
                                     TO OPTN-CTGY-CD       OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-STL-LOC                                       CAT710  
                                     TO STTLM-LCTN-CD      OF DCLVASSET CAT710  
           IF   W-NSCC-AT-STL-LOC-RSN-CD = 'NSET'                       CAT710  
                MOVE 'XSET'          TO W-NSCC-AT-STL-LOC-RSN-CD        CAT710  
                ADD 1 TO W-NSET-CNT                                     CAT710  
           END-IF                                                       CAT710  
           MOVE W-NSCC-AT-STL-LOC-RSN-CD                                CAT710  
                                     TO STTLM-RSN-CD       OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-SEC-CNTRY-CD                                  CAT710  
                                     TO ISIN-CNTRY-CD      OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-SEC-ID                                        CAT710  
                                     TO ISIN-SEC-ISSUE-CD  OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-SEC-CHKDGT                                    CAT710  
                                     TO ISIN-SEC-CDG-CD    OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-DESC                                    CAT710  
                                     TO ASSET-DESC-TXT     OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-QTY-RQIND                               CAT710  
                                     TO ASSET-RQST-QTY-CD  OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-REQ-TRNCD                               CAT710  
                                     TO AST-RQST-TRANS-CD  OF DCLVASSET CAT710  
                                                                        CAT710  
           MOVE WS-ASSET-QTY         TO ASSET-QTY          OF DCLVASSET.CAT710  
           MOVE WS-ASSET-PCT         TO ASSET-PCT          OF DCLVASSET.CAT710  
                                                                        CAT710  
TCKNEW     MOVE W-NSCC-VALUE-FREE-IND TO ASSET-AMT-STTS-CD OF DCLVASSET.CAT710  
TCKNEW     IF W-NSCC-VALUE-FREE-IND = 'F'                               CAT710  
TCKNEW        ADD 1   TO WS-VALUE-FREE-CNT                              CAT710  
TCKNEW     END-IF.                                                      CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-OPT-CATG > '00'                                CAT710  
               IF W-NSCC-ATO-OPT-BS-IND = 'B'                           CAT710  
                  MOVE 'S'           TO W-NSCC-AT-POS-CD                CAT710  
               ELSE                                                     CAT710  
                  MOVE 'L'           TO W-NSCC-AT-POS-CD                CAT710  
               END-IF                                                   CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-NSCC-AT-POS-CD                                        CAT710  
                                     TO PSTN-CD            OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ISO-CURCY-CD                                  CAT710  
                                     TO ISO-CRNCY-CD       OF DCLVASSET CAT710  
                                                                        CAT710  
           MOVE WS-ASSET-AMT         TO ASSET-AMT          OF DCLVASSET.CAT710  
                                                                        CAT710  
           MOVE W-NSCC-AT-BEARER-BOND                                   CAT710  
                                     TO BEARER-BOND-CD     OF DCLVASSET CAT710  
           IF  W-NSCC-AT-CASH-MRGN-SHTCD = ' '                          CAT710  
               MOVE 'C'              TO W-NSCC-AT-CASH-MRGN-SHTCD       CAT710  
           END-IF                                                       CAT710  
           MOVE W-NSCC-AT-CASH-MRGN-SHTCD                               CAT710  
                                     TO CSH-MGN-SHRT-CD    OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-WHN-ISS-IND                                   CAT710  
                                     TO WHI-CD             OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-TFR-TYPE-RSN                                  CAT710  
                                     TO TRNFR-TYPE-RSN-CD  OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-MBS-SER-NT                                    CAT710  
                                     TO MBS-SERIAL-NBR     OF DCLVASSET CAT710  
           MOVE W-NSCC-AT-ASSET-COMMENT                                 CAT710  
                                     TO ASSET-CMNT-TXT     OF DCLVASSET CAT710  
           MOVE 'CAT710WM'           TO PRGM-NM            OF DCLVASSET CAT710  
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVASSET CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVASSET CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVASSET CAT710  
           MOVE ' '                  TO NSCC-PEND-CD       OF DCLVASSET CAT710  
           MOVE ' '                  TO NSCC-ACK-IND       OF DCLVASSET CAT710  
                                                                        CAT710  
           MOVE ' '                  TO NSCC-NON-ADP-IND   OF DCLVASSET CAT710  
                                                                        CAT710  
           MOVE ' '                  TO RCL-SENT-NSCC-IND  OF DCLVASSET CAT710  
           MOVE ' '                  TO FAIL-OPEN-CAGE-IND OF DCLVASSET CAT710  
           MOVE ' '                  TO FAIL-SENT-CAGE-IND OF DCLVASSET CAT710  
           MOVE ' '                  TO FRV-SENT-NSCC-IND  OF DCLVASSET CAT710  
           MOVE 'N'                  TO ISIN-SEC-EXCPT-IND OF DCLVASSET CAT710  
                                                                        CAT710  
DJ0004***GET CAGE TAG NBR FROM HISTORY FILE FOR BOOKING OF 866*         CAT710  
DJ0004     IF  (W-NSCC-AT-TFR-TYPE = 'FRV' OR 'MFC' OR 'RCL')           CAT710  
DJ0004         PERFORM 7611-SELECT-VASTHSTY THRU 7611-EXIT              CAT710  
DJ0004         IF  W-VASTHSTY-FND-SW = 'Y'                              CAT710  
DJ0004             MOVE CAGE-TAG-NBR  OF DCLVASTHSTY                    CAT710  
DJ0004                                TO CAGE-TAG-NBR   OF DCLVASSET    CAT710  
DJ0004             MOVE SCRTY-866-NBR OF DCLVASTHSTY                    CAT710  
DJ0004                                TO SCRTY-866-NBR  OF DCLVASSET    CAT710  
DJ0004             COMPUTE ASSET-866-QTY OF DCLVASSET =                 CAT710  
DJ0004             (ASSET-QTY OF DCLVASSET / ASSET-QTY OF DCLVASTHSTY)  CAT710  
DJ0004                                 * ASSET-866-QTY OF DCLVASTHSTY   CAT710  
DJ0004                ON SIZE ERROR                                     CAT710  
DJ0004                  MOVE ZERO TO ASSET-866-QTY OF DCLVASSET         CAT710  
DJ0004             END-COMPUTE                                          CAT710  
DJ0004         END-IF                                                   CAT710  
DJ0004     END-IF                                                       CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               INSERT INTO VASSET                                       CAT710  
                 (                                                      CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,ASSET_SEQ_NBR                                        CAT710  
                  ,SYS_ACT_CD                                           CAT710  
                  ,SYS_RJCT_RSN_CD                                      CAT710  
                  ,RCRD_STTS_CD                                         CAT710  
                  ,RCRD_LNGTH_STTS_CD                                   CAT710  
                  ,PHSCL_SEQ_STTS_CD                                    CAT710  
                  ,LGCL_SEQ_NR_STS_CD                                   CAT710  
                  ,TRANS_TYPE_STTS_CD                                   CAT710  
                  ,CONTROL_NBR_STS_CD                                   CAT710  
                  ,TRNFR_TYPE_STTS_CD                                   CAT710  
                  ,SBMT_PRT_NR_STS_CD                                   CAT710  
                  ,RCV_NBR_STTS_CD                                      CAT710  
                  ,DLVR_NBR_STTS_CD                                     CAT710  
                  ,TRANS_RFRN_STTS_CD                                   CAT710  
                  ,AST_SEQ_NBR_STS_CD                                   CAT710  
                  ,AST_PRC_CTG_STS_CD                                   CAT710  
                  ,OPTN_CTGY_STTS_CD                                    CAT710  
                  ,STTLM_LCTN_STTS_CD                                   CAT710  
                  ,STTLM_RSN_STTS_CD                                    CAT710  
                  ,ISIN_CNTRY_STTS_CD                                   CAT710  
                  ,ISIN_SEC_IS_STS_CD                                   CAT710  
                  ,ISIN_SEC_CD_STS_CD                                   CAT710  
                  ,ASSET_DESC_STTS_CD                                   CAT710  
                  ,ASSET_RQST_STS_CD                                    CAT710  
                  ,AST_RQ_TRAN_STS_CD                                   CAT710  
                  ,ASSET_QTY_STTS_CD                                    CAT710  
                  ,ASSET_PCT_STTS_CD                                    CAT710  
                  ,PSTN_CD_STTS_CD                                      CAT710  
                  ,ISO_CRNCY_STTS_CD                                    CAT710  
                  ,ASSET_AMT_STTS_CD                                    CAT710  
                  ,BEARER_BND_STTS_CD                                   CAT710  
                  ,CSH_MRG_SHT_STS_CD                                   CAT710  
                  ,WHI_STTS_CD                                          CAT710  
                  ,TRN_TYP_RSN_STS_CD                                   CAT710  
                  ,MBS_SERIAL_STTS_CD                                   CAT710  
                  ,ASSET_CMNT_STTS_CD                                   CAT710  
                  ,PHSCL_SEQ_NBR                                        CAT710  
                  ,LGCL_SEQ_NBR                                         CAT710  
                  ,TRANS_TYPE_CD                                        CAT710  
                  ,TRNFR_TYPE_CD                                        CAT710  
                  ,SBMTG_PRTCP_NBR                                      CAT710  
                  ,TRANS_RFRN_ID_CD                                     CAT710  
                  ,ASSET_PRC_CTGY_CD                                    CAT710  
                  ,OPTN_CTGY_CD                                         CAT710  
                  ,STTLM_LCTN_CD                                        CAT710  
                  ,STTLM_RSN_CD                                         CAT710  
                  ,ISIN_CNTRY_CD                                        CAT710  
                  ,ISIN_SEC_ISSUE_CD                                    CAT710  
                  ,ISIN_SEC_CDG_CD                                      CAT710  
                  ,ASSET_DESC_TXT                                       CAT710  
                  ,ASSET_RQST_QTY_CD                                    CAT710  
                  ,AST_RQST_TRANS_CD                                    CAT710  
                  ,ASSET_QTY                                            CAT710  
                  ,ASSET_PCT                                            CAT710  
                  ,PSTN_CD                                              CAT710  
                  ,ISO_CRNCY_CD                                         CAT710  
                  ,ASSET_AMT                                            CAT710  
                  ,BEARER_BOND_CD                                       CAT710  
                  ,CSH_MGN_SHRT_CD                                      CAT710  
                  ,WHI_CD                                               CAT710  
                  ,TRNFR_TYPE_RSN_CD                                    CAT710  
                  ,MBS_SERIAL_NBR                                       CAT710  
                  ,ASSET_CMNT_TXT                                       CAT710  
                  ,PRGM_NM                                              CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,SECURITY_ADP_NBR                                     CAT710  
                  ,NSCC_ACK_IND                                         CAT710  
                  ,NSCC_PEND_CD                                         CAT710  
                  ,NSCC_NON_ADP_IND                                     CAT710  
                  ,RCL_SENT_NSCC_IND                                    CAT710  
                  ,FAIL_OPEN_CAGE_IND                                   CAT710  
                  ,FAIL_SENT_CAGE_IND                                   CAT710  
                  ,FRV_SENT_NSCC_IND                                    CAT710  
                  ,ISIN_SEC_EXCPT_IND                                   CAT710  
                 )                                                      CAT710  
                 VALUES                                                 CAT710  
                 (                                                      CAT710  
                   :DCLVASSET.CLIENT-NBR                                CAT710  
                  ,:DCLVASSET.ACAT-CONTROL-NBR                          CAT710  
                  ,:DCLVASSET.ASSET-SEQ-NBR                             CAT710  
                  ,:DCLVASSET.SYS-ACT-CD                                CAT710  
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                           CAT710  
                  ,:DCLVASSET.RCRD-STTS-CD                              CAT710  
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                        CAT710  
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                         CAT710  
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                        CAT710  
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                        CAT710  
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                        CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                        CAT710  
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                        CAT710  
                  ,:DCLVASSET.RCV-NBR-STTS-CD                           CAT710  
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                          CAT710  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                        CAT710  
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                        CAT710  
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                        CAT710  
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                         CAT710  
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                        CAT710  
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                         CAT710  
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                        CAT710  
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                        CAT710  
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-RQST-STS-CD                         CAT710  
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                         CAT710  
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                         CAT710  
                  ,:DCLVASSET.PSTN-CD-STTS-CD                           CAT710  
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                         CAT710  
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                         CAT710  
                  ,:DCLVASSET.BEARER-BND-STTS-CD                        CAT710  
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                        CAT710  
                  ,:DCLVASSET.WHI-STTS-CD                               CAT710  
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                        CAT710  
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                        CAT710  
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                        CAT710  
                  ,:DCLVASSET.PHSCL-SEQ-NBR                             CAT710  
                  ,:DCLVASSET.LGCL-SEQ-NBR                              CAT710  
                  ,:DCLVASSET.TRANS-TYPE-CD                             CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-CD                             CAT710  
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                           CAT710  
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                          CAT710  
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                         CAT710  
                  ,:DCLVASSET.OPTN-CTGY-CD                              CAT710  
                  ,:DCLVASSET.STTLM-LCTN-CD                             CAT710  
                  ,:DCLVASSET.STTLM-RSN-CD                              CAT710  
                  ,:DCLVASSET.ISIN-CNTRY-CD                             CAT710  
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                         CAT710  
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                           CAT710  
                  ,:DCLVASSET.ASSET-DESC-TXT                            CAT710  
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                         CAT710  
                  ,:DCLVASSET.AST-RQST-TRANS-CD                         CAT710  
                  ,:DCLVASSET.ASSET-QTY                                 CAT710  
                  ,:DCLVASSET.ASSET-PCT                                 CAT710  
                  ,:DCLVASSET.PSTN-CD                                   CAT710  
                  ,:DCLVASSET.ISO-CRNCY-CD                              CAT710  
                  ,:DCLVASSET.ASSET-AMT                                 CAT710  
                  ,:DCLVASSET.BEARER-BOND-CD                            CAT710  
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                           CAT710  
                  ,:DCLVASSET.WHI-CD                                    CAT710  
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                         CAT710  
                  ,:DCLVASSET.MBS-SERIAL-NBR                            CAT710  
                  ,:DCLVASSET.ASSET-CMNT-TXT                            CAT710  
                  ,:DCLVASSET.PRGM-NM                                   CAT710  
                  ,:DCLVASSET.CICS-TERM-ID-CD                           CAT710  
                  ,:DCLVASSET.CRT-TMSTP                                 CAT710  
                  ,:DCLVASSET.UPDT-TMSTP                                CAT710  
                  ,:DCLVASSET.SECURITY-ADP-NBR                          CAT710  
                  ,:DCLVASSET.NSCC-ACK-IND                              CAT710  
                  ,:DCLVASSET.NSCC-PEND-CD                              CAT710  
                  ,:DCLVASSET.NSCC-NON-ADP-IND                          CAT710  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                         CAT710  
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                        CAT710  
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                        CAT710  
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                         CAT710  
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                        CAT710  
                 )                                                      CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           MOVE 'VASSET  '               TO W-DB2-TABLE-NAME            CAT710  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT710  
           MOVE SQLCODE                  TO W-DB2-SQLCODE.              CAT710  
           IF  SQLCODE = 0                                              CAT710  
               ADD 1 TO W-VASSET-INSERTED-CNT                           CAT710  
               IF W-NSCC-AT-OPT-CATG > '00'                             CAT710  
                  PERFORM 7620-INSERT-VOPTN THRU 7620-EXIT              CAT710  
               ELSE                                                     CAT710  
                  IF W-NSCC-AT-STL-LOC = '10'                           CAT710  
                     PERFORM 7630-INSERT-VMF THRU 7630-EXIT             CAT710  
                  END-IF                                                CAT710  
               END-IF                                                   CAT710  
           ELSE                                                         CAT710  
               ADD 1 TO W-VASSET-NOT-INSERTED-CNT                       CAT710  
               DISPLAY 'ASSET NOT INSERTED.'                            CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' SQL=' W-DB2-SQLCODE                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7610-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
DJ0004 7611-SELECT-VASTHSTY.                                            CAT710  
DJ0004**GET THE CAGE TAG NUMBER FROM THE ASSET HISTORY FILE             CAT710  
DJ0004                                                                  CAT710  
DJ0004     MOVE ' '                TO W-SAVE-CNTL-ASTD-NBR              CAT710  
DJ0004                                                                  CAT710  
DJ0004     EXEC SQL SELECT                                              CAT710  
DJ0004              ACAT_CNTL_ASTD_NBR                                  CAT710  
DJ0004         INTO                                                     CAT710  
DJ0004             :W-SAVE-CNTL-ASTD-NBR                                CAT710  
DJ0004         FROM VTRNFR                                              CAT710  
DJ0004        WHERE CLIENT_NBR       = :SV-CLIENT-NBR                   CAT710  
DJ0004          AND ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR                CAT710  
DJ0004     END-EXEC                                                     CAT710  
DJ0004                                                                  CAT710  
DJ0004     MOVE ' '                TO W-VASTHSTY-FND-SW                 CAT710  
DJ0004     INITIALIZE DCLVASTHSTY                                       CAT710  
DJ0004     EXEC SQL SELECT                                              CAT710  
DJ0004              CAGE_TAG_NBR                                        CAT710  
DJ0004             ,SCRTY_866_NBR                                       CAT710  
DJ0004             ,ASSET_866_QTY                                       CAT710  
DJ0004         INTO                                                     CAT710  
DJ0004              :DCLVASTHSTY.CAGE-TAG-NBR                           CAT710  
DJ0004             ,:DCLVASTHSTY.SCRTY-866-NBR                          CAT710  
DJ0004             ,:DCLVASTHSTY.ASSET-866-QTY                          CAT710  
DJ0004         FROM  VASTHSTY                                           CAT710  
DJ0004         WHERE CLIENT_NBR         = :SV-CLIENT-NBR                CAT710  
DJ0004           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR         CAT710  
DJ0004           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD       CAT710  
DJ0004           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID             CAT710  
DJ0004           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT         CAT710  
DJ0004           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD    CAT710  
DJ0004     END-EXEC                                                     CAT710  
DJ0004                                                                  CAT710  
DJ0004     IF  SQLCODE  =  +0                                           CAT710  
DJ0004     AND SCRTY-866-NBR OF DCLVASTHSTY > SPACES                    CAT710  
DJ0004         MOVE 'Y'                TO W-VASTHSTY-FND-SW             CAT710  
DJ0004     ELSE                                                         CAT710  
DJ0004         MOVE 'N'                TO W-VASTHSTY-FND-SW             CAT710  
DJ0004     END-IF.                                                      CAT710  
DJ0004                                                                  CAT710  
DJ0004 7611-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7620-INSERT-VOPTN.                                               CAT710  
           MOVE '7620-INSERT-VOPTN      ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           INITIALIZE DCLVOPTN                                          CAT710  
           MOVE SV-CLIENT-NBR                                           CAT710  
                                     TO CLIENT-NBR         OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT710  
                                     TO ACAT-CONTROL-NBR   OF DCLVOPTN. CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                 CAT710  
                                     TO ASSET-SEQ-NBR      OF DCLVOPTN. CAT710  
                                                                        CAT710  
           MOVE W-NSCC-ATO-OPT-BS-IND                                   CAT710  
                                     TO BS-CD              OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-PC-IND                                   CAT710  
                                     TO PTCL-CD            OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-OC-IND                                   CAT710  
                                     TO OPTN-OPN-CLSD-CD   OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-SYM                                      CAT710  
                                     TO SYM-CD             OF DCLVOPTN. CAT710  
                                                                        CAT710  
           INITIALIZE                   W-DATE                          CAT710  
           IF  W-NSCC-ATO-OPT-EXP-CC = '00'                             CAT710  
               MOVE '20'          TO W-NSCC-ATO-OPT-EXP-CC              CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATO-OPT-EXP-DT > ' '                             CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           ELSE                                                         CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                       ' CLT=' SV-CLIENT-NBR,                           CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' OPT-EXP-DT(MMYYCC) IS INVALID: '               CAT710  
                                            W-NSCC-ATO-OPT-EXP-DT       CAT710  
                      '  DEFAULT TO 0001-01-01'                         CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATO-OPT-EXP-MM > '12'                            CAT710  
           AND  W-NSCC-ATO-OPT-EXP-CC < '19'                            CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                       ' CLT=' SV-CLIENT-NBR,                           CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' OPT-EXP-DT(MMYYCC) IS INVALID: '               CAT710  
                                            W-NSCC-ATO-OPT-EXP-DT       CAT710  
                       '  SWAPPING MM AND CC'                           CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
           MOVE W-DATE-CC TO WS-DATE-CC                                 CAT710  
           MOVE W-DATE-YY TO WS-DATE-YY                                 CAT710  
           MOVE W-DATE-MM TO WS-DATE-MM                                 CAT710  
           MOVE W-DATE-DD TO WS-DATE-DD                                 CAT710  
           IF  (W-DATE-MM             > '12' OR                         CAT710  
                W-DATE-MM             < '01')                           CAT710  
           OR  (W-DATE-CC             < '00')                           CAT710  
           OR  (W-DATE-CC             > '99')                           CAT710  
           OR  (W-DATE-YY             < '00')                           CAT710  
           OR  (W-DATE-YY             > '99')                           CAT710  
           OR  WS-DATE-CCYYMMDD NOT NUMERIC                             CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                       ' CLT=' SV-CLIENT-NBR,                           CAT710  
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                      CAT710  
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                  CAT710  
                       ' OPT-EXP-DT(MMYYCC) IS INVALID: '               CAT710  
                                            W-NSCC-ATO-OPT-EXP-DT       CAT710  
                       '  DEFAULT TO 0001-01-01.'                       CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-DATE               TO EXPTN-DT           OF DCLVOPTN. CAT710  
                                                                        CAT710  
           MOVE W-NSCC-ATO-OPT-STKPRC-INT                               CAT710  
                                     TO STPRC-INTEGER-AMT  OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-STKPRC-FRC                               CAT710  
                                     TO STPRC-FRCTN-AMT    OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-OCC-DEL-NBR                              CAT710  
                                     TO DLVR-OCC-NBR       OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-ACCT-TYP                                 CAT710  
                                     TO OPTN-ACCT-TYPE-CD  OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-SUB-ACCT-ID                                  CAT710  
                                     TO ACCT-SUB-CD        OF DCLVOPTN. CAT710  
           MOVE W-NSCC-ATO-OPT-COMMENT                                  CAT710  
                                     TO OPTN-CMNT-TXT      OF DCLVOPTN. CAT710  
           MOVE 'CAT710WM'           TO PRGM-NM            OF DCLVOPTN  CAT710  
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVOPTN  CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVOPTN  CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVOPTN  CAT710  
           MOVE ' '                  TO ACCT-TYPE-MSMT-IND OF DCLVOPTN  CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               INSERT INTO VOPTN                                        CAT710  
                 (                                                      CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,ASSET_SEQ_NBR                                        CAT710  
                  ,BS_STTS_CD                                           CAT710  
                  ,PTCL_STTS_CD                                         CAT710  
                  ,OPT_OPN_CLS_STS_CD                                   CAT710  
                  ,SYM_STTS_CD                                          CAT710  
                  ,OPTN_EXPTN_DT_CD                                     CAT710  
                  ,STPRC_INTR_STTS_CD                                   CAT710  
                  ,STPRC_FRCT_STTS_CD                                   CAT710  
                  ,OPT_OCC_DLV_STS_CD                                   CAT710  
                  ,OPT_ACT_TYP_STS_CD                                   CAT710  
                  ,ACCT_SUB_STTS_CD                                     CAT710  
                  ,OPTN_CMNT_STTS_CD                                    CAT710  
                  ,BS_CD                                                CAT710  
                  ,PTCL_CD                                              CAT710  
                  ,OPTN_OPN_CLSD_CD                                     CAT710  
                  ,SYM_CD                                               CAT710  
                  ,EXPTN_DT                                             CAT710  
                  ,STPRC_INTEGER_AMT                                    CAT710  
                  ,STPRC_FRCTN_AMT                                      CAT710  
                  ,DLVR_OCC_NBR                                         CAT710  
                  ,OPTN_ACCT_TYPE_CD                                    CAT710  
                  ,ACCT_SUB_CD                                          CAT710  
                  ,OPTN_CMNT_TXT                                        CAT710  
                  ,PRGM_NM                                              CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,ACCT_TYPE_MSMT_IND                                   CAT710  
                 )                                                      CAT710  
                 VALUES                                                 CAT710  
                 (                                                      CAT710  
                   :DCLVOPTN.CLIENT-NBR                                 CAT710  
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                           CAT710  
                  ,:DCLVOPTN.ASSET-SEQ-NBR                              CAT710  
                  ,:DCLVOPTN.BS-STTS-CD                                 CAT710  
                  ,:DCLVOPTN.PTCL-STTS-CD                               CAT710  
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                         CAT710  
                  ,:DCLVOPTN.SYM-STTS-CD                                CAT710  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                           CAT710  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                         CAT710  
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                         CAT710  
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                         CAT710  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                         CAT710  
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                           CAT710  
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                          CAT710  
                  ,:DCLVOPTN.BS-CD                                      CAT710  
                  ,:DCLVOPTN.PTCL-CD                                    CAT710  
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                           CAT710  
                  ,:DCLVOPTN.SYM-CD                                     CAT710  
                  ,:DCLVOPTN.EXPTN-DT                                   CAT710  
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                          CAT710  
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                            CAT710  
                  ,:DCLVOPTN.DLVR-OCC-NBR                               CAT710  
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                          CAT710  
                  ,:DCLVOPTN.ACCT-SUB-CD                                CAT710  
                  ,:DCLVOPTN.OPTN-CMNT-TXT                              CAT710  
                  ,:DCLVOPTN.PRGM-NM                                    CAT710  
                  ,:DCLVOPTN.CICS-TERM-ID-CD                            CAT710  
                  ,:DCLVOPTN.CRT-TMSTP                                  CAT710  
                  ,:DCLVOPTN.UPDT-TMSTP                                 CAT710  
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                         CAT710  
                 )                                                      CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           MOVE 'VOPTN   '               TO W-DB2-TABLE-NAME            CAT710  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT710  
           MOVE SQLCODE                  TO W-DB2-SQLCODE.              CAT710  
           IF  SQLCODE = 0                                              CAT710  
               ADD 1 TO W-VOPTN-INSERTED-CNT                            CAT710  
           ELSE                                                         CAT710  
               ADD 1 TO W-VOPTN-NOT-INSERTED-CNT                        CAT710  
               DISPLAY 'OPTN  NOT INSERTED.'                            CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' SQL=' W-DB2-SQLCODE                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7620-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       7630-INSERT-VMF.                                                 CAT710  
           MOVE '7630-INSERT-VMF        ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           INITIALIZE DCLVMF                                            CAT710  
           MOVE SV-CLIENT-NBR                                           CAT710  
                                     TO CLIENT-NBR         OF DCLVMF.   CAT710  
                                                                        CAT710  
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR              CAT710  
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-NSCC-ACAT-CTL-NBR                                     CAT710  
                                     TO ACAT-CONTROL-NBR   OF DCLVMF.   CAT710  
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                 CAT710  
                                     TO ASSET-SEQ-NBR      OF DCLVMF.   CAT710  
                                                                        CAT710  
           INITIALIZE                   W-DATE                          CAT710  
LRM005     IF W-NSCC-AT-TFR-TYPE = 'MFC'                                        
LRM005        IF W-NSCC-ATF-RE-REGIST-DT > ' '                                  
LRM005          MOVE W-NSCC-ATF-RE-REGIST-DT (1:4) TO W-DATE-YEAR               
LRM005          MOVE W-NSCC-ATF-RE-REGIST-DT (5:2) TO W-DATE-MM                 
LRM005          MOVE W-NSCC-ATF-RE-REGIST-DT (7:2) TO W-DATE-DD                 
LRM005        ELSE                                                              
LRM005          MOVE '0001'                 TO W-DATE-YEAR                      
LRM005          MOVE '01'                   TO W-DATE-MM                        
LRM005          MOVE '01'                   TO W-DATE-DD                        
LRM005        END-IF                                                            
LRM005     ELSE                                                                 
              IF   W-NSCC-PROC-DATE > ' '                               CAT710  
                MOVE W-NSCC-PROC-DATE (1:4) TO W-DATE-YEAR              CAT710  
                MOVE W-NSCC-PROC-DATE (5:2) TO W-DATE-MM                CAT710  
                MOVE W-NSCC-PROC-DATE (7:2) TO W-DATE-DD                CAT710  
              ELSE                                                      CAT710  
                MOVE '0001'                 TO W-DATE-YEAR              CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
              END-IF                                                    CAT710  
LRM005     END-IF.                                                      CAT710  
           MOVE W-DATE               TO PRCS-DT            OF DCLVMF.   CAT710  
                                                                        CAT710  
           MOVE W-NSCC-REG-IND                                          CAT710  
                                     TO RGSTN-CD           OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-CUS-ACCT                                     CAT710  
                                     TO FNBR               OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-PHSCL-SHR-IND                                CAT710  
                                     TO BK-PHSCL-SHR-CD    OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-NTWRK-CTL-IND                                CAT710  
                                     TO NTWRK-CNTL-CD      OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-ACCT-TYP-IND                                 CAT710  
                                     TO ACCT-TYPE-CD       OF DCLVMF.   CAT710  
                                                                        CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '3' OR '4'            CAT710  
                MOVE 'C'             TO DVDND-CD           OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO DVDND-CD           OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '5' OR '7'            CAT710  
                MOVE 'C'             TO LTCG-CD            OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO LTCG-CD            OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATF-DIV-CD = '0' OR '4' OR '5' OR '6'            CAT710  
                MOVE 'C'             TO STCG-CD            OF DCLVMF    CAT710  
           ELSE                                                         CAT710  
                MOVE 'R'             TO STCG-CD            OF DCLVMF    CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-NSCC-ATF-DIV-PAYEE-IND                                CAT710  
                                     TO DVDND-PAYEE-CD     OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-EXEC-BRKR                                    CAT710  
                                     TO BRKR-EXCTG-NBR     OF DCLVMF.   CAT710  
           MOVE W-NSCC-ATF-FULL-PART-IND                                CAT710  
                                     TO MF-FULL-PRTL-CD    OF DCLVMF.   CAT710  
           MOVE 'CAT710WM'           TO PRGM-NM            OF DCLVMF.   CAT710  
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVMF.   CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVMF.   CAT710  
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVMF.   CAT710  
DJ0003     MOVE W-NSCC-ATF-FUND-CUST-ACCT-RCV                           CAT710  
DJ0003                               TO FCST-ACCT-RCVR-NBR OF DCLVMF.   CAT710  
                                                                        CAT710  
           EXEC SQL                                                     CAT710  
               INSERT INTO VMF                                          CAT710  
                 (                                                      CAT710  
                   CLIENT_NBR                                           CAT710  
                  ,DSTBN_SIDE_CD                                        CAT710  
                  ,ACAT_CONTROL_NBR                                     CAT710  
                  ,ASSET_SEQ_NBR                                        CAT710  
                  ,PRCS_DT                                              CAT710  
                  ,RGSTN_CD                                             CAT710  
                  ,FND_ACT_NBR_STS_CD                                   CAT710  
                  ,BK_PHSC_SHR_STS_CD                                   CAT710  
                  ,NTWRK_CNTL_STTS_CD                                   CAT710  
                  ,ACCT_TYPE_STTS_CD                                    CAT710  
                  ,DVDND_STTS_CD                                        CAT710  
                  ,DVDND_PYE_STTS_CD                                    CAT710  
                  ,BRKR_EXCTG_STTS_CD                                   CAT710  
                  ,MF_FUL_PRTL_STS_CD                                   CAT710  
                  ,FNBR                                                 CAT710  
                  ,BK_PHSCL_SHR_CD                                      CAT710  
                  ,NTWRK_CNTL_CD                                        CAT710  
                  ,ACCT_TYPE_CD                                         CAT710  
                  ,DVDND_CD                                             CAT710  
                  ,LTCG_CD                                              CAT710  
                  ,STCG_CD                                              CAT710  
                  ,DVDND_PAYEE_CD                                       CAT710  
                  ,BRKR_EXCTG_NBR                                       CAT710  
                  ,MF_FULL_PRTL_CD                                      CAT710  
                  ,PRGM_NM                                              CAT710  
                  ,CICS_TERM_ID_CD                                      CAT710  
                  ,CRT_TMSTP                                            CAT710  
                  ,UPDT_TMSTP                                           CAT710  
                  ,FCST_ACCT_RCVR_NBR                                   CAT710  
                 )                                                      CAT710  
                 VALUES                                                 CAT710  
                 (                                                      CAT710  
                   :DCLVMF.CLIENT-NBR                                   CAT710  
                  ,:DCLVMF.DSTBN-SIDE-CD                                CAT710  
                  ,:DCLVMF.ACAT-CONTROL-NBR                             CAT710  
                  ,:DCLVMF.ASSET-SEQ-NBR                                CAT710  
                  ,:DCLVMF.PRCS-DT                                      CAT710  
                  ,:DCLVMF.RGSTN-CD                                     CAT710  
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                           CAT710  
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                           CAT710  
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                           CAT710  
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                            CAT710  
                  ,:DCLVMF.DVDND-STTS-CD                                CAT710  
                  ,:DCLVMF.DVDND-PYE-STTS-CD                            CAT710  
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                           CAT710  
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                           CAT710  
                  ,:DCLVMF.FNBR                                         CAT710  
                  ,:DCLVMF.BK-PHSCL-SHR-CD                              CAT710  
                  ,:DCLVMF.NTWRK-CNTL-CD                                CAT710  
                  ,:DCLVMF.ACCT-TYPE-CD                                 CAT710  
                  ,:DCLVMF.DVDND-CD                                     CAT710  
                  ,:DCLVMF.LTCG-CD                                      CAT710  
                  ,:DCLVMF.STCG-CD                                      CAT710  
                  ,:DCLVMF.DVDND-PAYEE-CD                               CAT710  
                  ,:DCLVMF.BRKR-EXCTG-NBR                               CAT710  
                  ,:DCLVMF.MF-FULL-PRTL-CD                              CAT710  
                  ,:DCLVMF.PRGM-NM                                      CAT710  
                  ,:DCLVMF.CICS-TERM-ID-CD                              CAT710  
                  ,:DCLVMF.CRT-TMSTP                                    CAT710  
                  ,:DCLVMF.UPDT-TMSTP                                   CAT710  
                  ,:DCLVMF.FCST-ACCT-RCVR-NBR                           CAT710  
                 )                                                      CAT710  
           END-EXEC.                                                    CAT710  
                                                                        CAT710  
           MOVE 'VMF     '               TO W-DB2-TABLE-NAME            CAT710  
           MOVE 'INSERT'                 TO W-DB2-ACTION                CAT710  
           MOVE SQLCODE                  TO W-DB2-SQLCODE.              CAT710  
                                                                        CAT710  
           IF  SQLCODE = 0                                              CAT710  
               ADD 1 TO W-VMF-INSERTED-CNT                              CAT710  
           ELSE                                                         CAT710  
               ADD 1 TO W-VMF-NOT-INSERTED-CNT                          CAT710  
               DISPLAY 'MF    NOT INSERTED.'                            CAT710  
                      ' CLT=' SV-CLIENT-NBR,                            CAT710  
                      ' CTL=' SV-ACAT-CNTL-NBR                          CAT710  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
                      ' SQL=' W-DB2-SQLCODE                             CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7630-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       7680-GET-ADP-NO.                                                 CAT710  
           MOVE '7680-GET-ADP-NO        ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           IF (W-NSCC-AT-OP-LEN                                         CAT710  
           AND W-NSCC-AT-OPT-CATG > '00')                               CAT710  
              PERFORM 7681-GET-ADP-OPTION THRU 7681-EXIT                CAT710  
           ELSE                                                         CAT710  
               PERFORM 7700-GETMSDC THRU 7700-EXIT                      CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
                                                                        CAT710  
       7680-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** LOOK UP ADP MSD SECURITY NUMBER AND SYMBOL FOR OPTIONS     ***CAT710  
      ******************************************************************CAT710  
       7681-GET-ADP-OPTION.                                             CAT710  
                                                                        CAT710  
           MOVE ' '                      TO FMT-ADP-SEC-NO              CAT710  
           MOVE W-NSCC-ATO-OPT-BS-IND    TO FMT-BUY-SELL-IND            CAT710  
           MOVE W-NSCC-ATO-OPT-PC-IND    TO FMT-OPT-PUT-CALL            CAT710  
           MOVE W-NSCC-ATO-OPT-OC-IND    TO FMT-OPEN-CLOSE              CAT710  
           MOVE W-NSCC-ATO-OPT-SYM       TO FMT-OPT-SYMBOL              CAT710  
           MOVE W-NSCC-ATO-OPT-STKPRC-INT(3:3) TO FMT-OPT-PRICE         CAT710  
           INITIALIZE                   W-DATE                          CAT710  
           IF   W-NSCC-ATO-OPT-EXP-DT > ' '                             CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           ELSE                                                         CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
           IF   W-NSCC-ATO-OPT-EXP-MM > '12'                            CAT710  
           AND  W-NSCC-ATO-OPT-EXP-CC < '19'                            CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-CC                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                CAT710  
                MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
           IF  (W-DATE-MM             > '12' OR                         CAT710  
                W-DATE-MM             < '01')                           CAT710  
           OR  (W-DATE-CC             < '00')                           CAT710  
           OR  (W-DATE-YY             < '00')                           CAT710  
                MOVE '00'                   TO W-DATE-CC                CAT710  
                MOVE '01'                   TO W-DATE-YY                CAT710  
                MOVE '01'                   TO W-DATE-MM                CAT710  
                MOVE '01'                   TO W-DATE-DD                CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE W-DATE-CC                TO FMT-OPT-EXP-CC              CAT710  
           MOVE W-DATE-YY                TO FMT-OPT-EXP-YY              CAT710  
           MOVE W-DATE-MM                TO FMT-OPT-EXP-MM              CAT710  
           MOVE W-DATE-DD                TO FMT-OPT-EXP-DD              CAT710  
           MOVE W-NSCC-ATO-OPT-ACCT-TYP  TO FMT-OPT-ACT-TYPE            CAT710  
           MOVE W-NSCC-ATO-OPT-STKPRC-INT   TO W-STPRC-INTEGER-AMT      CAT710  
           MOVE W-NSCC-ATO-OPT-STKPRC-FRC   TO W-STPRC-FRCTN-AMT        CAT710  
           IF   W-STPRC-FRCTN-AMT NOT NUMERIC                           CAT710  
                MOVE 0                      TO W-STPRC-FRCTN-AMT        CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           PERFORM 7682-GET-ADP-SYMBOL                                  CAT710  
                                                                        CAT710  
           IF SYMBOL-IS-FOUND                                           CAT710  
               MOVE WS-ADP-SYMBOL TO GETXRF-SEARCH-KEY                  CAT710  
               PERFORM 7688-CALL-MSDXREF                                CAT710  
               IF  GETXRF-RETURN-VALID                                  CAT710  
                   CONTINUE                                             CAT710  
               ELSE                                                     CAT710  
                   PERFORM 7686-GET-ADP-OPTION-AMEX                     CAT710  
               END-IF                                                   CAT710  
           ELSE                                                         CAT710  
               PERFORM 7686-GET-ADP-OPTION-AMEX                         CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           PERFORM 7690-READ-INF-IDX  THRU 7690-EXIT.                   CAT710  
                                                                        CAT710  
           IF  FMT-ADP-SEC-NO > ' '                                     CAT710  
                   MOVE 'N'         TO W-MSD-NOTFND-SW                  CAT710  
                   SET DIFFERENCE-FOUND TO TRUE                         CAT710  
                   IF W-NSCC-SETTLE-CLOSE                               CAT710  
                   AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                   CAT710  
LRM007             AND NOT PARM-WM-RUN                                          
                      IF SECURITY-ADP-NBR  OF DCLVASSET = ' '           CAT710  
                         DISPLAY 'INP=' W-INFILE-CNT                    CAT710  
                              ' ' SV-CLIENT-NBR,                        CAT710  
                              ' ' W-NSCC-ACAT-CTL-NBR                   CAT710  
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR               CAT710  
                             ' STL-CLS'                                 CAT710  
                             ' SEC=' W-NSCC-AT-SEC-ID                   CAT710  
                             ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET     CAT710  
                             ' NEW=' FMT-ADP-SEC-NO '(NOT REPLACED1)'   CAT710  
                      END-IF                                            CAT710  
                   ELSE                                                 CAT710  
                   MOVE FMT-ADP-SEC-NO TO SECURITY-ADP-NBR  OF DCLVASSETCAT710  
                   END-IF                                               CAT710  
                   MOVE FMT-CUSIP-NO   TO ISIN-SEC-ISSUE-CD OF DCLVASSETCAT710  
                   MOVE 'N'           TO ISIN-SEC-EXCPT-IND OF DCLVASSETCAT710  
                   MOVE FMT-CUSIP-NO   TO W-NSCC-AT-SEC-ID              CAT710  
                   MOVE FMT-DESC1 TO W-NSCC-ATO-OPT-COMMENT             CAT710  
                   MOVE ' '       TO W-NSCC-AT-ASSET-DESC               CAT710  
                   MOVE FMT-DESC1 TO W-NSCC-AT-ASSET-DESC (1:30)        CAT710  
                   MOVE FMT-DESC2 TO W-NSCC-AT-ASSET-DESC (31:30)       CAT710  
                   MOVE FMT-DESC3 TO W-NSCC-AT-ASSET-DESC (61:30)       CAT710  
                   MOVE FMT-ADP-SEC-NO TO WK-POS-DESC5-SEC              CAT710  
                   MOVE WK-POS-DESC5 TO W-NSCC-AT-ASSET-DESC (121:20)   CAT710  
           ELSE                                                         CAT710  
LRM                IF NOT W-NSCC-SETTLE-CLOSE                           CAT710  
                    OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                     CAT710  
                     MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET   CAT710  
                   END-IF                                               CAT710  
                   MOVE 'Y'         TO W-MSD-NOTFND-SW                  CAT710  
                   DISPLAY 'INP=' W-INFILE-CNT                          CAT710  
                              ' ' SV-CLIENT-NBR,                        CAT710  
                              ' ' W-NSCC-ACAT-CTL-NBR                   CAT710  
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR               CAT710  
                          ' OPT NOT FND:'                               CAT710  
                          ' SYM=' FMT-OPT-SYMBOL                        CAT710  
                           ' BS=' FMT-BUY-SELL-IND                      CAT710  
                           ' PC=' FMT-OPT-PUT-CALL                      CAT710  
                           ' OC=' FMT-OPEN-CLOSE                        CAT710  
                           ' ED=' FMT-OPT-EXP-DATE                      CAT710  
                           ' PR=' FMT-OPT-PRICE                         CAT710  
                   DISPLAY '    OPT-COMMENT=' W-NSCC-ATO-OPT-COMMENT    CAT710  
           END-IF.                                                      CAT710  
           IF  W-NSCC-AT-OPT-CATG   > '00'                              CAT710  
               INITIALIZE                W-OPT-DESC                     CAT710  
               IF W-NSCC-ATO-OPT-BS-IND      = 'B'                      CAT710  
                  MOVE 'BUY'          TO W-OPT-BUY-SELL                 CAT710  
               ELSE                                                     CAT710  
                  MOVE 'SELL'         TO W-OPT-BUY-SELL                 CAT710  
               END-IF                                                   CAT710  
               IF W-NSCC-ATO-OPT-OC-IND      = 'O'                      CAT710  
                  MOVE 'OPEN'         TO W-OPT-OPEN-CLOSE               CAT710  
               ELSE                                                     CAT710  
                  MOVE 'CLOS'         TO W-OPT-OPEN-CLOSE               CAT710  
               END-IF                                                   CAT710  
               IF W-NSCC-ATO-OPT-PC-IND     = 'C'                       CAT710  
                  MOVE 'CALL'         TO W-OPT-CALL-PUT                 CAT710  
               ELSE                                                     CAT710  
                  MOVE 'PUT '         TO W-OPT-CALL-PUT                 CAT710  
               END-IF                                                   CAT710  
               MOVE W-NSCC-ATO-OPT-SYM TO W-OPT-SYMBOL                  CAT710  
               IF   W-MSD-NOTFND-SW = 'Y'                               CAT710  
                    MOVE ' '                 TO W-OPT-MS-SYMBOL         CAT710  
               ELSE                                                     CAT710  
                    MOVE MS-SYMBOL           TO W-OPT-MS-SYMBOL         CAT710  
               END-IF                                                   CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-MM    TO W-OPT-EXPTN-MM          CAT710  
               MOVE '/'                      TO W-OPT-EXPTN-S1          CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-CC    TO W-OPT-EXPTN-CC          CAT710  
               MOVE W-NSCC-ATO-OPT-EXP-YY    TO W-OPT-EXPTN-YY          CAT710  
               MOVE W-NSCC-ATO-OPT-STKPRC-INT   TO W-STPRC-INTEGER-AMT  CAT710  
               MOVE W-NSCC-ATO-OPT-STKPRC-FRC   TO W-STPRC-FRCTN-AMT    CAT710  
               MOVE W-STPRC-INTEGER-AMT TO W-OPT-STRIKE-PRIC            CAT710  
               IF   W-STPRC-FRCTN-AMT NOT NUMERIC                       CAT710  
                    MOVE 0              TO W-STPRC-FRCTN-AMT            CAT710  
               END-IF                                                   CAT710  
               IF   W-STPRC-FRCTN = '00'                                CAT710  
                    MOVE ' '            TO W-OPT-STRIKE-FRAC            CAT710  
                    MOVE ' '            TO W-OPT-SLASH-8                CAT710  
               ELSE                                                     CAT710  
                    MOVE W-STPRC-FRCTN (2:1)                            CAT710  
                                        TO W-OPT-STRIKE-FRAC            CAT710  
                    MOVE '/8'           TO W-OPT-SLASH-8                CAT710  
               END-IF                                                   CAT710  
           END-IF.                                                      CAT710  
           IF  W-NSCC-AT-OPT-CATG     > '00'                            CAT710  
             IF (W-NSCC-AT-ASSET-DESC        (1:60) = ' ')              CAT710  
                    MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (1:60) CAT710  
                    DISPLAY 'INP=' W-INFILE-CNT                         CAT710  
                      ' W-OPT-DESC = ' W-OPT-DESC                       CAT710  
             ELSE                                                       CAT710  
              IF (W-NSCC-AT-ASSET-DESC        (31:60) = ' ')            CAT710  
                    MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (31:60)CAT710  
              ELSE                                                      CAT710  
               IF (W-NSCC-AT-ASSET-DESC        (61:60) = ' ')           CAT710  
                    MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (61:60)CAT710  
               ELSE                                                     CAT710  
                IF (W-NSCC-AT-ASSET-DESC        (91:30) = ' ')          CAT710  
                    MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (91:30)CAT710  
                END-IF                                                  CAT710  
               END-IF                                                   CAT710  
              END-IF                                                    CAT710  
             END-IF                                                     CAT710  
           END-IF.                                                      CAT710  
       7681-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7681-GET-ADP-OPTION                                    ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7682-GET-ADP-SYMBOL.                                             CAT710  
                                                                        CAT710  
           SET ENTER-SYMBOL-SEARCH TO TRUE                              CAT710  
           MOVE 'Y' TO SYMBOL-SW                                        CAT710  
           MOVE SPACES TO WS-ADP-SYMBOL                                 CAT710  
           MOVE +1 TO FMT-SYMBOL-SUB                                    CAT710  
           MOVE +2 TO ADP-SYMBOL-SUB                                    CAT710  
                                                                        CAT710  
           EVALUATE TRUE                                                CAT710  
               WHEN (FMT-BUY AND FMT-OPEN) OR (FMT-SELL AND FMT-CLOSE)  CAT710  
                   MOVE 'Q' TO WS-ADP-SYMBOL-CHAR (1)                   CAT710  
                   PERFORM 7683-GET-ADP-SYMBOL-SEARCH                   CAT710  
               WHEN (FMT-SELL AND FMT-OPEN) OR (FMT-BUY AND FMT-CLOSE)  CAT710  
                   MOVE 'X' TO WS-ADP-SYMBOL-CHAR (1)                   CAT710  
                   PERFORM 7683-GET-ADP-SYMBOL-SEARCH                   CAT710  
               WHEN OTHER                                               CAT710  
                   MOVE 'N' TO SYMBOL-SW                                CAT710  
                   SET EXIT-SYMBOL-SEARCH TO TRUE                       CAT710  
           END-EVALUATE.                                                CAT710  
       7682-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7682-GET-ADP-SYMBOL (2 PLACES)                         ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7683-GET-ADP-SYMBOL-SEARCH.                                      CAT710  
           MOVE FMT-OPT-SYMBOL TO WS-FMT-SYMBOL                         CAT710  
           PERFORM 7684-MOVE-SYMBOL-TO-ADP-SYMBOL                       CAT710  
               UNTIL WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB) = SPACES       CAT710  
               OR    FMT-SYMBOL-SUB > 6                                 CAT710  
           IF WS-ADP-SYMBOL-CHAR (2) = SPACES                           CAT710  
               MOVE 'N' TO SYMBOL-SW                                    CAT710  
               SET EXIT-SYMBOL-SEARCH TO TRUE                           CAT710  
           ELSE                                                         CAT710  
               SEARCH ALL EXP-MONTH-ENTRY                               CAT710  
                   AT END                                               CAT710  
                       MOVE 'N' TO SYMBOL-SW                            CAT710  
                       SET EXIT-SYMBOL-SEARCH TO TRUE                   CAT710  
                   WHEN EXP-MONTH (EXP-MONTH-IND) = FMT-OPT-EXP-MM      CAT710  
                       PERFORM 7685-MOVE-EXP-MONTH                      CAT710  
               END-SEARCH                                               CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF EXIT-SYMBOL-SEARCH                                        CAT710  
               CONTINUE                                                 CAT710  
           ELSE                                                         CAT710  
               SEARCH ALL STR-PRICE-ENTRY                               CAT710  
                   AT END                                               CAT710  
                       MOVE 'N' TO SYMBOL-SW                            CAT710  
                       SET EXIT-SYMBOL-SEARCH TO TRUE                   CAT710  
                   WHEN STR-PRICE (STR-PRICE-IND) =                     CAT710  
                       FMT-OPT-PRICE-POS2-3                             CAT710  
                       MOVE STR-PRICE-A (STR-PRICE-IND) TO              CAT710  
                           WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)          CAT710  
               END-SEARCH                                               CAT710  
           END-IF.                                                      CAT710  
       7683-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7683-GET-ADP-SYMBOL-SEARCH                             ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7684-MOVE-SYMBOL-TO-ADP-SYMBOL.                                  CAT710  
                                                                        CAT710  
           MOVE WS-FMT-SYMBOL-CHAR (FMT-SYMBOL-SUB)                     CAT710  
               TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)                   CAT710  
                                                                        CAT710  
           ADD +1 TO FMT-SYMBOL-SUB                                     CAT710  
           ADD +1 TO ADP-SYMBOL-SUB.                                    CAT710  
       7684-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7683-GET-ADP-SYMBOL-SEARCH                             ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7685-MOVE-EXP-MONTH.                                             CAT710  
                                                                        CAT710  
           IF FMT-PUT                                                   CAT710  
               MOVE EXP-MONTH-PUT (EXP-MONTH-IND)                       CAT710  
                   TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               CAT710  
           ELSE                                                         CAT710  
               MOVE EXP-MONTH-CALL (EXP-MONTH-IND)                      CAT710  
                   TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               CAT710  
           END-IF                                                       CAT710  
           MOVE WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)                     CAT710  
                                                 TO W-MSDINF-MONTH-CODE.CAT710  
                                                                        CAT710  
           ADD +1 TO ADP-SYMBOL-SUB.                                    CAT710  
       7685-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7681-GET-ADP-OPTION (2 PLACES)                         ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7686-GET-ADP-OPTION-AMEX.                                        CAT710  
                                                                        CAT710  
           PERFORM 7687-GET-ADP-AMEX-SYMBOL                             CAT710  
                                                                        CAT710  
           IF SYMBOL-IS-FOUND                                           CAT710  
               MOVE WS-ADP-SYMBOL TO GETXRF-SEARCH-KEY                  CAT710  
               PERFORM 7688-CALL-MSDXREF                                CAT710  
           END-IF.                                                      CAT710  
       7686-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7686-GET-ADP-OPTION-AMEX                               ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7687-GET-ADP-AMEX-SYMBOL.                                        CAT710  
                                                                        CAT710  
           MOVE 'Y' TO SYMBOL-SW                                        CAT710  
           IF FMT-OPT-PRICE IS NOT NUMERIC                              CAT710  
               MOVE 'N' TO SYMBOL-SW                                    CAT710  
           ELSE                                                         CAT710  
               IF FMT-OPT-PRICE-POS1 NOT = '0'                          CAT710  
                   MOVE FMT-OPT-PRICE-POS1                              CAT710  
                       TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)           CAT710  
                   ADD +1 TO ADP-SYMBOL-SUB                             CAT710  
               END-IF                                                   CAT710  
               MOVE FMT-OPT-PRICE-POS2                                  CAT710  
                   TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               CAT710  
               ADD +1 TO ADP-SYMBOL-SUB                                 CAT710  
               MOVE FMT-OPT-PRICE-POS3                                  CAT710  
                   TO WS-ADP-SYMBOL-CHAR (ADP-SYMBOL-SUB)               CAT710  
           END-IF.                                                      CAT710  
       7687-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
      ******************************************************************CAT710  
      *** PERFORMED BY:                                              ***CAT710  
      ***     7681-GET-ADP-OPTION                                    ***CAT710  
      ***     7683-GET-ADP-OPTION-AMEX                               ***CAT710  
      ******************************************************************CAT710  
                                                                        CAT710  
       7688-CALL-MSDXREF.                                               CAT710  
                                                                        CAT710  
           SET GETXRF-DEVICE-DISK        TO TRUE                        CAT710  
           SET GETXRF-ACCESS-RANDOM      TO TRUE                        CAT710  
           SET GETXRF-RETURN-VALID       TO TRUE                        CAT710  
           CALL GETXREF USING GETXRF-CALLING-INFO.                      CAT710  
                                                                        CAT710  
           EVALUATE TRUE                                                CAT710  
               WHEN GETXRF-RETURN-VALID                                 CAT710  
                   ADD 1 TO W-XRF-FND-CNT                               CAT710  
                   MOVE SPACES           TO FMT-ADP-SEC-NO              CAT710  
                   MOVE SPACE            TO GETMSD-SEARCH-KEY-AREA      CAT710  
                   MOVE ALL ZERO         TO GETMSD-WI-CODE              CAT710  
                                            GETMSD-CLIENT-NO            CAT710  
                   MOVE MSXREF-ADP-NO    TO GETMSD-SEARCH-KEY           CAT710  
                   CALL GETMSDC USING MASTER-SECURITY-RECORD            CAT710  
                   IF  GETMSD-RETURN-VALID                              CAT710  
124900               IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR  12440002
230800                 PERFORM 7910-CHECK-PRNGFL     THRU 7910-EXIT     23010002
                     END-IF                                             23011002
                   END-IF                                                       
230900                                                                  23020000
                   IF  GETMSD-RETURN-VALID                              CAT710  
                       ADD 1 TO W-MSD-FND-CNT                           CAT710  
                       MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL       CAT710  
                       MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO       CAT710  
                       MOVE 'XX'                TO FMT-CUSIP-NO (1:2)   CAT710  
                       MOVE MS-ADP-NO           TO FMT-CUSIP-NO (3:7)   CAT710  
                       MOVE MS-DESC1            TO FMT-DESC1            CAT710  
                       MOVE MS-DESC2            TO FMT-DESC2            CAT710  
                       MOVE MS-DESC3            TO FMT-DESC3            CAT710  
                   ELSE                                                 CAT710  
                       ADD 1 TO W-MSD-NOTFND-CNT                        CAT710  
                   END-IF                                               CAT710  
               WHEN OTHER                                               CAT710  
                       ADD 1 TO W-XRF-NOTFND-CNT                        CAT710  
           END-EVALUATE.                                                CAT710  
       7688-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7690-READ-INF-IDX           SECTION.                             CAT710  
           MOVE '7690-READ-INF-IDX            ' TO W-ROUTINE.           CAT710  
                                                                        CAT710  
           PERFORM 7692-GET-MSDINF-SYMBOL    THRU 7692-EXIT             CAT710  
           IF  W-MSDINF-SYMBOL-SW = 'Y'                                 CAT710  
               PERFORM 7694-GET-MSDINF-MONTH THRU 7694-EXIT             CAT710  
               IF  W-MSDINF-MONTH-SW = 'Y'                              CAT710  
                   PERFORM 7696-READ-MSDIDX  THRU 7696-EXIT             CAT710  
               END-IF                                                   CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7690-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7692-GET-MSDINF-SYMBOL      SECTION.                             CAT710  
           MOVE '7692-GET-MSDINF-SYMBOL       ' TO W-ROUTINE.           CAT710  
                                                                        CAT710  
           MOVE 'N'  TO W-MSDINF-SYMBOL-SW                              CAT710  
           MOVE SPACES                      TO MSDINF-FILE-RECORD       CAT710  
           MOVE W-NSCC-ATO-OPT-SYM          TO MSDINF-FILE-KEY          CAT710  
                                                                        CAT710  
           READ MSDINF.                                                 CAT710  
                                                                        CAT710  
           IF MSDINF-OKAY                                               CAT710  
               ADD 1     TO W-MSDINF-SYMBOL-CNT                         CAT710  
               MOVE 'Y'  TO W-MSDINF-SYMBOL-SW                          CAT710  
               MOVE MSDINF-FILE-RECORD TO MSDINF-REC2                   CAT710  
               MOVE MSDINF-SEC-NUM   TO W-MSDINF-SEC-NUM                CAT710  
           ELSE                                                         CAT710  
             IF MSDINF-END-OF-FILE                                      CAT710  
             OR MSDINF-NOT-FOUND                                        CAT710  
               ADD 1     TO W-MSDINF-NOTFND-CNT                         CAT710  
               MOVE 'N'  TO W-MSDINF-SYMBOL-SW                          CAT710  
                GO TO 7692-EXIT                                         CAT710  
             ELSE                                                       CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                        ' MSDINF FILE, READ NEXT ERROR'                 CAT710  
                        ' FILE-STATUS = ' MSDINF-STAT                   CAT710  
                DISPLAY 'MSDINF-FILE-KEY = ' MSDINF-FILE-KEY            CAT710  
                MOVE +3701    TO ABEND-CODE                             CAT710  
                CALL ABEND USING ABEND-CODE                             CAT710  
             END-IF                                                     CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7692-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7694-GET-MSDINF-MONTH  SECTION.                                  CAT710  
           MOVE '7694-GET-MSDINF-MONTH        ' TO W-ROUTINE.           CAT710  
                                                                        CAT710  
           MOVE 'N'  TO W-MSDINF-MONTH-SW                               CAT710  
           MOVE LOW-VALUES               TO MSDINF-REC1.                CAT710  
           MOVE HIGH-VALUES              TO MSDINF-REC-KEY1.            CAT710  
           MOVE W-MSDINF-MONTH-CODE      TO MSDINF-MONTH-CODE.          CAT710  
           MOVE MSDINF-REC1              TO MSDINF-FILE-RECORD          CAT710  
                                                                        CAT710  
           READ MSDINF.                                                 CAT710  
                                                                        CAT710  
           IF MSDINF-OKAY                                               CAT710  
               ADD 1     TO W-MSDINF-MONTH-CNT                          CAT710  
               MOVE 'Y'  TO W-MSDINF-MONTH-SW                           CAT710  
               MOVE MSDINF-FILE-RECORD TO MSDINF-REC1                   CAT710  
               MOVE MSDINF-EXP-DATE    TO W-MSDINF-EXP-DATE-UNPACK      CAT710  
               IF   W-MSDINF-EXP-CCYYMM = FMT-OPT-EXP-DATE (1:6)        CAT710  
                    MOVE MSDINF-EXP-DATE   TO W-MSDINF-EXP-DATE         CAT710  
               ELSE                                                     CAT710  
                 MOVE MSDINF-EXP-DATE-2 TO W-MSDINF-EXP-DATE-UNPACK     CAT710  
                 IF W-MSDINF-EXP-CCYYMM = FMT-OPT-EXP-DATE (1:6)        CAT710  
                    MOVE MSDINF-EXP-DATE-2 TO W-MSDINF-EXP-DATE         CAT710  
                 ELSE                                                   CAT710  
                   MOVE MSDINF-EXP-DATE-3 TO W-MSDINF-EXP-DATE-UNPACK   CAT710  
                   IF W-MSDINF-EXP-CCYYMM = FMT-OPT-EXP-DATE (1:6)      CAT710  
                      MOVE MSDINF-EXP-DATE-3 TO W-MSDINF-EXP-DATE       CAT710  
                   ELSE                                                 CAT710  
                      MOVE MSDINF-EXP-DATE TO W-MSDINF-EXP-DATE-UNPACK  CAT710  
                      MOVE MSDINF-EXP-DATE TO W-MSDINF-EXP-DATE         CAT710  
                   END-IF                                               CAT710  
                 END-IF                                                 CAT710  
               END-IF                                                   CAT710  
           ELSE                                                         CAT710  
             IF MSDINF-END-OF-FILE                                      CAT710  
             OR MSDINF-NOT-FOUND                                        CAT710  
                MOVE 'N'  TO W-MSDINF-MONTH-SW                          CAT710  
                GO TO 7694-EXIT                                         CAT710  
             ELSE                                                       CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                        ' MSDINF FILE, READ EOF/NOTFND'                 CAT710  
                        ' FILE-STATUS = ' MSDINF-STAT                   CAT710  
                DISPLAY 'MSDINF-FILE-KEY = ' MSDINF-FILE-KEY            CAT710  
                MOVE +3702    TO ABEND-CODE                             CAT710  
                CALL ABEND USING ABEND-CODE                             CAT710  
             END-IF                                                     CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7694-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7696-READ-MSDIDX      SECTION.                                   CAT710  
           MOVE '7696-READ-MSDIDX             ' TO W-ROUTINE.           CAT710  
                                                                        CAT710  
           MOVE 'N'  TO W-MSDIDX-FND-SW                                 CAT710  
           MOVE LOW-VALUES               TO MSDIDX-RECORD.              CAT710  
           MOVE 'O'                      TO MSDIDX-TYPE.                CAT710  
           MOVE W-MSDINF-SEC-NUM         TO MSDIDX-OPT-XREF.            CAT710  
           COMPUTE WS-MSDIDX-KEY-1 = W-MSDINF-EXP-DATE * +10.           CAT710  
           MOVE WS-MSDIDX-KEY-3          TO WS-MSDIDX-KEY-5.            CAT710  
           MOVE WS-MSDIDX-KEY-5          TO MSDIDX-OPT-EXP.             CAT710  
           MOVE W-STPRC-INTEGER-AMT      TO ED-OPT-PRC-WHOLE            CAT710  
           IF   W-STPRC-FRCTN-AMT = 0                                   CAT710  
                MOVE 0                   TO ED-OPT-PRC-FRAC             CAT710  
           ELSE                                                         CAT710  
                COMPUTE ED-OPT-PRC-FRAC = W-STPRC-FRCTN-AMT / 8         CAT710  
           END-IF                                                       CAT710  
           MOVE ED-OPT-PRC-OUT     TO WS-STRIKE-PRICE11.                CAT710  
           COMPUTE WS-STR-PRC7 ROUNDED = WS-STRIKE-PRC10.               CAT710  
           MOVE WS-STRIKE-PRC10          TO MSDIDX-OPT-STRK-PR.         CAT710  
           MOVE W-NSCC-ATO-OPT-PC-IND    TO MSDIDX-OPT-TYPE.            CAT710  
           MOVE MSDIDX-KEY               TO WS-SAVE-MSDIDX-KEY          CAT710  
           MOVE MSDIDX-RECORD            TO MSDIDX-FILE-RECORD.         CAT710  
           MOVE +0                       TO WS-MSDIDX-KEY-1             CAT710  
           MOVE MSDIDX-OPT-EXP           TO WS-MSDIDX-KEY-3             CAT710  
           MOVE WS-MSDIDX-KEY-1          TO WS-MSDIDX-EXP-DATE          CAT710  
                                                                        CAT710  
           START MSDIDX KEY NOT < MSDIDX-FILE-KEY                       CAT710  
                                                                        CAT710  
           IF MSDIDX-OKAY                                               CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
             IF MSDIDX-END-OF-FILE                                      CAT710  
             OR MSDIDX-NOT-FOUND                                        CAT710  
                GO TO 7696-EXIT                                         CAT710  
             ELSE                                                       CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                        ' MSDIDX FILE, START BROWSE ERROR'              CAT710  
                        ' FILE-STATUS = ' MSDIDX-STAT                   CAT710  
                DISPLAY 'MSDIDX-FILE-KEY = ' W-NSCC-ATO-OPT-SYM         CAT710  
                MOVE +3703    TO ABEND-CODE                             CAT710  
                CALL ABEND USING ABEND-CODE                             CAT710  
             END-IF                                                     CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7696-READ-MSDIDX-NEXT.                                           CAT710  
                                                                        CAT710  
           READ MSDIDX NEXT RECORD.                                     CAT710  
                                                                        CAT710  
           MOVE MSDIDX-FILE-RECORD    TO MSDIDX-RECORD                  CAT710  
                                                                        CAT710  
           IF MSDIDX-OKAY                                               CAT710  
              CONTINUE                                                  CAT710  
           ELSE                                                         CAT710  
             IF MSDIDX-END-OF-FILE                                      CAT710  
                GO TO 7696-EXIT                                         CAT710  
             ELSE                                                       CAT710  
                DISPLAY 'INP=' W-INFILE-CNT                             CAT710  
                        ' MSDIDX FILE, READ NEXT ERROR'                 CAT710  
                        ' FILE-STATUS = ' MSDIDX-STAT                   CAT710  
                DISPLAY 'MSDIDX-FILE-KEY = ' MSDIDX-FILE-KEY            CAT710  
                MOVE +3704    TO ABEND-CODE                             CAT710  
                CALL ABEND USING ABEND-CODE                             CAT710  
             END-IF                                                     CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE +0                       TO WS-MSDIDX-KEY-1             CAT710  
           MOVE MSDIDX-OPT-EXP           TO WS-MSDIDX-KEY-3             CAT710  
           MOVE WS-MSDIDX-KEY-1          TO WS-MSDIDX-EXP-DATE          CAT710  
           IF  MSDIDX-KEY (1:14)          = WS-COMP-MSDIDX-KEY          CAT710  
               ADD 1     TO W-MSDIDX-FND-CNT                            CAT710  
               MOVE 'Y'  TO W-MSDIDX-FND-SW                             CAT710  
               MOVE SPACE             TO GETMSD-SEARCH-KEY-AREA         CAT710  
               MOVE ALL ZERO          TO GETMSD-WI-CODE                 CAT710  
                                         GETMSD-CLIENT-NO               CAT710  
               MOVE MSDIDX-OPT-SEC-NO TO GETMSD-SEARCH-KEY              CAT710  
               IF (FMT-BUY  AND FMT-OPEN) OR                            CAT710  
                  (FMT-SELL AND FMT-CLOSE)                              CAT710  
                   MOVE '8'           TO GETMSD-SEARCH-KEY(1:1)         CAT710  
                ELSE                                                    CAT710  
                   MOVE '9'           TO GETMSD-SEARCH-KEY(1:1)         CAT710  
               END-IF                                                   CAT710  
               CALL GETMSDC USING MASTER-SECURITY-RECORD                CAT710  
               IF  GETMSD-RETURN-VALID                                  CAT710  
124900               IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR  12440002
230800                 PERFORM 7910-CHECK-PRNGFL     THRU 7910-EXIT     23010002
                     END-IF                                             23011002
               END-IF                                                           
230900                                                                  23020000
               IF   GETMSD-RETURN-VALID                                 CAT710  
                AND MS-SYMBOL > ' '                                     CAT710  
DJ0001             PERFORM 7697-SCAN-FOR-OPT-SYM THRU 7697-EXIT         CAT710  
DJ0001             IF OPT-SYMBOL = W-NSCC-ATO-OPT-SYM                   CAT710  
DJ0001                       CONTINUE                                   CAT710  
DJ0001             ELSE                                                 CAT710  
DJ0001                       GO TO 7696-READ-MSDIDX-NEXT                CAT710  
DJ0001             END-IF                                               CAT710  
                   MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL           CAT710  
                   MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO           CAT710  
                   MOVE 'XX'                TO FMT-CUSIP-NO (1:2)       CAT710  
                   MOVE MS-ADP-NO           TO FMT-CUSIP-NO (3:7)       CAT710  
                   MOVE MS-DESC1            TO FMT-DESC1                CAT710  
                   MOVE MS-DESC2            TO FMT-DESC2                CAT710  
                   MOVE MS-DESC3            TO FMT-DESC3                CAT710  
                ELSE                                                    CAT710  
                        CONTINUE                                        CAT710  
                        GO TO 7696-READ-MSDIDX-NEXT                     CAT710  
               END-IF                                                   CAT710  
           ELSE                                                         CAT710  
               ADD 1     TO W-MSDIDX-NOTFND-CNT                         CAT710  
               MOVE 'N'  TO W-MSDIDX-FND-SW                             CAT710  
               MOVE +0                       TO WS-MSDIDX-KEY-1         CAT710  
               MOVE WS-SAVE-MSDIDX-OPT-EXP   TO WS-MSDIDX-KEY-3         CAT710  
               MOVE WS-MSDIDX-KEY-1          TO WS-MSDIDX-EXP-DATE      CAT710  
DJ0001         DISPLAY 'INP=' W-INFILE-CNT                              CAT710  
DJ0001                    ' ' SV-CLIENT-NBR,                            CAT710  
DJ0001                    ' ' W-NSCC-ACAT-CTL-NBR                       CAT710  
DJ0001                ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                   CAT710  
DJ0001                ' MSDIDX NOTFD'                                   CAT710  
DJ0001         DISPLAY ' OPT:' W-NSCC-ATO-OPT-SYM                       CAT710  
DJ0001                    '  ' W-NSCC-ATO-OPT-BS-IND                    CAT710  
DJ0001                     ' ' W-NSCC-ATO-OPT-PC-IND                    CAT710  
DJ0001                     ' ' W-NSCC-ATO-OPT-OC-IND                    CAT710  
DJ0001                   '   ' W-NSCC-ATO-OPT-EXP-DT (5:2)              CAT710  
DJ0001                         W-NSCC-ATO-OPT-EXP-DT (3:2)              CAT710  
DJ0001                         W-NSCC-ATO-OPT-EXP-DT (1:2)              CAT710  
DJ0001                     ' ' W-NSCC-ATO-OPT-STKPRC-INT                CAT710  
DJ0001                     ' ' W-NSCC-ATO-OPT-STKPRC-FRC                CAT710  
DJ0001                    '  ' W-NSCC-ATO-OPT-COMMENT                   CAT710  
DJ0001         DISPLAY ' ADP=' SECURITY-ADP-NBR OF DCLVASSET            CAT710  
DJ0001                 ' TXT=' ASSET-DESC-TXT OF DCLVASSET (1:90)       CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7696-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
DJ0001 7697-SCAN-FOR-OPT-SYM.                                           CAT710  
DJ0001                                                                  CAT710  
DJ0001     MOVE  MS-SYMBOL               TO OPT-WORK1                   CAT710  
DJ0001     MOVE    12                    TO SUB2                        CAT710  
DJ0001     PERFORM UNTIL NOT (OPT-WORK3 (SUB2) = SPACES)                CAT710  
DJ0001         SUBTRACT 1              FROM SUB2                        CAT710  
DJ0001     END-PERFORM                                                  CAT710  
DJ0001                                                                  CAT710  
DJ0001     IF  OPT-WORK3 (SUB2) IS NUMERIC                              CAT710  
DJ0001         SUBTRACT 1 FROM SUB2                                     CAT710  
DJ0001         PERFORM UNTIL NOT (OPT-WORK3 (SUB2) IS NUMERIC)          CAT710  
DJ0001                 SUBTRACT 1 FROM SUB2                             CAT710  
DJ0001         END-PERFORM                                              CAT710  
DJ0001         SUBTRACT 1 FROM SUB2                                     CAT710  
DJ0001     ELSE                                                         CAT710  
DJ0001         SUBTRACT 2              FROM SUB2                        CAT710  
DJ0001     END-IF                                                       CAT710  
DJ0001                                                                  CAT710  
DJ0001     MOVE SPACES                   TO OPTION-SYMBOL1 (1)          CAT710  
DJ0001                                      OPTION-SYMBOL1 (2)          CAT710  
DJ0001                                      OPTION-SYMBOL1 (3)          CAT710  
DJ0001                                                                  CAT710  
DJ0001     MOVE 3                        TO SUB3                        CAT710  
DJ0001     PERFORM UNTIL SUB2 = 1                                       CAT710  
DJ0001         MOVE  OPT-WORK3 (SUB2)    TO OPTION-SYMBOL1 (SUB3)       CAT710  
DJ0001         SUBTRACT 1              FROM SUB2                        CAT710  
DJ0001                                      SUB3                        CAT710  
DJ0001         END-SUBTRACT                                             CAT710  
DJ0001     END-PERFORM                                                  CAT710  
DJ0001                                                                  CAT710  
DJ0001     MOVE 1                        TO SUB2                        CAT710  
DJ0001                                      SUB3                        CAT710  
DJ0001     MOVE SPACES                   TO OPT-SYMBOL                  CAT710  
DJ0001     PERFORM UNTIL SUB3 > 3                                       CAT710  
DJ0001         IF  OPTION-SYMBOL1 (SUB3) = SPACES                       CAT710  
DJ0001             ADD  1                TO SUB3                        CAT710  
DJ0001         ELSE                                                     CAT710  
DJ0001             MOVE  OPTION-SYMBOL1 (SUB3) TO                       CAT710  
DJ0001                   OPTION-SYMBOL  (SUB2)                          CAT710  
DJ0001             ADD  1                TO SUB3                        CAT710  
DJ0001                                      SUB2                        CAT710  
DJ0001             END-ADD                                              CAT710  
DJ0001         END-IF                                                   CAT710  
DJ0001     END-PERFORM.                                                 CAT710  
DJ0001                                                                  CAT710  
DJ0001 7697-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7700-GETMSDC.                                                    CAT710  
           MOVE '7700-GETMSDC           ' TO W-ROUTINE.                 CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-ASSET-PRC-CATG =                               CAT710  
              'CORP' OR 'MUNI' OR 'ZERO'                                CAT710  
               PERFORM 7800-BONDS      THRU 7800-EXIT                   CAT710  
               GO TO 7700-EXIT                                          CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           MOVE ' '                    TO   GETMSD-RETURN-CODE.         CAT710  
           MOVE SPACE                  TO   GETMSD-SEARCH-KEY-AREA.     CAT710  
           MOVE ALL ZERO               TO   GETMSD-WI-CODE              CAT710  
                                            GETMSD-CLIENT-NO.           CAT710  
           IF   W-NSCC-AT-WHN-ISS-IND = 'W'                             CAT710  
                MOVE '1'               TO   GETMSD-WI-CODE              CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-SEC-ID = ' '                                   CAT710  
               MOVE ' '              TO W-MSD-NOTFND-SW                 CAT710  
               ADD 1 TO W-BLANK-SEC-CNT                                 CAT710  
GOTO           GO TO 7700-EXIT                                          CAT710  
           ELSE                                                         CAT710  
               MOVE W-NSCC-AT-SEC-ID     TO GETMSD-SEARCH-KEY           CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.     CAT710  
           IF  GETMSD-RETURN-VALID                                      CAT710  
124900         IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR        12440002
230800             PERFORM 7910-CHECK-PRNGFL     THRU 7910-EXIT         23010002
               END-IF                                                   23011002
           END-IF                                                               
                                                                        CAT710  
           IF GETMSD-RETURN-VALID                                       CAT710  
              ADD 1 TO W-MSD-FND-CNT                                    CAT710  
              MOVE 'N'         TO W-MSD-NOTFND-SW                       CAT710  
              SET DIFFERENCE-FOUND TO TRUE                              CAT710  
LRM           IF W-NSCC-SETTLE-CLOSE                                    CAT710  
              AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                        CAT710  
LRM007        AND NOT PARM-WM-RUN                                               
                      IF SECURITY-ADP-NBR  OF DCLVASSET = ' '           CAT710  
                         DISPLAY 'INP=' W-INFILE-CNT                    CAT710  
                              ' ' SV-CLIENT-NBR,                        CAT710  
                              ' ' W-NSCC-ACAT-CTL-NBR                   CAT710  
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR               CAT710  
                             ' STL-CLS'                                 CAT710  
                             ' SEC=' W-NSCC-AT-SEC-ID                   CAT710  
                             ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET     CAT710  
                             ' NEW=' MS-ADP-NO      '(NOT REPLACED2)'   CAT710  
                      END-IF                                            CAT710  
              ELSE                                                      CAT710  
                 MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET       CAT710  
              END-IF                                                    CAT710  
              MOVE MS-DESC1 TO W-NSCC-AT-ASSET-DESC (1:30)              CAT710  
              MOVE MS-DESC2 TO W-NSCC-AT-ASSET-DESC (31:30)             CAT710  
              MOVE MS-DESC3 TO W-NSCC-AT-ASSET-DESC (61:30)             CAT710  
              MOVE MS-ADP-NO            TO WK-POS-DESC5-SEC             CAT710  
              MOVE WK-POS-DESC5 TO W-NSCC-AT-ASSET-DESC (121:20)        CAT710  
              IF  W-NSCC-AT-SEC-ID = ' '                                CAT710  
                  IF  MS-CUSIP-NO > ' '                                 CAT710  
                      MOVE 'US'      TO W-NSCC-AT-SEC-CNTRY-CD          CAT710  
                      MOVE MS-CUSIP-NO TO W-NSCC-AT-SEC-ID              CAT710  
                  ELSE                                                  CAT710  
                      MOVE 'US'      TO W-NSCC-AT-SEC-CNTRY-CD          CAT710  
                      MOVE 'XX'        TO W-NSCC-AT-SEC-ID (1:2)        CAT710  
                      MOVE MS-ADP-NO   TO W-NSCC-AT-SEC-ID (3:7)        CAT710  
                  END-IF                                                CAT710  
              END-IF                                                    CAT710  
           ELSE                                                         CAT710  
LRM           IF NOT W-NSCC-SETTLE-CLOSE                                CAT710  
                OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                         CAT710  
                 MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET       CAT710  
              END-IF                                                    CAT710  
              ADD 1 TO W-MSD-NOTFND-CNT                                 CAT710  
              MOVE 'Y'         TO W-MSD-NOTFND-SW                       CAT710  
              DISPLAY 'INP=' W-INFILE-CNT                               CAT710  
                              ' ' SV-CLIENT-NBR,                        CAT710  
                              ' ' W-NSCC-ACAT-CTL-NBR                   CAT710  
                     ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                    CAT710  
                     ' MSD-NOTFND'                                      CAT710  
                     ' SEC=' W-NSCC-AT-SEC-ID                           CAT710  
                     ' STL=' W-NSCC-AT-STL-LOC                          CAT710  
                     ' RSN=' W-NSCC-AT-STL-LOC-RSN-CD                   CAT710  
                     ' CTG=' W-NSCC-AT-ASSET-PRC-CATG                   CAT710  
                     ' OPC=' W-NSCC-AT-OPT-CATG                         CAT710  
                     ' BND=' W-NSCC-AT-BEARER-BOND                      CAT710  
                     ' WHN=' W-NSCC-AT-WHN-ISS-IND                      CAT710  
              DISPLAY '    DSC=' W-NSCC-AT-ASSET-DESC (1:110)           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7700-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       7800-BONDS           SECTION.                                    CAT710  
                                                                        CAT710  
           IF  W-NSCC-AT-BEARER-BOND = 'B'                              CAT710  
               PERFORM 7810-BEARER-BOND THRU 7810-EXIT                  CAT710  
           ELSE                                                         CAT710  
               IF  W-NSCC-AT-ASSET-PRC-CATG = 'MUNI'                    CAT710  
                   PERFORM 7820-MUNI-BOND THRU 7820-EXIT                CAT710  
               ELSE                                                     CAT710  
                   PERFORM 7830-REGISTERED-BOND THRU 7830-EXIT          CAT710  
               END-IF                                                   CAT710  
           END-IF                                                       CAT710  
                                                                        CAT710  
           IF  GETXRF-RETURN-VALID                                      CAT710  
           AND GETMSD-RETURN-VALID                                      CAT710  
              ADD 1 TO W-MSD-FND-CNT                                    CAT710  
              ADD 1 TO W-BOND-FND-CNT                                   CAT710  
              MOVE 'N'           TO W-MSD-NOTFND-SW                     CAT710  
              IF W-NSCC-SETTLE-CLOSE                                    CAT710  
              AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                        CAT710  
LRM007        AND NOT PARM-WM-RUN                                               
                      IF SECURITY-ADP-NBR  OF DCLVASSET = ' '           CAT710  
                         DISPLAY 'INP=' W-INFILE-CNT                    CAT710  
                              ' ' SV-CLIENT-NBR,                        CAT710  
                              ' ' W-NSCC-ACAT-CTL-NBR                   CAT710  
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR               CAT710  
                             ' STL-CLS'                                 CAT710  
                             ' SEC=' W-NSCC-AT-SEC-ID                   CAT710  
                             ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET     CAT710  
                             ' NEW=' MS-ADP-NO      '(NOT REPLACED3)'   CAT710  
                      END-IF                                            CAT710  
              ELSE                                                      CAT710  
                 MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET       CAT710  
              END-IF                                                    CAT710  
              MOVE ' '           TO W-NSCC-AT-ASSET-DESC                CAT710  
              MOVE MS-DESC1      TO W-NSCC-AT-ASSET-DESC (1:30)         CAT710  
              MOVE MS-DESC2      TO W-NSCC-AT-ASSET-DESC (31:30)        CAT710  
              MOVE MS-DESC3      TO W-NSCC-AT-ASSET-DESC (61:30)        CAT710  
              MOVE MS-ADP-NO     TO WK-POS-DESC5-SEC                    CAT710  
              MOVE WK-POS-DESC5  TO W-NSCC-AT-ASSET-DESC (121:20)       CAT710  
                                                                        CAT710  
           ELSE                                                         CAT710  
LRM           IF NOT W-NSCC-SETTLE-CLOSE                                CAT710  
                OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                         CAT710  
                 MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET       CAT710  
              END-IF                                                    CAT710  
              ADD 1 TO W-MSD-NOTFND-CNT                                 CAT710  
              ADD 1 TO W-BOND-NOTFND-CNT                                CAT710  
              MOVE 'Y'         TO W-MSD-NOTFND-SW                       CAT710  
              MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET       CAT710  
              MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET       CAT710  
              DISPLAY 'INP=' W-INFILE-CNT                               CAT710  
                     ' BOND NOTFD'                                      CAT710  
                     ' SEC=' W-NSCC-AT-SEC-ID                           CAT710  
                     ' STL=' W-NSCC-AT-STL-LOC                          CAT710  
                     ' RSN=' W-NSCC-AT-STL-LOC-RSN-CD                   CAT710  
                     ' CTG=' W-NSCC-AT-ASSET-PRC-CATG                   CAT710  
                     ' OPC=' W-NSCC-AT-OPT-CATG                         CAT710  
                     ' BND=' W-NSCC-AT-BEARER-BOND                      CAT710  
                     ' WHN=' W-NSCC-AT-WHN-ISS-IND                      CAT710  
              DISPLAY '    '                                            CAT710  
                     'DESC=' W-NSCC-AT-ASSET-DESC (1:110)               CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7800-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7810-BEARER-BOND.                                                CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7810-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7810-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7820-MUNI-BOND.                                                  CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7820-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7820-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7830-REGISTERED-BOND.                                            CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE '0'                  TO GETXRF-WI-CODE                  CAT710  
           MOVE W-NSCC-AT-SEC-ID     TO GETXRF-SEARCH-KEY (1:9)         CAT710  
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)        CAT710  
           PERFORM 7840-GETXREF THRU 7840-EXIT                          CAT710  
           IF GETXRF-RETURN-VALID                                       CAT710  
              GO TO 7830-EXIT                                           CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       7830-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       7840-GETXREF.                                                    CAT710  
                                                                        CAT710  
           MOVE ' '          TO GETMSD-RETURN-CODE                      CAT710  
           MOVE ' '          TO GETXRF-RETURN-CODE                      CAT710  
           CALL GETXREF USING GETXRF-CALLING-INFO.                      CAT710  
           EVALUATE TRUE                                                CAT710  
               WHEN  GETXRF-RETURN-VALID                                CAT710  
                                                                        CAT710  
                   MOVE SPACE            TO GETMSD-SEARCH-KEY-AREA      CAT710  
                   MOVE ALL ZERO         TO GETMSD-WI-CODE              CAT710  
                                            GETMSD-CLIENT-NO            CAT710  
                   MOVE MSXREF-ADP-NO    TO GETMSD-SEARCH-KEY           CAT710  
                   CALL GETMSDC USING MASTER-SECURITY-RECORD            CAT710  
                   IF  GETMSD-RETURN-VALID                              CAT710  
124900              IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR   12440002
230800                PERFORM 7910-CHECK-PRNGFL     THRU 7910-EXIT      23010002
                    END-IF                                              23011002
                   END-IF                                                       
                                                                        CAT710  
                   IF GETMSD-RETURN-VALID                               CAT710  
                      MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL        CAT710  
                      MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO        CAT710  
                      MOVE MS-CUSIP-AREA       TO FMT-CUSIP-NO          CAT710  
                      MOVE MS-DESC1            TO FMT-DESC1             CAT710  
                      MOVE MS-DESC2            TO FMT-DESC2             CAT710  
                      MOVE MS-DESC3            TO FMT-DESC3             CAT710  
                   ELSE                                                 CAT710  
                     DISPLAY 'INP=' W-INFILE-CNT                        CAT710  
                     ' BOND MSDFD'                                      CAT710  
                     ' SEC=' W-NSCC-AT-SEC-ID                           CAT710  
                     ' CTG=' W-NSCC-AT-ASSET-PRC-CATG                   CAT710  
                     ' BND=' W-NSCC-AT-BEARER-BOND                      CAT710  
                     ' KEY=' GETXRF-SEARCH-KEY                          CAT710  
                     ' ADP=' MSXREF-ADP-NO                              CAT710  
                   END-IF                                               CAT710  
                                                                        CAT710  
               WHEN  GETXRF-RETURN-EOF                                  CAT710  
                 OR  GETXRF-INVALID-SYMBOL-CUSIP                        CAT710  
                 OR  GETXRF-RETURN-REC-NOT-FOUND                        CAT710  
                 OR  GETXRF-REQ-KEY-SECURITY-NO                         CAT710  
                   CONTINUE                                             CAT710  
                                                                        CAT710  
               WHEN  GETXRF-RETURN-IO-ERROR                             CAT710  
                     DISPLAY ' CAT710WM: CALL GETXREF ERROR'            CAT710  
                             ' GETXRF-RETURN-CODE='                     CAT710  
                               GETXRF-RETURN-CODE                       CAT710  
                     MOVE +3705    TO ABEND-CODE                        CAT710  
                     CALL ABEND USING ABEND-CODE                        CAT710  
               WHEN  OTHER                                              CAT710  
                   CONTINUE                                             CAT710  
           END-EVALUATE.                                                CAT710  
                                                                        CAT710  
       7840-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
                                                                        12431002
306300 7910-CHECK-PRNGFL.                                               30560002
306400     MOVE '7910-CHECK-PRNGFL             ' TO W-ROUTINE.          30570002
306500                                                                  30580000
306600     MOVE 'N'  TO W-PRNGFL-SW                                     30590000
306700     MOVE SPACES                      TO PRNGREC                  30600000
306800     MOVE MS-ADP-NO                   TO PRNGKEY                  30610002
306900                                                                  30620000
307000     START PRNGFL KEY NOT < PRNGKEY                               30630000
307100                                                                  30640000
307200     IF PRNGFL-OKAY                                               30650000
307300        CONTINUE                                                  30660000
307400     ELSE                                                         30670000
307500       IF PRNGFL-END-OF-FILE                                      30680000
307600       OR PRNGFL-NOT-FOUND                                        30690000
307700          GO TO 7910-EXIT                                         30700002
307800       ELSE                                                       30710000
307900          DISPLAY ' ** CAT710WM - PRNGFL FILE, START BROWSE ERR'  30720001
308000                  ' FILE-STATUS = ' PRNGFL-STAT                   30730000
308100          DISPLAY 'W-PRNGFL-KEY = ' MS-ADP-NO                     30740002
308200          MOVE +3105    TO ABEND-CODE                             30750000
308300          CALL ABEND USING ABEND-CODE                             30760000
308400       END-IF                                                     30770000
308500     END-IF.                                                      30780000
308600                                                                  30790000
308700 7910-READ-PRNGFL-NEXT.                                           30800002
308800                                                                  30810000
308900     READ PRNGFL NEXT RECORD.                                     30820000
309000                                                                  30830000
309100     IF PRNGFL-OKAY                                               30840000
309200        CONTINUE                                                  30850000
309300     ELSE                                                         30860000
309400       IF PRNGFL-END-OF-FILE                                      30870000
309500          GO TO 7910-EXIT                                         30880002
309600       ELSE                                                       30890000
309700          DISPLAY ' ** CAT710WM - PRNGFL FILE, READ NEXT ERROR'   30900001
309800                  ' FILE-STATUS = ' PRNGFL-STAT                   30910000
309900          DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                       30920000
310000          MOVE +3106    TO ABEND-CODE                             30930000
310100          CALL ABEND USING ABEND-CODE                             30940000
310200       END-IF                                                     30950000
310300     END-IF.                                                      30960000
310400                                                                  30970000
310600                                                                  30990000
310700     EVALUATE TRUE                                                31000000
310800         WHEN ((MS-ADP-NO       < PRSECLO)                        31010002
310900                    OR                                            31020000
311000              (PRCLNT  =  '000' OR '096'))                        31030000
311100              MOVE 'N'  TO W-PRNGFL-SW                            31040000
311200         WHEN OTHER                                               31050000
                 IF   PRCLNT   = WS-ADP-CLIENT (2 : 3)                  31060002
                   OR PRACLNT1 = WS-ADP-CLIENT (2 : 3)                  31061002
                   OR PRACLNT2 = WS-ADP-CLIENT (2 : 3)                  31062002
                   OR PRACLNT3 = WS-ADP-CLIENT (2 : 3)                  31063002
                   OR PRACLNT4 = WS-ADP-CLIENT (2 : 3)                  31064002
                   OR PRACLNT5 = WS-ADP-CLIENT (2 : 3)                  31065002
                   OR PRACLNT6 = WS-ADP-CLIENT (2 : 3)                  31066002
                   OR PRACLNT7 = WS-ADP-CLIENT (2 : 3)                  31067002
                    CONTINUE                                            31068002
                   ELSE                                                 31069002
306600              MOVE 'Y'  TO W-PRNGFL-SW                            31069103
311400              SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE             31070002
311500              DISPLAY '   PRIVATE RANGE FOUND: '                  31080000
311600                          MS-ADP-NO          ' ' MS-DESC1         31090002
311900              END-IF                                              31120000
312000     END-EVALUATE.                                                31130000
312100                                                                  31140000
312200 7910-EXIT. EXIT.                                                 31150002
312300/                                                                 31160000
       8000-ABEND-ROUTINE.                                              CAT710  
                                                                        CAT710  
           DISPLAY '!!!! 8000-ABEND-ROUTINE '                           CAT710  
           DISPLAY '    CAT710WM: INPUT-CNT = ' W-INFILE-CNT            CAT710  
                   ' VTRNFR-NOT-FOUND-CNT = ' VTRNFR-NOTFND-CNT         CAT710  
           DISPLAY ' CAT710WM - BAD RECORD TYPE'                        CAT710  
           DISPLAY '  '  W-NSCC-COMMON-AREA                             CAT710  
                                                                        CAT710  
           CALL ABEND USING ABEND-CODE.                                 CAT710  
                                                                        CAT710  
       8000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      /                                                                 CAT710  
       8100-SQL-COMMIT     SECTION.                                     CAT710  
                                                                        CAT710  
           EXEC SQL COMMIT                                              CAT710  
           END-EXEC                                                     CAT710  
                                                                        CAT710  
           MOVE SQLCA   TO COMMIT-SQLCA                                 CAT710  
           MOVE SQLCODE TO COMMIT-RETURN                                CAT710  
                                                                        CAT710  
           IF  COMMIT-AB                                                CAT710  
               ACCEPT W-SYS-DATE              FROM DATE                 CAT710  
               ACCEPT W-SYS-TIME              FROM TIME                 CAT710  
               DISPLAY 'TIME=' W-SYS-TIME ' COMMIT FAILED '             CAT710  
                          ' RC=' COMMIT-RETURN                          CAT710  
                     ' INP-CNT=' W-INFILE-CNT                           CAT710  
                         ' REC=' W-NSCC-RECORD (1:60)                   CAT710  
           ELSE                                                         CAT710  
               CONTINUE                                                 CAT710  
***************ACCEPT*W-SYS-DATE**************FROM*DATE*****************CAT710  
***************ACCEPT*W-SYS-TIME**************FROM*TIME*****************CAT710  
***************DISPLAY*'TIME='*W-SYS-TIME*'*COMMITED'*******************CAT710  
*********************'*INP-CNT='*W-INFILE-CNT***************************CAT710  
*************************'*REC='*W-NSCC-RECORD*(1:60)*******************CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
           MOVE W-INFILE-CNT            TO W-LAST-COMMIT-INFILE-CNT     CAT710  
           .                                                            CAT710  
       8100-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       8200-SQL-ROLLBACK   SECTION.                                     CAT710  
           DISPLAY '8200-SQL-ROLLBACK'                                  CAT710  
                     ' INP-CNT='           W-INFILE-CNT                 CAT710  
                         ' REC=' W-NSCC-RECORD (1:31)                   CAT710  
                  ' LAST-COMMIT-INFILE-CNT = '                          CAT710  
                                            W-LAST-COMMIT-INFILE-CNT    CAT710  
                                                                        CAT710  
           EXEC SQL ROLLBACK WORK                                       CAT710  
           END-EXEC                                                     CAT710  
                                                                        CAT710  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT710  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT710  
                                                                        CAT710  
           IF ROLLBACK-AB                                               CAT710  
               DISPLAY 'CAT710WM: '                                     CAT710  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT710  
                   ROLLBACK-RETURN                                      CAT710  
           ELSE                                                         CAT710  
               DISPLAY 'CAT710WM: '                                     CAT710  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT710  
                   ROLLBACK-RETURN                                      CAT710  
           END-IF.                                                      CAT710  
                                                                        CAT710  
       8200-EXIT. EXIT.                                                 CAT710  
      /                                                                 CAT710  
       8500-SQL-ERROR-ROUTINE.                                          CAT710  
                                                                        CAT710  
           CALL DSNTIAR               USING  SQLCA                      CAT710  
                                             WS-DB2-MESSAGE-AREA        CAT710  
                                             WS-ERR-LINE-LEN            CAT710  
                                                                        CAT710  
           DISPLAY ' '                                                  CAT710  
                                                                        CAT710  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT710  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT710  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT710  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT710  
                 END-IF                                                 CAT710  
           END-PERFORM                                                  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY ' *** CAT710WM ABENDED ****'                         CAT710  
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                  CAT710  
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.             CAT710  
           DISPLAY ' INPUT RECORD = ' W-NSCC-RECORD                     CAT710  
           DISPLAY ' '                                                  CAT710  
                                                                        CAT710  
           PERFORM 8200-SQL-ROLLBACK THRU 8200-EXIT                     CAT710  
                                                                        CAT710  
           DISPLAY 'CAT710WM: U3999 - ABENDING ON BAD DB2 STATUS'       CAT710  
           DISPLAY 'CAT710WM: PROGRAM ENDED ABNORMALLY'                 CAT710  
           MOVE +3999    TO ABEND-CODE                                  CAT710  
           CALL ABEND USING ABEND-CODE.                                 CAT710  
                                                                        CAT710  
       9000-CLOSE-ACATPOSN.                                             CAT710  
           CLOSE NSCC-POSITION-FILE.                                    CAT710  
           DISPLAY 'CAT710WM: ACATPOSN CLOSED. STATUS = '               CAT710  
                                                 ACATPOSN-STAT          CAT710  
                                                                        CAT710  
           CLOSE MSDINF                                                 CAT710  
           DISPLAY 'CAT710WM: MSDINF   CLOSED. STATUS = '               CAT710  
                                             MSDINF-STAT.               CAT710  
                                                                        CAT710  
           CLOSE MSDIDX                                                 CAT710  
           DISPLAY 'CAT710WM: MSDIDX   CLOSED. STATUS = '               CAT710  
                                             MSDIDX-STAT.               CAT710  
                                                                        CAT710  
583500     CLOSE PRNGFL                                                 58320000
           DISPLAY 'CAT710WM: PRNGFL   CLOSED. STATUS = '               CAT710  
                                             PRNGFL-STAT.               CAT710  
                                                                        CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY 'ACATPOSN CLOSED. STATUS = ' ACATPOSN-STAT.          CAT710  
           DISPLAY '## INPUT RECORD COUNT = ' W-INFILE-CNT      ' ##'.  CAT710  
           DISPLAY '## NSCC TIF INPUT CNT = ' NSCC-TIF-CNT      ' ##'.  CAT710  
           DISPLAY '## NSCC ASSET INP CNT = ' NSCC-ASSET-CNT    ' ##'.  CAT710  
           DISPLAY '## W-NO-CLT-CNT       = ' W-NO-CLT-CNT      ' ##'.  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY '## TIF FOUND COUNT    = ' VTRNFR-FND-CNT    ' ##'.  CAT710  
           DISPLAY '## TIF UPDATED COUNT  = ' VTRNFR-UPDT-CNT   ' ##'.  CAT710  
           DISPLAY '## TIF NOT FOUND CNT  = ' VTRNFR-NOTFND-CNT ' ##'.  CAT710  
           DISPLAY '## TRNFR INSERTED     = ' W-VTRNFR-INSERTED-CNT     CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## TRNFR NOT INSERTED = ' W-VTRNFR-NOT-INSERTED-CNT CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY '## NSCC REG ASSET CNT = ' NSCC-REG-ASSET-CNT ' ##'. CAT710  
           DISPLAY '## NSCC OPT   INP CNT = ' NSCC-OPTION-CNT   ' ##'.  CAT710  
           DISPLAY '## NSCC MF    INP CNT = ' NSCC-MF-CNT       ' ##'.  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY '## ASSET FOUND COUNT  = ' VASSET-FND-CNT    ' ##'.  CAT710  
           DISPLAY '## ASSET UPDATED CNT  = ' VASSET-UPDT-CNT   ' ##'.  CAT710  
           DISPLAY '## ASSET NOTFOUND CNT = ' VASSET-NOTFND-CNT ' ##'.  CAT710  
           DISPLAY '## ASSET NOT UPDATED  = ' VASSET-NOT-UPDATED-CNT    CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## ASSET INSERTED     = ' W-VASSET-INSERTED-CNT     CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## ASSET NOT INSERTED = ' W-VASSET-NOT-INSERTED-CNT CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## OPTN  FOUND COUNT  = ' VOPTN-FND-CNT     ' ##'.  CAT710  
           DISPLAY '## OPTN  NOTFOUND CNT = ' VOPTN-NOTFND-CNT  ' ##'.  CAT710  
           DISPLAY '## OPTN  INSERTED     = ' W-VOPTN-INSERTED-CNT      CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## OPTN  NOT INSERTED = ' W-VOPTN-NOT-INSERTED-CNT  CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## MF    FOUND COUNT  = ' VMF-FND-CNT       ' ##'.  CAT710  
           DISPLAY '## MF    NOTFOUND CNT = ' VMF-NOTFND-CNT    ' ##'.  CAT710  
           DISPLAY '## MF    INSERTED     = ' W-VMF-INSERTED-CNT        CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY '## MF    NOT INSERTED = ' W-VMF-NOT-INSERTED-CNT    CAT710  
                                                                ' ##'.  CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY '## W-MSD-FND-CNT      = ' W-MSD-FND-CNT     ' ##'.  CAT710  
           DISPLAY '## W-MSD-NOTFND-CNT   = ' W-MSD-NOTFND-CNT  ' ##'.  CAT710  
           DISPLAY '## W-XRF-FND-CNT      = ' W-XRF-FND-CNT     ' ##'.  CAT710  
           DISPLAY '## W-XRF-NOTFND-CNT   = ' W-XRF-NOTFND-CNT  ' ##'.  CAT710  
           DISPLAY '## W-BOND-FND-CNT     = ' W-BOND-FND-CNT    ' ##'.  CAT710  
           DISPLAY '## W-BOND-NOTFND-CNT  = ' W-BOND-NOTFND-CNT ' ##'.  CAT710  
           DISPLAY '## W-BLANK-SEC-CNT    = ' W-BLANK-SEC-CNT   ' ##'.  CAT710  
           DISPLAY '## W-NSET-CNT         = ' W-NSET-CNT        ' ##'.  CAT710  
           DISPLAY '## W-MSDINF-SYMBOL-CNT= ' W-MSDINF-SYMBOL-CNT       CAT710  
                     ' W-MSDINF-MONTH-CNT = ' W-MSDINF-MONTH-CNT        CAT710  
           DISPLAY '## W-MSDIDX-FND-CNT   = ' W-MSDIDX-FND-CNT          CAT710  
                     ' W-MSDIDX-NOTFND-CNT= ' W-MSDIDX-NOTFND-CNT       CAT710  
           DISPLAY ' '                                                  CAT710  
           DISPLAY '## WS-SETTLED-CNT     = ' WS-SETTLED-CNT    ' ##'.  CAT710  
TCKNEW     DISPLAY ' '                                                  CAT710  
TCKNEW     DISPLAY '## WS-VALUE-FREE-CNT  = ' WS-VALUE-FREE-CNT ' ##'.  CAT710  
       9000-EXIT.                                                       CAT710  
           EXIT.                                                        CAT710  
      *#################################################################CAT710  
