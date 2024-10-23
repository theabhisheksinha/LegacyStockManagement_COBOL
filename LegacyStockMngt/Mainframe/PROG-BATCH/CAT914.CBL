000001* PDX    - CAT914   C0151283 12/18/00 13:46:38 TBTIKUO            00001000
000001* PDX    - CAT914   C0119637 12/19/98 11:10:32 TBLAMUR            00001000
000001* PDX    - CAT914   C0116408 11/05/98 14:52:07 TBDOJUN            00001000
      * PDX    - CAT914   C0115988 10/11/98 09:15:03 TBYOHON            CAT914  
       IDENTIFICATION DIVISION.                                         CAT914  
       PROGRAM-ID.  CAT914.                                             CAT914  
      *** THIS IS TO CAREATE "P" FILE OF NSCC OUT OF SIAC103 FILE.      CAT914  
      *** MAIN PURPOSE IS TO PICK UP SETTLEMENT DATE FOR ANY POSITION   CAT914  
      *** SETTLING TODAY & TOMMORROW.                                   CAT914  
       ENVIRONMENT DIVISION.                                            CAT914  
       INPUT-OUTPUT SECTION.                                            CAT914  
       FILE-CONTROL.                                                    CAT914  
                                                                        CAT914  
           SELECT NSCCFILE         ASSIGN       TO NSCCFILE.            CAT914  
           SELECT S103FILE         ASSIGN       TO S103FILE.            CAT914  
           SELECT P103FILE         ASSIGN       TO P103FILE.            CAT914  
                                                                        CAT914  
       DATA DIVISION.                                                   CAT914  
       FILE SECTION.                                                    CAT914  
       FD  NSCCFILE                                                     CAT914  
           RECORDING MODE IS V                                          CAT914  
           BLOCK CONTAINS 0 RECORDS.                                    CAT914  
       01  NSCCOTRN-PT-RECORD   PIC X(0475).                            CAT914  
       01  NSCCOTRN-PA-REG-RECORD   PIC X(0535).                        CAT914  
       01  NSCCOTRN-PA-OPT-RECORD   PIC X(0620).                        CAT914  
       01  NSCCOTRN-PA-MFD-RECORD   PIC X(0575).                        CAT914  
       01  NSCCOTRN-PF-MFR-RECORD   PIC X(3095).                        CAT914  
       01  DUMMY-LARGE-RECORD       PIC X(4000).                        CAT914  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCPHDR==.      CAT914  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCPTRL==.      CAT914  
                                                                        CAT914  
       FD  S103FILE.                                                    CAT914  
           COPY SIAC103.                                                CAT914  
                                                                        CAT914  
       FD  P103FILE.                                                    CAT914  
       01  P103-RECORD.                                                 CAT914  
           02  P103-FIRST-RECORD.                                       CAT914  
           05  P103-REC-ID-1                    PIC X.                  CAT914  
               88  P103-FIRST-REC                   VALUE '1'.          CAT914  
           05  P103-SEQ-NUM-1                   PIC X(7).               CAT914  
           05  P103-BROKER-CLEAR-NO             PIC X(4).               CAT914  
           05  P103-REPT-TYPE                   PIC X.                  CAT914  
               88  P103-SETTLEMENT                  VALUE '3'.          CAT914  
           05  P103-REPT-SIDE                   PIC X.                  CAT914  
               88  P103-CLNT-IS-RECEIVER            VALUE '1'.          CAT914  
           05  P103-REJECT-STATUS               PIC X.                  CAT914  
           05  P103-SRT-CURR-STAT               PIC X.                  CAT914  
           05  P103-CONTROL                     PIC X(8).               CAT914  
           05  P103-RECORD-TYPE                 PIC X.                  CAT914  
           05  P103-ASSET-SEQ-NO                PIC X(4).               CAT914  
           05  P103-ADJ-REC-IND                 PIC X.                  CAT914  
           05  P103-CONTRA-BRK-NUM              PIC X(4).               CAT914  
           05  P103-CUST-BR-ACT                 PIC X(15).              CAT914  
           05  P103-CONTRA-CUS-ACT              PIC X(15).              CAT914  
           05  P103-ACT-TITLE                   PIC X(51).              CAT914  
           05  P103-SOC-SEC-TAX-ID              PIC X(9).               CAT914  
           05  P103-DAYS-CURRENT-STATUS         PIC X(3).               CAT914  
           05  P103-ACCOUNT-TYPE                PIC X(2).               CAT914  
           05  P103-CURRENT-STATUS              PIC X.                  CAT914  
           05  FILLER                           PIC X.                  CAT914  
           05  P103-PAST-DUE-IND                PIC X.                  CAT914  
           05  P103-ASSET-TYPE                  PIC X.                  CAT914  
           02  P103-THIRD-RECORD REDEFINES P103-FIRST-RECORD.           CAT914  
            05  P103-REC-ID-3                    PIC X.                 CAT914  
               88  P103-THIRD-REC                   VALUE '3'.          CAT914  
           05  P103-SEQ-NUM-3                   PIC X(7).               CAT914  
           05  P103-BROKER-CLEAR-NO-3           PIC X(4).               CAT914  
           05  P103-SEC-DESC-2                  PIC X(24).              CAT914  
           05  P103-ASSET-VALUE                 PIC 9(9)V99.            CAT914  
           05  P103-OPT-BUY-SELL-IND            PIC X.                  CAT914  
           05  P103-OPT-OPEN-CLOSE              PIC X.                  CAT914  
           05  P103-OPT-ACT-TYPE                PIC X.                  CAT914  
           05  FILLER                           PIC XXX.                CAT914  
           05  P103-OPT-PUT-CALL                PIC X.                  CAT914  
           05  FILLER                           PIC X.                  CAT914  
           05  P103-OPT-EXP-DATE.                                       CAT914  
               10  P103-OPT-EXP-MM              PIC X(2).               CAT914  
               10  P103-OPT-EXP-Y               PIC X(1).               CAT914  
           05  P103-OPT-PRICE.                                          CAT914  
               10 P103-OPT-PRICE-POS1           PIC 9(1).               CAT914  
               10 P103-OPT-PRICE-POS2-3.                                CAT914  
                  15 P103-OPT-PRICE-POS2        PIC 9(1).               CAT914  
                  15 P103-OPT-PRICE-POS3        PIC 9(1).               CAT914  
      * OPTION PRICE 1 = 1/8, 2 = 2/8,...,7 = 7/8                       CAT914  
           05  P103-OPT-1-8TH-PRCE              PIC X.                  CAT914  
      * INVALID FIELD INDICATORS   0 = VALID, 1 = INVALID               CAT914  
           05  P103-INVAL-IND.                                          CAT914  
               10  P103-IND-CNTL-NO             PIC X.                  CAT914  
               10  P103-IND-CONTRA-BKR-NO       PIC X.                  CAT914  
               10  P103-IND-DISTR-BKR           PIC X.                  CAT914  
               10  P103-IND-ASSET-SEQ-NO        PIC X.                  CAT914  
               10  P103-IND-TRAN-ACTION-CDE     PIC X.                  CAT914  
               10  P103-IND-QUANTITY            PIC X.                  CAT914  
               10  P103-IND-SETTLE-IND          PIC X.                  CAT914  
               10  P103-IND-SECURITY-DESC       PIC X.                  CAT914  
               10  P103-IND-VALUE               PIC X.                  CAT914  
               10  P103-IND-OPTION-SYMBOL       PIC X.                  CAT914  
               10  P103-MF-CUST-ACCT REDEFINES P103-IND-OPTION-SYMBOL   CAT914  
                                                PIC X.                  CAT914  
               10  P103-IND-OPT-BUY-SELL        PIC X.                  CAT914  
               10  P103-MF-NTWK-CTL-IND REDEFINES P103-IND-OPT-BUY-SELL CAT914  
                                                PIC X.                  CAT914  
               10  P103-IND-OPT-OCC-REC-INV     PIC X.                  CAT914  
               10  P103-MF-ACT-TYP-IND REDEFINES                        CAT914  
                     P103-IND-OPT-OCC-REC-INV   PIC X.                  CAT914  
               10  P103-IMD-OPT-OCC-DEL-INV     PIC X.                  CAT914  
               10  P103-IND-NON-OPT-CASH-MRGN   PIC X.                  CAT914  
               10  P103-IND-OPT-PUT-CALL        PIC X.                  CAT914  
               10  P103-MF-BOOK-PHYS-IND REDEFINES                      CAT914  
                         P103-IND-OPT-PUT-CALL  PIC X.                  CAT914  
               10  P103-IND-SECURITY-TYPE       PIC X.                  CAT914  
               10  P103-IND-OPT-EXP-DATE        PIC X.                  CAT914  
               10  P103-MF-DLVR-EXEC-BRKR-INV REDEFINES                 CAT914  
                     P103-IND-OPT-EXP-DATE      PIC X.                  CAT914  
               10  P103-IND-OPT-EXER-PRICE      PIC X.                  CAT914  
               10  P103-MF-SEC-CATEGORY REDEFINES                       CAT914  
                       P103-IND-OPT-EXER-PRICE  PIC X.                  CAT914  
               10  P103-IND-OPT-1-8TH-PRICE     PIC X.                  CAT914  
               10  P103-MF-ACCT-NO-INV REDEFINES                        CAT914  
                      P103-IND-OPT-1-8TH-PRICE  PIC X.                  CAT914  
               10  P103-IND-ASSET-TYPE          PIC X.                  CAT914  
               10  P103-IND-REJECT-REASON       PIC X.                  CAT914  
      * TIF INVALID FIELD INDICATORS   0 = VALID, 1 = INVALID           CAT914  
           05  P103-INVAL-IND-TIF REDEFINES P103-INVAL-IND.             CAT914  
               10  P103-TIF-SYSTEM-CODE         PIC X.                  CAT914  
               10  P103-TIF-TRANSFER-CODE       PIC X.                  CAT914  
               10  P103-TIF-CONTRA-BRKR         PIC X.                  CAT914  
               10  P103-TIF-DIST-CUST-ACCT      PIC X.                  CAT914  
               10  P103-TIF-CONTRA-CUST-ACCT    PIC X.                  CAT914  
               10  P103-TIF-ACCT-TITLE          PIC X.                  CAT914  
               10  P103-TIF-ACCT-TYPE           PIC X.                  CAT914  
               10  P103-TIF-ORIG-CNTL-NO        PIC X.                  CAT914  
               10  P103-TIF-ORIG-SETTL-DTE      PIC X.                  CAT914  
               10  P103-TIF-RC-DESCR            PIC X.                  CAT914  
               10  P103-TIF-OCC-BRKR            PIC X.                  CAT914  
               10  P103-TIF-SOC-SEC-TAX-ID      PIC X.                  CAT914  
               10  FILLER                       PIC X(9).               CAT914  
           05  P103-ACCT-ERR-INVALID-REC        PIC X.                  CAT914  
           05  P103-SETTLMENT-IND               PIC X.                  CAT914  
           05  P103-NSCC-SEC-IND                PIC X.                  CAT914  
           05  P103-REASON-CLOSED               PIC X.                  CAT914  
           05  FILLER                           PIC X.                  CAT914  
           05  P103-DEL-REC-IND                 PIC X.                  CAT914  
           05  P103-REJ-REASON                  PIC XX.                 CAT914  
           05  P103-CASH-MGN-IND                PIC X.                  CAT914  
           05  P103-SORT-SETT-IND               PIC XX.                 CAT914  
           05  P103-PROCESS-DATE                PIC X(6).               CAT914  
           05  P103-SETTL-DT.                                           CAT914  
               10  P103-SETTL-DATE-YY           PIC X(2).               CAT914  
               10  P103-SETTL-DATE-MM           PIC X(2).               CAT914  
               10  P103-SETTL-DATE-DD           PIC X(2).               CAT914  
           05  P103-SECURITY-TYPE               PIC X.                  CAT914  
               88  P103-BEARER-BOND                 VALUE 'B'.          CAT914  
               88  P103-WHEN-ISSUE                  VALUE 'W'.          CAT914  
               88  P103-REGISTERED-BOND             VALUE 'R'.          CAT914  
               88  P103-REGULAR-WAY                 VALUE 'G'.          CAT914  
               88  P103-REGIST-BOND-OR-REG-WAY      VALUE SPACE.        CAT914  
           05  P103-DUMMY-RECORD-IND            PIC X.                  CAT914  
               88  P103-DUMMY-RECORD                VALUE '1'.          CAT914  
               88  P103-REAL-RECORD                 VALUE SPACE.        CAT914  
           05  P103-STCK-BND-IND                PIC X.                  CAT914  
               88  P103-STOCK                       VALUE '0'.          CAT914  
               88  P103-BOND                        VALUE '1'.          CAT914  
               88  P103-MUNI                        VALUE '3'.          CAT914  
               88  P103-UIT                         VALUE '4'.          CAT914  
           05  P103-SECURITY-CATEGORY           PIC X(2).               CAT914  
               88  P103-EQUITIES                    VALUE 'ES'.         CAT914  
               88  P103-FOREIGN-SECURITY            VALUE 'FS'.         CAT914  
               88  P103-CORPORATE-BONDS             VALUE 'CB'.         CAT914  
               88  P103-MUNICIPAL-BONDS             VALUE 'MB'.         CAT914  
               88  P103-MF-NON-MONEY-MRKT           VALUE 'MF'.         CAT914  
               88  P103-MF-MONEY-MRKT               VALUE 'MM'.         CAT914  
               88  P103-ZERO-COUPON-BONDS           VALUE 'ZC'.         CAT914  
               88  P103-LIMITED-PARNERSHIPS         VALUE 'LP'.         CAT914  
               88  P103-CDS-AND-COMMERCIAL-PAPER    VALUE 'CD'.         CAT914  
               88  P103-GOVT-BONDS-US-AND-FGN       VALUE 'GB'.         CAT914  
               88  P103-UITS                        VALUE 'UN'.         CAT914  
               88  P103-MORTGAGED-BACKED            VALUE 'MO'.         CAT914  
               88  P103-OTHER-SECURITY              VALUE 'OO'.         CAT914  
           05  P103-REC-OCC-BKR-NO              PIC X(4).               CAT914  
           05  FILLER                           PIC X(18).              CAT914  
                                                                        CAT914  
       WORKING-STORAGE SECTION.                                         CAT914  
           COPY PDXIDCOB.                                               CAT914  
      **** COPY NSCCX    REPLACING ==NSCCPI== BY ==NSCCPI==.            CAT914  
       01  NSCCPI-RECORD.                                               CAT914  
           05  NSCCPI-COMMON-FIELDS.                                    CAT914  
               10  NSCCPI-REC-TYPE         PIC X(01).                   CAT914  
                   88  NSCCPI-POSITION-MRO              VALUE 'P'.      CAT914  
                   88  NSCCPI-SETTLEMENT-MRO            VALUE 'S'.      CAT914  
               10  NSCCPI-REC-SUBTYPE      PIC X(01).                   CAT914  
                   88  NSCCPI-XFER                      VALUE 'T'.      CAT914  
                   88  NSCCPI-ASSET                     VALUE 'A'.      CAT914  
                   88  NSCCPI-FND-RGS                   VALUE 'F'.      CAT914  
               10  NSCCPI-REC-LENGTH       PIC 9(04).                   CAT914  
               10  NSCCPI-PHSCL-SEQ-NBR    PIC 9(02).                   CAT914  
               10  NSCCPI-LGCL-SEQ-NBR     PIC 9(02).                   CAT914  
               10  NSCCPI-DSTRB-SIDE       PIC X(01).                   CAT914  
                   88  NSCCPI-ORG-RCV                   VALUE 'R'.      CAT914  
                   88  NSCCPI-ORG-DEL                   VALUE 'D'.      CAT914  
                   88  NSCCPI-BOTH                      VALUE 'B'.      CAT914  
               10  NSCCPI-ACAT-CNTL-NBR    PIC X(14).                   CAT914  
               10  NSCCPI-ASSET-SEQ-NBR    PIC 9(06).                   CAT914  
               10  NSCCPI-PROCESS-DATE     PIC X(08).                   CAT914  
               10  FILLER                  PIC X(06).                   CAT914  
               10  NSCCPI-DSTRB-PART       PIC X(04).                   CAT914  
               10  FILLER                  PIC X(01).                   CAT914  
               10  NSCCPI-STATUS           PIC X(03).                   CAT914  
               10  NSCCPI-DAYS-IN-STAT     PIC X(03).                   CAT914  
               10  FILLER                  PIC X(20).                   CAT914  
               10  NSCCPI-REGST-IND        PIC X(01).                   CAT914  
               10  NSCCPI-SETLMNT-DT       PIC X(08).                   CAT914  
               10  NSCCPI-SETLMNT-TM       PIC X(01).                   CAT914  
               10  NSCCPI-VAL-FREE-IND     PIC X(01).                   CAT914  
               10  NSCCPI-DEB-CRD-IND      PIC X(01).                   CAT914  
               10  FILLER                  PIC X(16).                   CAT914  
           05 VARIABLE-SECTION   PIC X(1000).                           CAT914  
           05 NSCCTI-AREA REDEFINES VARIABLE-SECTION.                   CAT914  
      ***  COPY NSCCXTI  REPLACING ==NSCCTI== BY ==NSCCTI==.            CAT914  
               10  NSCCTI-REC-TYPE              PIC X(02).              CAT914  
               10  FILLER                       PIC X(09).              CAT914  
               10  NSCCTI-ACATS-CNTL-NBR        PIC X(14).              CAT914  
               10  NSCCTI-XFER-TYPE             PIC X(03).              CAT914  
               10  FILLER                       PIC X(12).              CAT914  
               10  NSCCTI-ORG-RCV-NBR           PIC X(04).              CAT914  
               10  FILLER                       PIC X(04).              CAT914  
               10  NSCCTI-ORG-DEL-NBR           PIC X(04).              CAT914  
               10  NSCCTI-ORG-RCV-CUS-ACT       PIC X(20).              CAT914  
               10  NSCCTI-ORG-RCV-CUS-NAME      PIC X(60).              CAT914  
               10  NSCCTI-ORG-RCV-SSN-PRM       PIC X(09).              CAT914  
               10  NSCCTI-ORG-RCV-SSN-SEC       PIC X(09).              CAT914  
               10  NSCCTI-ORG-RCV-ACCT-TYP      PIC X(02).              CAT914  
               10  FILLER                       PIC X(03).              CAT914  
               10  NSCCTI-ORG-RCV-OCC-BKNBR     PIC X(05).              CAT914  
               10  FILLER                       PIC X(04).              CAT914  
               10  NSCCTI-ORG-RCV-CORRSP        PIC X(04).              CAT914  
               10  FILLER                       PIC X(04).              CAT914  
               10  NSCCTI-ORG-DEL-ACCT-NBR      PIC X(20).              CAT914  
               10  NSCCTI-XFER-TYPE-REJECT      PIC X(02).              CAT914  
               10  NSCCTI-ASSC-ACATS-CTL-NBR    PIC X(14).              CAT914  
               10  NSCCTI-ASSC-STTLM-DATE       PIC X(08).              CAT914  
               10  NSCCTI-TI-TRANS-REF-ID       PIC X(20).              CAT914  
               10  NSCCTI-COMMENTS              PIC X(120).             CAT914  
               10  FILLER                       PIC X(15).              CAT914  
           05 NSCCAT-AREA REDEFINES VARIABLE-SECTION.                   CAT914  
      ***  COPY NSCCXAT  REPLACING ==NSCCAT== BY ==NSCCAT==.            CAT914  
               10  NSCCAT-REC-TYPE              PIC X(02).              CAT914  
               10  FILLER                       PIC X(09).              CAT914  
               10  NSCCAT-ACATS-CNTL-NBR        PIC X(14).              CAT914  
               10  NSCCAT-XFER-TYPE             PIC X(03).              CAT914  
               10  FILLER                       PIC X(12).              CAT914  
               10  NSCCAT-ORG-RCV-NBR           PIC X(04).              CAT914  
               10  FILLER                       PIC X(04).              CAT914  
               10  NSCCAT-ORG-DEL-NBR           PIC X(04).              CAT914  
               10  NSCCAT-TRANS-REF-ID          PIC X(20).              CAT914  
               10  NSCCAT-ASET-SEQ-NBR          PIC X(06).              CAT914  
               10  FILLER                       PIC X(02).              CAT914  
               10  NSCCAT-AST-PRC-CATG          PIC X(04).              CAT914  
               10  NSCCAT-OPT-CATG              PIC X(02).              CAT914  
               10  NSCCAT-SET-LOC               PIC X(02).              CAT914  
               10  NSCCAT-SET-LOC-RSN           PIC X(04).              CAT914  
               10  NSCCAT-ISIN-CNTRY-CD         PIC X(02).              CAT914  
               10  NSCCAT-ISIN-SEC-ID           PIC X(09).              CAT914  
               10  NSCCAT-ISIN-SEC-CHKDGT       PIC X(01).              CAT914  
               10  FILLER                       PIC X(04).              CAT914  
               10  NSCCAT-ASET-DESC             PIC X(140).             CAT914  
      **** FOLLOWING 2 BYTES FIELDS WILL BE SPACES IN NSCCIAT FILE *****CAT914  
               10  NSCCAT-ASET-QNTY-RQIND       PIC X(01).              CAT914  
               10  NSCCAT-ASET-REQ-TRANCD       PIC X(01).              CAT914  
               10  NSCCAT-ASET-QNTY             PIC X(17).              CAT914  
               10  NSCCAT-ASET-PRCNT            PIC X(15).              CAT914  
               10  NSCCAT-POSTN-CD              PIC X(01).              CAT914  
               10  NSCCAT-ISO-CURCY-CD          PIC X(03).              CAT914  
               10  NSCCAT-ASSET-AMT             PIC X(17).              CAT914  
               10  NSCCAT-BEARER-BOND           PIC X(01).              CAT914  
               10  NSCCAT-CASH-MRGN-SHTCD       PIC X(01).              CAT914  
                    88  NSCCAT-CASH                        VALUE 'C'.   CAT914  
                    88  NSCCAT-MARGIN                      VALUE 'M'.   CAT914  
                    88  NSCCAT-SHORT                       VALUE 'S'.   CAT914  
               10  NSCCAT-WHN-ISS-IND           PIC X(01).              CAT914  
                    88  NSCCAT-WHN-ISS                     VALUE 'W'.   CAT914  
                    88  NSCCAT-WHN-NOT-ISS                 VALUE 'N'.   CAT914  
               10  NSCCAT-XFER-TYP-RSN          PIC X(02).              CAT914  
               10  NSCCAT-MBS-SER-NT            PIC X(03).              CAT914  
               10  NSCCAT-ASST-COMMENT          PIC X(120).             CAT914  
                                                                        CAT914  
       01  W-FIELDS.                                                    CAT914  
           05 W-SHARE-AREA.                                             CAT914  
             10 FILLER.                                                 CAT914  
                15 FILLER   PIC X(3) VALUE '000'.                       CAT914  
                15 W-SHARE-DIG  PIC 9(9).                               CAT914  
             10 FILLER      PIC X VALUE ','.                            CAT914  
             10 W-SHARE-FRA    PIC V9(4) VALUE 0.                       CAT914  
           05 W-NUM-4-A    PIC X(4).                                    CAT914  
           05 W-NUM-4-N REDEFINES W-NUM-4-A PIC 9(4).                   CAT914  
           05 WS-NUM-3-A    PIC X(3).                                   CAT914  
           05 WS-NUM-3-N REDEFINES WS-NUM-3-A PIC 9(3).                 CAT914  
           05 SAVE-CLR-NO      PIC X(4) VALUE '0000'.                   CAT914  
           05 SAVE-CONTROL     PIC X(8) VALUE SPACES.                   CAT914  
           05 TEMP-CONTROL     PIC X(8) VALUE SPACES.                   CAT914  
           05 FILLER           PIC X    VALUE SPACES.                   CAT914  
              88 END-OF-P103FILE  VALUE 'E'.                            CAT914  
           05 W-CTL-NO.                                                 CAT914  
              10 W-CTL-NO-CCYY  PIC X(4).                               CAT914  
              10 W-CTL-NO-DDD   PIC X(3).                               CAT914  
              10 W-CTL-NO-SEQ   PIC X(7).                               CAT914  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT914  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT914  
           05  W-CHANGE-IND              PIC  X(001) VALUE '0'.         CAT914  
               88 THIS-IS-CHANGE                     VALUE 'Y'.         CAT914  
           05  END-OF-NSCCFILE-SW        PIC  X(001) VALUE '0'.         CAT914  
               88 END-OF-NSCCFILE                    VALUE '1'.         CAT914  
           05  NSCCFILE-STAT             PIC  X(002).                   CAT914  
               88 NSCCFILE-OKAY          VALUE '00' THRU '09', '97'.    CAT914  
               88 NSCCFILE-END-OF-FILE   VALUE '10'.                    CAT914  
               88 NSCCFILE-EMPTY-MISSING VALUE '35'.                    CAT914  
           05  NSCCFILE-DATE-SW          PIC  X(001) VALUE ' '.         CAT914  
               88 NSCCFILE-DATE-FOUND                VALUE 'Y'.         CAT914  
           05  ACATLOG-STAT              PIC  X(002).                   CAT914  
               88 ACATLOG-OKAY           VALUE '00' THRU '09', '97'.    CAT914  
               88 ACATLOG-END-OF-FILE    VALUE '10'.                    CAT914  
               88 ACATLOG-DUP-REC        VALUE '22'.                    CAT914  
               88 ACATLOG-NOTFND         VALUE '23'.                    CAT914  
               88 ACATLOG-EMPTY-MISSING  VALUE '35'.                    CAT914  
           05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           CAT914  
TCK001     05  ABEND-CD                  PIC S9(004) COMP SYNC VALUE 0. CAT914  
TCK001*    05  DUMP-SW                   PIC  X(001) VALUE 'D'.         CAT914  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT914  
           05  FILLER  REDEFINES                                        CAT914  
               W-SYS-DATE.                                              CAT914  
               10  W-UPD-DATE            PIC  X(006).                   CAT914  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT914  
           05  FILLER  REDEFINES                                        CAT914  
               W-SYS-TIME.                                              CAT914  
               10  W-UPD-TIME            PIC  X(006).                   CAT914  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT914  
           05  LD-PROC-DATE.                                            CAT914  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT914  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT914  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT914  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         CAT914  
               88 HDR-FOUND                          VALUE 'H'.         CAT914  
               88 TRL-FOUND                          VALUE 'T'.         CAT914  
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.         CAT914  
               88 BRK-FOUND                          VALUE 'Y'.         CAT914  
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  CAT914  
           05  W-NSCCFILE-CNT            PIC  9(009) VALUE 0.           CAT914  
           05  W-NCHGFILE-CNT            PIC  9(009) VALUE 0.           CAT914  
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.  CAT914  
           05  W-DETAIL-CNT              PIC  9(011) VALUE 0.           CAT914  
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.  CAT914  
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT914  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.  CAT914  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.           CAT914  
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.  CAT914  
           05  W-NAME-WORK.                                             CAT914  
              10 W-N-W OCCURS 20 TIMES INDEXED BY IWNW   PIC X.         CAT914  
           05  W-NAME-WORKNEW.                                          CAT914  
              10 W-N-WN OCCURS 20 TIMES INDEXED BY IWNWN PIC X.         CAT914  
           05  W-NEXT-CYCLE.                                            CAT914  
               07  W-NEXT-CYCLE-N        PIC  9(004) VALUE 0.           CAT914  
       01  CONTROL-TABLE.                                               CAT914  
           05  TAB-MAX                PIC S9(8) COMP VALUE +0.          CAT914  
           05  TAB-CUR                PIC S9(8) COMP VALUE +0.          CAT914  
           05  TAB-WRK                PIC S9(8) COMP VALUE +0.          CAT914  
           05  FILLER                 PIC X(16) VALUE SPACES.           CAT914  
           05  CONTROL-TAB OCCURS 0 TO 50000 TIMES                      CAT914  
                      DEPENDING ON TAB-MAX                              CAT914  
                      ASCENDING KEY IS TAB-CONTROL                      CAT914  
                      INDEXED BY TAB-IND.                               CAT914  
                10 TAB-CONTROL  PIC X(8).                               CAT914  
                10 TAB-DATE     PIC X(06).                              CAT914  
                                                                        CAT914  
           COPY BPDATESC.                                               CAT914  
TCK001     COPY STUBCPY.                                                        
       LINKAGE SECTION.                                                 CAT914  
       01  L-JCL-PARMS.                                                 CAT914  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT914  
           05  L-STREAM                  PIC  X(001).                   CAT914  
               88  L-NEW-TRANSFER                    VALUE 'Y'.         CAT914  
           05  L-BYP-CYCLE-SW            PIC  X(001).                   CAT914  
               88  L-NEW-PARTIAL                     VALUE 'Y'.         CAT914  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT914  
      *                         ===========                             CAT914  
           COPY MSGCOBO.                                                CAT914  
           OPEN INPUT P103FILE.                                         CAT914  
           READ P103FILE.                                               CAT914  
           PERFORM UNTIL END-OF-P103FILE                                CAT914  
              PERFORM UNTIL (P103-FIRST-REC AND P103-SETTLEMENT)        CAT914  
                       OR  END-OF-P103FILE                              CAT914  
                READ P103FILE AT END SET END-OF-P103FILE TO TRUE        CAT914  
                END-READ                                                CAT914  
              END-PERFORM                                               CAT914  
              IF NOT END-OF-P103FILE                                    CAT914  
                MOVE P103-CONTROL    TO SAVE-CONTROL                    CAT914  
                PERFORM INSERT-TO-TABLE                                 CAT914  
                READ P103FILE                                           CAT914  
                IF NOT END-OF-P103FILE                                  CAT914  
                  READ P103FILE                                         CAT914  
                END-IF                                                  CAT914  
                IF P103-THIRD-REC                                       CAT914  
                  AND  P103-SETTL-DT > '981021'                         CAT914  
                   MOVE P103-SETTL-DT TO TAB-DATE (TAB-CUR)             CAT914  
                END-IF                                                  CAT914  
              END-IF                                                    CAT914  
           END-PERFORM.                                                 CAT914  
           IF TAB-MAX > 50000                                           CAT914  
             DISPLAY TAB-MAX ' INCREASE TABLE '.                        CAT914  
           CLOSE P103FILE.                                              CAT914  
           DISPLAY TAB-MAX ' NUMBER OF ENTRY'.                          CAT914  
           MOVE 'CAT914'                  TO BPDATES-CALLING-PGM.       CAT914  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT914  
TCK001     CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT914  
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           CAT914  
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           CAT914  
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           CAT914  
           MOVE BPD-PROC-DATE(1:4)        TO W-CTL-NO-CCYY.             CAT914  
                                                                        CAT914  
           OPEN INPUT S103FILE                                          CAT914  
                OUTPUT NSCCFILE.                                        CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
                                                                        CAT914  
           PERFORM 1000-PROCESS                                         CAT914  
                       UNTIL  END-OF-NSCCFILE                           CAT914  
                                                                        CAT914  
           CLOSE NSCCFILE S103FILE.                                     CAT914  
                                                                        CAT914  
           GOBACK.                                                      CAT914  
                                                                        CAT914  
       INSERT-TO-TABLE.                                                 CAT914  
           MOVE 0 TO TAB-CUR.                                           CAT914  
           PERFORM VARYING TAB-WRK FROM 1 BY 1                          CAT914  
               UNTIL TAB-WRK  > TAB-MAX                                 CAT914  
              IF TAB-CONTROL (TAB-WRK) = SAVE-CONTROL                   CAT914  
                IF  TAB-CUR = 0                                         CAT914  
                 MOVE TAB-WRK   TO TAB-CUR                              CAT914  
                END-IF                                                  CAT914  
                MOVE TAB-MAX TO TAB-WRK                                 CAT914  
              ELSE                                                      CAT914  
               IF TAB-CONTROL (TAB-WRK) > SAVE-CONTROL                  CAT914  
                 MOVE TAB-CONTROL(TAB-WRK) TO TEMP-CONTROL              CAT914  
                 IF  TAB-CUR = 0                                        CAT914  
                  MOVE TAB-WRK   TO TAB-CUR                             CAT914  
                 END-IF                                                 CAT914  
                 MOVE SAVE-CONTROL  TO TAB-CONTROL(TAB-WRK)             CAT914  
                 MOVE TEMP-CONTROL  TO SAVE-CONTROL                     CAT914  
               END-IF                                                   CAT914  
              END-IF                                                    CAT914  
           END-PERFORM.                                                 CAT914  
           IF  SAVE-CONTROL > TAB-CONTROL (TAB-MAX)                     CAT914  
            ADD  1    TO TAB-MAX                                        CAT914  
            MOVE SAVE-CONTROL TO TAB-CONTROL (TAB-MAX)                  CAT914  
            MOVE SPACE        TO TAB-DATE    (TAB-MAX)                  CAT914  
            IF TAB-CUR = 0                                              CAT914  
             MOVE TAB-MAX TO TAB-CUR                                    CAT914  
            END-IF                                                      CAT914  
           END-IF.                                                      CAT914  
                                                                        CAT914  
       1000-PROCESS.                                                    CAT914  
           IF  HEADER                                                   CAT914  
             MOVE ACAT-HDR-BROKER-CLR-NO   TO SAVE-CLR-NO               CAT914  
      *      IF SAVE-CLR-NO = '0573' OR '0057'                          CAT914  
                 PERFORM CONVERT-HEADER                                 CAT914  
                 PERFORM 3000-READ-INPUT                                CAT914  
                 PERFORM 2000-PROCESS                                   CAT914  
                       UNTIL  END-OF-NSCCFILE                           CAT914  
                          OR  TRAILER                                   CAT914  
                 PERFORM CONVERT-TRAILER                                CAT914  
                 PERFORM 3000-READ-INPUT                                CAT914  
      *       ELSE                                                      CAT914  
      *          PERFORM 3000-READ-INPUT                                CAT914  
      *                UNTIL  END-OF-NSCCFILE                           CAT914  
      *                   OR  ACAT-HDR-BROKER-CLR-NO NOT = SAVE-CLR-NO  CAT914  
      *       END-IF                                                    CAT914  
            ELSE                                                        CAT914  
               PERFORM 3000-READ-INPUT                                  CAT914  
                     UNTIL  END-OF-NSCCFILE                             CAT914  
                        OR  HEADER                                      CAT914  
           END-IF.                                                      CAT914  
                                                                        CAT914  
       2000-PROCESS.                                                    CAT914  
                                                                        CAT914  
           IF  ACAT-CONTROL                                             CAT914  
               PERFORM CONVERT-TRANSFER                                 CAT914  
           ELSE                                                         CAT914  
           IF  ACAT-ASSET                                               CAT914  
             IF ACAT-NEW-DEFAULT-REG OR ACAT-OLD-DEFAULT-REG            CAT914  
              OR ACAT-NEW-BROKER-REG OR ACAT-REJECT-OF-REG              CAT914  
               PERFORM CONVERT-MFREG                                    CAT914  
             ELSE                                                       CAT914  
               PERFORM CONVERT-ASSET                                    CAT914  
             END-IF                                                     CAT914  
           ELSE                                                         CAT914  
             IF  ACAT-SETTLEMENT                                        CAT914  
               PERFORM CONVERT-SETTLEMENT                               CAT914  
             ELSE                                                       CAT914  
               DISPLAY '        ' ACAT-IN-FILE-AREA                     CAT914  
               DISPLAY ' BAD REC-TYPE'                                  CAT914  
             END-IF                                                     CAT914  
             PERFORM 3000-READ-INPUT 3 TIMES                            CAT914  
           END-IF.                                                      CAT914  
                                                                        CAT914  
       3000-READ-INPUT.                                                 CAT914  
                                                                        CAT914  
           READ S103FILE                                                CAT914  
             AT END                                                     CAT914  
                   MOVE '1'              TO END-OF-NSCCFILE-SW          CAT914  
             NOT AT END                                                 CAT914  
                   IF  ACAT-REC-ID = 'H' OR '1' OR '2' OR '3' OR 'T'    CAT914  
                    CONTINUE                                            CAT914  
                   ELSE                                                 CAT914  
                    GO TO 3000-READ-INPUT                               CAT914  
                   END-IF                                               CAT914  
           END-READ.                                                    CAT914  
                                                                        CAT914  
       CONVERT-SETTLEMENT.                                              CAT914  
           MOVE 'H'         TO  NSCCPHDR-REC-TYPE.                      CAT914  
                                                                        CAT914  
       CONVERT-HEADER.                                                  CAT914  
                                                                        CAT914  
           MOVE 'H'         TO  NSCCPHDR-REC-TYPE.                      CAT914  
           MOVE  '0061'     TO NSCCPHDR-REC-LEN.                        CAT914  
           MOVE '02070718'  TO  NSCCPHDR-AUTORTE-PROD-ID                CAT914  
           MOVE  'ACAT TRANSFER POSITION MRO'                           CAT914  
                            TO  NSCCPHDR-FILE-DESC                      CAT914  
           MOVE SAVE-CLR-NO  TO NSCCPHDR-DIST-SIDE.                     CAT914  
           MOVE BPD-PROC-DATE TO NSCCPHDR-PROC-DATE                     CAT914  
           MOVE ' '         TO NSCCPHDR-MULTI-CYCLE-IND.                CAT914  
           MOVE '0000'      TO NSCCPHDR-MULTI-CYCLE-NBR.                CAT914  
           MOVE '*'         TO NSCCPHDR-VAR-LEN-REC-IND.                CAT914  
           ADD  1                TO W-NSCCFILE-CNT                      CAT914  
           WRITE NSCCPHDR-RECORD.                                       CAT914  
                                                                        CAT914  
                                                                        CAT914  
       CONVERT-TRAILER.                                                 CAT914  
                                                                        CAT914  
           MOVE 'T'         TO  NSCCPTRL-REC-TYPE.                      CAT914  
           MOVE  '0070'     TO NSCCPTRL-REC-LEN.                        CAT914  
           MOVE '02070718'  TO  NSCCPTRL-AUTORTE-PROD-ID                CAT914  
           MOVE  'ACAT TRANSFER POSITION MRO'                           CAT914  
                            TO  NSCCPTRL-FILE-DESC                      CAT914  
           MOVE SAVE-CLR-NO  TO NSCCPTRL-DIST-SIDE.                     CAT914  
           MOVE BPD-PROC-DATE TO NSCCPTRL-PROC-DATE                     CAT914  
           MOVE ' '         TO NSCCPTRL-MULTI-CYCLE-IND.                CAT914  
           MOVE '0000'      TO NSCCPTRL-MULTI-CYCLE-NBR.                CAT914  
           MOVE '*'         TO NSCCPTRL-VAR-LEN-REC-IND.                CAT914  
           ADD  1                TO W-NSCCFILE-CNT                      CAT914  
           MOVE  W-NSCCFILE-CNT         TO  NSCCPTRL-ITEM-CNT.          CAT914  
           MOVE 0                        TO W-NSCCFILE-CNT              CAT914  
           WRITE NSCCPTRL-RECORD.                                       CAT914  
                                                                        CAT914  
       CONVERT-TRANSFER.                                                CAT914  
                                                                        CAT914  
           PERFORM CONVERT-COMMON.                                      CAT914  
           PERFORM CONVERT-FIRST-CONTROL.                               CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM CONVERT-SECOND-CONTROL.                              CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM CONVERT-THIRD-CONTROL.                               CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           IF      NSCCPI-REC-TYPE = 'P'                                CAT914  
             ADD  1                TO W-NSCCFILE-CNT                    CAT914  
             WRITE NSCCOTRN-PT-RECORD FROM NSCCPI-RECORD.               CAT914  
      *                                                                 CAT914  
      *                                                                 CAT914  
       CONVERT-ASSET.                                                   CAT914  
                                                                        CAT914  
           PERFORM CONVERT-COMMON.                                      CAT914  
           PERFORM CONVERT-FIRST-ASSET.                                 CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM CONVERT-SECOND-ASSET.                                CAT914  
                                                                        CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM CONVERT-THIRD-ASSET.                                 CAT914  
      *     IF        NSCCOTRN-AT-CHG                                   CAT914  
      *      OR      NSCCOTRN-AT-DEL                                    CAT914  
      *      ADD  1                TO W-NCHGFILE-CNT                    CAT914  
      *      IF NSCCAT-SET-LOC = '10'                                   CAT914  
      *         SET NSCCOTRN-AT-MF-LEN   TO TRUE                        CAT914  
      *         MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT914  
      *         WRITE NCHGOTRN-AT-MFD-RECORD FROM NSCCOTRN-RECORD       CAT914  
      *      ELSE IF NSCCAT-SET-LOC = '35'                              CAT914  
      *         SET NSCCOTRN-AT-OP-LEN   TO TRUE                        CAT914  
      *         MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT914  
      *         WRITE NCHGOTRN-AT-OPT-RECORD FROM NSCCOTRN-RECORD       CAT914  
      *        ELSE                                                     CAT914  
      *         SET NSCCOTRN-AT-LEN   TO TRUE                           CAT914  
      *         MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN          CAT914  
      *         WRITE NCHGOTRN-AT-REG-RECORD FROM NSCCOTRN-RECORD       CAT914  
      *           END-IF                                                CAT914  
      *      END-IF                                                     CAT914  
      *    ELSE                                                         CAT914  
      *      ADD  1                TO W-NSCCFILE-CNT                    CAT914  
      *      IF NSCCAT-SET-LOC = '10'                                   CAT914  
      *        SET NSCCOTRN-AT-MF-LEN   TO TRUE                         CAT914  
      *        MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT914  
      *        WRITE NSCCOTRN-AT-MFD-RECORD FROM NSCCOTRN-RECORD        CAT914  
      *      ELSE IF NSCCAT-SET-LOC = '35'                              CAT914  
      *        SET NSCCOTRN-AT-OP-LEN   TO TRUE                         CAT914  
      *        MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT914  
      *        WRITE NSCCOTRN-AT-OPT-RECORD FROM NSCCOTRN-RECORD        CAT914  
      *       ELSE                                                      CAT914  
      *        SET NSCCOTRN-AT-LEN   TO TRUE                            CAT914  
      *        MOVE NSCCOTRN-REC-LEN   TO NSCCOTRN-AT-REC-LEN           CAT914  
      *        WRITE NSCCOTRN-AT-REG-RECORD FROM NSCCOTRN-RECORD        CAT914  
      *           END-IF                                                CAT914  
      *      END-IF                                                     CAT914  
      *     END-IF                                                      CAT914  
      *    END-IF.                                                      CAT914  
           PERFORM 3000-READ-INPUT.                                     CAT914  
                                                                        CAT914  
       CONVERT-MFREG.                                                   CAT914  
                                                                        CAT914  
      *    PERFORM CONVERT-COMMON.                                      CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM 3000-READ-INPUT                                      CAT914  
           PERFORM 3000-READ-INPUT.                                     CAT914  
                                                                        CAT914  
       CONVERT-COMMON.                                                  CAT914  
                                                                        CAT914  
           MOVE SPACES TO  NSCCPI-RECORD.                               CAT914  
           MOVE 'P'  TO  NSCCPI-REC-TYPE.                               CAT914  
           MOVE 'T'  TO  NSCCPI-REC-SUBTYPE.                            CAT914  
           IF  ACAT-CONTROL                                             CAT914  
              MOVE  475  TO NSCCPI-REC-LENGTH                           CAT914  
              MOVE 0           TO NSCCPI-ASSET-SEQ-NBR                  CAT914  
           ELSE IF  ACAT-ASSET                                          CAT914  
              MOVE 'A'  TO  NSCCPI-REC-SUBTYPE                          CAT914  
              MOVE  535  TO NSCCPI-REC-LENGTH                           CAT914  
              IF  NOT ACAT-NON-OPTION                                   CAT914  
                MOVE  620  TO NSCCPI-REC-LENGTH                         CAT914  
              END-IF                                                    CAT914  
              MOVE ACAT-ASSET-SEQ-NO  TO W-NUM-4-A                      CAT914  
              MOVE W-NUM-4-N   TO NSCCPI-ASSET-SEQ-NBR                  CAT914  
           END-IF.                                                      CAT914  
           MOVE 1 TO NSCCPI-PHSCL-SEQ-NBR                               CAT914  
           MOVE 1 TO  NSCCPI-LGCL-SEQ-NBR                               CAT914  
           IF  ACAT-CLNT-IS-RECEIVER                                    CAT914  
               SET NSCCPI-ORG-RCV             TO TRUE                   CAT914  
           ELSE                                                         CAT914  
              SET  NSCCPI-ORG-DEL             TO TRUE.                  CAT914  
           MOVE ACAT-CONTROL-NUM TO SAVE-CONTROL.                       CAT914  
           MOVE ACAT-CONTROL-NUM (1 : 3) TO  W-CTL-NO-DDD.              CAT914  
           MOVE ACAT-CONTROL-NUM (4 : 5) TO  W-CTL-NO-SEQ(3 : 5)        CAT914  
           MOVE '00'                 TO  W-CTL-NO-SEQ(1 : 2)            CAT914  
           MOVE  W-CTL-NO            TO  NSCCPI-ACAT-CNTL-NBR.          CAT914  
           MOVE SAVE-CLR-NO          TO NSCCPI-DSTRB-PART               CAT914  
           MOVE ACAT-DAYS-CURRENT-STATUS   TO WS-NUM-3-A.               CAT914  
           IF ACAT-NEW                                                  CAT914  
             IF  ACAT-NOT-PAST-DUE                                      CAT914  
              MOVE '100' TO NSCCPI-STATUS                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
            ELSE                                                        CAT914  
              MOVE '130' TO NSCCPI-STATUS                               CAT914  
              SUBTRACT 3 FROM WS-NUM-3-N                                CAT914  
              MOVE    WS-NUM-3-A TO     NSCCPI-DAYS-IN-STAT             CAT914  
            END-IF                                                      CAT914  
           END-IF.                                                      CAT914  
           IF ACAT-PEND                                                 CAT914  
            IF ACAT-NOT-REJECTED                                        CAT914  
              MOVE '200' TO NSCCPI-STATUS                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
            ELSE                                                        CAT914  
              MOVE '220' TO NSCCPI-STATUS                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
            END-IF                                                      CAT914  
           END-IF.                                                      CAT914  
           IF ACAT-PEND-ADJ                                             CAT914  
              MOVE '210' TO NSCCPI-STATUS                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
           END-IF.                                                      CAT914  
           IF ACAT-SETTLE                                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
              MOVE '300' TO NSCCPI-STATUS                               CAT914  
           END-IF.                                                      CAT914  
           IF ACAT-CLOSED                                               CAT914  
              MOVE WS-NUM-3-A   TO NSCCPI-DAYS-IN-STAT                  CAT914  
              MOVE '310' TO NSCCPI-STATUS                               CAT914  
           END-IF.                                                      CAT914  
           IF ACAT-REJECTED                                             CAT914  
              MOVE ' '   TO NSCCPI-REC-TYPE                             CAT914  
              MOVE '600' TO NSCCPI-STATUS.                              CAT914  
            MOVE 'P' TO NSCCPI-REGST-IND.                               CAT914  
                                                                        CAT914  
       CONVERT-FIRST-CONTROL.                                           CAT914  
            MOVE W-CTL-NO TO  NSCCTI-ACATS-CNTL-NBR.                    CAT914  
            MOVE 'TI' TO  NSCCTI-REC-TYPE.                              CAT914  
      *     IF ACAT-REJECTED                                            CAT914  
      *       SET NSCCOTRN-TI-REJECT TO TRUE.                           CAT914  
            MOVE 'FUL'  TO NSCCTI-XFER-TYPE                             CAT914  
            IF ACAT-CONTROL-NUM(1 : 3) > '400'                          CAT914  
               MOVE 'RCR'  TO NSCCTI-XFER-TYPE                          CAT914  
            END-IF.                                                     CAT914  
            IF ACAT-CLNT-IS-RECEIVER                                    CAT914  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCTI-ORG-RCV-NBR            CAT914  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCTI-ORG-DEL-NBR           CAT914  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT914  
             PERFORM CLEAN-NAME                                         CAT914  
             MOVE W-NAME-WORKNEW      TO  NSCCTI-ORG-RCV-CUS-ACT        CAT914  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT914  
             PERFORM CLEAN-NAME                                         CAT914  
             MOVE W-NAME-WORKNEW      TO  NSCCTI-ORG-DEL-ACCT-NBR       CAT914  
            ELSE                                                        CAT914  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCTI-ORG-DEL-NBR            CAT914  
             MOVE ACAT-CONTRA-BRK-NUM TO   NSCCTI-ORG-RCV-NBR           CAT914  
             MOVE ACAT-CUST-BR-ACT    TO  W-NAME-WORK                   CAT914  
             PERFORM CLEAN-NAME                                         CAT914  
             MOVE W-NAME-WORKNEW      TO  NSCCTI-ORG-DEL-ACCT-NBR       CAT914  
             MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                   CAT914  
             PERFORM CLEAN-NAME                                         CAT914  
             MOVE W-NAME-WORKNEW      TO  NSCCTI-ORG-RCV-CUS-ACT        CAT914  
            END-IF.                                                     CAT914  
            MOVE ACAT-SOC-SEC-TAX-ID TO NSCCTI-ORG-RCV-SSN-PRM          CAT914  
      *****  15  NSCCOTRN-TI-RCV-SSN-SEC                                CAT914  
            IF  ACAT-SINGLE-ACCT                                        CAT914  
             MOVE 'SN'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-JOINT-ACCT                                    CAT914  
             MOVE 'JT'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-ROLLOVER                                      CAT914  
             MOVE 'DR'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-IRA                                           CAT914  
             MOVE 'IR'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-PROF-PENSION                                  CAT914  
             MOVE 'QP'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-OTHER-ACCT                                    CAT914  
             MOVE 'OT'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-ESTATE-ACCT                                   CAT914  
             MOVE 'ES'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-CUSTODIAN-ACCT                                CAT914  
             MOVE 'CU'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-TRUST-ACCT                                    CAT914  
             MOVE 'TR'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            ELSE IF  ACAT-CORP-ACCT                                     CAT914  
             MOVE 'CO'     TO NSCCTI-ORG-RCV-ACCT-TYP                   CAT914  
            END-IF.                                                     CAT914  
            MOVE ACAT-ACT-TITLE    TO NSCCTI-ORG-RCV-CUS-NAME.          CAT914  
                                                                        CAT914  
             MOVE ' '                  TO                               CAT914  
                                              NSCCTI-COMMENTS.          CAT914  
                                                                        CAT914  
       CONVERT-SECOND-CONTROL.                                          CAT914  
                                                                        CAT914  
                                                                        CAT914  
       CONVERT-THIRD-CONTROL.                                           CAT914  
           MOVE ACAT-REJ-REASON    TO NSCCTI-XFER-TYPE-REJECT.          CAT914  
           IF NSCCPI-STATUS = '300'                                     CAT914  
            MOVE ACAT-SETTL-DATE  TO NSCCPI-SETLMNT-DT  (3 : 6)         CAT914  
            IF   ACAT-SETTL-DATE  NOT = SPACES                          CAT914  
            MOVE '19'              TO NSCCPI-SETLMNT-DT (1 : 2)         CAT914  
            END-IF                                                      CAT914  
           END-IF.                                                      CAT914  
           IF NSCCPI-STATUS > '300'                                     CAT914  
            SEARCH ALL CONTROL-TAB                                      CAT914  
              AT END                                                    CAT914  
               CONTINUE                                                 CAT914  
              WHEN TAB-CONTROL (TAB-IND) = SAVE-CONTROL                 CAT914  
                MOVE TAB-DATE (TAB-IND) TO NSCCPI-SETLMNT-DT  (3 : 6)   CAT914  
                IF NSCCPI-SETLMNT-DT  (3 : 6) NOT = SPACES              CAT914  
                  MOVE '19'              TO NSCCPI-SETLMNT-DT (1 : 2)   CAT914  
                END-IF                                                  CAT914  
            END-SEARCH                                                  CAT914  
           END-IF.                                                      CAT914  
           MOVE ACAT-PROCESS-DATE  TO NSCCPI-PROCESS-DATE (3 : 6).      CAT914  
           IF   ACAT-PROCESS-DATE  NOT = SPACES                         CAT914  
           MOVE '19'              TO NSCCPI-PROCESS-DATE(1 : 2).        CAT914  
                                                                        CAT914  
       CONVERT-FIRST-ASSET.                                             CAT914  
                                                                        CAT914  
            MOVE W-CTL-NO TO  NSCCAT-ACATS-CNTL-NBR.                    CAT914  
           MOVE 'AT'       TO NSCCAT-REC-TYPE                           CAT914  
           MOVE 'FUL'  TO NSCCAT-XFER-TYPE                              CAT914  
           IF ACAT-CONTROL-NUM(1 : 3) > '400'                           CAT914  
               MOVE 'RCR'  TO NSCCAT-XFER-TYPE                          CAT914  
           END-IF.                                                      CAT914  
           MOVE ACAT-BROKER-CLEAR-NO TO                                 CAT914  
                               NSCCAT-ORG-DEL-NBR                       CAT914  
           MOVE NSCCPI-ASSET-SEQ-NBR TO NSCCAT-ASET-SEQ-NBR.            CAT914  
           IF ACAT-CLNT-IS-RECEIVER                                     CAT914  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCAT-ORG-RCV-NBR            CAT914  
             MOVE ACAT-CONTRA-BRK-NUM TO  NSCCAT-ORG-DEL-NBR            CAT914  
             IF        NSCCAT-XFER-TYPE = 'RCR'                         CAT914  
               MOVE ACAT-CONTRA-CUS-ACT TO  W-NAME-WORK                 CAT914  
               PERFORM CLEAN-NAME                                       CAT914  
               MOVE W-NAME-WORKNEW      TO  NSCCAT-TRANS-REF-ID         CAT914  
             END-IF                                                     CAT914  
            ELSE                                                        CAT914  
             MOVE ACAT-BROKER-CLEAR-NO TO NSCCAT-ORG-DEL-NBR            CAT914  
             MOVE ACAT-CONTRA-BRK-NUM TO  NSCCAT-ORG-RCV-NBR            CAT914  
            END-IF.                                                     CAT914  
           IF ACAT-NON-OPTION                                           CAT914  
             MOVE '00'   TO NSCCAT-OPT-CATG                             CAT914  
           ELSE IF ACAT-EQUITY-OPTION                                   CAT914  
             MOVE '01'   TO NSCCAT-OPT-CATG                             CAT914  
           ELSE IF ACAT-NON-EQUITY-OPTION                               CAT914  
             MOVE '02'   TO NSCCAT-OPT-CATG                             CAT914  
           ELSE IF ACAT-INTL-CURR-SYS-OPTION                            CAT914  
             MOVE '03'   TO NSCCAT-OPT-CATG.                            CAT914  
                                                                        CAT914  
       CONVERT-SECOND-ASSET.                                            CAT914  
                                                                        CAT914  
           MOVE 'US'     TO   NSCCAT-ISIN-CNTRY-CD                      CAT914  
           IF   NOT ACAT-CUSIP-IS-CASH-BAL                              CAT914  
              MOVE ACAT-CUSIP-NUM TO  NSCCAT-ISIN-SEC-ID.               CAT914  
           MOVE ACAT-SEC-DESC-1 TO   NSCCAT-ASET-DESC.                  CAT914  
           MOVE 'F' TO  NSCCAT-ASET-QNTY-RQIND.                         CAT914  
           MOVE '2' TO  NSCCAT-ASET-REQ-TRANCD.                         CAT914  
           MOVE ACAT-ASSET-QUAN-WHOLE-NUM TO W-SHARE-DIG                CAT914  
           MOVE ACAT-ASSET-QUAN-FRACTION  TO W-SHARE-FRA                CAT914  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT914  
             MOVE 0                         TO W-SHARE-DIG.             CAT914  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT914  
             MOVE 0                         TO W-SHARE-FRA.             CAT914  
           MOVE W-SHARE-AREA     TO  NSCCAT-ASET-QNTY                   CAT914  
           MOVE 0                         TO W-SHARE-DIG                CAT914  
           MOVE 0                         TO W-SHARE-FRA                CAT914  
           MOVE W-SHARE-AREA     TO  NSCCAT-ASET-PRCNT                  CAT914  
           IF ACAT-SHORT-POSITION                                       CAT914  
             MOVE 'S' TO NSCCAT-POSTN-CD                                CAT914  
           ELSE                                                         CAT914  
             MOVE 'S' TO NSCCAT-POSTN-CD.                               CAT914  
           IF NSCCAT-OPT-CATG = '00'                                    CAT914  
               PERFORM CONVERT-SECOND-MF                                CAT914  
           ELSE                                                         CAT914  
               PERFORM CONVERT-SECOND-OPTION.                           CAT914  
                                                                        CAT914  
       CONVERT-THIRD-ASSET.                                             CAT914  
           IF ACAT-EQUITIES                                             CAT914  
             MOVE 'CORP' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-FOREIGN-SECURITY                                CAT914  
             MOVE 'FEQU' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-CORPORATE-BONDS                                 CAT914  
             MOVE 'CORP' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-MUNICIPAL-BONDS                                 CAT914  
             MOVE 'MUNI' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-MF-NON-MONEY-MRKT                               CAT914  
             MOVE 'MFNM' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-MF-MONEY-MRKT                                   CAT914  
             MOVE 'MFMM' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-ZERO-COUPON-BONDS                               CAT914  
             MOVE 'ZERO' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-LIMITED-PARNERSHIPS                             CAT914  
             MOVE 'LPAR' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-CDS-AND-COMMERCIAL-PAPER                        CAT914  
             MOVE 'CDCP' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-GOVT-BONDS-US-AND-FGN                           CAT914  
             MOVE 'GOVT' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-UITS                                            CAT914  
             MOVE 'UIT ' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE IF ACAT-MORTGAGED-BACKED                                CAT914  
             MOVE 'MBS ' TO  NSCCAT-AST-PRC-CATG                        CAT914  
           ELSE                                                         CAT914  
             MOVE 'OTH ' TO  NSCCAT-AST-PRC-CATG.                       CAT914  
                                                                        CAT914  
           IF   NSCCAT-AST-PRC-CATG = 'FEQU'                            CAT914  
              MOVE '  '     TO   NSCCAT-ISIN-CNTRY-CD.                  CAT914  
                                                                        CAT914  
           IF ACAT-SETTL-CNS                                            CAT914  
             MOVE '05'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE  SPACES TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-MF-BOOK-ENTRY                             CAT914  
             MOVE '10'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE  SPACES TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-XCNS                                      CAT914  
             MOVE '50'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE  'XSET' TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-DELAYED-DELIVERY                          CAT914  
                 OR ACAT-SETTL-NON-CNS                                  CAT914  
             MOVE '50'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE  'DDEL' TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-NOT-DELIVERABLE                           CAT914  
             MOVE '30'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE SPACES  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-CASH-BALANCE                              CAT914  
             MOVE '40'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'CRED'  TO        NSCCAT-SET-LOC-RSN                  CAT914  
             IF  ACAT-CUSIP-NUM = ALL '9'                               CAT914  
               MOVE 'DEB '  TO        NSCCAT-SET-LOC-RSN                CAT914  
             END-IF                                                     CAT914  
           ELSE IF ACAT-SETTL-OPTION                                    CAT914  
             MOVE '35'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'OPT '  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-SAFEKEEPING                               CAT914  
             MOVE '50'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'SFK '  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-UNDERLY-CASH-BAL                          CAT914  
             MOVE 'CASH'  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-EXPIRING-OPTION                           CAT914  
             MOVE '35'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'EXPO'  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-MEMO                                      CAT914  
             MOVE '45'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'COMT'  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-SMA                                       CAT914  
             MOVE '45'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'SMA '  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-UNDERLY-SECURITY                          CAT914  
             MOVE '45'     TO NSCCAT-SET-LOC                            CAT914  
             IF NSCCAT-OPT-CATG NOT = '00'                              CAT914  
                MOVE '35'     TO NSCCAT-SET-LOC                         CAT914  
             END-IF                                                     CAT914  
             MOVE 'USEC'  TO        NSCCAT-SET-LOC-RSN                  CAT914  
           ELSE IF ACAT-SETTL-RESTRICTED-SEC                            CAT914  
             MOVE '50'     TO NSCCAT-SET-LOC                            CAT914  
             MOVE 'RSEC'  TO        NSCCAT-SET-LOC-RSN.                 CAT914  
      *                                                                 CAT914  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-DIG                CAT914  
           MOVE ACAT-ASSET-VALUE          TO W-SHARE-FRA                CAT914  
           IF W-SHARE-DIG NOT NUMERIC                                   CAT914  
             MOVE 0                         TO W-SHARE-DIG.             CAT914  
           IF W-SHARE-FRA NOT NUMERIC                                   CAT914  
             MOVE 0                         TO W-SHARE-FRA.             CAT914  
           MOVE W-SHARE-AREA     TO  NSCCAT-ASSET-AMT                   CAT914  
           MOVE 'N'  TO  NSCCAT-BEARER-BOND                             CAT914  
                         NSCCAT-WHN-ISS-IND.                            CAT914  
           IF  ACAT-BEARER-BOND                                         CAT914  
             MOVE 'B'   TO NSCCAT-BEARER-BOND.                          CAT914  
           IF  ACAT-WHEN-ISSUE                                          CAT914  
             MOVE 'W'   TO NSCCAT-WHN-ISS-IND.                          CAT914  
      *                                                                 CAT914  
           IF ACAT-MARGIN-ACT                                           CAT914  
              SET  NSCCAT-MARGIN  TO TRUE                               CAT914  
           ELSE IF ACAT-SHORT-ACT                                       CAT914  
              SET    NSCCAT-SHORT   TO TRUE                             CAT914  
           ELSE                                                         CAT914  
              SET    NSCCAT-CASH    TO TRUE.                            CAT914  
                                                                        CAT914  
      *                                 NSCCOTRN-AT-TFR-TYPE-RSN.       CAT914  
      *********  NSCCOTRN-AT-MBS-SER-NT             PIC X(0003).        CAT914  
           MOVE ACAT-SEC-DESC-2 TO   NSCCAT-ASET-DESC(97 : 24).         CAT914  
           IF NSCCAT-OPT-CATG = '00'                                    CAT914  
                 PERFORM CONVERT-THIRD-MF                               CAT914  
           ELSE                                                         CAT914  
                 PERFORM CONVERT-THIRD-OPTION.                          CAT914  
      ******************************************************************CAT914  
       CONVERT-SECOND-OPTION.                                           CAT914  
      *    MOVE ACAT-OPTION-SYMBOL    TO                                CAT914  
      *                     NSCCOTRN-ATO-OPT-SYM                        CAT914  
      *    MOVE ACAT-OPTION-DEL-BKR-NO TO                               CAT914  
      *                           NSCCOTRN-ATO-OPT-OCC-DEL-NBR.         CAT914  
       CONVERT-THIRD-OPTION.                                            CAT914  
                                                                        CAT914  
      *    IF ACAT-OPT-BUY                                              CAT914  
      *       SET  NSCCOTRN-ATO-OPT-BUY TO TRUE                         CAT914  
      *    ELSE                                                         CAT914  
      *       SET  NSCCOTRN-ATO-OPT-SELL TO TRUE.                       CAT914  
      *    MOVE ACAT-OPT-PUT-CALL TO    NSCCOTRN-ATO-OPT-PC-IND.        CAT914  
      *    IF ACAT-OPT-OPEN                                             CAT914  
      *       SET NSCCOTRN-ATO-OPT-OPEN TO TRUE                         CAT914  
      *    ELSE IF ACAT-OPT-CLOSE                                       CAT914  
      *        SET NSCCOTRN-ATO-OPT-CLOSE TO TRUE.                      CAT914  
      *    MOVE ACAT-OPT-EXP-MM                                         CAT914  
      *        TO  NSCCOTRN-ATO-OPT-EXP-DT(1 : 2).                      CAT914  
      *    MOVE  ACAT-OPT-EXP-Y                                         CAT914  
      *        TO  NSCCOTRN-ATO-OPT-EXP-DT(4 : 1).                      CAT914  
      *    IF ACAT-OPT-EXP-Y < '8'                                      CAT914  
      *      MOVE '0'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT914  
      *      MOVE '20' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2)               CAT914  
      *    ELSE                                                         CAT914  
      *      MOVE '9'  TO  NSCCOTRN-ATO-OPT-EXP-DT(3 : 1)               CAT914  
      *      MOVE '19' TO  NSCCOTRN-ATO-OPT-EXP-DT(5 : 2).              CAT914  
      *        MOVE '00'     TO NSCCOTRN-ATO-OPT-STKPRC-INT(1 : 2)      CAT914  
      *        MOVE ACAT-OPT-PRICE                                      CAT914  
      *                           TO NSCCOTRN-ATO-OPT-STKPRC-INT(3 : 3).CAT914  
      *        MOVE '0' TO NSCCOTRN-ATO-OPT-STKPRC-FRC(1 : 1).          CAT914  
      *        MOVE  ACAT-OPT-1-8TH-PRCE                                CAT914  
      *             TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).             CAT914  
      *        IF    ACAT-OPT-1-8TH-PRCE = ' '                          CAT914  
      *          MOVE '0'   TO  NSCCOTRN-ATO-OPT-STKPRC-FRC(2 : 1).     CAT914  
      *     SET   NSCCOTRN-ATO-OPT-CUST  TO TRUE.                       CAT914  
      *******      88  NSCCOTRN-ATO-OPT-FIRM       VALUE 'F'.           CAT914  
      *******      88  NSCCOTRN-ATO-OPT-MARKET     VALUE 'M'.           CAT914  
      *       MOVE ACAT-REC-OCC-BKR-NO                                  CAT914  
      *                 TO  NSCCOTRN-ATO-SUB-ACCT-ID.                   CAT914  
      *       MOVE ' '                 TO                               CAT914  
      *                                   NSCCOTRN-ATO-OPT-COMMENT.     CAT914  
                                                                        CAT914  
       CONVERT-SECOND-MF.                                               CAT914  
      *     SET        NSCCOTRN-ATF-FULL-TFR  TO TRUE.                  CAT914  
      *     MOVE ACAT-MF-CUST-ACCT-AT-FUND   TO                         CAT914  
      *                                   NSCCOTRN-ATF-CUS-ACCT.        CAT914  
      *     MOVE ACAT-BOOK-PHYS-SHARE-IND    TO                         CAT914  
      *                                   NSCCOTRN-ATF-PHSCL-SHR-IND.   CAT914  
      *     MOVE ACAT-NETWORK-CNTL-IND       TO                         CAT914  
      *                                 NSCCOTRN-ATF-NTWRK-CTL-IND      CAT914  
      *     MOVE ACAT-ACCOUNT-TYPE-IND       TO                         CAT914  
      *                                 NSCCOTRN-ATF-ACCT-TYP-IND       CAT914  
      *     MOVE ACAT-MF-DIVIDEND-CODE       TO                         CAT914  
      *                                  NSCCOTRN-ATF-DIV-CD            CAT914  
      *     MOVE ACAT-MF-DIV-PAYEE-TYPE      TO                         CAT914  
      *                                   NSCCOTRN-ATF-DIV-PAYEE-IND    CAT914  
      *     MOVE ACAT-DELIVER-EXEC-BROKER    TO                         CAT914  
      *                                  NSCCOTRN-ATF-EXEC-BRKR.        CAT914  
       CONVERT-THIRD-MF.                                                CAT914  
      *     MOVE ACAT-MF-ACCT-LAST6   TO                                CAT914  
      *                          NSCCOTRN-ATF-CUS-ACCT(13 : 6).         CAT914  
       CLEAN-NAME.                                                      CAT914  
           SET IWNWN TO 1. SET IWNWN DOWN BY 1.                         CAT914  
           MOVE SPACE   TO W-NAME-WORKNEW.                              CAT914  
                                                                        CAT914  
           PERFORM VARYING IWNW FROM 1 BY 1                             CAT914  
              UNTIL IWNW > 20                                           CAT914  
              IF  W-N-W (IWNW)  = '-' OR ' '                            CAT914  
               CONTINUE                                                 CAT914  
              ELSE                                                      CAT914  
               SET IWNWN UP BY 1                                        CAT914  
               MOVE W-N-W (IWNW)    TO W-N-WN(IWNWN)                    CAT914  
              END-IF                                                    CAT914  
           END-PERFORM.                                                 CAT914  
                                                                        CAT914  
