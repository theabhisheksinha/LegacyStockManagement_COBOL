       01  :CAT:-OFAC-RECORD.                                           03/04/16
           03  :CAT:-OFAC-HDR-RECORD.                                   CATOFAC 
               05 :CAT:-OFAC-HDR-CLIENT       PIC X(04).                CATOFAC 
                  88 :CAT:-OFAC-HDR-REC                 VALUE LOW-VALUE.CATOFAC 
               05 :CAT:-OFAC-HDR-DATE-LIT     PIC X(05).                CATOFAC 
               05 :CAT:-OFAC-HDR-PROC-DATE.                             CATOFAC 
                  07 :CAT:-OFAC-HDR-PROC-CC   PIC X(02).                CATOFAC 
                  07 :CAT:-OFAC-HDR-PROC-YY   PIC X(02).                CATOFAC 
                  07 :CAT:-OFAC-HDR-PROC-MM   PIC X(02).                CATOFAC 
                  07 :CAT:-OFAC-HDR-PROC-DD   PIC X(02).                CATOFAC 
               05 :CAT:-OFAC-HDR-JULIAN-LIT   PIC X(07).                CATOFAC 
               05 :CAT:-OFAC-HDR-JULIAN-DATE  PIC X(07).                CATOFAC 
               05 :CAT:-OFAC-HDR-PGM-LIT      PIC X(04).                CATOFAC 
               05 :CAT:-OFAC-HDR-PROG-NAME    PIC X(08).                CATOFAC 
               05 FILLER                      PIC X(457).               CATOFAC 
           03  :CAT:-OFAC-DETAIL-REC REDEFINES :CAT:-OFAC-HDR-RECORD.   CATOFAC 
               05 :CAT:-OFAC-CLIENT-NUM       PIC X(04).                CATOFAC 
               05 :CAT:-OFAC-MATCH-IND        PIC X(01).                CATOFAC 
                  88 :CAT:-OFAC-EXACT-MATCH             VALUE 'A'.      CATOFAC 
                  88 :CAT:-OFAC-FUZZY-MATCH             VALUE 'B'.      CATOFAC 
               05 :CAT:-OFAC-BRANCH           PIC X(03).                CATOFAC 
               05 :CAT:-OFAC-ACCOUNT          PIC X(05).                CATOFAC 
               05 :CAT:-OFAC-ACAT-CNTL        PIC X(14).                CATOFAC 
               05 :CAT:-OFAC-RR               PIC X(03).                CATOFAC 
               05 :CAT:-OFAC-DEL-RCV-IND      PIC X(01).                CATOFAC 
                  88 :CAT:-OFAC-DELIVERER               VALUE 'D'.      CATOFAC 
                  88 :CAT:-OFAC-RECEIVER                VALUE 'R'.      CATOFAC 
               05 :CAT:-OFAC-ACAT-NAME.                                 CATOFAC 
                  07 :CAT:-OFAC-ACAT-NAME1    PIC X(30).                CATOFAC 
                  07 :CAT:-OFAC-ACAT-NAME2    PIC X(30).                CATOFAC 
               05 :CAT:-OFAC-ACAT-ADDR.                                 CATOFAC 
                  07 :CAT:-OFAC-ACAT-ADDR1    PIC X(30).                CATOFAC 
                  07 :CAT:-OFAC-ACAT-ADDR2    PIC X(30).                CATOFAC 
                  07 :CAT:-OFAC-ACAT-ADDR3    PIC X(30).                CATOFAC 
                  07 :CAT:-OFAC-ACAT-ADDR4    PIC X(30).                CATOFAC 
               05 :CAT:-OFAC-OFAC-NBR         PIC X(10).                CATOFAC 
               05 :CAT:-OFAC-OFAC-NAME        PIC X(200).               CATOFAC 
               05 :CAT:-OFAC-ACAT-TRNF-TYP    PIC X(03).                CATOFAC 
               05 FILLER                      PIC X(76).                CATOFAC 
