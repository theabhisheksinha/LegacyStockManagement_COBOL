       01 FRR-RECORD.                                                   00010000
           05 FRR-CLIENT-NBR                PIC  X(04).                 00020000
           05 FRR-ACAT-CONTROL-NBR          PIC  X(14).                 00030000
           05 FRR-ACCT-RCV-NBR              PIC  X(20).                 00040000
           05 FRR-RCV-CUST-NM               PIC  X(60).                 00050000
           05 FRR-DLVR-NBR                  PIC  X(04).                 00060000
           05 FRR-ASSET-AMT                             COMP-2.         00070000
           05 FRR-ASSET-DESC-TXT            PIC  X(140).                00080000
           05 FRR-ASSET-QTY                             COMP-2.         00090000
           05 FRR-ASSET-SEQ-NBR             PIC S9(04)  COMP.           00100000
           05 FRR-ISIN-SEC-ISSUE-CD         PIC  X(09).                 00110000
           05 FRR-ISIN-CNTRY-CD             PIC  X(02).                 00120000
           05 FRR-ISIN-SEC-CDG-CD           PIC  X(01).                 00130000
           05 FRR-ISO-CRNCY-CD              PIC  X(03).                 00140000
           05 FRR-NSCC-NON-ADP-IND          PIC  X(01).                 00150000
           05 FRR-SECURITY-ADP-NBR          PIC  X(07).                 00160000
           05 FRR-SBMTG-PRTCP-NBR           PIC  X(04).                 00170000
           05 FRR-SYS-RJCT-RSN-CD           PIC  X(02).                 00180000
           05 FRR-TRNFR-TYPE-CD             PIC  X(03).                 00190000
           05 FRR-CSH-MGN-SHRT-CD           PIC  X(01).                 00191000
           05 FILLER                        PIC  X(29).                 00200000
                                                                        00210000
       01  FRR-HEADER                                                   00220000
           REDEFINES FRR-RECORD.                                        00230000
           05  FRR-DATE-LIT                 PIC  X(05).                 00240000
           05  FRR-DATE-TIME.                                           00250000
               10  FRR-DATE-CC              PIC  X(02).                 00260000
               10  FRR-DATE-YY              PIC  X(02).                 00270000
               10  FILLER                   PIC  X(01).                 00271000
               10  FRR-DATE-MM              PIC  X(02).                 00272000
               10  FILLER                   PIC  X(01).                 00273000
               10  FRR-DATE-DD              PIC  X(02).                 00274000
               10  FILLER                   PIC  X(01).                 00275000
               10  FRR-DATE-HH              PIC  X(02).                 00276000
               10  FILLER                   PIC  X(01).                 00277000
               10  FRR-DATE-MM              PIC  X(02).                 00278000
               10  FILLER                   PIC  X(01).                 00279000
               10  FRR-DATE-SS              PIC  X(02).                 00280000
               10  FILLER                   PIC  X(01).                 00290000
               10  FRR-DATE-NSS             PIC  X(06).                 00291000
           05  FILLER                       PIC  X(279).                00292000
