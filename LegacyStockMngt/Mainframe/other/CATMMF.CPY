000001* PDX    - CATMMF   C0287084 10/16/09 13:49:58 TBLAMUR            00001000
000001* PDX    - CATMMF   C0230098 01/17/06 13:28:58 TBLAMUR            00001000
LRM001*** SSR 45101 ADD THRESHOLD FUNDS TO PRIMARY REDEMPTION                   
LRM003*** SSR 66946 ADD THRESHOLD FUNDS EXPANDED TO 999 OCCURS.                 
       01  :CAT:-MMF-RECORD.                                            02/06/28
           03  :CAT:-MMF-HDR-REC.                                       CATMMF  
               05  :CAT:-MMF-HDR-CLIENT         PIC 9(03).              CATMMF  
                   88  :CAT:-MMF-HEADER                   VALUE 000.    CATMMF  
               05  :CAT:-MMF-HDR-SEQ            PIC X(04).              CATMMF  
               05  :CAT:-MMF-HDR-PROC-DATE.                             CATMMF  
                   07  :CAT:-MMF-HDR-PROC-CC    PIC X(02).              CATMMF  
                   07  :CAT:-MMF-HDR-PROC-YY    PIC X(02).              CATMMF  
                   07  :CAT:-MMF-HDR-PROC-MM    PIC X(02).              CATMMF  
                   07  :CAT:-MMF-HDR-PROC-DD    PIC X(02).              CATMMF  
               05  FILLER                       PIC X(65).              CATMMF  
*********  PRIMARY REDEMPTION RECORDS                                           
       01  :CAT:-MMF-SEURITY-REC.                                       CATMMF  
               05  :CAT:-MMF-CLIENT-NUM         PIC 9(03).              CATMMF  
               05  :CAT:-MMF-SEQUENCE-NO        PIC 9(04).              CATMMF  
               05  :CAT:-MMF-SECURITY           PIC X(07).              CATMMF  
               05  :CAT:-MMF-SWEEP-CODE         PIC 9(04).              CATMMF  
               05  :CAT:-MMF-REDMPT-HRCHY       PIC X(01).              CATMMF  
                   88  :CAT:-MMF-REDMPT-ASC               VALUE 'A'.    CATMMF  
                   88  :CAT:-MMF-REDMPT-DESC              VALUE 'D'.    CATMMF  
                   88  :CAT:-MMF-REDMPT-NONE              VALUE 'N'.    CATMMF  
               05  FILLER                       PIC X(26).              CATMMF  
LRM003         05  :CAT:-MMF-THRESHOLD-COUNT    PIC 999.                CATMMF  
LRM003         05  :CAT:-MMF-THRESHOLD-ENTRY OCCURS 1 TO 999 TIMES      CATMMF  
LRM003                  DEPENDING ON :CAT:-MMF-THRESHOLD-COUNT.                 
LRM003             07  :CAT:-MMF-THRESHOLD-FUND     PIC X(07).          CATMMF  
                                                                                
*********  SECONDARY REDEMPTION RECORD / TABLE.                                 
       01  :CAT:-MMF-REDMPT-RECORD.                                     CATMMF  
           03  :CAT:-MMF-REDMPT-CLIENT          PIC 9(03).              CATMMF  
           03  :CAT:-MMF-REDMPT-SEQUENCE        PIC X(04).              CATMMF  
               88  :CAT:-MMF-REDMPT-REC                   VALUE '9999'. CATMMF  
           03  :CAT:-MMF-REDMPT-SECURITY-AREA.                          CATMMF  
               05  :CAT:-MMF-REDMPT-COUNT       PIC 999.                CATMMF  
               05  :CAT:-MMF-REDMPT-SECURITY OCCURS 0 TO 999 TIMES      CATMMF  
                       DEPENDING ON :CAT:-MMF-REDMPT-COUNT              CATMMF  
                                                PIC X(07).              CATMMF  
