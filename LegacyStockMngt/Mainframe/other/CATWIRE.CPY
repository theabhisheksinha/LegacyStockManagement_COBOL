000001* PDX    - CATWIRE  C0240170 12/08/06 16:12:17 TBDOJUN            00001000
      ******************************************************************CATWIRE 
      ***  CATWIRE - ACATS WIRES LAYOUT                              ***CATWIRE 
      ***  EXTRACT AUTO WIRES VARIABLES TO BE SENT TO BDF SYSTEM.    ***CATWIRE 
      ***  THE CATWIRE COPYBOOK MAPS THE ACATS DATA IN THE           ***CATWIRE 
      ***  ESWWIRE-MSG-DATA(3000 BYTES) PART OF THE COPYBOOK ESSWIRES***CATWIRE 
      ***  THE CATWIRE COPYBOOK SHOULD FOLLOW DIRECTLY               ***CATWIRE 
      ***  AFTER THE ESWWIRES COPYBOOK IN THE PROGRAM.               ***CATWIRE 
      ***  ESWWIRES LENGTH = 3155                                    ***CATWIRE 
      ***  CATWIRE  LENGTH = 500                                     ***CATWIRE 
      ******************************************************************CATWIRE 
      ***  12/11/06 SSR 46059 RBC DAIN                               ***CATWIRE 
      ******************************************************************CATWIRE 
                                                                        CATWIRE 
           05  :WIRE:-ACAT-RECORD REDEFINES ESWWIRE-MSG-DATA.           CATWIRE 
             10  :WIRE:-ACAT-REC.                                       CATWIRE 
               15  :WIRE:-ACAT-RR             PIC X(03).                CATWIRE 
               15  :WIRE:-ACAT-ACCOUNT-NBR.                             CATWIRE 
                   20  :WIRE:-ACAT-BRANCH     PIC X(03).                CATWIRE 
                   20  :WIRE:-ACAT-ACCOUNT    PIC X(05).                CATWIRE 
               15  :WIRE:-ACAT-ALT-BRANCH     PIC X(05).                CATWIRE 
               15  :WIRE:-ACAT-SHORT-NAME     PIC X(20).                CATWIRE 
               15  :WIRE:-ACAT-TITLE          PIC X(60).                CATWIRE 
               15  :WIRE:-ACAT-CONTACT-NAME   PIC X(30).                CATWIRE 
               15  :WIRE:-ACAT-CONTACT-PHONE  PIC X(14).                CATWIRE 
               15  :WIRE:-ACAT-CONTRA-FIRM    PIC X(50).                CATWIRE 
               15  :WIRE:-ACAT-CONTRA-BRK-NBR PIC X(04).                CATWIRE 
               15  :WIRE:-ACAT-CONTRA-ACCOUNT PIC X(20).                CATWIRE 
               15  :WIRE:-ACAT-TRNFR-TYPE     PIC X(03).                CATWIRE 
                   88  :WIRE:-ACAT-FULL                  VALUE 'FUL'.   CATWIRE 
                   88  :WIRE:-ACAT-PARTIAL-REQ           VALUE 'PTR'.   CATWIRE 
                   88  :WIRE:-ACAT-PARTIAL-DLVY          VALUE 'PTD'.   CATWIRE 
                   88  :WIRE:-ACAT-FAIL-REVERSAL         VALUE 'FRV'.   CATWIRE 
                   88  :WIRE:-ACAT-RECLAIM               VALUE 'RCL'.   CATWIRE 
                   88  :WIRE:-ACAT-RESIDUAL-CREDIT       VALUE 'RCR'.   CATWIRE 
               15  :WIRE:-ACAT-CONTROL-NBR    PIC X(14).                CATWIRE 
               15  :WIRE:-ACAT-STATUS-CD      PIC X(03).                CATWIRE 
               15  :WIRE:-ACAT-SETTL-DATE.                              CATWIRE 
                   20  :WIRE:-ACAT-SETTL-DATE-CC PIC X(02).             CATWIRE 
                   20  :WIRE:-ACAT-SETTL-DATE-YY PIC X(02).             CATWIRE 
                   20  :WIRE:-ACAT-SETTL-DATE-MM PIC X(02).             CATWIRE 
                   20  :WIRE:-ACAT-SETTL-DATE-DD PIC X(02).             CATWIRE 
               15  :WIRE:-ACAT-CASH-MGN-IND   PIC X(01).                CATWIRE 
                   88  :WIRE:-ACAT-CASH-ACT              VALUE 'C'.     CATWIRE 
                   88  :WIRE:-ACAT-MARGIN-ACT            VALUE 'M'.     CATWIRE 
                   88  :WIRE:-ACAT-SHORT-ACT             VALUE 'S'.     CATWIRE 
               15  :WIRE:-ACAT-QTY-CASH-IND   PIC X(01).                CATWIRE 
                   88  :WIRE:-ACAT-CASH-ASSET            VALUE 'C'.     CATWIRE 
                   88  :WIRE:-ACAT-EQUITY-ASSET          VALUE 'E'.     CATWIRE 
               15  :WIRE:-ACAT-LONG-SHT-IND   PIC X(01).                CATWIRE 
                   88  :WIRE:-ACAT-LONG                  VALUE 'L'.     CATWIRE 
                   88  :WIRE:-ACAT-SHORT                 VALUE 'S'.     CATWIRE 
               15  :WIRE:-ACAT-AMOUNT         PIC 9(15)V9(2).           CATWIRE 
               15  :WIRE:-ACAT-QUANTITY       PIC 9(11)V9(5).           CATWIRE 
               15  :WIRE:-ACAT-NSCC-SEC-ID    PIC X(09).                CATWIRE 
               15  :WIRE:-ACAT-ADP-SEC-NBR    PIC X(07).                CATWIRE 
               15  :WIRE:-ACAT-FRV-REASON-IND PIC X(01).                CATWIRE 
               15  :WIRE:-ACAT-FRV-REASON     PIC X(30).                CATWIRE 
               15  :WIRE:-ACAT-RCL-REASON-IND PIC X(01).                CATWIRE 
               15  :WIRE:-ACAT-RCL-REASON     PIC X(30).                CATWIRE 
               15  :WIRE:-ACAT-SEC-DESC-1.                              CATWIRE 
                   20  :WIRE:-ACAT-SEC-D-1    PIC X(80).                CATWIRE 
                                                                        CATWIRE 
             10  FILLER                       PIC X(64).                CATWIRE 
      ******************************************************************CATWIRE 
      ***  END OF CATWIRE - ACATS WIRES LAYOUT                       ***CATWIRE 
      ******************************************************************CATWIRE 
