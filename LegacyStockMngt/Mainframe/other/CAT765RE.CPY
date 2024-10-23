000001* PDX    - CAT765RE C0214108 02/14/05 07:52:04 TBDOJUN            00001000
      ***************************************************************** CAT765RE
      ***   CAT765RE - EXTRACTED NSCC/SIAC ACATS TRANSACTIONS       *** CAT765RE
      ***                                                           *** CAT765RE
      ***   USED BY CAT765 TO CREATE REPORT                         *** CAT765RE
      ***                                                           *** CAT765RE
      ***   LENGTH   - 800 BYTES    DCB=(RECFM=FB,LRECL=800)        *** CAT765RE
      ***   KEY      -  80 BYTES                                    *** CAT765RE
      ***                                                           *** CAT765RE
      ***===========================================================*** CAT765RE
       01  :CAT765RE:-RECORD.                                           CAT765RE
        03  :CAT765RE:-REC.                                             CAT765RE
         05  :CAT765RE:-KEY.                                            CAT765RE
           10  :CAT765RE:-KEY-CLIENT-NBR           PIC X(0004).         CAT765RE
           10  :CAT765RE:-KEY-CLIENT-NBR-N  REDEFINES                   CAT765RE
               :CAT765RE:-KEY-CLIENT-NBR           PIC 9(0004).         CAT765RE
           10  :CAT765RE:-KEY-SIDE                 PIC X(0001).         CAT765RE
             88  :CAT765RE:-KEY-IS-RECEIVER        VALUE 'R'.           CAT765RE
             88  :CAT765RE:-KEY-IS-DELIVERER       VALUE 'D'.           CAT765RE
           10  :CAT765RE:-KEY-TFR-TYPE             PIC X(0003).         CAT765RE
           10  :CAT765RE:-KEY-ACCT-NBR             PIC X(0020).         CAT765RE
           10  :CAT765RE:-KEY-PROC-DATE.                                CAT765RE
               15  :CAT765RE:-KEY-PROC-YEAR        PIC X(0004).         CAT765RE
               15  :CAT765RE:-KEY-PROC-MM          PIC X(0002).         CAT765RE
               15  :CAT765RE:-KEY-PROC-DD          PIC X(0002).         CAT765RE
           10  :CAT765RE:-KEY-CYCLE                PIC X(0002).         CAT765RE
           10  :CAT765RE:-KEY-REC-TYPE             PIC X(0002).         CAT765RE
             88  :CAT765RE:-KEY-REC-TYPE-IS-TI     VALUE '1T'.          CAT765RE
             88  :CAT765RE:-KEY-REC-TYPE-IS-AT     VALUE '2A'.          CAT765RE
           10  :CAT765RE:-KEY-ACAT-CTL-NBR         PIC X(0014).         CAT765RE
           10  :CAT765RE:-KEY-STL-LOC              PIC X(0002).         CAT765RE
                 88  :CAT765RE:-KEY-CNS            VALUE '05'.          CAT765RE
                 88  :CAT765RE:-KEY-FUND-SERV      VALUE '10'.          CAT765RE
                 88  :CAT765RE:-KEY-PTC            VALUE '15'.          CAT765RE
                 88  :CAT765RE:-KEY-GSCC           VALUE '20'.          CAT765RE
                 88  :CAT765RE:-KEY-DTC            VALUE '25'.          CAT765RE
                 88  :CAT765RE:-KEY-UNDELIVERABLE  VALUE '30'.          CAT765RE
                 88  :CAT765RE:-KEY-OCC            VALUE '35'.          CAT765RE
                 88  :CAT765RE:-KEY-CASH-BALANCE   VALUE '40'.          CAT765RE
                 88  :CAT765RE:-KEY-MEMO           VALUE '45'.          CAT765RE
                 88  :CAT765RE:-KEY-R-D            VALUE '50'.          CAT765RE
           10  :CAT765RE:-KEY-CASH-MRGN-SHTCD      PIC X(0001).         CAT765RE
                 88  :CAT765RE:-KEY-CASH           VALUE 'C'.           CAT765RE
                 88  :CAT765RE:-KEY-MARGIN         VALUE 'M'.           CAT765RE
                 88  :CAT765RE:-KEY-SHORT          VALUE 'S'.           CAT765RE
           10  :CAT765RE:-KEY-SEC-CNTRY-CD         PIC X(0002).         CAT765RE
           10  :CAT765RE:-KEY-SEC-ID               PIC X(0009).         CAT765RE
           10  :CAT765RE:-KEY-SEC-CHKDGT           PIC X(0001).         CAT765RE
           10  :CAT765RE:-KEY-POS-CD               PIC X(0001).         CAT765RE
                 88  :CAT765RE:-KEY-SHORT-POS      VALUE 'S'.           CAT765RE
                 88  :CAT765RE:-KEY-LONG-POS       VALUE 'L'.           CAT765RE
           10  :CAT765RE:-KEY-ASSET-SEQ-NBR        PIC 9(0006).         CAT765RE
           10  :CAT765RE:-KEY-DATABASE-FROM        PIC X(0001).         CAT765RE
                 88  :CAT765RE:-KEY-DATABASE-YES   VALUE 'Y'.           CAT765RE
                 88  :CAT765RE:-KEY-DATABASE-NO    VALUE ' '.           CAT765RE
           10  :CAT765RE:-KEY-TRAN-TYPE            PIC X(0001).         CAT765RE
           10  :CAT765RE:-KEY-SYSTEM-ACTION        PIC X(0001).         CAT765RE
           10  FILLER                              PIC X(0001).         CAT765RE
                                                                        CAT765RE
         05  :CAT765RE:-BODY                       PIC X(720).          CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-TRN-REC =  716                                   * CAT765RE
      *---------------------------------------------------------------* CAT765RE
         05  :CAT765RE:-TRN-REC REDEFINES :CAT765RE:-BODY.              CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-COMMON-AREA = 0077                               * CAT765RE
      *---------------------------------------------------------------* CAT765RE
          07  :CAT765RE:-COMMON-AREA.                                   CAT765RE
           10  :CAT765RE:-REC-TYPE                 PIC X(0001).         CAT765RE
               88  :CAT765RE:-MULTI-CYCLE-TRAN     VALUE 'M'.           CAT765RE
               88  :CAT765RE:-END-OF-DAY-TRAN      VALUE 'E'.           CAT765RE
           10  :CAT765RE:-REC-SUBTYPE              PIC X(0001).         CAT765RE
               88  :CAT765RE:-TRANSFER-OUTPUT      VALUE 'T'.           CAT765RE
               88  :CAT765RE:-ASSET-OUTPUT         VALUE 'A'.           CAT765RE
               88  :CAT765RE:-FNDREG-OUTPUT        VALUE 'F'.           CAT765RE
           10  :CAT765RE:-REC-LEN                  PIC X(0004).         CAT765RE
               88  :CAT765RE:-TI-LEN               VALUE '0481'.        CAT765RE
               88  :CAT765RE:-AT-LEN               VALUE '0585'.        CAT765RE
               88  :CAT765RE:-AT-OP-LEN            VALUE '0651'.        CAT765RE
DJ0003         88  :CAT765RE:-AT-MF-LEN            VALUE '0700'.        CAT765RE
           10  :CAT765RE:-PHYSICAL-SEQ-NBR         PIC X(0002).         CAT765RE
               88  :CAT765RE:-PHYSICAL-SEQ-DEFAULT VALUE '01'.          CAT765RE
           10  :CAT765RE:-LOGICAL-SEQ-NBR          PIC X(0002).         CAT765RE
               88  :CAT765RE:-LOGICAL-SEQ-DEFAULT  VALUE '01'.          CAT765RE
           10  :CAT765RE:-DIST-SIDE                PIC X(0001).         CAT765RE
               88  :CAT765RE:-ORIGINAL-RECEIVER    VALUE 'R'.           CAT765RE
               88  :CAT765RE:-ORIGINAL-DELIVERER   VALUE 'D'.           CAT765RE
               88  :CAT765RE:-BOTH-ORIG-REC-DEL    VALUE 'B'.           CAT765RE
           10  :CAT765RE:-ACAT-CTL-NBR             PIC X(0014).         CAT765RE
           10  :CAT765RE:-ASSET-SEQ-NBR            PIC 9(0006).         CAT765RE
           10  :CAT765RE:-PROC-DATE.                                    CAT765RE
               15  :CAT765RE:-PROC-YEAR            PIC X(0004).         CAT765RE
               15  :CAT765RE:-PROC-MM              PIC X(0002).         CAT765RE
               15  :CAT765RE:-PROC-DD              PIC X(0002).         CAT765RE
           10  :CAT765RE:-CYCLE                    PIC X(0002).         CAT765RE
           10  :CAT765RE:-FILLER                   PIC X(0004).         CAT765RE
           10  :CAT765RE:-DIST-PARTICIPANT         PIC X(0004).         CAT765RE
           10  :CAT765RE:-SYSTEM-ACTION            PIC X(0001).         CAT765RE
               88  :CAT765RE:-ACCEPTED             VALUE '1'.           CAT765RE
               88  :CAT765RE:-REJECTED             VALUE '2'.           CAT765RE
               88  :CAT765RE:-MODIFIED             VALUE '3'.           CAT765RE
           10  :CAT765RE:-SYSTEM-REJ-RSN           PIC X(0002).         CAT765RE
               88  :CAT765RE:-INV-FLD              VALUE '01'.          CAT765RE
               88  :CAT765RE:-MISSED-CUTOFF        VALUE '02'.          CAT765RE
               88  :CAT765RE:-ASSOC-REC-NOT-PRSNT  VALUE '03'.          CAT765RE
               88  :CAT765RE:-PHY-REC-OUT-OF-SEQ   VALUE '04'.          CAT765RE
               88  :CAT765RE:-INV-PHY-SEQ-NBR      VALUE '05'.          CAT765RE
               88  :CAT765RE:-LOG-REC-OUT-OF-SEQ   VALUE '06'.          CAT765RE
               88  :CAT765RE:-INV-LOG-SEQ-NBR      VALUE '07'.          CAT765RE
               88  :CAT765RE:-INV-LEN-REC          VALUE '08'.          CAT765RE
               88  :CAT765RE:-INV-REC-CONTENTS     VALUE '09'.          CAT765RE
               88  :CAT765RE:-INV-ADD-REC-EXIST    VALUE '10'.          CAT765RE
               88  :CAT765RE:-INV-CHG-REC-NOT-EXST VALUE '11'.          CAT765RE
               88  :CAT765RE:-INV-DEL-REC-NOT-EXST VALUE '12'.          CAT765RE
               88  :CAT765RE:-REQ-ACT-INV-TRN-STAT VALUE '13'.          CAT765RE
               88  :CAT765RE:-TRN-INV-CONTRA-PART  VALUE '14'.          CAT765RE
               88  :CAT765RE:-TRN-INV-SUBMIT-PART  VALUE '15'.          CAT765RE
               88  :CAT765RE:-INV-PARTICIPANT      VALUE '16'.          CAT765RE
               88  :CAT765RE:-NON-STD-INV-PHY-SEQ  VALUE '17'.          CAT765RE
               88  :CAT765RE:-NON-STD-INV-AST-TYP  VALUE '18'.          CAT765RE
           10  :CAT765RE:-STATUS                   PIC X(0003).         CAT765RE
               88  :CAT765RE:-REQ                  VALUE '100'.         CAT765RE
               88  :CAT765RE:-REQ-ADJ              VALUE '110'.         CAT765RE
               88  :CAT765RE:-REQ-ADJ-PAST         VALUE '120'.         CAT765RE
               88  :CAT765RE:-REQ-PAST             VALUE '130'.         CAT765RE
               88  :CAT765RE:-REQ-REJ              VALUE '140'.         CAT765RE
               88  :CAT765RE:-REVIEW               VALUE '200'.         CAT765RE
               88  :CAT765RE:-REVIEW-ADJ           VALUE '210'.         CAT765RE
               88  :CAT765RE:-REVIEW-ERROR         VALUE '220'.         CAT765RE
               88  :CAT765RE:-REVIEW-ACCEL         VALUE '230'.         CAT765RE
               88  :CAT765RE:-SETTLE-PREP          VALUE '300'.         CAT765RE
               88  :CAT765RE:-SETTLE-CLOSE         VALUE '310'.         CAT765RE
               88  :CAT765RE:-CLOSE-PURGE          VALUE '400'.         CAT765RE
               88  :CAT765RE:-MEM-PART-TFR-REQ     VALUE '500'.         CAT765RE
               88  :CAT765RE:-MEM-PURG-PART-T-R    VALUE '510'.         CAT765RE
               88  :CAT765RE:-REJECT               VALUE '600'.         CAT765RE
           10  :CAT765RE:-DAYS-IN-STATUS-X.                             CAT765RE
             15  :CAT765RE:-DAYS-IN-STATUS         PIC 9(0003).         CAT765RE
           10  :CAT765RE:-FILLER                   PIC X(0018).         CAT765RE
           10  :CAT765RE:-REG-IND                  PIC X(0001).         CAT765RE
               88  :CAT765RE:-DEFAULT-REG          VALUE 'D'.           CAT765RE
               88  :CAT765RE:-PARTICIPANT-REG      VALUE 'P'.           CAT765RE
               88  :CAT765RE:-REG-NOT-AVAILABLE    VALUE ' '.           CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-TRN-BODY = 0639                                  * CAT765RE
      *---------------------------------------------------------------* CAT765RE
          07  :CAT765RE:-TRN-BODY                  PIC X(0643).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-TI-BODY =  404                                   * CAT765RE
      *---------------------------------------------------------------* CAT765RE
          07  :CAT765RE:-TI-BODY REDEFINES :CAT765RE:-TRN-BODY.         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-TI-STATUS-FIELDS = 48 BYTES                      * CAT765RE
      *     VALUES FOR STATUS CODE:             SPACE = NO CHANGE     * CAT765RE
      *     0 = VALID   1 = PARTICIPANT CHANGED     3 = ERROR         * CAT765RE
      *---------------------------------------------------------------* CAT765RE
           10  :CAT765RE:-TI-STATUS-FIELDS.                             CAT765RE
             15  :CAT765RE:-TI-REC-TYPE-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-REC-LEN-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-PHSCL-SEQ-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-LGCL-SEQ-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-TRAN-TYPE-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-ACAT-CTL-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-TFR-TYPE-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-SUB-PART-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-NBR-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-DEL-NBR-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-ACCT-NBR-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-CUST-NAME-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-SSN-PR-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-SSN-SE-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-ACCT-TYPE-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-OCC-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-RCV-CRSPN-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-DEL-ACCT-NBR-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-TFR-TYPE-REJ-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-ASSC-CTL-NBR-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-ASSC-STL-DT-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-TRAN-REF-ID-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-TI-COMMENTS-ST         PIC X(0001).         CAT765RE
             15  FILLER                            PIC X(0025).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-TI-AREA =  356                                   * CAT765RE
      *---------------------------------------------------------------* CAT765RE
           10  :CAT765RE:-TI-AREA.                                      CAT765RE
             15  :CAT765RE:-TI-REC-TYPE            PIC X(0002).         CAT765RE
                 88  :CAT765RE:-REC-TYPE-IS-TI     VALUE 'TI'.          CAT765RE
             15  :CAT765RE:-TI-REC-LEN             PIC 9(0004).         CAT765RE
             15  :CAT765RE:-TI-PHSCL-SEQ-NBR       PIC 9(0002).         CAT765RE
             15  :CAT765RE:-TI-LGCL-SEQ-NBR        PIC 9(0002).         CAT765RE
             15  :CAT765RE:-TI-TRAN-TYPE           PIC X(0001).         CAT765RE
                 88  :CAT765RE:-TI-ADD             VALUE 'A'.           CAT765RE
                 88  :CAT765RE:-TI-CHANGE          VALUE 'C'.           CAT765RE
                 88  :CAT765RE:-TI-REJECT          VALUE 'R'.           CAT765RE
                 88  :CAT765RE:-TI-ACCEL           VALUE 'X'.           CAT765RE
             15  :CAT765RE:-TI-ACAT-CTL-NBR        PIC X(0014).         CAT765RE
             15  :CAT765RE:-TI-TFR-TYPE            PIC X(0003).         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-CRD     VALUE 'CRD'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-FRV     VALUE 'FRV'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-FUL     VALUE 'FUL'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-MFC     VALUE 'MFC'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-PTD     VALUE 'PTD'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-PTR     VALUE 'PTR'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-RCL     VALUE 'RCL'.         CAT765RE
                  88  :CAT765RE:-TI-TFR-IS-RCR     VALUE 'RCR'.         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-TI-SUB-PART-NBR        PIC X(0004).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-TI-RCV-NBR             PIC X(0004).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-TI-DEL-NBR             PIC X(0004).         CAT765RE
             15  :CAT765RE:-TI-RCV-ACCT-NBR        PIC X(0020).         CAT765RE
             15  :CAT765RE:-TI-RCV-CUS-NAME        PIC X(0060).         CAT765RE
             15  :CAT765RE:-TI-RCV-SSN-PRM         PIC X(0009).         CAT765RE
             15  :CAT765RE:-TI-RCV-SSN-SEC         PIC X(0009).         CAT765RE
             15  :CAT765RE:-TI-RCV-ACCT-TYPE       PIC X(0002).         CAT765RE
                  88  :CAT765RE:-TI-401K           VALUE '4K'.          CAT765RE
                  88  :CAT765RE:-TI-AGENCY         VALUE 'AG'.          CAT765RE
                  88  :CAT765RE:-TI-BANK-CUSTODY   VALUE 'BC'.          CAT765RE
                  88  :CAT765RE:-TI-CORPORATE      VALUE 'CO'.          CAT765RE
                  88  :CAT765RE:-TI-CO-TRUSTEE     VALUE 'CT'.          CAT765RE
                  88  :CAT765RE:-TI-CUSTODIAN      VALUE 'CU'.          CAT765RE
                  88  :CAT765RE:-TI-DIR-ROLLOVER   VALUE 'DR'.          CAT765RE
                  88  :CAT765RE:-TI-ED-IRA         VALUE 'EI'.          CAT765RE
                  88  :CAT765RE:-TI-ESTATE         VALUE 'ES'.          CAT765RE
                  88  :CAT765RE:-TI-IRA            VALUE 'IR'.          CAT765RE
                  88  :CAT765RE:-TI-JOINT          VALUE 'JT'.          CAT765RE
                  88  :CAT765RE:-TI-MED-SAVINGS    VALUE 'MS'.          CAT765RE
                  88  :CAT765RE:-TI-OTHER          VALUE 'OT'.          CAT765RE
                  88  :CAT765RE:-TI-QUALIFIED      VALUE 'QP'.          CAT765RE
                  88  :CAT765RE:-TI-ROTH-IRA       VALUE 'RI'.          CAT765RE
                  88  :CAT765RE:-TI-SIMPLE-IRA     VALUE 'SI'.          CAT765RE
                  88  :CAT765RE:-TI-SINGLE         VALUE 'SN'.          CAT765RE
                  88  :CAT765RE:-TI-TRUST          VALUE 'TR'.          CAT765RE
             15  FILLER                            PIC X(0003).         CAT765RE
             15  :CAT765RE:-TI-RCV-OCC-BRKR        PIC X(0005).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-TI-RCV-CRSPN-NBR       PIC X(0004).         CAT765RE
             15  FILLER                            PIC X(0003).         CAT765RE
             15  :CAT765RE:-TI-CONTRA-PART-TYPE    PIC X(0001).         CAT765RE
                  88  :CAT765RE:-TI-CONTRA-BANK    VALUE '1'.           CAT765RE
                  88  :CAT765RE:-TI-CONTRA-BROKER  VALUE '2'.           CAT765RE
                  88  :CAT765RE:-TI-CONTRA-FUND    VALUE '3'.           CAT765RE
                  88  :CAT765RE:-TI-CONTRA-INSRNC  VALUE '4'.           CAT765RE
                  88  :CAT765RE:-TI-CONTRA-TRUST   VALUE '5'.           CAT765RE
             15  :CAT765RE:-TI-DEL-ACCT-NBR        PIC X(0020).         CAT765RE
             15  :CAT765RE:-TI-TFR-TYPE-REJ        PIC X(0002).         CAT765RE
                  88  :CAT765RE:-TI-NOT-REJECTED   VALUE '00'.          CAT765RE
                  88  :CAT765RE:-TI-SSN-MISMATCH   VALUE '01'.          CAT765RE
                  88  :CAT765RE:-TI-ACC-MISMATCH   VALUE '02'.          CAT765RE
                  88  :CAT765RE:-TI-DOC-NEEDED     VALUE '03'.          CAT765RE
                  88  :CAT765RE:-TI-ACC-FLAT       VALUE '04'.          CAT765RE
                  88  :CAT765RE:-TI-INV-ACCT-NBR   VALUE '05'.          CAT765RE
                  88  :CAT765RE:-TI-DUPLICATE      VALUE '06'.          CAT765RE
                  88  :CAT765RE:-TI-IN-DIST-TFR    VALUE '07'.          CAT765RE
                  88  :CAT765RE:-TI-CLT-RESCINDED  VALUE '08'.          CAT765RE
                  88  :CAT765RE:-TI-MISS-AUTH-SIGN VALUE '09'.          CAT765RE
                  88  :CAT765RE:-TI-VIOLATE-POLICY VALUE '21'.          CAT765RE
                  88  :CAT765RE:-TI-UNRG-RSDL-CR   VALUE '22'.          CAT765RE
                  88  :CAT765RE:-TI-PARTIAL-TFR-RJ VALUE '23'.          CAT765RE
                  88  :CAT765RE:-TI-FAIL-REV-REJ   VALUE '24'.          CAT765RE
                  88  :CAT765RE:-TI-RECLAIM-REJ    VALUE '25'.          CAT765RE
                  88  :CAT765RE:-TI-CUST-RE-DEL-RJ VALUE '26'.          CAT765RE
                  88  :CAT765RE:-TI-MFC-REJ        VALUE '27'.          CAT765RE
             15  :CAT765RE:-TI-ASSC-CTL-NBR        PIC X(0014).         CAT765RE
             15  :CAT765RE:-TI-ASSC-STL-DT.                             CAT765RE
               20  :CAT765RE:-TI-ASSC-STL-YEAR     PIC X(0004).         CAT765RE
               20  :CAT765RE:-TI-ASSC-STL-MM       PIC X(0002).         CAT765RE
               20  :CAT765RE:-TI-ASSC-STL-DD       PIC X(0002).         CAT765RE
             15  :CAT765RE:-TI-TRAN-REF-ID         PIC X(0020).         CAT765RE
             15  :CAT765RE:-TI-COMMENTS            PIC X(0120).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-AT-BODY =  562 BYTES                             * CAT765RE
      *---------------------------------------------------------------* CAT765RE
          07  :CAT765RE:-AT-BODY REDEFINES :CAT765RE:-TRN-BODY.         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-AT-STATUS-FIELDS = 77 BYTES                      * CAT765RE
      *     VALUES FOR STATUS CODE:  SPACE = NO CHANGE   0 = VALID    * CAT765RE
      *     1 = PARTICIPANT CHANGED  2 = SYSTEM CHANGED  3 = ERROR    * CAT765RE
      *---------------------------------------------------------------* CAT765RE
           10  :CAT765RE:-AT-STATUS-FIELDS.                             CAT765RE
             15  :CAT765RE:-AT-REC-TYPE-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-REC-LEN-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-PHSCL-SEQ-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-LGCL-SEQ-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-TRAN-TYPE-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ACAT-CTL-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-TFR-TYPE-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-SUB-PART-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-RCV-ST              PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-DEL-ST              PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-TRAN-REF-ID-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-SEQ-NBR-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-PRC-CATG-ST   PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OPT-CATG-ST         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-STL-LOC-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-STL-LOC-RSN-CD-ST   PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-SEC-CNTRY-CD-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-SEC-ID-ST           PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-SEC-CHKDGT-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-DESC-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-QTY-RQIND-ST  PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-REQ-TRNCD-ST  PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-QTY-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-PCT-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-POS-CD-ST           PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ISO-CURCY-CD-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-AMT-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-BEARER-BOND-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-CASH-MRGN-SHTCD-ST  PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-WHN-ISS-IND-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-TFR-TYPE-RSN-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-MBS-SER-NT-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASST-COMMENT-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OPT-BYDEL-IND-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OPT-PC-IND-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OPT-OC-IND-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-SYMB-ST          PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-EXP-DT-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-STKPRC-TRIG-ST   PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-STKPRC-FRCN-ST   PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-OCC-DEL-NBR-ST   PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-OPT-ACCT-TYP-ST  PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-SUB-ACCT-ID-ST      PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-OP-COMMENT-ST       PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-FND-CUS-ACCT-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-PHSCL-SHR-IND-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-NTWRK-CTL-IND-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ACCT-TYP-IND-ST     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-DIV-CD-ST           PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-DIV-PAYEE-IND-ST    PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-EXEC-BRKR-ST        PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-FR-FUL-PART-IND-ST  PIC X(0001).         CAT765RE
DJ0003       15  :CAT765RE:-AT-MF-CDSC-IND-DLV-ST  PIC X(0001).         CAT765RE
DJ0003       15  :CAT765RE:-AT-MF-FIRM-IND-DLV-ST  PIC X(0001).         CAT765RE
LRM001       15  :CAT765RE:-AT-MF-ACCT-NBR-RCV-ST  PIC X(0001).         CAT765RE
LRM005       15  :CAT765RE:-AT-FUND-RE-REG-ST      PIC X(0001).         CAT765RE
             15  FILLER                            PIC X(0021).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-AT-DATA = 546 BYTES                              * CAT765RE
      *---------------------------------------------------------------* CAT765RE
           10 :CAT765RE:-AT-DATA.                                       CAT765RE
             15  :CAT765RE:-AT-REC-TYPE            PIC X(0002).         CAT765RE
                 88  :CAT765RE:-REC-TYPE-IS-AT     VALUE 'AT'.          CAT765RE
             15  :CAT765RE:-AT-REC-LEN             PIC 9(0004).         CAT765RE
             15  :CAT765RE:-AT-PHSCL-SEQ-NBR       PIC 9(0002).         CAT765RE
             15  :CAT765RE:-AT-LGCL-SEQ-NBR        PIC 9(0002).         CAT765RE
             15  :CAT765RE:-AT-TRAN-TYPE           PIC X(0001).         CAT765RE
                 88  :CAT765RE:-AT-ADD             VALUE 'A'.           CAT765RE
                 88  :CAT765RE:-AT-CHANGE          VALUE 'C'.           CAT765RE
                 88  :CAT765RE:-AT-DELETE          VALUE 'D'.           CAT765RE
             15  :CAT765RE:-AT-ACAT-CTL-NBR        PIC X(0014).         CAT765RE
             15  :CAT765RE:-AT-TFR-TYPE            PIC X(0003).         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-CRD     VALUE 'CRD'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-FRV     VALUE 'FRV'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-FUL     VALUE 'FUL'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-MFC     VALUE 'MFC'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-PTD     VALUE 'PTD'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-PTR     VALUE 'PTR'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-RCL     VALUE 'RCL'.         CAT765RE
                  88  :CAT765RE:-AT-TFR-IS-RCR     VALUE 'RCR'.         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-SUB-PART-NBR        PIC X(0004).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-RCV-NBR             PIC X(0004).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-DEL-NBR             PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-TRAN-REF-ID         PIC X(0020).         CAT765RE
             15  :CAT765RE:-AT-ASSET-SEQ-NBR       PIC 9(0006).         CAT765RE
             15  FILLER                            PIC X(0002).         CAT765RE
             15  :CAT765RE:-AT-ASSET-PRC-CATG      PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-OPT-CATG            PIC X(0002).         CAT765RE
                 88  :CAT765RE:-AT-NON-OPT         VALUE '00'.          CAT765RE
                 88  :CAT765RE:-AT-EQUITY-OPT      VALUE '01'.          CAT765RE
                 88  :CAT765RE:-AT-NON-EQUITY-OPT  VALUE '02'.          CAT765RE
                 88  :CAT765RE:-AT-ICS-OPT         VALUE '03'.          CAT765RE
             15  :CAT765RE:-AT-STL-LOC             PIC X(0002).         CAT765RE
                 88  :CAT765RE:-AT-CNS             VALUE '05'.          CAT765RE
                 88  :CAT765RE:-AT-FUND-SERV       VALUE '10'.          CAT765RE
                 88  :CAT765RE:-AT-PTC             VALUE '15'.          CAT765RE
                 88  :CAT765RE:-AT-GSCC            VALUE '20'.          CAT765RE
                 88  :CAT765RE:-AT-DTC             VALUE '25'.          CAT765RE
                 88  :CAT765RE:-AT-UNDELIVERABLE   VALUE '30'.          CAT765RE
                 88  :CAT765RE:-AT-OCC             VALUE '35'.          CAT765RE
                 88  :CAT765RE:-AT-CASH-BALANCE    VALUE '40'.          CAT765RE
                 88  :CAT765RE:-AT-MEMO            VALUE '45'.          CAT765RE
                 88  :CAT765RE:-AT-R-D             VALUE '50'.          CAT765RE
             15  :CAT765RE:-AT-STL-LOC-RSN-CD      PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-SEC-CNTRY-CD        PIC X(0002).         CAT765RE
             15  :CAT765RE:-AT-SEC-ID              PIC X(0009).         CAT765RE
             15  :CAT765RE:-AT-SEC-CHKDGT          PIC X(0001).         CAT765RE
             15  FILLER                            PIC X(0004).         CAT765RE
             15  :CAT765RE:-AT-ASSET-DESC          PIC X(0140).         CAT765RE
             15  :CAT765RE:-AT-ASSET-QTY-RQIND     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-REQ-TRNCD     PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-ASSET-QTY           PIC X(0017).         CAT765RE
             15  :CAT765RE:-AT-ASSET-PCT           PIC X(0015).         CAT765RE
             15  :CAT765RE:-AT-POS-CD              PIC X(0001).         CAT765RE
                 88  :CAT765RE:-AT-SHORT-POS       VALUE 'S'.           CAT765RE
                 88  :CAT765RE:-AT-LONG-POS        VALUE 'L'.           CAT765RE
             15  :CAT765RE:-AT-ISO-CURCY-CD        PIC X(0003).         CAT765RE
             15  :CAT765RE:-AT-ASSET-AMT           PIC X(0017).         CAT765RE
             15  :CAT765RE:-AT-BEARER-BOND         PIC X(0001).         CAT765RE
             15  :CAT765RE:-AT-CASH-MRGN-SHTCD     PIC X(0001).         CAT765RE
                 88  :CAT765RE:-AT-CASH            VALUE 'C'.           CAT765RE
                 88  :CAT765RE:-AT-MARGIN          VALUE 'M'.           CAT765RE
                 88  :CAT765RE:-AT-SHORT           VALUE 'S'.           CAT765RE
             15  :CAT765RE:-AT-WHN-ISS-IND         PIC X(0001).         CAT765RE
                 88  :CAT765RE:-AT-WHN-ISS         VALUE 'W'.           CAT765RE
                 88  :CAT765RE:-AT-WHN-NOT-ISS     VALUE 'N'.           CAT765RE
             15  :CAT765RE:-AT-TFR-TYPE-RSN        PIC X(0002).         CAT765RE
             15  :CAT765RE:-AT-MBS-SER-NT          PIC X(0003).         CAT765RE
             15  :CAT765RE:-AT-ASST-COMMENT        PIC X(0120).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-ATF-FUND-AREA =  34 BYTES                        * CAT765RE
      *---------------------------------------------------------------* CAT765RE
             15  :CAT765RE:-ATF-FUND-AREA.                              CAT765RE
               20  :CAT765RE:-ATF-CUS-ACCT         PIC X(0020).         CAT765RE
               20  :CAT765RE:-ATF-PHSCL-SHR-IND    PIC X(0001).         CAT765RE
               20  :CAT765RE:-ATF-NTWRK-CTL-IND    PIC X(0001).         CAT765RE
               20  :CAT765RE:-ATF-ACCT-TYP-IND     PIC X(0001).         CAT765RE
               20  :CAT765RE:-ATF-DIV-CD           PIC X(0001).         CAT765RE
               20  :CAT765RE:-ATF-DIV-PAYEE-IND    PIC X(0001).         CAT765RE
               20  FILLER                          PIC X(0004).         CAT765RE
               20  :CAT765RE:-ATF-EXEC-BRKR        PIC X(0004).         CAT765RE
               20  :CAT765RE:-ATF-FULL-PART-IND    PIC X(0001).         CAT765RE
                   88  :CAT765RE:-ATF-FULL-TFR     VALUE '1'.           CAT765RE
                   88  :CAT765RE:-ATF-PART-TFR     VALUE '2'.           CAT765RE
DJ0003         20  :CAT765RE:-ATF-CDSC-IND-DLVR    PIC X(0001).         CAT765RE
DJ0003         20  :CAT765RE:-ATF-FIRM-IND-DLVR    PIC X(0002).         CAT765RE
LRM001         20  :CAT765RE:-ATF-FUND-AC-NBR-RCV  PIC X(0020).         CAT765RE
LRM005         20  :CAT765RE:-ATF-FUND-RE-REG-DT   PIC X(0008).         CAT765RE
      *---------------------------------------------------------------* CAT765RE
      *     CAT765RE-ATO-OPT-AREA =  66 BYTES                         * CAT765RE
      *---------------------------------------------------------------* CAT765RE
             15  :CAT765RE:-ATO-OPT-AREA.                               CAT765RE
               20  :CAT765RE:-ATO-OPT-BS-IND       PIC X(0001).         CAT765RE
                   88  :CAT765RE:-ATO-OPT-BUY      VALUE 'B'.           CAT765RE
                   88  :CAT765RE:-ATO-OPT-SELL     VALUE 'S'.           CAT765RE
               20  :CAT765RE:-ATO-OPT-PC-IND       PIC X(0001).         CAT765RE
                   88  :CAT765RE:-ATO-OPT-PUT      VALUE 'P'.           CAT765RE
                   88  :CAT765RE:-ATO-OPT-CALL     VALUE 'C'.           CAT765RE
               20  :CAT765RE:-ATO-OPT-OC-IND       PIC X(0001).         CAT765RE
                   88  :CAT765RE:-ATO-OPT-OPEN     VALUE 'O'.           CAT765RE
                   88  :CAT765RE:-ATO-OPT-CLOSE    VALUE 'C'.           CAT765RE
               20  :CAT765RE:-ATO-OPT-SYM          PIC X(0006).         CAT765RE
               20  :CAT765RE:-ATO-OPT-EXP-DT.                           CAT765RE
                 25  :CAT765RE:-ATO-OPT-EXP-MM     PIC X(0002).         CAT765RE
                 25  :CAT765RE:-ATO-OPT-EXP-YY     PIC X(0002).         CAT765RE
                 25  :CAT765RE:-ATO-OPT-EXP-CC     PIC X(0002).         CAT765RE
DJ0004         20  FILLER                          PIC X(0008).         CAT765RE
DJ0004         20  :CAT765RE:-ATO-OPT-DEC-FRAC-IND PIC X(0001).         CAT765RE
               20  :CAT765RE:-ATO-OPT-STKPRC-INT   PIC X(0005).         CAT765RE
               20  FILLER                          PIC X(0002).         CAT765RE
               20  :CAT765RE:-ATO-OPT-STKPRC-FRC   PIC X(0002).         CAT765RE
               20  FILLER                          PIC X(0003).         CAT765RE
               20  :CAT765RE:-ATO-OPT-OCC-DEL-NBR  PIC X(0005).         CAT765RE
               20  :CAT765RE:-ATO-OPT-ACCT-TYP     PIC X(0001).         CAT765RE
                   88  :CAT765RE:-ATO-OPT-CUST     VALUE 'C'.           CAT765RE
                   88  :CAT765RE:-ATO-OPT-FIRM     VALUE 'F'.           CAT765RE
                   88  :CAT765RE:-ATO-OPT-MARKET   VALUE 'M'.           CAT765RE
               20  FILLER                          PIC X(0004).         CAT765RE
               20  :CAT765RE:-ATO-SUB-ACCT-ID      PIC X(0004).         CAT765RE
               20  :CAT765RE:-ATO-OPT-COMMENT      PIC X(0016).         CAT765RE
                                                                        CAT765RE
      ***************************************************************** CAT765RE
      *     HEADER  RECORD = FIRST 54 BYTES IS P2 FORMAT   LREL = 120 * CAT765RE
      ***************************************************************** CAT765RE
        03  :CAT765RE:-HDR-REC REDEFINES :CAT765RE:-REC.                CAT765RE
          05  :CAT765RE:-HDR-P2.                                        CAT765RE
             10  :CAT765RE:-HDR-LIT                PIC X(0005).         CAT765RE
                 88  :CAT765RE:-HDR-RECORD         VALUE 'DATE='.       CAT765RE
             10  :CAT765RE:-HDR-PROC-DATE          PIC X(0006).         CAT765RE
             10  :CAT765RE:-HDR-SYS-DATE           PIC X(0006).         CAT765RE
             10  :CAT765RE:-HDR-SYS-TIME           PIC X(0006).         CAT765RE
             10  FILLER                            PIC X(0003).         CAT765RE
             10  :CAT765RE:-HDR-DATASET-NAME       PIC X(0017).         CAT765RE
             10  :CAT765RE:-HDR-PGM-NAME           PIC X(0008).         CAT765RE
             10  :CAT765RE:-HDR-CLT-NO             PIC X(0003).         CAT765RE
          05  :CAT765RE:-HDR-DATA.                                      CAT765RE
             10  :CAT765RE:-HDR-CYCLE-NBR          PIC 9(0002).         CAT765RE
             10  :CAT765RE:-HDR-TIMESTAMP          PIC X(0026).         CAT765RE
             10  FILLER                            PIC X(0038).         CAT765RE
             10  FILLER                            PIC X(0680).         CAT765RE
                                                                        CAT765RE
      ***************************************************************** CAT765RE
      *     TRAILER RECORD = FIRST 48 BYTES IS P2 FORMAT   LREL = 120 * CAT765RE
      ***************************************************************** CAT765RE
        03  :CAT765RE:-TRL-REC REDEFINES :CAT765RE:-REC.                CAT765RE
          05  :CAT765RE:-TRL-P2.                                        CAT765RE
             10  :CAT765RE:-TRL-LIT                PIC X(0008).         CAT765RE
                 88  :CAT765RE:-TRL-RECORD         VALUE 'REC-CNT='.    CAT765RE
             10  :CAT765RE:-TRL-REC-CNT            PIC 9(0011).         CAT765RE
             10  :CAT765RE:-TRL-PROC-DATE          PIC X(0006).         CAT765RE
             10  :CAT765RE:-TRL-SYS-DATE           PIC X(0006).         CAT765RE
             10  :CAT765RE:-TRL-SYS-TIME           PIC X(0006).         CAT765RE
             10  :CAT765RE:-TRL-PGM-NAME           PIC X(0008).         CAT765RE
             10  :CAT765RE:-TRL-CLT-NO             PIC X(0003).         CAT765RE
          05  :CAT765RE:-TRL-DATA.                                      CAT765RE
             10  :CAT765RE:-TRL-CYCLE-NBR          PIC 9(0002).         CAT765RE
             10  :CAT765RE:-TRL-TIMESTAMP          PIC X(0026).         CAT765RE
             10  FILLER                            PIC X(0044).         CAT765RE
             10  FILLER                            PIC X(0680).         CAT765RE
                                                                        CAT765RE
      ***************************************************************** CAT765RE
      ***   CAT765RE - END OF COPYBOOK                              *** CAT765RE
      ***************************************************************** CAT765RE
