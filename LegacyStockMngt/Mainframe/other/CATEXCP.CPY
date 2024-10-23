000001* PDX    - CATEXCP  C0328075 07/05/12 10:11:59 TBLAMUR            00001000
000001* PDX    - CATEXCP  C0317345 11/15/11 09:16:59 TBLAMUR            00001000
000001* PDX    - CATEXCP  C0291396 01/26/10 09:51:31 TBLAMUR            00001000
000001* PDX    - CATEXCP  C0276888 04/06/09 10:47:04 TBDOJUN            00001000
000001* PDX    - CATEXCP  C0270214 10/15/08 14:55:23 TBDOJUN            00001000
000001* PDX    - CATEXCP  C0260091 07/01/08 15:45:19 TBDOJUN            00001000
      ******************************************************************CATEXCP 
      *** CATEXCP- ACATS EXCEPTION FILE FOR ASCENDIS(WORKFLOW)      ****CATEXCP 
      ***   CREATED 03/19/08 FOR SSR 55766 ASCENDIS INTERFACE.      ****CATEXCP 
      ***          RECORD TYPE      - FIXED                         ****CATEXCP 
      ***          RECORD LENGTH    - 120                           ****CATEXCP 
      ***   OUTPUT FROM CAT525                                      ****CATEXCP 
      ***   DSN  : B***.CAT525.EXCP                                 ****CATEXCP 
      ***   FILE CONTAINS:                                          ****CATEXCP 
      ***       EXCEPTIONS INDICATORS FROM VTRNFR,VASSET            ****CATEXCP 
LRM001* SSR 83475 CHANGED TO ONE RECORD PER EXCEPTION LAYOUT TO PASS            
LRM001*   SPAD EXCEPTIONS.  ASCENDIS IS ABLE TO HANDLE THIS.                    
      ******************************************************************CATEXCP 
       01  :CATEXCP:-RECORD.                                            CATEXCP 
         03  :CATEXCP:-DETAIL-RECORD.                                   CATEXCP 
           05  :CATEXCP:-KEY.                                           CATEXCP 
               10  :CATEXCP:-REC-TYPE           PIC X(01).              CATEXCP 
                   88 :CATEXCP:-TRANSFER        VALUE 'T'.              CATEXCP 
                   88 :CATEXCP:-ASSET           VALUE 'A'.              CATEXCP 
               10  :CATEXCP:-CLIENT-NBR         PIC X(04).              CATEXCP 
               10  :CATEXCP:-ACAT-CONTROL-NBR   PIC X(14).              CATEXCP 
               10  :CATEXCP:-ASSET-SEQ-NBR      PIC 9(06).              CATEXCP 
               10  :CATEXCP:-BRN-ACCT.                                  CATEXCP 
                   15  :CATEXCP:-BRANCH-CD      PIC X(03).              CATEXCP 
                   15  :CATEXCP:-ACCT-CD        PIC X(05).              CATEXCP 
           05  :CATEXCP:-DATA.                                          CATEXCP 
               10  :CATEXCP:-ASSET-EXCP-RSN-CD  PIC X(04).              CATEXCP 
1                  88  :CATEXCP:-NSCC-NON-ADP       VALUE 'ENNA'.       CATEXCP 
2                  88  :CATEXCP:-ORIGINAL-ACCT-FLAT VALUE 'EFAA'.       CATEXCP 
3                  88  :CATEXCP:-GIFT               VALUE 'EGFT'.       CATEXCP 
4                  88  :CATEXCP:-CLIENT-RESCIND     VALUE 'ERBF'.       CATEXCP 
5                  88  :CATEXCP:-LEGAL-BLOCK        VALUE 'EFBF'.       CATEXCP 
6                  88  :CATEXCP:-ACCT-ACTIVITY      VALUE 'EACI'.       CATEXCP 
7                  88  :CATEXCP:-OPEN-ORDERS        VALUE 'EOOS'.       CATEXCP 
8                  88  :CATEXCP:-ACCT-RJCT-RSBM     VALUE 'ETRR'.       CATEXCP 
9                  88  :CATEXCP:-TIN-MISMATCH       VALUE 'ETIM'.       CATEXCP 
10                 88  :CATEXCP:-DUPLICATE-TIF      VALUE 'EDTF'.       CATEXCP 
11                 88  :CATEXCP:-ACCT-DB-BAL-T1     VALUE 'EDBC'.       CATEXCP 
12                 88  :CATEXCP:-ACCT-MRGN-DB       VALUE 'EMDB'.       CATEXCP 
13                 88  :CATEXCP:-ACCT-SHRT-PSTN     VALUE 'ESHP'.       CATEXCP 
14                 88  :CATEXCP:-ACCT-SEC-RSTRD     VALUE 'ERSC'.       CATEXCP 
15                 88  :CATEXCP:-ACCT-AST-EXCS      VALUE 'EEXA'.       CATEXCP 
16                 88  :CATEXCP:-ACCT-OPTN-PSTN     VALUE 'EOPS'.       CATEXCP 
17                 88  :CATEXCP:-ACCT-LTD-PRTNR     VALUE 'ELPP'.       CATEXCP 
18                 88  :CATEXCP:-ACCT-CUST-70       VALUE 'EOAC'.       CATEXCP 
19                 88  :CATEXCP:-QUALIFIED-PLAN     VALUE 'EQLP'.       CATEXCP 
20                 88  :CATEXCP:-MANAGED-ASSETS     VALUE 'WMAS'.       CATEXCP 
21                 88  :CATEXCP:-PRIVATE-RANGE      VALUE 'EPRS'.       CATEXCP 
22                 88  :CATEXCP:-REGT               VALUE 'ERTR'.       CATEXCP 
23                 88  :CATEXCP:-90DR               VALUE 'E90R'.       CATEXCP 
24                 88  :CATEXCP:-ADOPT-AGRMT        VALUE 'EAAM'.       CATEXCP 
25                 88  :CATEXCP:-ACCT-BRKR-TIF      VALUE 'ERPW'.       CATEXCP 
26                 88  :CATEXCP:-COMMENTS           VALUE 'ECMM'.       CATEXCP 
27                 88  :CATEXCP:-CUST-TYP-MSMTH     VALUE 'EATM'.       CATEXCP 
28                 88  :CATEXCP:-ACCT-FLAT          VALUE 'EFLP'.       CATEXCP 
29NEW              88  :CATEXCP:-PARTIAL-FULFILL    VALUE 'EPTR'.       CATEXCP 
30                 88  :CATEXCP:-SPECIAL-ACCT       VALUE 'ESPA'.       CATEXCP 
31                 88  :CATEXCP:-EXPIRING-OPTN      VALUE 'EEOP'.       CATEXCP 
32                 88  :CATEXCP:-RESTRICTED-SEC     VALUE 'ERSB'.       CATEXCP 
33                 88 :CATEXCP:-FRZ-CSH-IN-YES      VALUE 'EFCI'.       CATEXCP 
34                 88 :CATEXCP:-FRZ-CSH-OUT-YES     VALUE 'EFCO'.       CATEXCP 
35                 88 :CATEXCP:-FRZ-SEC-IN-YES      VALUE 'EFSI'.       CATEXCP 
36                 88 :CATEXCP:-FRZ-SEC-OUT-YES     VALUE 'EFSO'.       CATEXCP 
37                 88 :CATEXCP:-ACCT-FRZN-YES       VALUE 'EFRC'.       CATEXCP 
38                 88  :CATEXCP:-ACCT-FLAT-FEE      VALUE 'EFAF'.       CATEXCP 
39                 88  :CATEXCP:-ACCT-FLAT-MEMO     VALUE 'ETMO'.       CATEXCP 
40                 88  :CATEXCP:-AUCTION-RT         VALUE 'EAAR'.       CATEXCP 
41                 88  :CATEXCP:-CONV-ACCT-YES      VALUE 'ECNC'.       CATEXCP 
42                 88  :CATEXCP:-NTW-LVL4-YES       VALUE 'ELL4'.       CATEXCP 
43NEW              88  :CATEXCP:-SPAD               VALUE 'SPAD'.       CATEXCP 
44                 88  :CATEXCP:-ASSET-MF-DELETE    VALUE 'MFDE'.       CATEXCP 
                                                                                
               10  :CATEXCP:-EXCEPTION-DATA     PIC X(80).              CATEXCP 
                                                                                
               10  :CATEXCP:-PTR-FULFILLMENT-CD REDEFINES               CATEXCP 
                      :CATEXCP:-EXCEPTION-DATA  PIC X(4).               CATEXCP 
1                  88  :CATEXCP:-PTR-AFFN       VALUE 'AFFN'.           CATEXCP 
2                  88  :CATEXCP:-PTR-AFFP       VALUE 'AFFP'.           CATEXCP 
3                  88  :CATEXCP:-PTR-AFPX       VALUE 'AFPX'.           CATEXCP 
4                  88  :CATEXCP:-PTR-AFPN       VALUE 'AFPN'.           CATEXCP 
5                  88  :CATEXCP:-PTR-AFPF       VALUE 'AFPF'.           CATEXCP 
6                  88  :CATEXCP:-PTR-AFPP       VALUE 'AFPP'.           CATEXCP 
7                  88  :CATEXCP:-PTR-AFXX       VALUE 'AFXX'.           CATEXCP 
8                  88  :CATEXCP:-PTR-AFNN       VALUE 'AFNN'.           CATEXCP 
9                  88  :CATEXCP:-PTR-AFNF       VALUE 'AFNF'.           CATEXCP 
10                 88  :CATEXCP:-PTR-AFNP       VALUE 'AFNP'.           CATEXCP 
11                 88  :CATEXCP:-PTR-AFXN       VALUE 'AFXN'.           CATEXCP 
12                 88  :CATEXCP:-PTR-AFXP       VALUE 'AFXP'.           CATEXCP 
13                 88  :CATEXCP:-PTR-AFEE       VALUE 'AFEE'.           CATEXCP 
                                                                                
               10  :CATEXCP:-ALT-BRN-ACCT REDEFINES                     CATEXCP 
                      :CATEXCP:-EXCEPTION-DATA.                         CATEXCP 
                   15  :CATEXCP:-ALT-BRANCH-CD  PIC X(03).              CATEXCP 
                   15  :CATEXCP:-ALT-ACCT-CD    PIC X(05).              CATEXCP 
                                                                                
               10  :CATEXCP:-SPAD-ID REDEFINES                          CATEXCP 
                      :CATEXCP:-EXCEPTION-DATA.                         CATEXCP 
                   15  :CATEXCP:-SPAD-ID-1      PIC X(07).              CATEXCP 
                   15  :CATEXCP:-SPAD-ID-DSAH   PIC X(01).              CATEXCP 
                   15  :CATEXCP:-SPAD-ID-2      PIC X(02).              CATEXCP 
                                                                                
DELET**********10  :CATEXCP:-ASSET-ADP-NBR      PIC X(07).              CATEXCP 
               10  FILLER                       PIC X(03).              CATEXCP 
      ***************************************************************** CATEXCP 
      *** FILE HEADER RECORD - P2 FORMAT                            *** CATEXCP 
      ***************************************************************** CATEXCP 
           03  :CATEXCP:-HEADER-RECORD REDEFINES                        CATEXCP 
               :CATEXCP:-DETAIL-RECORD.                                 CATEXCP 
               05  :CATEXCP:-HDR-LIT               PIC X(005).          CATEXCP 
                  88  :CATEXCP:-HDR-REC            VALUE 'DATE='.       CATEXCP 
               05  :CATEXCP:-HDR-PROC-DATE         PIC X(006).          CATEXCP 
               05  :CATEXCP:-HDR-SYS-DATE          PIC X(006).          CATEXCP 
               05  :CATEXCP:-HDR-SYS-TIME          PIC X(006).          CATEXCP 
               05  FILLER                          PIC X(003).          CATEXCP 
               05  :CATEXCP:-HDR-DATASET-NAME      PIC X(017).          CATEXCP 
               05  :CATEXCP:-HDR-PGM-NAME          PIC X(008).          CATEXCP 
               05  :CATEXCP:-HDR-CLT-NO            PIC X(003).          CATEXCP 
               05  :CATEXCP:-HDR-CYCLE-DATA.                            CATEXCP 
                 07  :CATEXCP:-HDR-CYCLE-LIT       PIC X(006).          CATEXCP 
                  88  :CATEXCP:-HDR-CYCLE-LITERAL  VALUE 'CYCLE='.      CATEXCP 
                 07  :CATEXCP:-HDR-CYCLE-NO        PIC X(002).          CATEXCP 
               05  FILLER                          PIC X(058).          CATEXCP 
      ***************************************************************** CATEXCP 
      *** FILE TRAILER RECORD - P2 FORMAT                           *** CATEXCP 
      ***************************************************************** CATEXCP 
           03  :CATEXCP:-TRAILER-RECORD REDEFINES                       CATEXCP 
               :CATEXCP:-DETAIL-RECORD.                                 CATEXCP 
               05  :CATEXCP:-TRL-LIT               PIC X(008).          CATEXCP 
                 88  :CATEXCP:-TRL-REC             VALUE 'REC-CNT='.    CATEXCP 
               05  :CATEXCP:-TRL-REC-CNT           PIC 9(011).          CATEXCP 
               05  :CATEXCP:-TRL-PROC-DATE         PIC X(006).          CATEXCP 
               05  :CATEXCP:-TRL-SYS-DATE          PIC X(006).          CATEXCP 
               05  :CATEXCP:-TRL-SYS-TIME          PIC X(006).          CATEXCP 
               05  :CATEXCP:-TRL-PGM-NAME          PIC X(008).          CATEXCP 
               05  :CATEXCP:-TRL-CLT-NO            PIC X(003).          CATEXCP 
               05  FILLER                          PIC X(006).          CATEXCP 
               05  :CATEXCP:-TRL-CYCLE-DATA.                            CATEXCP 
                 07  :CATEXCP:-TRL-CYCLE-LIT       PIC X(006).          CATEXCP 
                  88  :CATEXCP:-TRL-CYCLE-LITERAL  VALUE 'CYCLE='.      CATEXCP 
                 07  :CATEXCP:-TRL-CYCLE-NO        PIC X(002).          CATEXCP 
               05  FILLER                          PIC X(058).          CATEXCP 
      ***************************************************************** CATEXCP 
      ***   CATEXCP  - END OF COPYBOOK                              *** CATEXCP 
      ***************************************************************** CATEXCP 
