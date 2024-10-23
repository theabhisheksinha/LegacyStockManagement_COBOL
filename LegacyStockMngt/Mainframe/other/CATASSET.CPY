000001* PDX    - CATASSET C0120573 01/15/99 19:26:01 TBDOJUN            00001000
      ***************************************************************** 99/01/15
      ***   CATASSET - EXTRACTED ACATS ASSETS FOR FULL DELIVERY     *** CATASSET
      ***              GDG FILE OF ACATS ASSETS FOR COMPARISON      *** CATASSET
      ***              TO PROCESS FULL DELIVERYS IN REVIEW STATUS.  *** CATASSET
      ***                                                           *** CATASSET
      ***   OUTPUT FROM CAT814A, CAT814B                            *** CATASSET
      ***   INPUT  TO   CAT814C, CAT814                             *** CATASSET
      ***                                                           *** CATASSET
      ***   LENGTH   - 700 BYTES TO  700  (DCB=LRECL=   ) RECFM=FB  *** CATASSET
      ***   KEY      - 040 BYTES                                    *** CATASSET
      ***                                                           *** CATASSET
      ***===========================================================*** CATASSET
      ***   DATE   PGMR        CHANGE                               *** CATASSET
      *** -------- ---- ------------------------------------------- *** CATASSET
      *** 01/15/99 DJ   CREATE NEW COPYBOOK FOR ACATS REDESIGN      *** CATASSET
      ***                                                           *** CATASSET
      ***************************************************************** CATASSET
       01  :CATASSET:-RECORD.                                           CATASSET
        03  :CATASSET:-REC.                                             CATASSET
         05  :CATASSET:-KEY.                                            CATASSET
           10  :CATASSET:-KEY-CLIENT-NBR           PIC X(0004).         CATASSET
           10  :CATASSET:-KEY-ACAT-CONTROL-NBR     PIC X(0014).         CATASSET
           10  :CATASSET:-KEY-CSH-MGN-SHRT-CD      PIC X(0001).         CATASSET
           10  :CATASSET:-KEY-OPTN-CTGY-CD         PIC X(2).            CATASSET
           10  :CATASSET:-KEY-CUSIP.                                    CATASSET
             15 :CATASSET:-KEY-SYM-CD              PIC X(6).            CATASSET
             15 :CATASSET:-KEY-PTCL-CD             PIC X(1).            CATASSET
             15 :CATASSET:-KEY-BS-CD               PIC X(1).            CATASSET
             15 :CATASSET:-KEY-OPTN-OPN-CLSD-CD    PIC X(1).            CATASSET
           10  FILLER REDEFINES                                         CATASSET
               :CATASSET:-KEY-CUSIP.                                    CATASSET
             15  FILLER                            PIC X(0003).         CATASSET
             15  :CATASSET:-KEY-STTLM-LCTN-CD      PIC X(0002).         CATASSET
             15  :CATASSET:-KEY-STTLM-RSN-CD       PIC X(0004).         CATASSET
           10  FILLER                              PIC X(0010).         CATASSET
         05  :CATASSET:-BODY.                                           CATASSET
           10 :CATASSET:-DATA.                                          CATASSET
             15 :CATASSET:-CLIENT-NBR              PIC X(4).            CATASSET
             15 :CATASSET:-ACAT-CONTROL-NBR        PIC X(14).           CATASSET
             15 :CATASSET:-ASSET-SEQ-NBR           PIC 9(6).            CATASSET
             15 :CATASSET:-SBMTG-PRTCP-NBR         PIC X(4).            CATASSET
             15 :CATASSET:-RCV-NBR                 PIC X(4).            CATASSET
             15 :CATASSET:-ACCT-RCV-NBR            PIC X(20).           CATASSET
             15 :CATASSET:-DLVR-NBR                PIC X(4).            CATASSET
             15 :CATASSET:-ACCT-DLVR-NBR           PIC X(20).           CATASSET
             15 :CATASSET:-ISIN-CNTRY-CD           PIC X(2).            CATASSET
             15 :CATASSET:-ISIN-SEC-ISSUE-CD       PIC X(9).            CATASSET
             15 :CATASSET:-ISIN-SEC-CDG-CD         PIC X(1).            CATASSET
             15 :CATASSET:-STTLM-LCTN-CD           PIC X(2).            CATASSET
             15 :CATASSET:-CSH-MGN-SHRT-CD         PIC X(1).            CATASSET
             15 :CATASSET:-TRANS-TYPE-CD           PIC X(1).            CATASSET
             15 :CATASSET:-TRNFR-TYPE-CD           PIC X(3).            CATASSET
             15 :CATASSET:-STTLM-RSN-CD            PIC X(4).            CATASSET
             15 :CATASSET:-TRANS-RFRN-ID-CD        PIC X(20).           CATASSET
             15 :CATASSET:-ASSET-PRC-CTGY-CD       PIC X(4).            CATASSET
             15 :CATASSET:-OPTN-CTGY-CD            PIC X(2).            CATASSET
             15 :CATASSET:-ASSET-RQST-QTY-CD       PIC X(1).            CATASSET
             15 :CATASSET:-AST-RQST-TRANS-CD       PIC X(1).            CATASSET
             15 :CATASSET:-ISO-CRNCY-CD            PIC X(3).            CATASSET
             15 :CATASSET:-BEARER-BOND-CD          PIC X(1).            CATASSET
             15 :CATASSET:-WHI-CD                  PIC X(1).            CATASSET
             15 :CATASSET:-TRNFR-TYPE-RSN-CD       PIC X(2).            CATASSET
             15 :CATASSET:-MBS-SERIAL-NBR          PIC X(3).            CATASSET
             15 :CATASSET:-ASSET-DESC-TXT          PIC X(140).          CATASSET
             15 :CATASSET:-ASSET-CMNT-TXT          PIC X(120).          CATASSET
             15 :CATASSET:-SECURITY-ADP-NBR        PIC X(7).            CATASSET
             15 :CATASSET:-ASSET-PCT               PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-PSTN-CD                 PIC X(1).            CATASSET
      *---------------------------------------------------------------* CATASSET
      *      OPTIONS                                                  * CATASSET
      *---------------------------------------------------------------* CATASSET
           10 :CATASSET:-OP-DATA.                                       CATASSET
             15 :CATASSET:-BS-CD                   PIC X(1).            CATASSET
             15 :CATASSET:-PTCL-CD                 PIC X(1).            CATASSET
             15 :CATASSET:-OPTN-OPN-CLSD-CD        PIC X(1).            CATASSET
             15 :CATASSET:-SYM-CD                  PIC X(6).            CATASSET
             15 :CATASSET:-EXPTN-DT                PIC X(10).           CATASSET
             15 :CATASSET:-STPRC-INTEGER-AMT       PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-STPRC-FRCTN-AMT         PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-DLVR-OCC-NBR PIC        X(5).                CATASSET
             15 :CATASSET:-OPTN-ACCT-TYPE-CD       PIC X(1).            CATASSET
             15 :CATASSET:-ACCT-SUB-CD             PIC X(4).            CATASSET
             15 :CATASSET:-OPTN-CMNT-TXT           PIC X(16).           CATASSET
      *---------------------------------------------------------------* CATASSET
      *      MUTUAL FUNDS                                             * CATASSET
      *---------------------------------------------------------------* CATASSET
           10 :CATASSET:-MF-DATA.                                       CATASSET
             15 :CATASSET:-BK-PHSCL-SHR-CD         PIC X(1).            CATASSET
             15 :CATASSET:-NTWRK-CNTL-CD           PIC X(1).            CATASSET
             15 :CATASSET:-ACCT-TYPE-CD            PIC X(1).            CATASSET
             15 :CATASSET:-DVDND-CD                PIC X(1).            CATASSET
             15 :CATASSET:-DVDND-PAYEE-CD          PIC X(1).            CATASSET
             15 :CATASSET:-LTCG-CD                 PIC X(1).            CATASSET
             15 :CATASSET:-BRKR-EXCTG-NBR          PIC X(4).            CATASSET
             15 :CATASSET:-STCG-CD                 PIC X(1).            CATASSET
             15 :CATASSET:-MF-FULL-PRTL-CD         PIC X(1).            CATASSET
             15 :CATASSET:-RGSTN-CD                PIC X(1).            CATASSET
             15 :CATASSET:-FNBR                    PIC X(20).           CATASSET
             15 :CATASSET:-DSTBN-SIDE-CD           PIC X(1).            CATASSET
             15 :CATASSET:-PRCS-DT                 PIC X(10).           CATASSET
                                                                        CATASSET
           10 :CATASSET:-MISC-DATA.                                     CATASSET
             15 :CATASSET:-ASSET-QTY               PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-ASSET-AMT               PIC 9(12)V9(5).      CATASSET
             15 FILLER                             PIC X(033).          CATASSET
                                                                        CATASSET
      ****USED BY CAT814C                                               CATASSET
           10 :CATASSET:-NEW-DATA.                                      CATASSET
             15 :CATASSET:-NEW-TRAN-TYPE           PIC X(1).            CATASSET
             15 :CATASSET:-NEW-PSTN-CD             PIC X(1).            CATASSET
             15 :CATASSET:-NEW-QTY                 PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-NEW-AMT                 PIC 9(12)V9(5).      CATASSET
             15 :CATASSET:-VINITAST-SQLCODE        PIC X(4).            CATASSET
             15 :CATASSET:-VINITOPN-SQLCODE        PIC X(4).            CATASSET
             15 :CATASSET:-VINITMF-SQLCODE         PIC X(4).            CATASSET
                                                                        CATASSET
      ***************************************************************** CATASSET
      *     HEADER  RECORD = P2 FORMAT                                * CATASSET
      ***************************************************************** CATASSET
        03  :CATASSET:-HDR-REC REDEFINES :CATASSET:-REC.                CATASSET
          05  :CATASSET:-HDR-P2.                                        CATASSET
             10  :CATASSET:-HDR-LIT                PIC X(0005).         CATASSET
                 88  :CATASSET:-HEADER-RECORD      VALUE 'DATE='.       CATASSET
             10  :CATASSET:-HDR-PROC-DATE          PIC X(0006).         CATASSET
             10  :CATASSET:-HDR-SYS-DATE           PIC X(0006).         CATASSET
             10  :CATASSET:-HDR-SYS-TIME           PIC X(0006).         CATASSET
             10  FILLER                            PIC X(0003).         CATASSET
             10  :CATASSET:-HDR-DATASET-NAME       PIC X(0017).         CATASSET
             10  :CATASSET:-HDR-PGM-NAME           PIC X(0008).         CATASSET
             10  :CATASSET:-HDR-CLT-NO             PIC X(0003).         CATASSET
             10  FILLER                            PIC X(0066).         CATASSET
             10  FILLER                            PIC X(0580).         CATASSET
                                                                        CATASSET
      ***************************************************************** CATASSET
      *     TRAILER RECORD = P2 FORMAT                                * CATASSET
      ***************************************************************** CATASSET
        03  :CATASSET:-TRL-REC REDEFINES :CATASSET:-REC.                CATASSET
          05  :CATASSET:-TRL-P2.                                        CATASSET
             10  :CATASSET:-TRL-LIT                PIC X(0008).         CATASSET
                 88  :CATASSET:-TRAILER-RECORD     VALUE 'REC-CNT='.    CATASSET
             10  :CATASSET:-TRL-REC-CNT            PIC 9(0011).         CATASSET
             10  :CATASSET:-TRL-PROC-DATE          PIC X(0006).         CATASSET
             10  :CATASSET:-TRL-SYS-DATE           PIC X(0006).         CATASSET
             10  :CATASSET:-TRL-SYS-TIME           PIC X(0006).         CATASSET
             10  :CATASSET:-TRL-PGM-NAME           PIC X(0008).         CATASSET
             10  :CATASSET:-TRL-CLT-NO             PIC X(0003).         CATASSET
             10  FILLER                            PIC X(0072).         CATASSET
             10  FILLER                            PIC X(0580).         CATASSET
                                                                        CATASSET
      ***************************************************************** CATASSET
      ***   CATASSET - END OF COPYBOOK                              *** CATASSET
      ***************************************************************** CATASSET
