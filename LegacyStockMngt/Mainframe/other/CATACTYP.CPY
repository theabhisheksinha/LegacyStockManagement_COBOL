000001* PDX    - CATACTYP C0305327 12/14/10 08:34:25 TBLAMUR            00001002
       01  WS-ACCOUNT-TYPE-CHOICES       PIC S9(4) COMP VALUE +24.      02620000
       01  WS-ACCOUNT-TYPES-VALUES.                                     02621000
           05  FILLER                    PIC X(4) VALUE '4KAG'.         02630000
           05  FILLER                    PIC X(4) VALUE 'BCCO'.         02640000
           05  FILLER                    PIC X(4) VALUE 'CTCU'.         02650000
           05  FILLER                    PIC X(4) VALUE 'DREI'.         02660000
           05  FILLER                    PIC X(4) VALUE 'ESIR'.         02670000
           05  FILLER                    PIC X(4) VALUE 'JTMS'.         02680000
           05  FILLER                    PIC X(4) VALUE 'OTRI'.         02690000
           05  FILLER                    PIC X(4) VALUE 'SISN'.         02700000
           05  FILLER                    PIC X(4) VALUE 'TRQP'.         02710000
           05  FILLER                    PIC X(4) VALUE 'BIBR'.         02720000
           05  FILLER                    PIC X(4) VALUE '4B5P'.         02730000
           05  FILLER                    PIC X(4) VALUE 'HS7B'.         02740000
       01  FILLER REDEFINES WS-ACCOUNT-TYPES-VALUES.                    02750000
           05  WS-ACCOUNT-TYPE OCCURS 24 TIMES PIC XX.                  02760000
