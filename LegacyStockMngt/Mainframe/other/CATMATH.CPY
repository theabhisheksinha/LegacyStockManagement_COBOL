000001* PDX    - CATMATH  C0361186 11/13/14 14:35:43 TBLAMUR            00001000
000001* PDX    - CATMATH  C0317345 10/04/11 11:56:21 TBLAMUR            00001000
000001* PDX    - CATMATH  C0296621 05/18/10 15:55:58 TBLAMUR            00001000
000001* PDX    - CATMATH  C0260091 04/30/08 10:57:11 TBLAMUR            00001000
      ******************************************************************CATMATH 
      *** CATMATH- ACATS MATH ADJUSTMENTS TO BALANCES.              ****CATMATH 
      ***   CREATED 03/17/08 FOR SSR 55766 ASCENDIS INTERFACE.      ****CATMATH 
      ***          RECORD TYPE      - FIXED                         ****CATMATH 
      ***          RECORD LENGTH    - 100                           ****CATMATH 
      ***   FILE CONTAINS:                                          ****CATMATH 
      ***       FEES                                                ****CATMATH 
      ***       FRACTIONAL LIQUIDATION ADJUSTMENTS                  ****CATMATH 
      ***       OLMI INTEREST ADJUSTMENTS                           ****CATMATH 
      ***       MONEY MARKETS DELIVERED AS CASH                     ****CATMATH 
      ***       ACOUNT TYPE 3 ==> 1 MOVES                           ****CATMATH 
      ******************************************************************CATMATH 
       01  :CATMATH:-RECORD.                                            CATMATH 
           03  :CATMATH:-DETAIL-RECORD.                                 CATMATH 
               05  :CATMATH:-CLIENT-NBR      PIC X(04)   VALUE '0000'.  CATMATH 
               05  :CATMATH:-ACATS-CNTL-NBR  PIC X(14)   VALUE SPACES.  CATMATH 
               05  :CATMATH:-BRANCH          PIC X(03)   VALUE SPACES.  CATMATH 
               05  :CATMATH:-ACCOUNT         PIC X(05)   VALUE SPACES.  CATMATH 
               05  :CATMATH:-ACCOUNT-TYPE-FROM PIC X(01) VALUE SPACES.  CATMATH 
                   88 :CATMATH:-ACTYPE-FROM VALUES ARE '1' '2' '3' '5'. CATMATH 
               05  :CATMATH:-ADP-NBR         PIC X(07)   VALUE SPACES.  CATMATH 
               05  :CATMATH:-ACCOUNT-TYPE-TO PIC X(01)   VALUE SPACES.  CATMATH 
                   88 :CATMATH:-ACTYPE-TO  VALUES ARE '1' '2' '5'.      CATMATH 
               05  :CATMATH:-RECORD-TYPE     PIC X(04)   VALUE SPACES.  CATMATH 
                   88 :CATMATH:-PENDING-SHORT-DVND       VALUE 'DVND'.          
                   88 :CATMATH:-FEE-TRANSFER             VALUE 'FEEX'.  CATMATH 
                   88 :CATMATH:-FEE-IRA-MAINT            VALUE 'FEEM'.  CATMATH 
                   88 :CATMATH:-FEE-IRA-TERMINATION      VALUE 'FEET'.  CATMATH 
                   88 :CATMATH:-FEE-FOREIGN-ASSET        VALUE 'FEFO'.  CATMATH 
                   88 :CATMATH:-FEE-PAPER-STATEMENT      VALUE 'FEPS'.  CATMATH 
                   88 :CATMATH:-TYPE3-MOVE               VALUE 'TYP3'.  CATMATH 
                   88 :CATMATH:-FRACTIONAL-QTY           VALUE 'FRAC'.  CATMATH 
                   88 :CATMATH:-MMF-AS-CASH              VALUE 'MMFC'.  CATMATH 
                   88 :CATMATH:-OLMI                     VALUE 'OLMI'.  CATMATH 
                   88 :CATMATH:-CONVENIENCE-ACCOUNT      VALUE 'CNVC'.  CATMATH 
               05  :CATMATH:-BALANCE         PIC 9(15)V99  VALUE 0.     CATMATH 
               05  :CATMATH:-BALANCE-SIGN    PIC X(01)   VALUE SPACES.  CATMATH 
                   88  :CATMATH:-BALANCE-CREDIT          VALUE '-'.     CATMATH 
                   88  :CATMATH:-BALANCE-DEBIT           VALUE ' '.     CATMATH 
               05  :CATMATH:-BALANCE-APPLIED PIC X(01)   VALUE SPACES.  CATMATH 
                   88 :CATMATH:-BALANCE-APPLIED-YES VALUE 'Y'.          CATMATH 
                   88 :CATMATH:-BALANCE-NOT-APPLIED VALUE 'N'.          CATMATH 
               05  :CATMATH:-QUANTITY        PIC 9(12)V9(5)  VALUE 0.   CATMATH 
               05  :CATMATH:-QUANTITY-SIGN   PIC X(01)   VALUE SPACES.  CATMATH 
                   88  :CATMATH:-QUANTITY-SHORT          VALUE '-'.     CATMATH 
                   88  :CATMATH:-QUANTITY-LONG           VALUE ' '.     CATMATH 
               05  FILLER                    PIC X(24)   VALUE SPACES.  CATMATH 
      ***************************************************************** CATMATH 
      *** FILE HEADER RECORD - P2 FORMAT                            *** CATMATH 
      ***************************************************************** CATMATH 
           03  :CATMATH:-HEADER-RECORD REDEFINES                        CATMATH 
               :CATMATH:-DETAIL-RECORD.                                 CATMATH 
               05  :CATMATH:-HDR-LIT               PIC X(005).          CATMATH 
                  88  :CATMATH:-HDR-REC            VALUE 'DATE='.       CATMATH 
               05  :CATMATH:-HDR-PROC-DATE         PIC X(006).          CATMATH 
               05  :CATMATH:-HDR-SYS-DATE          PIC X(006).          CATMATH 
               05  :CATMATH:-HDR-SYS-TIME          PIC X(006).          CATMATH 
               05  FILLER                          PIC X(003).          CATMATH 
               05  :CATMATH:-HDR-DATASET-NAME      PIC X(017).          CATMATH 
               05  :CATMATH:-HDR-PGM-NAME          PIC X(008).          CATMATH 
               05  :CATMATH:-HDR-CLT-NO            PIC X(003).          CATMATH 
               05  :CATMATH:-HDR-CYCLE-DATA.                            CATMATH 
                 07  :CATMATH:-HDR-CYCLE-LIT       PIC X(006).          CATMATH 
                  88  :CATMATH:-HDR-CYCLE-LITERAL  VALUE 'CYCLE='.      CATMATH 
                 07  :CATMATH:-HDR-CYCLE-NO        PIC X(002).          CATMATH 
               05  FILLER                          PIC X(038).          CATMATH 
      ***************************************************************** CATMATH 
      *** FILE TRAILER RECORD - P2 FORMAT                           *** CATMATH 
      ***************************************************************** CATMATH 
           03  :CATMATH:-TRAILER-RECORD REDEFINES                       CATMATH 
               :CATMATH:-DETAIL-RECORD.                                 CATMATH 
               05  :CATMATH:-TRL-LIT               PIC X(008).          CATMATH 
                 88  :CATMATH:-TRL-REC             VALUE 'REC-CNT='.    CATMATH 
               05  :CATMATH:-TRL-REC-CNT           PIC 9(011).          CATMATH 
               05  :CATMATH:-TRL-PROC-DATE         PIC X(006).          CATMATH 
               05  :CATMATH:-TRL-SYS-DATE          PIC X(006).          CATMATH 
               05  :CATMATH:-TRL-SYS-TIME          PIC X(006).          CATMATH 
               05  :CATMATH:-TRL-PGM-NAME          PIC X(008).          CATMATH 
               05  :CATMATH:-TRL-CLT-NO            PIC X(003).          CATMATH 
               05  FILLER                          PIC X(006).          CATMATH 
               05  :CATMATH:-TRL-CYCLE-DATA.                            CATMATH 
                 07  :CATMATH:-TRL-CYCLE-LIT       PIC X(006).          CATMATH 
                  88  :CATMATH:-TRL-CYCLE-LITERAL  VALUE 'CYCLE='.      CATMATH 
                 07  :CATMATH:-TRL-CYCLE-NO        PIC X(002).          CATMATH 
               05  FILLER                          PIC X(038).          CATMATH 
      ***************************************************************** CATMATH 
      ***   CATMATH  - END OF COPYBOOK                              *** CATMATH 
      ***************************************************************** CATMATH 
