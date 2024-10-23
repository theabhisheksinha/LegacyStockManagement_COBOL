000001* PDX    - CATFR    C0336625 06/26/13 11:10:15 TBLAMUR            00001005
000001* PDX    - CATFR    C0231736 04/10/06 09:23:54 TBDOJUN            00002001
       01  FR-RECORD.                                                   00010000
           05  FR-CLIENT-NBR                PIC  X(04).                 00020000
           05  FR-ACAT-CONTROL-NBR          PIC  X(14).                 00030000
           05  FR-ASSET-SEQ-NBR             PIC S9(04)  COMP.           00040000
           05  FR-SBMTG-PRTCP-NBR           PIC  X(04).                 00050000
           05  FR-SYS-RJCT-RSN-CD           PIC  X(02).                 00060000
           05  FR-MF-TRANS-TYPE-CD          PIC  X(01).                 00070000
           05  FR-NRA-TAX-PCT               PIC SV9(02) COMP-3.         00080000
           05  FR-BK-PHSCL-SHR-CD           PIC  X(01).                 00090000
           05  FR-FRCTN-CD                  PIC  X(01).                 00100000
           05  FR-DSBMT-ACCRL-CD            PIC  X(01).                 00110000
           05  FR-FNBR                      PIC  X(20).                 00111000
           05  FR-FUND-ACCT-CD              PIC  X(01).                 00112000
           05  FR-BRKR-EXCTG-NBR            PIC  X(04).                 00113000
           05  FR-BRCH-NBR                  PIC  X(09).                 00114000
           05  FR-DSBMT-FRCTN-CSH-CD        PIC  X(01).                 00115000
           05  FR-DSBMT-RSDL-CD             PIC  X(01).                 00116000
           05  FR-DVDND-CD                  PIC  X(01).                 00117000
           05  FR-LTCG-CD                   PIC  X(01).                 00118000
           05  FR-STCG-CD                   PIC  X(01).                 00119000
           05  FR-FUND-BK-CD                PIC  X(02).                 00120000
           05  FR-NTWRK-CNTL-CD             PIC  X(01).                 00130000
           05  FR-NA-LINE-TABLE.                                        00131000
               10  FR-NA-LINE                                           00132000
                   OCCURS 6 TIMES           PIC  X(35).                 00133000
           05  FR-SS-TIN-NBR                PIC  X(09).                 00134000
           05  FR-SS-TIN-CD                 PIC  X(01).                 00135000
           05  FR-ZIP5-CD                   PIC  X(05).                 00136000
           05  FR-ZIP4-CD                   PIC  X(04).                 00137000
           05  FR-WTHLD-CD                  PIC  X(01).                 00138000
           05  FR-ISIN-SEC-ISSUE-CD         PIC  X(09).                 00139000
           05  FR-ISIN-CNTRY-CD             PIC  X(02).                 00140000
           05  FR-ISIN-SEC-CDG-CD           PIC  X(01).                 00150000
           05  FR-BRANCH-NBR                PIC  X(09).                 00160000
           05  FR-DLRVY-CD                  PIC  X(01).                 00170000
           05  FR-PI-DLRVY-CD               PIC  X(01).                 00180000
           05  FR-CUST-NM                   PIC  X(20).                 00190000
           05  FR-PYBL-INFO-CD              PIC  X(01).                 00200000
           05  FR-SOC-CD                    PIC  X(02).                 00210000
           05  FR-NAV-ACCT-IND              PIC  X(01).                 00220000
           05  FR-MRGN-ACCT-IND             PIC  X(01).                 00230000
           05  FR-SL-ST-CD                  PIC  X(02).                 00240000
           05  FR-CNTRY-ORGN-CD             PIC  X(02).                 00250000
           05  FR-ACCT-RR-NM                PIC  X(15).                 00260000
           05  FR-ACCT-RR-CD                PIC  X(09).                 00270000
           05  FR-CHCK-WRTNG-IND            PIC  X(01).                 00280000
           05  FR-ACH-IND                   PIC  X(01).                 00290000
           05  FR-PAC-IND                   PIC  X(01).                 00300000
           05  FR-SWP-IND                   PIC  X(01).                 00310000
           05  FR-TRD-RLTD-IND              PIC  X(01).                 00320000
           05  FR-LOI-DT                    PIC  X(10).                 00330000
           05  FR-SWP-PAC-EFFCT-DT          PIC  X(10).                 00340000
           05  FR-ACCT-RLTD-NBR             PIC  X(20).                 00350000
           05  FR-ACCT-RLTD-CD              PIC  X(01).                 00360000
           05  FR-TRNFR-TYPE-CD             PIC  X(03).                 00370000
           05  FR-NM-END-LN-QTY             PIC S9(04)  COMP.           00380000
           05  FR-ASSET-AMT                 USAGE       COMP-2.         00390000
           05  FR-ASSET-QTY                 USAGE       COMP-2.         00400000
           05  FR-ISO-CRNCY-CD              PIC  X(03).                 00410000
           05  FR-ASSET-DESC-TXT            PIC  X(140).                00420000
           05  FR-NSCC-NON-ADP-IND          PIC  X(01).                 00430000
           05  FR-SECURITY-ADP-NBR          PIC  X(07).                 00440000
           05  FR-DLVR-NBR                  PIC  X(04).                 00450000
           05  FR-CHCK-FRST-DT              PIC  X(10).                 00460000
           05  FR-PRCS-DT                   PIC  X(10).                 00470000
           05  FR-CERT-DT                   PIC  X(10).                 00480000
           05  FR-STTLM-ASCTD-DT            PIC  X(10).                 00490000
           05  FR-STTLM-DT                  PIC  X(10).                 00500000
           05  FR-DSBMT-OPTN-CD             PIC  X(01).                 00510000
           05  FR-DSBMT-AMT                 USAGE       COMP-2.         00520000
           05  FR-W8-WTHLD-CD               PIC  X(01).                 00530000
           05  FR-W8-CERT-DT                PIC  X(10).                 00540000
           05  FR-W8-EXPTN-DT               PIC  X(10).                 00550000
           05  FR-W8-OVRD-NRA-SPC-RT    PIC S9(2)V9(3) USAGE COMP-3.    00560000
           05  FR-W8-QULFD-INTRM-IND        PIC  X(01).                 00570000
           05  FR-W8-OVRD-CNTRY-CD          PIC  X(01).                 00571000
           05  FR-W8-OVRD-CNTRY-CD-BYTE2    PIC  X(01).                 00571100
           05  FR-NA-IRA-IND                PIC  X(01).                 00572000
           05  FR-PROCESSING-CODE           PIC  X(01).                 00573000
           05  FR-MF-SCHWAB                 PIC  X(01).                 00573103
           05  FILLER                       PIC  X(79).                 00574000
                                                                        00575000
       01  FR-HEADER                                                    00576000
           REDEFINES FR-RECORD.                                         00577000
           05  FR-DATE-LIT                  PIC  X(05).                 00578000
           05  FR-DATE-TIME.                                            00579000
               10  FR-DATE-CC               PIC  X(02).                 00580000
               10  FR-DATE-YY               PIC  X(02).                 00590000
               10  FILLER                   PIC  X(01).                 00600000
               10  FR-DATE-MM               PIC  X(02).                 00610000
               10  FILLER                   PIC  X(01).                 00620000
               10  FR-DATE-DD               PIC  X(02).                 00630000
               10  FILLER                   PIC  X(01).                 00640000
               10  FR-DATE-HH               PIC  X(02).                 00650000
               10  FILLER                   PIC  X(01).                 00660000
               10  FR-DATE-MM               PIC  X(02).                 00670000
               10  FILLER                   PIC  X(01).                 00680000
               10  FR-DATE-SS               PIC  X(02).                 00690000
               10  FILLER                   PIC  X(01).                 00700000
               10  FR-DATE-NSS              PIC  X(06).                 00710000
           05  FR-PROGRAM-NAME              PIC  X(008).                00720000
           05  FILLER                       PIC  X(641).                00730000
