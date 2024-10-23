000001* PDX    - CATWHLD  C0317345 11/15/11 09:18:00 TBLAMUR            00001000
000001* PDX    - CATWHLD  C0295620 06/11/10 13:34:22 TBLAMUR            00001000
000001* PDX    - CATWHLD  C0260091 05/12/08 10:53:18 TBDOJUN            00001000
      ******************************************************************CATWHLD 
      *** CATWHLD- ACATS WITHHOLD FILE FOR ASCENDIS(WORKFLOW)       ****CATWHLD 
      ***   CREATED 04/04/08 FOR SSR 55766 ASCENDIS INTERFACE.      ****CATWHLD 
      ***          RECORD TYPE      - FIXED                         ****CATWHLD 
      ***          RECORD LENGTH    - 62                            ****CATWHLD 
      ***   OUTPUT FROM CAT519, CAT810                              ****CATWHLD 
      ***   DSN  : B***.CAT519.WHLD / B***.CAT810.WHLD              ****CATWHLD 
      ***   FILE CONTAINS:                                          ****CATWHLD 
      ***       ALL THE POSITIONS ON THE HOLDERS FILE               ****CATWHLD 
      ***       THAT ARE NOT ACAT-ABLE.                             ****CATWHLD 
      ***       ALL THE RECORDS THAT CAT519 AND CAT810 BYPASS.      ****CATWHLD 
      ******************************************************************CATWHLD 
       01  :CATWHLD:-RECORD.                                            CATWHLD 
         03  :CATWHLD:-DETAIL-RECORD.                                   CATWHLD 
           05  :CATWHLD:-KEY.                                           CATWHLD 
               10  :CATWHLD:-CLIENT-NBR         PIC X(04).              CATWHLD 
               10  :CATWHLD:-ACAT-CONTROL-NBR   PIC X(14).              CATWHLD 
               10  :CATWHLD:-BRN-ACCT.                                  CATWHLD 
                   15  :CATWHLD:-BRANCH-CD      PIC X(03).              CATWHLD 
                   15  :CATWHLD:-ACCT-CD        PIC X(05).              CATWHLD 
               10  :CATWHLD:-CURR-CODE          PIC X(03).              CATWHLD 
               10  :CATWHLD:-TYPE               PIC X(01).              CATWHLD 
               10  :CATWHLD:-ASSET-ADP-NBR      PIC X(07).              CATWHLD 
               10  :CATWHLD:-WI-CODE            PIC X(01).              CATWHLD 
                   88  :CATWHLD:-WI-REGULAR         VALUE 'N'.          CATWHLD 
                   88  :CATWHLD:-WI-WHEN-ISSUED     VALUE 'W'.          CATWHLD 
           05  :CATWHLD:-DATA.                                          CATWHLD 
               10  :CATWHLD:-ASSET-WHLD-RSN-CD  PIC X(04).              CATWHLD 
                   88  :CATWHLD:-ANNUITY            VALUE 'ANNU'.       CATWHLD 
                   88  :CATWHLD:-CURR-NOT-000       VALUE 'CURR'.       CATWHLD 
                   88  :CATWHLD:-IRA                VALUE 'IRAA'.       CATWHLD 
                   88  :CATWHLD:-FUND-NTW-LVL4      VALUE 'LVL4'.       CATWHLD 
                   88  :CATWHLD:-MTRD-OR-CALLED-BND VALUE 'MATU'.       CATWHLD 
                   88  :CATWHLD:-OPEN-ORDER         VALUE 'OPOR'.       CATWHLD 
                   88  :CATWHLD:-QTY-ZERO           VALUE 'QTY0'.       CATWHLD 
                   88  :CATWHLD:-QTY-LT-ZERO        VALUE 'QTL0'.       CATWHLD 
                   88  :CATWHLD:-QTY-LT-0001        VALUE 'QTL1'.       CATWHLD 
                   88  :CATWHLD:-SPAD               VALUE 'SPAD'.       CATWHLD 
                   88  :CATWHLD:-TYPE-NOT-1-2-3-5   VALUE 'TYPE'.       CATWHLD 
                   88  :CATWHLD:-WHEN-ISSUED        VALUE 'WHIS'.       CATWHLD 
               10  FILLER                       PIC X(20).              CATWHLD 
      ***************************************************************** CATWHLD 
      *** FILE HEADER RECORD - P2 FORMAT                            *** CATWHLD 
      ***************************************************************** CATWHLD 
           03  :CATWHLD:-HEADER-RECORD REDEFINES                        CATWHLD 
               :CATWHLD:-DETAIL-RECORD.                                 CATWHLD 
               05  :CATWHLD:-HDR-LIT               PIC X(005).          CATWHLD 
                  88  :CATWHLD:-HDR-REC            VALUE 'DATE='.       CATWHLD 
               05  :CATWHLD:-HDR-PROC-DATE         PIC X(006).          CATWHLD 
               05  :CATWHLD:-HDR-SYS-DATE          PIC X(006).          CATWHLD 
               05  :CATWHLD:-HDR-SYS-TIME          PIC X(006).          CATWHLD 
               05  FILLER                          PIC X(003).          CATWHLD 
               05  :CATWHLD:-HDR-DATASET-NAME      PIC X(017).          CATWHLD 
               05  :CATWHLD:-HDR-PGM-NAME          PIC X(008).          CATWHLD 
               05  :CATWHLD:-HDR-CLT-NO            PIC X(003).          CATWHLD 
               05  :CATWHLD:-HDR-CYCLE-DATA.                            CATWHLD 
                 07  :CATWHLD:-HDR-CYCLE-LIT       PIC X(006).          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-LITERAL  VALUE 'CYCLE='.      CATWHLD 
                 07  :CATWHLD:-HDR-CYCLE-NO        PIC X(002).          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-01       VALUE '01'.          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-02       VALUE '02'.          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-03       VALUE '03'.          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-04       VALUE '04'.          CATWHLD 
                  88  :CATWHLD:-HDR-CYCLE-05       VALUE '05'.          CATWHLD 
                  88  :CATWHLD:-HDR-NIGHT-REFRESH  VALUE '00'.          CATWHLD 
      ***************************************************************** CATWHLD 
      *** FILE TRAILER RECORD - P2 FORMAT                           *** CATWHLD 
      ***************************************************************** CATWHLD 
           03  :CATWHLD:-TRAILER-RECORD REDEFINES                       CATWHLD 
               :CATWHLD:-DETAIL-RECORD.                                 CATWHLD 
               05  :CATWHLD:-TRL-LIT               PIC X(008).          CATWHLD 
                 88  :CATWHLD:-TRL-REC             VALUE 'REC-CNT='.    CATWHLD 
               05  :CATWHLD:-TRL-REC-CNT           PIC 9(011).          CATWHLD 
               05  :CATWHLD:-TRL-PROC-DATE         PIC X(006).          CATWHLD 
               05  :CATWHLD:-TRL-SYS-DATE          PIC X(006).          CATWHLD 
               05  :CATWHLD:-TRL-SYS-TIME          PIC X(006).          CATWHLD 
               05  :CATWHLD:-TRL-PGM-NAME          PIC X(008).          CATWHLD 
               05  :CATWHLD:-TRL-CLT-NO            PIC X(003).          CATWHLD 
               05  FILLER                          PIC X(006).          CATWHLD 
               05  :CATWHLD:-TRL-CYCLE-DATA.                            CATWHLD 
                 07  :CATWHLD:-TRL-CYCLE-LIT       PIC X(006).          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-LITERAL  VALUE 'CYCLE='.      CATWHLD 
                 07  :CATWHLD:-TRL-CYCLE-NO        PIC X(002).          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-01       VALUE '01'.          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-02       VALUE '02'.          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-03       VALUE '03'.          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-04       VALUE '04'.          CATWHLD 
                  88  :CATWHLD:-TRL-CYCLE-05       VALUE '05'.          CATWHLD 
                  88  :CATWHLD:-TRL-NIGHT-REFRESH  VALUE '00'.          CATWHLD 
      ***************************************************************** CATWHLD 
      ***   CATWHLD  - END OF COPYBOOK                              *** CATWHLD 
      ***************************************************************** CATWHLD 
