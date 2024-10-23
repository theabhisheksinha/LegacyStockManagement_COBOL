000001* PDX    - CAT575B  C0354069 04/16/14 10:06:04 TBLAMUR            00001000
      * LRM025 SSR 91941 ADDITIONAL CHANGE FOR 537503=A TO POPULATE CUST        
      *   SSN ON F/R.                                                           
000001* PDX    - CAT575B  C0344128 09/26/13 09:35:01 TBLAMUR            00001000
000001* LRM024 SSR 94296 RECOMPILE FOR EXPANDED BNWTRANW AND                    
      *    NEW COPYBOOK VERSION FOR NTWIOREC.                                   
000001* PDX    - CAT575B  C0344193 09/26/13 09:33:01 TBLAMUR            00001000
000001* LRM023 SSR# 95183 PASS NAPPA-ACCT-CLASS-EXP TO BNW59NTL.                
000001*   CHANGE BNW59NTL SETUP TO MATCH BNW59 USE BNWNADDP BNWNADDW.           
000001* PDX    - CAT575B  C0341452 06/27/13 14:52:10 TBLAMUR            00001000
      * LRM021 SSR 90907 CONSIDER GEO 999 FOREIGN, CAUSING ACCT-CD TO           
      *    HAVE VALUE OF 1 OR 3.  COUNTRY-CODE WILL BE 'UC' FOM 59CTY.          
000001* PDX    - CAT575B  C0340975 06/27/13 14:44:13 TBLAMUR            00001000
      * LRM020 SSR 91941 CALL BNW59NTL TO PICKUP B1 537503 CHANGE FOR           
      *  ALPHA A WHICH AFFECTS N/A LINES.                                       
000001* PDX    - CAT575B  C0336625 06/27/13 08:40:24 TBLAMUR            00001000
      * LRM019 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                           
      *  ADD COPY NNASGRPA FOR PRIVATE-FLD #7, TO MATCH TO 537646.              
000001* PDX    - CAT575B  C0326762 05/22/12 09:14:09 TBLAMUR            00001000
      * LRM018 SSR 84199 RECOMPILE TO PICKUP NEW COPYLIB BNWTAXWW               
      *   HAVING WITHHOLD CHANGES FOR VALUES U,V                                
000001* PDX    - CAT575B  C0310990 04/25/11 09:35:11 TBLAMUR            00001000
      * LRM017 SSR 76863 RECOMPILE TO PICKUP NEW COPYLIB BNWTAXWW               
      *   HAVING WITHHOLD CHANGES FOR VALUES G,P                                
000001* PDX    - CAT575B  C0300175 08/10/10 09:19:07 TBLAMUR            00001000
      * LRM016 SSR 69717 DIVIDEND CODE MISSING ON PTF                           
000001* PDX    - CAT575B  C0296893 06/11/10 10:04:38 TBLAMUR            00001000
      * LRM015 SSR 70534 NEW B1 434741 TO CAUSE NON OMNI FUND DVDND             
      *   CODES BE SET BY OUR CLIENTS B1 VALUES, NOT THE CONTRA'S.              
000001* PDX    - CAT575B  C0295363 04/20/10 15:30:15 TBLAMUR            00001000
      * LRM014 SSR 67411 RBC OMNIBUS PNC FUNDS ADDITINAL CHANGE TO              
      *  CORRECT FUND ACCOUNT NUMBER AND DEFAULT SOCIAL CODE TO 06.             
000001* PDX    - CAT575B  C0292845 04/06/10 11:08:06 TBLAMUR            00001000
      * LRM013 SSR 67411 RBC OMNIBUS PNC FUNDS.                                 
000001* PDX    - CAT575B  C0289034 12/02/09 12:31:32 TBLAMUR            00001000
      * LRM012 SSR 68448 HARD CODE CLIENT 210 SAME AS 10.                       
000001* PDX    - CAT575B  C0286527 11/04/09 16:36:05 TBLAMUR            00001000
      * LRM011 SSR 63684 CALL BNW59CTY FOR STATE AND COUNTRY CODE.              
000001* PDX    - CAT575B  C0284654 09/14/09 13:38:30 TBLAMUR            00001000
      * LRM010 SSR 65227 CALL BMFSOCL FOR SOCIAL CODE.                          
000001* PDX    - CAT575B  C0283883 09/03/09 08:24:28 TBLAMUR            00001000
      * LRM009 SSR 61835 NA-LINE-IND CHANGE BASED ON MFRS BNW59 CHANGE.         
000001* PDX    - CAT575B  C0275568 04/03/09 14:54:28 TBDOJUN            00001000
      * DJ0004 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE          
      * DJ0004 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER                      
000001* PDX    - CAT575B  C0272583 12/08/08 17:23:01 TBDOJUN                    
      * DJ0003 (SSR 61164) CHECK FOR NNARPB-SEGMENT-MISSING FOR ALT-BR          
000001* PDX    - CAT575B  C0272378 10/31/08 08:18:36 TBLAMUR                    
000001* LRM008 SSR 59237 BUILD NAME LINES LOGIC BASED ON B1 540207              
000001* PDX    - CAT575B  C0261891 03/06/08 09:56:33 TBLAMUR                    
000001* LRM007 SSR 43644 MISSING LOGIC FOR B1 537503 VALUES 8,9                 
000001*          COPY MFRS LOGIC FOR NA LINES AND SSN FIELDS.                   
000001* PDX    - CAT575B  C0256629 11/09/07 09:08:53 TBLAMUR                    
000001* LRM006 - SSR# 0055014 USE ALT BR IN BRANCH ID, BASED ON                 
000001* LRM006 - MFRS B1 540203.                                                
000001* PDX    - CAT575B  C0240891 10/26/06 09:39:46 TBLAMUR                    
000001* LRM005 - SSR# 0048591 REGULATORY A#6280 US RESIDENTS LIVING             
000001*          ABROAD, ADD F/R ACCOUNT TYPES 4,5 ID VIA GEO 969.              
000001* PDX    - CAT575B  C0231736 04/13/06 15:12:04 TBDOJUN                    
000001* DJ0002 - SSR# 45744 - MAINTAIN ONE MF NETWORK LEVEL                     
000001* DJ0002 - B1#537486: 1=ONE NETWORK-LEVEL 3 FUND ACCOUNT                  
000001* DJ0002 - IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                             
000001* PDX    - CAT575B  C0210812 09/13/04 08:07:29 TBLAMUR                    
000001* LRM004 - SSR# 0038145 REMOVE COPY NASEGPPE; NOT USED.                   
000001* PDX    - CAT575B  C0197442 10/27/03 12:33:49 TBLAMUR                    
000001* PDX    - CAT575B  C0196253 09/26/03 12:35:32 TBLAMUR                    
000001* PDX    - CAT575B  C0179270 10/04/02 10:31:33 TBLAMUR                    
000001* LRM003 - SSR# 0029440 DST/MFE FUND CHANGES                              
000001* PDX    - CAT575B  C0176431 06/25/02 11:32:29 TBLAMUR                    
000001* LRM002 - SSR# 0029188 MULTI PLATFORM O-NSCC                             
000001* PDX    - CAT575B  C0158046 05/03/01 14:57:22 TBYOHON                    
000001* PDX    - CAT575B  C0152145 02/20/01 18:25:37 TBLAMUR                    
000001* PDX    - CAT575B  C0150647 01/12/01 16:39:49 TBLAMUR                    
000001* PDX    - CAT575B  C0150927 12/19/00 09:58:20 TBLAMUR                    
000001* PDX    - CAT575B  C0147356 09/29/00 11:26:26 TBLAMUR                    
000001* PDX    - CAT575B  C0136961 02/22/00 15:18:02 TBTIKUO                    
000001* PDX    - CAT575B  C0132673 10/14/99 12:20:33 TBLAMUR                    
000001* PDX    - CAT575B  C0128792 07/23/99 09:14:00 TBEDTAK                    
000001* PDX    - CAT575B  C0124764 04/26/99 15:34:51 TBDOJUN                    
000001* PDX    - CAT575B  C0122593 03/03/99 11:01:59 TBTARYB                    
000001* PDX    - CAT575B  C0122148 02/22/99 15:37:29 TBTARYB                    
000001* PDX    - CAT575B  C0121552 02/10/99 21:37:45 TBTARYB                    
000001* PDX    - CAT575B  C0120355 01/24/99 19:11:16 TBTARYB                    
000001* PDX    - CAT575B  C0120194 01/11/99 13:19:56 TBTARYB                    
000001* PDX    - CAT575B  C0119343 12/22/98 16:00:09 TBTARYB                    
000001* PDX    - CAT575B  C0117593 11/13/98 11:14:15 TBTARYB                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT575B.                                                  
                                                                                
       DATE-WRITTEN.  OCTOBER 98.                                               
      ******************************************************************        
      *                          REMARKS                               *        
      ******************************************************************        
      * THIS PROGRAM IS THE SECOND OF THE THREE PROGRAMS THAT ARE      *        
      * INTENDED TO CREATE FUND/SERV RECORD IN VFNDRGST TABLE.  THIS   *        
      * PROGRAM READS REQUESTS FOR FR CREATION FROM FR-REQUEST FILE    *        
      * AND CALLS B1, N&A, TABLE MAINTENANCE, AND RR N&A. DEPENDING ON *        
      * THE VALUES OBTAINED FROM THOSE FILES, THE DEFAULTS ARE CREATED *        
      * FOR VARIOUS FUND/SERV FIELDS, AND WRITTEN TO THE FR-FILE.      *        
      ******************************************************************        
      * 04/26/99 DJ0001 IF B1#537503=2, MOVE CUSTOMER NA-LINE-1                 
      *                 TO FR-NA-LINE-2                                         
      *                                                                         
      * 02/02/00 TCK001 SSR# R1733500 &  R2439700                               
      *                 ACAT CHANGES IN FUND REGISTRATION                       
      *                                                                         
LRM001* 12/08/00 SSR# R2262400 W-8 REGULATORY CHANGES                           
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT FR-REQUEST        ASSIGN  TO  FREQUEST.                       
                                                                                
DJ0004     SELECT BNWMAST-FILE      ASSIGN TO NTWMAST                           
TCK001            ACCESS            DYNAMIC                                     
TCK001            ORGANIZATION      INDEXED                                     
TCK001            RECORD KEY IS     MAST-KEY-AREA                               
TCK001            FILE STATUS IS    BNWMAST-STATUS.                             
                                                                                
           SELECT BNWREGOP          ASSIGN  TO  NTWREGOP                        
              ORGANIZATION  IS  INDEXED                                         
              ACCESS        IS  DYNAMIC                                         
              RECORD KEY    IS  REG-OPT-KEY-AREA                                
              FILE STATUS   IS  BNWREGOP-STATUS.                                
                                                                                
           SELECT MFRRNM-FILE       ASSIGN  TO  MFRRNM                          
              ORGANIZATION  IS  INDEXED                                         
              ACCESS        IS  DYNAMIC                                         
              RECORD KEY    IS  MFRRNM-KEY-IN                                   
              FILE STATUS   IS  MFRRNM-FILE-STATUS.                             
                                                                                
DJ0004     SELECT MFEXBR            ASSIGN TO MFEXBR                            
DJ0004            ACCESS            RANDOM                                      
DJ0004            ORGANIZATION      INDEXED                                     
DJ0004            RECORD KEY IS     EXBR-KEY                                    
DJ0004            FILE STATUS IS    MFEXBR-STATUS.                              
                                                                                
           SELECT FR-FILE           ASSIGN  TO  FRFILE.                         
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  FR-REQUEST                                                           
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 310 CHARACTERS.                                      
       01  FR-REQ-REC                       PIC  X(310).                        
                                                                                
       FD  BNWMAST-FILE.                                                        
       01  BNWMAST-REC.                                                         
           COPY BNWMASTW.                                                       
                                                                                
       FD  BNWREGOP.                                                            
       01  BNWREGOP-RECORD.                                                     
           COPY BNWREGOP.                                                       
                                                                                
       FD  MFRRNM-FILE.                                                         
       01  MFRRNM-RECORD.                                                       
           05  MFRRNM-KEY-IN                PIC  X(11).                         
           05  FILLER                       PIC  X(39).                         
                                                                                
DJ0004 FD  MFEXBR.                                                              
DJ0004 01  MFEXBR-REC.                                                          
DJ0004     COPY MFEXBR.                                                         
                                                                                
       FD  FR-FILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 750 CHARACTERS.                                      
                                                                                
        01  FR-REC                          PIC  X(750).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       77  BNWMAST-REC-LEN-IN               PIC  9(3)   VALUE 764.              
       77  EOF-FRR-REQUEST-SW               PIC  X(01).                         
           88  EOF-FRR-REQUEST                          VALUE 'Y'.              
           88  NOT-EOF-FRR-REQUEST                      VALUE 'N'.              
       77  BNWREGOP-STATUS                  PIC  X(02)  VALUE '00'.             
       77  MFRRNM-FILE-STATUS               PIC  X(02)  VALUE '00'.             
       77  WS-DATE-TIME                     PIC  X(26) .                        
       77  S1                               PIC  9(02).                         
       77  FIRST-TIME-SW                    PIC  X(01)  VALUE 'Y'.              
           88  FIRST-TIME                               VALUE 'Y'.              
           88  NOT-FIRST-TIME                           VALUE 'N'.              
       77  GETNA-SW                         PIC  X(01).                         
           88  GETNA-OK                                 VALUE 'Y'.              
           88  GETNA-NOT-OK                             VALUE 'N'.              
       77  STOP-OK-SW                       PIC  X(01).                         
           88  STOP-OK                                  VALUE 'Y'.              
           88  STOP-NOT-OK                              VALUE 'N'.              
       77  RANGE-FOUND-SW                   PIC  X(01).                         
           88  RANGE-FOUND                              VALUE 'Y'.              
           88  RANGE-NOT-FOUND                          VALUE 'N'.              
       77  READ-CNTR                        PIC  9(09)  VALUE ZEROES.           
TCK001 77  WS-BNWMAST-CNT                   PIC  9(09)  VALUE ZEROES.           
TCK001 77  WS-BNWMAST-FND-CNT               PIC  9(09)  VALUE ZEROES.           
       77  WRITE-CNTR                       PIC  9(09)  VALUE ZEROES.           
       77  WS-DVDND-CD                      PIC  X(01)  VALUE SPACES.           
       77  WS-LTCG-CD                       PIC  X(01)  VALUE SPACES.           
       77  WS-STCG-CD                       PIC  X(01)  VALUE SPACES.           
       77  LENGTH-KEY                       PIC  9(02)  VALUE 9.                
DJ0004 01  FILE-STATUSES.                                                       
DJ0004     05  MFEXBR-STATUS             PIC X(002).                            
DJ0004         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.             
DJ0004         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0004         88 MFEXBR-END-OF-FILE     VALUE '10'.                            
DJ0004         88 MFEXBR-NOT-FOUND       VALUE '23'.                            
DJ0004         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                            
DJ0004 01  WORK-AREA.                                                           
DJ0004     05  W-MFMSD-CNT               PIC  9(009) COMP-3 VALUE 0.            
DJ0004     05  W-MFMSD-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0004     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0004     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
DJ0004     05  W-MFMSD-FND-SW             PIC X(01).                            
DJ0004         88  W-MFMSD-FOUND                    VALUE 'Y'.                  
DJ0004         88  W-MFMSD-NOT-FOUND                VALUE 'N'.                  
DJ0004     05  W-MFEXBR-FND-SW            PIC X(01).                            
DJ0004         88  W-MFEXBR-FOUND                   VALUE 'Y'.                  
DJ0004         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.                  
LRM020     05  W-REG-SETUP-OPTION         PIC X(1).                             
LRM020     05  W-NA-IO-NAME-LINE-IND.                                           
LRM020         10  W-NA-IO-NAME-LINE-IND-N  PIC 9.                              
                                                                                
           COPY STUBCPY.                                                        
LRM002     03  BNWNTWIO                  PIC X(8)  VALUE 'BNWNTWIO'.            
DJ0004     03  BMFSEC                    PIC X(8)  VALUE 'BMFSEC  '.            
LRM010     03  BMFSOCL                   PIC X(08) VALUE 'BMFSOCL'.             
                                                                                
           03  CKDIGIT              PIC X(08) VALUE 'CKDIGIT'.                  
           03  GETSTRGN             PIC X(08) VALUE 'GETSTRGN'.                 
           03  C-BNW59CTY           PIC X(08) VALUE 'BNW59CTY'.                 
LRM020     03  C-BNW59NTL           PIC X(08) VALUE 'BNW59NTL'.                 
                                                                                
       01  HOLD-AREA.                                                           
           05  WS-HOLD-CLIENT               PIC  X(04)  VALUE SPACES.           
           05  WS-HOLD-BRCH                 PIC  X(03)  VALUE SPACES.           
           05  WS-HOLD-ACCT                 PIC  X(05)  VALUE SPACES.           
                                                                                
DJ0002 01  W-CKDIGIT.                                                           
DJ0002     03 W-CKDIGIT-PARM.                                                   
DJ0002        05 W-CKDIGIT-LEN               PIC 9(02) VALUE 9.                 
DJ0002        05 W-CKDIGIT-ACCT-TC.                                             
DJ0002           07 W-CKDIGIT-ACCT-T.                                           
DJ0002              09 W-CKDIGIT-BRN-ACCT    PIC X(08).                         
DJ0002              09 W-CKDIGIT-TYPE        PIC X(01).                         
DJ0002           07 W-CKDIGIT-CK             PIC X(01) VALUE ' '.               
DJ0002        05 W-CKDIGIT-ACCT-TC-1.                                           
DJ0002           07 W-CKDIGIT-ACCT-T-1.                                         
DJ0002              09 W-CKDIGIT-BRN-ACCT-1  PIC X(08).                         
DJ0002              09 W-CKDIGIT-TYPE-1      PIC X(01).                         
DJ0002           07 W-CKDIGIT-CK-1           PIC X(01) VALUE ' '.               
                                                                                
       01  NS-BRCH-ACCT-TC.                                                     
           05  NS-BRCH-ACCT.                                                    
               10  NS-BRCH                  PIC  X(03).                         
               10  NS-ACCT                  PIC  X(05).                         
               10  NS-T                     PIC  X(01).                         
           05 NS-C                          PIC  X(01).                         
                                                                                
LRM003 01  WS-DST-BOX-ACCT-TC.                                                  
LRM003     05  WS-DST-BRCH-ACCT.                                                
LRM003         10  WS-DST-BRCH              PIC  X(03).                         
LRM003         10  WS-DST-ACCT              PIC  X(05).                         
LRM003         10  WS-DST-T                 PIC  X(01).                         
LRM003     05 WS-DST-C                      PIC  X(01).                         
                                                                                
LRM013 01  WS-PNC-SURPAS-BOX-TC.                                                
LRM013     05  WS-PNC-SURPAS-BRCH-ACCT.                                         
LRM013         10  WS-PNC-SURPAS-BRCH       PIC  X(03).                         
LRM013         10  WS-PNC-SURPAS-ACCT       PIC  X(05).                         
LRM013         10  WS-PNC-SURPAS-T          PIC  X(01).                         
LRM013     05 WS-PNC-SURPAS-C               PIC  X(01).                         
                                                                                
       01  WS-BRCH-ACCT-TC.                                                     
           05  WS-BRCH-ACCT.                                                    
               10  WS-BRCH                  PIC  X(03).                         
               10  WS-ACCT                  PIC  X(05).                         
               10  WS-T                     PIC  X(01).                         
           05 WS-C                          PIC  X(01).                         
                                                                                
       01  WS-SSN-PACKED            COMP-3  PIC  9(09)  VALUE ZEROES.           
       01  WS-SSN-UNPACKED                  PIC  9(09).                         
       01  WS-SSN-ALPHA REDEFINES                                               
           WS-SSN-UNPACKED                  PIC  X(09).                         
                                                                                
       01  WK-TAX.                                                              
           05  WK-TAX2                      PIC  X(02)  VALUE SPACES.           
           05  WK-TAX3                      PIC  X(01)  VALUE SPACES.           
                                                                                
       01  WK-ALC.                                                              
           05  WK-ALC-1                     PIC  X(01)  VALUE SPACES.           
           05  WK-ALC-2-3                   PIC  X(02)  VALUE SPACES.           
                                                                                
       01  B1-AREA.                                                             
           05  B1-BRKR-EXCTG-NBR            PIC  9(04)  VALUE ZEROES.           
ET         05  B1-BRKR-EXCTG-NBR-X   REDEFINES                                  
ET             B1-BRKR-EXCTG-NBR            PIC  X(04).                         
           05  B1-NTWRK-CNTL-CD             PIC  X(01)  VALUE SPACES.           
           05  B1-SOC-CD                    PIC  X(02)  VALUE SPACES.           
           05  B1-BK-PHSCL-SHR-CD           PIC  X(01)  VALUE SPACES.           
           05  B1-DLRVY-CD                  PIC  X(01)  VALUE SPACES.           
           05  B1-PI-DLRVY-CD               PIC  X(01)  VALUE SPACES.           
           05  B1-FRCTN-CD                  PIC  X(01)  VALUE SPACES.           
           05  B1-DSBMT-ACCRL-CD            PIC  X(01)  VALUE SPACES.           
           05  B1-DSBMT-FRCTN-CSH-CD        PIC  X(01)  VALUE SPACES.           
           05  B1-DSBMT-RSDL-CD             PIC  X(01)  VALUE SPACES.           
           05  B1-DVDND-CD                  PIC  X(01)  VALUE SPACES.           
           05  B1-LTCG-CD                   PIC  X(01)  VALUE SPACES.           
           05  B1-STCG-CD                   PIC  X(01)  VALUE SPACES.           
           05  B1-PYBL-INFO-CD              PIC  X(01)  VALUE SPACES.           
           05  B1-NAV-ACCT-IND              PIC  X(01)  VALUE SPACES.           
           05  B1-MRGN-ACCT-IND             PIC  X(01)  VALUE SPACES.           
           05  B1-CHCK-WRTNG-IND            PIC  X(01)  VALUE SPACES.           
           05  B1-ACH-IND                   PIC  X(01)  VALUE SPACES.           
           05  B1-PAC-IND                   PIC  X(01)  VALUE SPACES.           
           05  B1-SWP-IND                   PIC  X(01)  VALUE SPACES.           
           05  B1-TRD-RLTD-IND              PIC  X(01)  VALUE SPACES.           
DJ0001     05  B1-ACAT-MF-REG-FUND-ACCT     PIC  X(01)  VALUE SPACES.           
DJ0002     05  B1-SINGLE-FUND-ACCOUNT       PIC  X(01)  VALUE SPACES.           
DJ0004     05  B1-EXBR-OPTION               PIC  X(01)  VALUE SPACES.           
                                                                                
       01  NA-AREA.                                                             
           05  NA-IRA-IND                   PIC  X(01)  VALUE SPACES.           
           05  NA-NRA-TAX                   PIC V9(02)  VALUE ZEROES.           
           05  NA-IRA-VALUE                 PIC  X(01)  VALUE SPACES.           
           05  NA-WITHHOLD                  PIC  X(01)  VALUE SPACES.           
           05  NA-LINE-TABLE.                                                   
               10  NA-LINE                                                      
                   OCCURS 6 TIMES           PIC  X(35)  VALUE SPACES.           
           05  NA-SOC-SEC-NBR               PIC  9(09)  VALUE ZEROES.           
           05  NA-SOC-SEC-CD                PIC  X(01)  VALUE SPACES.           
           05  NA-ZIP                       PIC  X(09)  VALUE SPACES.           
           05  NA-NAME-IND                  PIC  9(01)  VALUE ZEROES.           
           05  NA-SL-ST-CD                  PIC  X(02)  VALUE SPACES.           
           05  NA-CNTRY-ORGN-CD             PIC  X(02)  VALUE SPACES.           
           05  NA-NM-END-LN-QTY       COMP  PIC S9(04)  VALUE ZEROES.           
           05  NA-ACCT-RR-CD                PIC  X(09)  VALUE SPACES.           
           05  NA-ACCT-RR-NM                PIC  X(15)  VALUE SPACES.           
           05  NA-BRCH-NBR                  PIC  X(09)  VALUE SPACES.           
                                                                                
TCK001**----- ADDED FOR SSR#1733500 --------- BEG ----*******                   
TCK001 01  FILLER                    PIC X(20)  VALUE                           
TCK001                                          'BNWMAST WORK AREA'.            
TCK001 01  BNWMAST-WORK-AREA.                                                   
           05  WS-BNWMAST-FND-SW           PIC X(01).                           
               88  WS-BNWMAST-FOUND                  VALUE 'Y'.                 
TCK001     05 BNWMAST-STATUS               PIC X(002).                          
TCK001        88 VALID-BNWMAST-STATUS VALUE '00' '04' '10' '23'.                
TCK001        88 BNWMAST-OKAY        VALUE '00' THRU '09', '97'.                
TCK001        88 BNWMAST-END-OF-FILE    VALUE '10'.                             
TCK001        88 BNWMAST-NOT-FOUND      VALUE '23'.                             
TCK001        88 BNWMAST-EMPTY-MISSING  VALUE '35'.                             
TCK001     05 W-BNWMAST-FND-SW              PIC X(01).                          
TCK001        88 W-BNWMAST-FOUND                VALUE 'Y'.                      
TCK001 01  WS-BNWMAST-KEY.                                                      
           05  WS-BNWMAST-CLT-NO            PIC 9(3).                           
           05  WS-BNWMAST-CUSIP-15.                                             
               10  WS-BNWMAST-CUSIP-CNTRY-CD PIC X(2).                          
               10  WS-BNWMAST-CUSIP         PIC X(9).                           
               10  WS-BNWMAST-CUSIP-CHK-DGT PIC X.                              
               10  WS-BNWMAST-CUSIP-EXT     PIC X(3).                           
           05  WS-BNWMAST-ACCT-ID.                                              
               10  WS-BNWMAST-CLT           PIC 9(3).                           
               10  WS-BNWMAST-BRN-5.                                            
                   15  WS-BNWMAST-BRN-1-2   PIC X(2).                           
                   15  WS-BNWMAST-BRN-3     PIC X(3).                           
               10  WS-BNWMAST-ACCT-10.                                          
                   15  WS-BNWMAST-ACCT-1-5  PIC X(5).                           
                   15  WS-BNWMAST-ACCT-5    PIC X(5).                           
               10  WS-BNWMAST-ACCT-TC.                                          
                   15  WS-BNWMAST-TYPE      PIC X.                              
                   15  WS-BNWMAST-CHK       PIC X.                              
TCK001     05  WS-BNWMAST-PAYABLE-SEQ-NO    PIC 9(1).                           
TCK001**----- ADDED FOR SSR#1733500 --------- END ----*******                   
       01  NTW-AREA.                                                            
           05  NTW-HOUSE-REG                PIC  X(01)  VALUE SPACES.           
           05  NTW-HOUSE-ACCOUNT            PIC  X(20)  VALUE SPACES.           
           05  NTW-HOUSE-ACCT-FLAG          PIC  X(01)  VALUE SPACES.           
               88  NTW-HOUSE-ACCT                       VALUE 'Y'.              
               88  NTW-NOT-HOUSE-ACCT                   VALUE 'N'.              
           05  NTW-OMNIBUS-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
               88  NTW-OMNIBUS-ACCT                     VALUE 'Y'.              
LRM003         88  NTW-DST-MFE-ACCT                     VALUE 'D'.              
LRM013         88  NTW-PNC-SURPAS-ACCT                  VALUE 'P'.              
               88  NTW-NOT-OMNIBUS-ACCT                 VALUE 'N'.              
           05  NTW-NSCCSRC-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
               88  NTW-NSCCSRC-ACCT                     VALUE 'Y'.              
               88  NTW-NOT-NSCCSRC-ACCT                 VALUE 'N'.              
LRM019     05  NTW-SHWB-ACCT-FLAG           PIC  X(01)  VALUE SPACES.           
LRM019         88  NTW-SHWB-ACCT                        VALUE 'Y'.              
LRM019         88  NTW-NOT-SHWB-ACCT                    VALUE 'N'.              
LRM019     05  NTW-WAIVE-ACCT-FLAG          PIC  X(01)  VALUE SPACES.           
LRM019         88  NTW-WAIVE-ACCT                       VALUE 'Y'.              
LRM019         88  NTW-NOT-WAIVE-ACCT                   VALUE 'N'.              
                                                                                
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.                    
                                                                                
DJ0004 01  BMFSECIO-CALLING-AREA.                                               
DJ0004     COPY BMFSECIO.                                                       
                                                                                
DJ0004 01  MFMSD-REC.                                                           
DJ0004     COPY MFMSDREC.                                                       
                                                                                
LRM010     COPY BMFSOCLW REPLACING ==:BMFSOCL:== BY ==BMFSOCL==.                
                                                                                
LRM011 01  BNW59CTY-PARM-INFO.                                                  
LRM011     COPY BNW59CTY.                                                       
           EJECT                                                                
LRM020     COPY BNW59NTL.                                                       
           EJECT                                                                
       01  FILLER.                                                              
           05  ZIP-FOUND-SW                 PIC  X(01)  VALUE SPACES.           
               88  ZIP-FOUND                            VALUE 'Y'.              
               88  ZIP-NOT-FOUND                        VALUE 'N'.              
           05  W-ADDRESS-WORK-BYTES.                                            
               10  W-ADDRESS-WORK-BYTE  OCCURS 35 TIMES                         
                                            PIC  X(01)  VALUE SPACES.           
           05  ADDRESS-SUB                  PIC  9(02)  VALUE ZEROES.           
           05  W-ZIP-WORK-BYTES.                                                
               10  W-ZIP-WORK-BYTE OCCURS 9 TIMES                               
                                            PIC  9(01)  VALUE ZEROES.           
           05  ZIP-SUB                      PIC  9(02)  VALUE ZEROES.           
LRM019     05  SUB                          PIC  9(02)  VALUE ZEROES.           
                                                                                
           EJECT                                                                
           COPY CATFRR.                                                         
                                                                                
           EJECT                                                                
           COPY CATFR.                                                          
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
           COPY BHICS.                                                          
                                                                                
           EJECT                                                                
           COPY BHBTS2.                                                         
                                                                                
           EJECT                                                                
           COPY BHMF.                                                           
                                                                                
           EJECT                                                                
           COPY BHMF3.                                                          
                                                                                
           EJECT                                                                
LRM023 01  W-SUB                       PIC 99.                                  
LRM023 01  C-CURR-PROGRAM              PIC X(8) VALUE 'CAT575B'.                
LRM023     COPY BNWBIOW.                                                        
LRM023     COPY BNWNADDW.                                                       
                                                                                
           EJECT                                                                
           COPY GETNACOB.                                                       
       01  GETNA-SEGMENT-INCLUDES.                                              
           COPY NASEGPPA.                                                       
           COPY NASEGPPB.                                                       
LRM019     COPY NNASGRPA.                                                       
LRM006     COPY NNASGRPB.                                                       
LRM023     COPY NASEGIP9.                                                       
           COPY NASEGEND.                                                       
                                                                                
           EJECT                                                                
           COPY BNWTAXWW.                                                       
                                                                                
           EJECT                                                                
       01  NA-GE-CODE-901-955-TRANS.                                            
           COPY MFSTEGEO.                                                       
                                                                                
           EJECT                                                                
       01  COUNTRY-CODE-CONVERSION.                                             
           COPY NTWCRYTB.                                                       
                                                                                
           EJECT                                                                
           COPY MFRRMAST.                                                       
                                                                                
           EJECT                                                                
           COPY BSKPARM.                                                        
                                                                                
           EJECT                                                                
           COPY BSKREC01 REPLACING ==:BSK-ST:== BY ==BSK-ST==.                  
                                                                                
           EXEC SQL                                                             
              INCLUDE VMF                                                       
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
DJ0004     DISPLAY 'CAT575B - FORMAT FUND REGISTRATION RECORDS'.                
DJ0004     DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
DJ0004     DISPLAY ' '.                                                         
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           PERFORM MAIN-PROCESS                                                 
              UNTIL EOF-FRR-REQUEST.                                            
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       MAIN-PROCESS.                                                            
      **************                                                            
                                                                                
           MOVE FRR-ACCT-RCV-NBR            TO  WS-BRCH-ACCT-TC.                
DJ0002     MOVE FRR-ACCT-RCV-NBR            TO  W-CKDIGIT-ACCT-TC               
                                                                                
           IF FIRST-TIME                                                        
              PERFORM GET-NA-INFO                                               
              IF GETNA-OK                                                       
                 PERFORM FORMAT-NA-AREA                                         
              END-IF                                                            
              PERFORM GET-B1-INFO                                               
              MOVE FRR-CLIENT-NBR           TO  WS-HOLD-CLIENT                  
              MOVE WS-BRCH                  TO  WS-HOLD-BRCH                    
              MOVE WS-ACCT                  TO  WS-HOLD-ACCT                    
              PERFORM BRANCH-RANGE-SEARCH                                       
              SET NOT-FIRST-TIME            TO  TRUE                            
           END-IF.                                                              
                                                                                
TEST****** DISPLAY 'WORKING WITH BR ' WS-BRCH                                   
           IF FRR-CLIENT-NBR = WS-HOLD-CLIENT                                   
ET            IF WS-BRCH = WS-HOLD-BRCH                                         
ET               IF WS-ACCT = WS-HOLD-ACCT                                      
LRM009              MOVE NA-NM-END-LN-QTY TO NA-NAME-IND                        
TEST                IF GETNA-OK                                                 
TEST                   PERFORM FORMAT-NA-AREA                                   
TEST                END-IF                                                      
ET******************CONTINUE                                                    
ET               ELSE                                                           
ET                  PERFORM GET-NA-INFO                                         
ET                  IF GETNA-OK                                                 
ET                     PERFORM FORMAT-NA-AREA                                   
ET                  END-IF                                                      
ET                  MOVE WS-BRCH            TO  WS-HOLD-BRCH                    
ET                  MOVE WS-ACCT            TO  WS-HOLD-ACCT                    
ET               END-IF                                                         
ET            ELSE                                                              
ET               PERFORM GET-NA-INFO                                            
ET               IF GETNA-OK                                                    
ET                  PERFORM FORMAT-NA-AREA                                      
ET               END-IF                                                         
ET               PERFORM BRANCH-RANGE-SEARCH                                    
ET               MOVE WS-BRCH               TO  WS-HOLD-BRCH                    
ET               MOVE WS-ACCT               TO  WS-HOLD-ACCT                    
ET            END-IF                                                            
           ELSE                                                                 
              PERFORM GET-NA-INFO                                               
              IF GETNA-OK                                                       
                 PERFORM FORMAT-NA-AREA                                         
              END-IF                                                            
              PERFORM GET-B1-INFO                                               
              MOVE FRR-CLIENT-NBR           TO  WS-HOLD-CLIENT                  
              PERFORM BRANCH-RANGE-SEARCH                                       
              MOVE WS-BRCH                  TO  WS-HOLD-BRCH                    
              MOVE WS-ACCT                  TO  WS-HOLD-ACCT                    
           END-IF.                                                              
TCK001                                                                          
           PERFORM FORMAT-FR-RECORD.                                            
           WRITE FR-REC                   FROM  FR-RECORD.                      
           ADD 1                            TO  WRITE-CNTR.                     
                                                                                
           READ FR-REQUEST                INTO  FRR-RECORD                      
              AT END SET EOF-FRR-REQUEST    TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF NOT EOF-FRR-REQUEST                                               
              ADD 1                         TO  READ-CNTR                       
TEST          DISPLAY 'READ INPUT FR-REQUEST '  READ-CNTR                       
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       GET-NA-INFO.                                                             
      **************                                                            
                                                                                
           MOVE 'N'                         TO GETNA-SW.                        
           INITIALIZE  GETNA-PARAMETERS.                                        
           MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
           MOVE  'R'                        TO  GETNA-REQ-FILE.                 
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
           MOVE  FRR-CLIENT-NBR (2:3)       TO  GETNA-KEY-CLIENT.               
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.            
           MOVE  WS-BRCH                    TO  GETNA-KEY-BRANCH3-5.            
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.           
           MOVE  WS-ACCT                    TO  GETNA-KEY-ACCOUNT6-10.          
TEST       DISPLAY 'CALLING N/A FOR ' WS-BRCH  WS-ACCT                          
                                                                                
           CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES.         
                                                                                
           IF GETNA-RETURN-FOUND         AND                                    
              NOT NAPPA-SEGMENT-MISSING  AND                                    
              NOT NAPPB-SEGMENT-MISSING                                         
              SET GETNA-OK                  TO  TRUE                            
           ELSE                                                                 
              SET GETNA-NOT-OK              TO  TRUE                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       FORMAT-NA-AREA.                                                          
      ****************                                                          
                                                                                
TEST       DISPLAY 'FORMAT-NA'.                                                 
           INITIALIZE NA-AREA.                                                  
                                                                                
           IF NAPPA-GEO-LOC NUMERIC                              AND            
              (NAPPA-GEO-LOC > '900' AND NAPPA-GEO-LOC < '956')  AND            
              (NAPPA-GEO-LOC NOT = '906' AND '913' AND '942' AND '951')         
              MOVE NAPPA-GEO-LOC-2-3        TO  STATE-SUB                       
              MOVE STATE-CODE (STATE-SUB)   TO  NA-SL-ST-CD                     
           ELSE                                                                 
              MOVE NAPPA-ALC                TO  WK-ALC                          
              IF WK-ALC NUMERIC                          AND                    
                 (WK-ALC > '900' AND WK-ALC < '956')     AND                    
                 (WK-ALC NOT = '906' AND '913' AND '942' AND '951')             
                 MOVE WK-ALC-2-3            TO  STATE-SUB                       
                 MOVE STATE-CODE (STATE-SUB) TO NA-SL-ST-CD                     
              ELSE                                                              
                 MOVE SPACES                TO  NA-SL-ST-CD                     
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NAPPA-GEO-LOC NUMERIC                                             
              IF (NAPPA-GEO-LOC > '900' AND NAPPA-GEO-LOC < '956')  AND         
                 (NAPPA-GEO-LOC NOT = '906' AND '913' AND '942'                 
                                   AND '951')                                   
                 MOVE 'US'                  TO  NA-CNTRY-ORGN-CD                
              ELSE                                                              
                 IF (WK-ALC > '900' AND WK-ALC < '956')   AND                   
                    (WK-ALC NOT = '906' AND '913' AND '942' AND '951')          
                    MOVE 'US'               TO  NA-CNTRY-ORGN-CD                
                 ELSE                                                           
                    SET COUNTRY-SUB TO 1                                        
                    SEARCH COUNTRY-CODES VARYING COUNTRY-SUB                    
                       AT END MOVE 'OC'     TO  NA-CNTRY-ORGN-CD                
                    WHEN NAPPA-GEO-LOC = ADP-COUNTRY-CODE (COUNTRY-SUB)         
                       MOVE NSCC-COUNTRY-CODE (COUNTRY-SUB)                     
                                            TO  NA-CNTRY-ORGN-CD                
                    END-SEARCH                                                  
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 'OC'                     TO  NA-CNTRY-ORGN-CD                
           END-IF.                                                              
                                                                                
           INITIALIZE NA-LINE-TABLE.                                            
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                          
              IF NAPPB-NA-LINE (S1) > SPACES                                    
                 MOVE NAPPB-NA-LINE (S1)    TO  NA-LINE (S1)                    
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE NAPPA-IRA-KEOUGH-IND        TO  NA-IRA-VALUE.                   
                                                                                
           IF NAPPA-IRA-KEOUGH-IND > SPACES AND                                 
537513        BH-MFN-INHOUSE-IRA-DEFAULT-OPT = '1'                              
              MOVE 'Y'                      TO  NA-IRA-IND                      
           ELSE                                                                 
              IF NAPPA-IRA-KEOUGH-IND = '1'                                     
                 MOVE 'Y'                   TO  NA-IRA-IND                      
              ELSE                                                              
                 MOVE SPACES                TO  NA-IRA-IND                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NAPPA-SOC-SEC-TAX-ID1 NOT NUMERIC                                 
              MOVE ZEROES                   TO  NA-SOC-SEC-NBR                  
           ELSE                                                                 
              MOVE NAPPA-SOC-SEC-TAX-ID1    TO  NA-SOC-SEC-NBR                  
           END-IF.                                                              
                                                                                
           IF NAPPA-SOC-SEC-TAX-CODE1 = '1'                                     
              MOVE  '1'                     TO  NA-SOC-SEC-CD                   
           ELSE                                                                 
LRM007********IF NAPPA-SOC-SEC-TAX-CODE1 = '2'                                  
LRM007           MOVE '0'                   TO  NA-SOC-SEC-CD                   
LRM007********ELSE                                                              
LRM007********   MOVE ' '                   TO  NA-SOC-SEC-CD                   
LRM007********END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NAPPA-USA-WITHHOLD          TO  NA-WITHHOLD.                    
                                                                                
           MOVE NAPPA-STK-WH-TAX-N          TO  WK-TAX.                         
           MOVE WK-TAX2                     TO  NA-NRA-TAX.                     
                                                                                
           IF NAPPA-MAIL-ADDR > SPACES                                          
              IF NAPPA-MAIL-ADDR-N > 1                                          
                 COMPUTE NA-NAME-IND = NAPPA-MAIL-ADDR-N - 1                    
              ELSE                                                              
                 MOVE 1                     TO  NA-NAME-IND                     
              END-IF                                                            
           ELSE                                                                 
              MOVE 1                        TO  NA-NAME-IND                     
           END-IF.                                                              
           MOVE NA-NAME-IND                 TO  NA-NM-END-LN-QTY.               
                                                                                
           IF NAPPA-ZIP-CODE (1:4) > SPACES                                     
              MOVE NAPPA-ZIP-CODE           TO  NA-ZIP                          
           ELSE                                                                 
              MOVE NAPPA-ZIP-CODE (5:5)     TO  NA-ZIP                          
           END-IF.                                                              
                                                                                
           MOVE NAPPA-RR1-3                 TO  NA-ACCT-RR-CD.                  
                                                                                
           MOVE NA-ACCT-RR-CD               TO  NA-ACCT-RR-NM.                  
TEST       DISPLAY 'MOVING RR-CD ' NAPPA-RR1-3                                  
                                                                                
537388     EVALUATE BH-MFRS-RR-NAME-LOOKUP-OPT                                  
              WHEN '1'                                                          
                 MOVE FRR-CLIENT-NBR (2:3)     TO  RRMA-CLNT                    
                 MOVE ZEROS                    TO  RRMA-BRCH-NMBR-5             
537389           IF BH-MFRS-RR-SETUP-TYPE = '1'                                 
                    MOVE WS-BRCH               TO  RRMA-BRCH-NMBR-3             
                 END-IF                                                         
                 MOVE NAPPA-RR1-3              TO  RRMA-REG-REP-NMBR            
                 MOVE RRMA-RCRD                TO  MFRRNM-RECORD                
                 READ MFRRNM-FILE            INTO  RRMA-RCRD                    
                 IF MFRRNM-FILE-STATUS = '00'                                   
                    IF RRMA-REG-REP-NAME  > SPACES                              
                       MOVE RRMA-REG-REP-NAME  TO  NA-ACCT-RR-NM                
                    END-IF                                                      
                 END-IF                                                         
              WHEN '2'                                                          
                 MOVE SPACES                   TO  GETSTREG-CALLING-INFO        
                 MOVE 'R'                      TO  GETSTREG-FUNCTION-IND        
                 MOVE FRR-CLIENT-NBR (2:3)     TO  GETSTREG-CLNT-NUM            
                 MOVE WS-BRCH                  TO  GETSTREG-BRCH-NUM            
                 MOVE NA-ACCT-RR-CD            TO  GETSTREG-RR-NUM              
                 CALL  GETSTRGN             USING  GETSTREG-CALLING-INFO        
                 IF GETSTREG-SUCCESSFUL                                         
                    MOVE GETSTREG-STATE-REC    TO  BSK-ST-REC                   
                    MOVE BSK-ST-RR-NAME        TO  NA-ACCT-RR-NM                
TEST                DISPLAY 'FOUND RR NAME ' BSK-ST-RR-NAME                     
TEST             ELSE                                                           
TEST                DISPLAY 'NOT FND RR NAME'                                   
                 END-IF                                                         
           END-EVALUATE.                                                        
                                                                                
LRM020 0609-REG-SETUP-OPTION.                                                   
LRM020     DISPLAY 'IN 0609- NTL PREP'                                          
LRM020     MOVE SPACE      TO W-REG-SETUP-OPTION                                
072500*** 05/17/91 GJB                                                          
072600     IF MATRIX-LEVEL OF ACCT-MAST-RECORD = '3'                            
SFP015     OR O-NSCC-SURPAS-ACCT OF ACCT-MAST-RECORD                            
JW0001     OR PNC-SURPAS-PROCESSING OF ACCT-MAST-RECORD                         
JR0001     OR DST-DIRECT OF ACCT-MAST-RECORD                                    
TR0007        IF BH-MF3-REG-OPTION-REFRESH-OPT = '0'                            
TR0007*****   IF BH-MF-REG-OPTION-REFRESH-ACT                                   
JPC022           IF BNWREGOP-STATUS = '00'                                      
IS0003           AND NTWK-LVL-3-REG-OPTION OF BNWREGOP-RECORD > SPACE           
SFP015           AND (NOT O-NSCC-HOUSE-ACCT OF ACCT-MAST-RECORD)                
JW0001           AND (NOT PNC-SURPAS-HOUSE-ACCT OF ACCT-MAST-RECORD)            
IS0001           AND (NOT DST-MFE-HOUSE-ACCT OF ACCT-MAST-RECORD)               
JPC022               MOVE NTWK-LVL-3-REG-OPTION OF BNWREGOP-RECORD              
JPC022                 TO W-REG-SETUP-OPTION                                    
JPC022           ELSE                                                           
TR0007****           MOVE BH-MFN-REG-SETUP-OPTION                               
TR0007               MOVE BH-MFN-REGIS-SETUP-OPT                                
JPC022                 TO W-REG-SETUP-OPTION                                    
JPC022           END-IF                                                         
JPC022        ELSE                                                              
SAG001           IF NTWK-LEVEL-3-REG-OPTION                                     
SAG001                   OF ACCT-MAST-RECORD IS GREATER THAN SPACE              
072900               MOVE NTWK-LEVEL-3-REG-OPTION OF ACCT-MAST-RECORD           
073000                 TO W-REG-SETUP-OPTION                                    
SAG001           ELSE                                                           
JPC011               IF BNWREGOP-STATUS = '00'                                  
IS0003               AND NTWK-LVL-3-REG-OPTION                                  
IS0003                      OF BNWREGOP-RECORD > SPACE                          
                                                                                
SFP015               AND (NOT O-NSCC-HOUSE-ACCT  OF ACCT-MAST-RECORD)           
JW0001               AND (NOT PNC-SURPAS-HOUSE-ACCT OF ACCT-MAST-RECORD)        
IS0001               AND (NOT DST-MFE-HOUSE-ACCT OF ACCT-MAST-RECORD)           
JPC011                   MOVE NTWK-LVL-3-REG-OPTION OF BNWREGOP-RECORD          
JPC011                     TO W-REG-SETUP-OPTION                                
JPC011               ELSE                                                       
TR0007****               MOVE BH-MFN-REG-SETUP-OPTION                           
TR0007                   MOVE BH-MFN-REGIS-SETUP-OPT                            
SAG001                     TO W-REG-SETUP-OPTION                                
JPC011               END-IF                                                     
SAG001           END-IF                                                         
LRM020     ELSE                                                                 
LRM020        MOVE BH-MFN-REGIS-SETUP-OPT                                       
LRM020                     TO W-REG-SETUP-OPTION                                
JPC022     END-IF.                                                              
LRM023**** IF NOT NTW-SHWB-ACCT                                                 
LRM023        PERFORM 8081-NADD-FORMAT-IO                                       
LRM023        IF PROCESSING-CODE OF BNWREGOP-RECORD NOT = 'P'                   
LRM020           PERFORM 0610-SETUP-REGISTRATION.                               
                                                                                
LRM023     COPY BNWNADDP.                                                       
IS0002 0610-SETUP-REGISTRATION.                                                 
IS0002                                                                          
IS0002     MOVE SPACE TO BNW59NTL-COMM-AREA                                     
IS0002     INITIALIZE  BNW59NTL-COMM-AREA                                       
IS0002     MOVE W-REG-SETUP-OPTION   TO  BNW59NTL-NTWK-LVL-3-REG-OPT            
IS0002     MOVE FRR-CLIENT-NBR (2:3)        TO  BNW59NTL-CLIENT                 
IS0002     MOVE PROCESSING-CODE OF BNWREGOP-RECORD                              
IS0002            TO  BNW59NTL-PROCESSING-CODE                                  
LRMTST     IF FRR-CLIENT-NBR(2 : 3) = '313'                                     
IS0002        MOVE FR-NTWRK-CNTL-CD                                             
IS0002            TO  BNW59NTL-MATRIX-LEVEL                                     
LRMTST     ELSE                                                                 
IS0002        MOVE MATRIX-LEVEL OF ACCT-MAST-RECORD                             
IS0002            TO  BNW59NTL-MATRIX-LEVEL                                     
LRMTST     END-IF.                                                              
IS0002     IF  O-NSCC-SURPAS-ACCT OF ACCT-MAST-RECORD                           
IS0002       SET BNW59NTL-O-NSCC-SURPAS-ACCT  TO  TRUE                          
IS0002     END-IF                                                               
IS0002     SET BNW59NTL-CREATE-REG-FOR-TRAN TO  TRUE                            
IS0002***  MOVE IRA-INDICATOR OF ACCT-MAST-RECORD                               
IS0002***            TO  BNW59NTL-IRA-INDICATOR                                 
LRM023     IF NAPPA-IRA-KEOUGH-IND > SPACES AND                                 
LRM023        BH-MFN-INHOUSE-IRA-DEFAULT-OPT = '1'                              
LRM023        MOVE 'Y'                      TO  BNW59NTL-IRA-INDICATOR          
LRM023     ELSE                                                                 
LRM023        IF NAPPA-IRA-KEOUGH-IND = '1'                                     
LRM023           MOVE 'Y'                   TO  BNW59NTL-IRA-INDICATOR          
LRM023        ELSE                                                              
LRM023           MOVE SPACES                TO  BNW59NTL-IRA-INDICATOR          
LRM023        END-IF                                                            
LRM023     END-IF.                                                              
LRM023     IF B1-SINGLE-FUND-ACCOUNT = '1'                                      
LRM023        MOVE W-CKDIGIT-ACCT-TC-1 (1:3)  TO BNW59NTL-BRANCH                
LRM023        MOVE W-CKDIGIT-ACCT-TC-1 (4:5)  TO BNW59NTL-ACCOUNT               
LRM023        MOVE W-CKDIGIT-ACCT-TC-1 (9:1)  TO BNW59NTL-ACCOUNT-TYPE          
LRM023        MOVE W-CKDIGIT-ACCT-TC-1 (10:1) TO BNW59NTL-CHK-DIGIT             
LRM023     ELSE                                                                 
LRM023        MOVE W-CKDIGIT-ACCT-TC   (1:3)  TO BNW59NTL-BRANCH                
LRM023        MOVE W-CKDIGIT-ACCT-TC   (4:5)  TO BNW59NTL-ACCOUNT               
LRM023        MOVE W-CKDIGIT-ACCT-TC   (9:1)  TO BNW59NTL-ACCOUNT-TYPE          
LRM023        MOVE W-CKDIGIT-ACCT-TC   (10:1) TO BNW59NTL-CHK-DIGIT             
LRM023     END-IF.                                                              
IS0002***  MOVE WS-BRCH      TO   BNW59NTL-BRANCH                               
IS0002***  MOVE WS-T         TO  BNW59NTL-ACCOUNT-TYPE                          
IS0002***  MOVE WS-C         TO  BNW59NTL-CHK-DIGIT                             
IS0002     MOVE BOOK-OPTION  OF ACCT-MAST-RECORD                                
IS0002               TO  BNW59NTL-BOOK-OPTION                                   
IS0002     MOVE REG-REP      OF ACCT-MAST-RECORD                                
IS0002               TO  BNW59NTL-REG-REP                                       
IS0002     MOVE NA-IO-NAME-LINE-IND      TO BNW59NTL-NAME-LINE-IND              
IS0002     MOVE NA-IO-IRA-KEOGH-IND      TO BNW59NTL-IRA-KEOGH-IND              
IS0002     MOVE NA-IO-SOC-SEC-TAX-ID     TO BNW59NTL-SS-NO                      
IS0002     MOVE NA-IO-SOC-SEC-TAX-CODE   TO BNW59NTL-SS-NO-TYPE                 
IS0002     MOVE NA-IO-2-SOC-SEC-TAX-ID   TO BNW59NTL-SS-NO-2                    
IS0002     MOVE NA-IO-2-SOC-SEC-TAX-CODE TO BNW59NTL-SS-NO-TYPE-2               
IS0002     MOVE NA-IO-ZIP-CODE           TO BNW59NTL-ZIP-CODE                   
IS0002     MOVE NA-IO-JOINT-AGREEMENT-CODE                                      
IS0002                                   TO BNW59NTL-JT-AGREEMENT-CODE          
IS0002     MOVE NA-IO-PT-NA-LINE-COUNT   TO BNW59NTL-PT-LINE-COUNT              
IS0002     MOVE NA-IO-PT-NA-LINE-1       TO BNW59NTL-PT-NA-LINE-1 (1:30)        
IS0002     MOVE NA-IO-PT-NA-LINE-2       TO BNW59NTL-PT-NA-LINE-2 (1:30)        
IS0002     MOVE NA-IO-PT-NA-LINE-3       TO BNW59NTL-PT-NA-LINE-3 (1:30)        
IS0002     MOVE NA-IO-PT-NA-LINE-4       TO BNW59NTL-PT-NA-LINE-4 (1:30)        
IS0002     MOVE NA-IO-PT-NA-LINE-5       TO BNW59NTL-PT-NA-LINE-5 (1:30)        
IS0002     MOVE NA-IO-PT-NA-LINE-6       TO BNW59NTL-PT-NA-LINE-6 (1:30)        
IS0002     MOVE NA-IO-IP-LINE-COUNT      TO BNW59NTL-IP-LINE-COUNT              
IS0002     MOVE NA-IO-IP-NA-LINE-1       TO BNW59NTL-IP-NA-LINE-1 (1:30)        
IS0002     MOVE NA-IO-IP-NA-LINE-2       TO BNW59NTL-IP-NA-LINE-2 (1:30)        
IS0002     MOVE NA-IO-IP-NA-LINE-3       TO BNW59NTL-IP-NA-LINE-3 (1:30)        
IS0002     MOVE NA-IO-IP-NA-LINE-4       TO BNW59NTL-IP-NA-LINE-4 (1:30)        
IS0002     MOVE NA-IO-IP-NA-LINE-5       TO BNW59NTL-IP-NA-LINE-5 (1:30)        
IS0002     MOVE NA-IO-IP-NA-LINE-6       TO BNW59NTL-IP-NA-LINE-6 (1:30)        
TR0018     MOVE NAPPA-SS-HOLDER          TO BNW59NTL-NAPPA-SS-HOLDER.           
TR0018     MOVE NAPPA-MAIL-ADDR          TO BNW59NTL-NAPPA-MAIL-ADDR.           
TR0018     MOVE NAPPA-CITY-LINE          TO BNW59NTL-NAPPA-CITY-LINE.           
RAR001     MOVE NAPPA-ACCT-CLASS-EXP   TO BNW59NTL-NAPPA-ACCT-CLASS-EXP.        
IS0002                                                                          
TEST       DISPLAY 'CALLING BNW59NTL ' BNW59NTL-BRANCH BNW59NTL-ACCOUNT         
TEST           ' WITH SETUP ' W-REG-SETUP-OPTION                                
TEST           ' N/A-CLS ' BNW59NTL-NAPPA-ACCT-CLASS-EXP                        
TEST           ' PROC-CD ' BNW59NTL-PROCESSING-CODE                             
TEST           ' MATRIX '  BNW59NTL-MATRIX-LEVEL                                
TEST           ' BOOK-OPT ' BNW59NTL-BOOK-OPTION                                
TEST           ' IRA '     BNW59NTL-IRA-INDICATOR                               
IS0002     CALL C-BNW59NTL  USING  BNW59NTL-COMM-AREA                           
IS0002                                                                          
IS0002     IF BNW59NTL-RETURN-OK                                                
IS0002       PERFORM 0611-MOVE-BNW59NTL-FIELDS                                  
IS0002     ELSE                                                                 
IS0002       DISPLAY 'BWN59NTL CALL FAILED '                                    
IS0002     END-IF.                                                              
IS0002 0611-MOVE-BNW59NTL-FIELDS.                                               
IS0002                                                                          
           IF BNW59NTL-REG-NME-LINE-DISP NOT = NA-NAME-IND                      
              DISPLAY 'CHANGE NAME LINE FROM ' NA-NAME-IND                      
              ' TO ' BNW59NTL-REG-NME-LINE-DISP.                                
IS0002     MOVE BNW59NTL-REG-NME-LINE-DISP                                      
IS0002          TO NA-NAME-IND                                                  
           IF BNW59NTL-REG-NA-LINE-1 NOT = NA-LINE (1)                          
           OR BNW59NTL-REG-NA-LINE-2 NOT = NA-LINE (2)                          
           OR BNW59NTL-REG-NA-LINE-3 NOT = NA-LINE (3)                          
           OR BNW59NTL-REG-NA-LINE-4 NOT = NA-LINE (4)                          
           OR BNW59NTL-REG-NA-LINE-5 NOT = NA-LINE (5)                          
           OR BNW59NTL-REG-NA-LINE-6 NOT = NA-LINE (6)                          
              DISPLAY 'CHANGE NAME LINES FROM / TO '                            
              DISPLAY NA-LINE (1) '   ' BNW59NTL-REG-NA-LINE-1                  
              DISPLAY NA-LINE (2) '   ' BNW59NTL-REG-NA-LINE-2                  
              DISPLAY NA-LINE (3) '   ' BNW59NTL-REG-NA-LINE-3                  
              DISPLAY NA-LINE (4) '   ' BNW59NTL-REG-NA-LINE-4                  
              DISPLAY NA-LINE (5) '   ' BNW59NTL-REG-NA-LINE-5                  
              DISPLAY NA-LINE (6) '   ' BNW59NTL-REG-NA-LINE-6.                 
LRMTST     IF FRR-CLIENT-NBR(2 : 3) = '313'                                     
LRMTST       MOVE BNW59NTL-REG-NA-LINE-1                                        
LRMTST          TO NA-LINE (1) FR-NA-LINE(1)                                    
LRMTST       MOVE BNW59NTL-REG-NA-LINE-2                                        
LRMTST          TO NA-LINE (2) FR-NA-LINE(2)                                    
LRMTST       MOVE BNW59NTL-REG-NA-LINE-3                                        
LRMTST          TO NA-LINE (3) FR-NA-LINE(3)                                    
LRMTST       MOVE BNW59NTL-REG-NA-LINE-4                                        
LRMTST          TO NA-LINE (4) FR-NA-LINE(4)                                    
LRMTST       MOVE BNW59NTL-REG-NA-LINE-5                                        
LRMTST          TO NA-LINE (5) FR-NA-LINE(5)                                    
LRMTST       MOVE BNW59NTL-REG-NA-LINE-6                                        
LRMTST          TO NA-LINE (6) FR-NA-LINE(6)                                    
LRMTST     ELSE                                                                 
IS0002       MOVE BNW59NTL-REG-NA-LINE-1                                        
IS0002          TO NA-LINE (1)                                                  
IS0002       MOVE BNW59NTL-REG-NA-LINE-2                                        
IS0002          TO NA-LINE (2)                                                  
IS0002       MOVE BNW59NTL-REG-NA-LINE-3                                        
IS0002          TO NA-LINE (3)                                                  
IS0002       MOVE BNW59NTL-REG-NA-LINE-4                                        
IS0002          TO NA-LINE (4)                                                  
IS0002       MOVE BNW59NTL-REG-NA-LINE-5                                        
IS0002          TO NA-LINE (5)                                                  
IS0002       MOVE BNW59NTL-REG-NA-LINE-6                                        
IS0002          TO NA-LINE (6)                                                  
LRMTST     END-IF.                                                              
           IF BNW59NTL-RETURN-SS-NO NOT = NA-SOC-SEC-NBR                        
              DISPLAY 'CHANGE SSN FROM ' NA-SOC-SEC-NBR                         
             ' TO ' BNW59NTL-RETURN-SS-NO.                                      
IS0002     MOVE BNW59NTL-RETURN-SS-NO                                           
IS0002          TO NA-SOC-SEC-NBR                                               
           IF BNW59NTL-RETURN-SS-TYPE NOT = NA-SOC-SEC-CD                       
              DISPLAY 'CHANGE SSN TYPE FROM ' NA-SOC-SEC-CD                     
             ' TO ' BNW59NTL-RETURN-SS-TYPE.                                    
IS0002     MOVE BNW59NTL-RETURN-SS-TYPE                                         
IS0002            TO NA-SOC-SEC-CD                                              
           IF BNW59NTL-RETURN-ZIP-CODE NOT =  NA-ZIP                            
              DISPLAY 'CHANGE ZIP FROM '  NA-ZIP                                
             ' TO ' BNW59NTL-RETURN-ZIP-CODE.                                   
IS0002     MOVE BNW59NTL-RETURN-ZIP-CODE                                        
IS0002            TO NA-ZIP.                                                    
           EJECT                                                                
      **************                                                            
       GET-B1-INFO.                                                             
      **************                                                            
                                                                                
           MOVE ' '                         TO  BH-ACAT-INFO.                   
           MOVE FRR-CLIENT-NBR (2:3)        TO  BH-BROKER-NUMBER                
           MOVE '015'                       TO  BH-LOGICAL-RECORD-CODE          
           MOVE ' '                         TO  BH-B2-INFO-ID-AREA              
           MOVE '434500'                    TO  BH-B2-INFO-ID                   
           CALL  GETB1V                  USING  BH-BROKER-HEADER-INFO           
                                                BH-ACAT-INFO.                   
                                                                                
           MOVE ' '                         TO  BH-ICS-INFO.                    
           MOVE FRR-CLIENT-NBR (2:3)        TO  BH-BROKER-NUMBER-N.             
           MOVE '015'                       TO  BH-LOGICAL-RECORD-CODE.         
           MOVE '501000'                    TO  BH-B2-INFO-ID.                  
           CALL  GETB1V                  USING  BH-BROKER-HEADER-INFO           
                                                BH-ICS-INFO.                    
                                                                                
           MOVE  ' '                        TO  BH-BTS2-INFO.                   
           MOVE  FRR-CLIENT-NBR             TO  BH-BROKER-NUMBER-N.             
           MOVE  '015'                      TO  BH-LOGICAL-RECORD-CODE.         
           MOVE  '511000'                   TO  BH-B2-INFO-ID.                  
           CALL   GETB1V                 USING  BH-BROKER-HEADER-INFO           
                                                BH-BTS2-INFO.                   
                                                                                
           MOVE  ' '                        TO  BH-MF-INFO.                     
           MOVE  FRR-CLIENT-NBR (2:3)       TO  BH-BROKER-NUMBER-N.             
           MOVE  '015'                      TO  BH-LOGICAL-RECORD-CODE.         
           MOVE  '537000'                   TO  BH-B2-INFO-ID.                  
           CALL   GETB1V                 USING  BH-BROKER-HEADER-INFO           
                                                BH-MF-INFO.                     
                                                                                
           MOVE  ' '                        TO  BH-MF3-INFO.                    
           MOVE  FRR-CLIENT-NBR (2:3)       TO  BH-BROKER-NUMBER-N.             
           MOVE  '015'                      TO  BH-LOGICAL-RECORD-CODE.         
           MOVE  '540000'                   TO  BH-B2-INFO-ID.                  
           CALL   GETB1V                 USING  BH-BROKER-HEADER-INFO           
                                                BH-MF3-INFO.                    
                                                                                
ET         PERFORM BRANCH-RANGE-SEARCH.                                         
                                                                                
434608     MOVE BH-ACAT-MF-REG-FUND-ACCT                                        
                                        TO  B1-ACAT-MF-REG-FUND-ACCT            
                                                                                
434613     MOVE BH-ACAT-MF-REG-NETWRK-CTRL-IND                                  
                                            TO  B1-NTWRK-CNTL-CD.               
                                                                                
434615     EVALUATE BH-ACAT-MF-REG-BOOK-PHYS-SHARE                              
              WHEN '0'                                                          
                 MOVE '0'                   TO  B1-BK-PHSCL-SHR-CD              
              WHEN '1'                                                          
                 MOVE '1'                   TO  B1-BK-PHSCL-SHR-CD              
              WHEN '1'                                                          
                 MOVE '2'                   TO  B1-BK-PHSCL-SHR-CD              
           END-EVALUATE.                                                        
511129*    MOVE BH-BTS2-MF-REG-REQ-BK-PHYS-SHR                                  
      *                                     TO  B1-BK-PHSCL-SHR-CD.             
                                                                                
434616     EVALUATE BH-ACAT-MF-REG-DIVIDEND-CODE                                
511129*    EVALUATE BH-BTS2-MF-REG-REQ-DIV-CODE                                 
              WHEN '0'                                                          
                 MOVE 'C'                    TO  B1-DVDND-CD                    
                 MOVE 'C'                    TO  B1-LTCG-CD                     
                 MOVE 'C'                    TO  B1-STCG-CD                     
              WHEN '1'                                                          
                 MOVE 'R'                    TO  B1-DVDND-CD                    
                 MOVE 'R'                    TO  B1-LTCG-CD                     
                 MOVE 'R'                    TO  B1-STCG-CD                     
              WHEN '2'                                                          
                 MOVE 'R'                    TO  B1-DVDND-CD                    
                 MOVE 'C'                    TO  B1-LTCG-CD                     
                 MOVE 'R'                    TO  B1-STCG-CD                     
              WHEN '3'                                                          
                 MOVE 'C'                    TO  B1-DVDND-CD                    
                 MOVE 'R'                    TO  B1-LTCG-CD                     
                 MOVE 'R'                    TO  B1-STCG-CD                     
              WHEN '4'                                                          
                 MOVE 'C'                    TO  B1-DVDND-CD                    
                 MOVE 'R'                    TO  B1-LTCG-CD                     
                 MOVE 'C'                    TO  B1-STCG-CD                     
              WHEN '5'                                                          
                 MOVE 'R'                    TO  B1-DVDND-CD                    
                 MOVE 'C'                    TO  B1-LTCG-CD                     
                 MOVE 'C'                    TO  B1-STCG-CD                     
              WHEN '6'                                                          
                 MOVE 'R'                    TO  B1-DVDND-CD                    
                 MOVE 'R'                    TO  B1-LTCG-CD                     
                 MOVE 'C'                    TO  B1-STCG-CD                     
              WHEN '7'                                                          
                 MOVE 'R'                    TO  B1-DVDND-CD                    
                 MOVE 'C'                    TO  B1-LTCG-CD                     
                 MOVE 'R'                    TO  B1-STCG-CD                     
              WHEN OTHER                                                        
                 MOVE SPACES                 TO  B1-DVDND-CD                    
                                                 B1-LTCG-CD                     
                                                 B1-STCG-CD                     
           END-EVALUATE.                                                        
                                                                                
434635     MOVE BH-ACAT-MF-REGIST-SOCIAL-CODE                                   
511127*    MOVE BH-BTS2-MF-REGIST-SOCIAL-CODE                                   
                                             TO  B1-SOC-CD.                     
                                                                                
434604     MOVE BH-ACAT-MF-REG-PI-DELIVER-IND                                   
511130*    MOVE BH-BTS2-MF-REG-OPT-PI-DELIVERY                                  
                                            TO  B1-DLRVY-CD.                    
                                                                                
511129     IF BH-BTS2-MF-REG-REQ-FRACT-IND = '1' OR '2'                         
511129        MOVE BH-BTS2-MF-REG-REQ-FRACT-IND                                 
                                            TO  B1-FRCTN-CD                     
           END-IF.                                                              
                                                                                
434522     EVALUATE BH-ACAT-MUT-FUND-ACCRUAL-DISB                               
              WHEN '0'                                                          
                 MOVE '2'                   TO  B1-DSBMT-ACCRL-CD               
              WHEN '1'                                                          
                 MOVE '4'                   TO  B1-DSBMT-ACCRL-CD               
              WHEN OTHER                                                        
                 MOVE '2'                   TO  B1-DSBMT-ACCRL-CD               
           END-EVALUATE.                                                        
      *    MOVE '2'                         TO  B1-DSBMT-ACCRL-CD.              
                                                                                
434596     MOVE BH-ACAT-MF-REG-ACCT-DISB-FRAC                                   
                                            TO  B1-DSBMT-FRCTN-CSH-CD.          
                                                                                
434595     MOVE BH-ACAT-MF-REG-ACCT-DISB-RSDL TO B1-DSBMT-RSDL-CD.              
                                                                                
434616     MOVE BH-ACAT-MF-REG-DIVIDEND-CODE  TO FR-DVDND-CD.                   
511129*    MOVE BH-BTS2-MF-REG-REQ-DIV-CODE   TO FR-DVDND-CD.                   
                                                                                
434616     EVALUATE BH-ACAT-MF-REG-DIVIDEND-CODE                                
511129*    EVALUATE BH-BTS2-MF-REG-REQ-DIV-CODE                                 
              WHEN '0'                                                          
                 MOVE 'C'                    TO  FR-LTCG-CD                     
                 MOVE 'C'                    TO  FR-STCG-CD                     
              WHEN '1'                                                          
                 MOVE 'R'                    TO  FR-LTCG-CD                     
                 MOVE 'R'                    TO  FR-STCG-CD                     
              WHEN '2'                                                          
                 MOVE 'C'                    TO  FR-LTCG-CD                     
                 MOVE 'R'                    TO  FR-STCG-CD                     
              WHEN '3'                                                          
                 MOVE 'R'                    TO  FR-LTCG-CD                     
                 MOVE 'R'                    TO  FR-STCG-CD                     
              WHEN '4'                                                          
                 MOVE 'R'                    TO  FR-LTCG-CD                     
                 MOVE 'C'                    TO  FR-STCG-CD                     
              WHEN '5'                                                          
                 MOVE 'C'                    TO  FR-LTCG-CD                     
                 MOVE 'C'                    TO  FR-STCG-CD                     
              WHEN '6'                                                          
                 MOVE 'R'                    TO  FR-LTCG-CD                     
                 MOVE 'C'                    TO  FR-STCG-CD                     
              WHEN '7'                                                          
                 MOVE 'C'                    TO  FR-LTCG-CD                     
                 MOVE 'R'                    TO  FR-STCG-CD                     
              WHEN OTHER                                                        
                 MOVE SPACES                 TO  FR-LTCG-CD                     
                                                 FR-STCG-CD                     
           END-EVALUATE.                                                        
                                                                                
434605     MOVE BH-ACAT-MF-REG-PAYABL-INFO-IND                                  
511130*    MOVE  BH-BTS2-MF-REG-OPT-PAYABL-INFO                                 
                                             TO  B1-PYBL-INFO-CD.               
                                                                                
434603     IF BH-ACAT-MF-REG-NAV-ACCT-IND = '1'                                 
              MOVE 'Y'                       TO  B1-NAV-ACCT-IND                
           ELSE                                                                 
              MOVE 'N'                       TO  B1-NAV-ACCT-IND                
           END-IF.                                                              
                                                                                
434598     IF BH-ACAT-MF-REG-MARGIN-ACCT-IND = '1'                              
511130*    IF BH-BTS2-MF-REG-OPT-MGN-ACT-IND = '1'                              
              MOVE 'Y'                       TO  B1-MRGN-ACCT-IND               
           ELSE                                                                 
              MOVE 'N'                       TO  B1-MRGN-ACCT-IND               
           END-IF.                                                              
                                                                                
434599     IF BH-ACAT-MF-REG-CHKWRITE-PRIVLG = '1'                              
511130*    IF BH-BTS2-MF-REG-OPT-CHK-WR-PRIV = '1'                              
              MOVE 'Y'                       TO  B1-CHCK-WRTNG-IND              
           ELSE                                                                 
              MOVE 'N'                       TO  B1-CHCK-WRTNG-IND              
           END-IF.                                                              
                                                                                
434602     IF BH-ACAT-MF-REG-ACH-IND = '1'                                      
511130*    IF BH-BTS2-MF-REG-OPT-AUTO-CLRG = '1'                                
              MOVE 'Y'                       TO  B1-ACH-IND                     
           ELSE                                                                 
              MOVE 'N'                       TO  B1-ACH-IND                     
           END-IF.                                                              
                                                                                
434601     IF BH-ACAT-MF-REG-PRE-AUT-CHK-IND = '1'                              
511130*    IF BH-BTS2-MF-REG-OPT-PREAUTH-CHK = '1'                              
              MOVE 'Y'                       TO  B1-PAC-IND                     
           ELSE                                                                 
              MOVE 'N'                       TO  B1-PAC-IND                     
           END-IF.                                                              
                                                                                
434600     IF BH-ACAT-MF-REG-SWP-IND = '1'                                      
511130*    IF BH-BTS2-MF-REG-OPT-SYS-WDL-IND = '1'                              
              MOVE 'Y'                       TO  B1-SWP-IND                     
           ELSE                                                                 
              MOVE 'N'                       TO  B1-SWP-IND                     
           END-IF.                                                              
                                                                                
434597     IF BH-ACAT-MF-REG-RELATED-TRD-IND = '1'                              
511130*    IF BH-BTS2-MF-REG-OPT-REL-TRD-IND = '1'                              
              MOVE 'Y'                       TO  B1-TRD-RLTD-IND                
           ELSE                                                                 
              MOVE 'N'                       TO  B1-TRD-RLTD-IND                
           END-IF.                                                              
                                                                                
537486     MOVE BH-MF-SINGLE-FUND-ACCOUNT    TO  B1-SINGLE-FUND-ACCOUNT         
                                                                                
DJ0004     MOVE BH-MF-EXBR-OPTION            TO  B1-EXBR-OPTION                 
DJ0004     DISPLAY 'CAT575B: ' BH-BROKER-NUMBER                                 
DJ0004            ' BH-MF-EXBR-OPTION(537483) = ' BH-MF-EXBR-OPTION             
                                                                                
537596     MOVE BH-MFN-OMNIBUS-NSCC-BOX-ACCT TO  NS-BRCH-ACCT-TC                
           IF BH-MFN-OMNIBUS-NSCC-BOX-ACCT NOT = SPACE                          
            CALL  CKDIGIT                  USING  NS-BRCH-ACCT                  
                                                  LENGTH-KEY                    
                                                  NS-C                          
           END-IF.                                                              
                                                                                
537601     MOVE BH-MFN-DST-MFE-NSCC-BOX-ACCT TO  WS-DST-BOX-ACCT-TC             
LRM003     IF BH-MFN-DST-MFE-NSCC-BOX-ACCT NOT = SPACE                          
LRM003      CALL  CKDIGIT                  USING  WS-DST-BRCH-ACCT              
LRM003                                            LENGTH-KEY                    
LRM003                                            WS-DST-C                      
LRM003     END-IF.                                                              
                                                                                
540238     MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT TO WS-PNC-SURPAS-BOX-TC           
LRM013     IF BH-MF3-PNC-SURPAS-BOX-ACCOUNT NOT = SPACE                         
LRM013      CALL  CKDIGIT               USING  WS-PNC-SURPAS-BRCH-ACCT          
LRM013                                         LENGTH-KEY                       
LRM013                                         WS-PNC-SURPAS-C                  
LRM013     END-IF.                                                              
           EJECT                                                                
      *********************                                                     
ET     BRANCH-RANGE-SEARCH.                                                     
      *********************                                                     
      *----------------------------------------------------------------*        
      * SCAN NEW B1 540167 (ALPHA/BRANCH REPLACEMENT FOR 537330)       *        
      *----------------------------------------------------------------*        
                                                                                
           SET RANGE-NOT-FOUND              TO  TRUE.                           
                                                                                
           IF BH-MF3-SUB-EXEC-BKR-REC-NO NUMERIC AND                            
              BH-MF3-SUB-EXEC-BKR-REC-NO > ZERO                                 
              PERFORM SCAN-EXCTG-BRANCH-RANGE                                   
           END-IF.                                                              
                                                                                
           IF RANGE-NOT-FOUND                                                   
434636        MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                                
511128*       MOVE BH-BTS2-MF-REGIST-RECEIVE-BKR                                
                                            TO  B1-BRKR-EXCTG-NBR               
           END-IF.                                                              
           EJECT                                                                
      ***********************                                                   
ET     SCAN-EXCTG-BRANCH-RANGE.                                                 
      ***********************                                                   
                                                                                
           SET STOP-NOT-OK TO TRUE.                                             
TEST*****  DISPLAY 'LOOKING UP EXCTG FOR BRANCH ' WS-BRCH.                      
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL                                 
              (S1 > BH-MF3-SUB-EXEC-BKR-REC-NO) OR STOP-OK                      
              IF WS-BRCH >= BH-MF3-SEBR-BR-LO (S1) AND                          
                 WS-BRCH <= BH-MF3-SEBR-BR-HI (S1)                              
ET    **         MOVE BH-MF3-SEBR-CLEAR (S1)                                    
ET    **                                    TO  B1-BRKR-EXCTG-NBR               
ET               MOVE BH-MF3-SEBR-CLEAR (S1)                                    
ET                                          TO  B1-BRKR-EXCTG-NBR-X             
TEST******       DISPLAY 'EXCTG BRKR TBL HIT ' B1-BRKR-EXCTG-NBR-X              
TEST******           ' FOR BRANCH ' WS-BRCH                                     
                 SET RANGE-FOUND            TO  TRUE                            
                 SET STOP-OK                TO  TRUE                            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
       EJECT                                                                    
      ******************                                                        
       FORMAT-FR-RECORD.                                                        
      ******************                                                        
                                                                                
           INITIALIZE FR-RECORD.                                                
                                                                                
           MOVE FRR-CLIENT-NBR              TO  FR-CLIENT-NBR.                  
                                                                                
           MOVE '0001-01-01'                TO  FR-LOI-DT                       
                                                FR-SWP-PAC-EFFCT-DT             
                                                FR-CHCK-FRST-DT                 
                                                FR-PRCS-DT                      
                                                FR-CERT-DT                      
                                                FR-STTLM-ASCTD-DT               
                                                FR-STTLM-DT.                    
                                                                                
           IF FRR-ISIN-SEC-ISSUE-CD (1:2) = 'XX'                                
              MOVE SPACES                   TO  FR-ISIN-SEC-ISSUE-CD            
           ELSE                                                                 
              MOVE FRR-ISIN-SEC-ISSUE-CD    TO  FR-ISIN-SEC-ISSUE-CD            
           END-IF.                                                              
                                                                                
           IF FR-ISIN-SEC-ISSUE-CD = SPACES                                     
              MOVE SPACES                   TO  FR-ISIN-CNTRY-CD                
                                                FR-ISIN-SEC-CDG-CD              
           ELSE                                                                 
              MOVE FRR-ISIN-CNTRY-CD        TO  FR-ISIN-CNTRY-CD                
              MOVE FRR-ISIN-SEC-CDG-CD      TO  FR-ISIN-SEC-CDG-CD              
           END-IF.                                                              
                                                                                
           MOVE FRR-ACAT-CONTROL-NBR        TO  FR-ACAT-CONTROL-NBR.            
                                                                                
           MOVE FRR-ASSET-SEQ-NBR           TO  FR-ASSET-SEQ-NBR.               
                                                                                
           MOVE FRR-ASSET-QTY               TO  FR-ASSET-QTY.                   
                                                                                
           MOVE FRR-SBMTG-PRTCP-NBR         TO  FR-SBMTG-PRTCP-NBR.             
                                                                                
           MOVE FRR-SYS-RJCT-RSN-CD         TO  FR-SYS-RJCT-RSN-CD.             
                                                                                
           MOVE FRR-TRNFR-TYPE-CD            TO  FR-TRNFR-TYPE-CD.              
                                                                                
           MOVE FRR-ASSET-AMT                TO  FR-ASSET-AMT.                  
                                                                                
           MOVE FRR-ISO-CRNCY-CD             TO  FR-ISO-CRNCY-CD.               
                                                                                
           MOVE FRR-ASSET-DESC-TXT           TO  FR-ASSET-DESC-TXT.             
                                                                                
           MOVE FRR-NSCC-NON-ADP-IND         TO  FR-NSCC-NON-ADP-IND.           
                                                                                
           MOVE FRR-SECURITY-ADP-NBR         TO  FR-SECURITY-ADP-NBR.           
                                                                                
           MOVE FRR-DLVR-NBR                 TO  FR-DLVR-NBR.                   
                                                                                
           EVALUATE FRR-CSH-MGN-SHRT-CD                                         
              WHEN 'C'                                                          
                 MOVE '1'                    TO  WS-T                           
              WHEN 'M'                                                          
                 MOVE '2'                    TO  WS-T                           
              WHEN 'S'                                                          
                 MOVE '5'                    TO  WS-T                           
              WHEN OTHER                                                        
                 MOVE '1'                    TO  WS-T                           
           END-EVALUATE.                                                        
                                                                                
           CALL  CKDIGIT                  USING  WS-BRCH-ACCT                   
                                                 LENGTH-KEY                     
                                                 WS-C.                          
           IF WS-C NOT NUMERIC                                                  
              DISPLAY 'CLIENT = ' FR-CLIENT-NBR                                 
                      ' ACAT CONTROL = ' FR-ACAT-CONTROL-NBR                    
                      ' ACCOUNT = ' WS-BRCH-ACCT-TC                             
                      ' BAD CALL TO CKDIGIT'                                    
              MOVE SPACES                   TO  WS-C                            
           END-IF.                                                              
                                                                                
DJ0002     MOVE WS-BRCH-ACCT-TC TO W-CKDIGIT-ACCT-TC                            
DJ0002     IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                                   
DJ0002        MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1                     
DJ0002        IF W-CKDIGIT-TYPE = '1'                                           
DJ0002           CONTINUE                                                       
DJ0002        ELSE                                                              
DJ0002           MOVE '1'        TO W-CKDIGIT-TYPE-1                            
DJ0002           MOVE ' '        TO W-CKDIGIT-CK-1                              
DJ0002           CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                          
DJ0002                              W-CKDIGIT-LEN                               
DJ0002                              W-CKDIGIT-CK-1                              
DJ0002           DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC                
DJ0002                   ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1            
DJ0002        END-IF                                                            
DJ0002     END-IF.                                                              
                                                                                
           PERFORM READ-BNWREGOP.                                               
                                                                                
LRM003     IF (NTW-OMNIBUS-ACCT OR NTW-DST-MFE-ACCT                             
LRM013     OR  NTW-PNC-SURPAS-ACCT)                                             
LRM019     AND NOT NTW-SHWB-ACCT                                                
              PERFORM FORMAT-FR-FOR-OMNIBUS                                     
           ELSE                                                                 
              PERFORM FORMAT-FR-NON-OMNIBUS                                     
           END-IF.                                                              
                                                                                
LRM020***CALL BNW59NTL AND REPLACE NAME LINES, ETC WITH RETURNED VALUES         
LRM020     IF GETNA-OK                                                          
LRM020        PERFORM 0609-REG-SETUP-OPTION.                                    
                                                                                
DJ0004***--                                                                     
DJ0004***--USE MFEXBR FOR FR-BRKR-EXCTG-NBR IF B1 537483 = '1'                  
DJ0004     IF B1-EXBR-OPTION = '1'                                              
DJ0004         PERFORM READ-MFMSD                                               
DJ0004         PERFORM READ-MFEXBR                                              
DJ0004         IF W-MFEXBR-FND-SW = 'Y'                                         
DJ0004            MOVE EXBR-EXECUTING-BROKER                                    
DJ0004                                 TO FR-BRKR-EXCTG-NBR                     
DJ0004         END-IF                                                           
DJ0004     END-IF                                                               
                                                                                
LRM001     PERFORM FORMAT-W8-FIELDS                                             
              THRU FORMAT-W8-EXIT.                                              
           MOVE NA-IRA-IND TO FR-NA-IRA-IND.                                    
           MOVE PROCESSING-CODE OF BNWREGOP-RECORD                              
                                              TO FR-PROCESSING-CODE.            
LRM010     IF  BH-MFN-SOCIAL-CD-DEFAULT-OPT = '1'                               
LRM010         IF PROCESSING-CODE OF BNWREGOP-RECORD = ' '                      
LRM010         AND FR-NTWRK-CNTL-CD NOT = '3'                                   
LRM010            CONTINUE                                                      
LRM010         ELSE                                                             
LRM014         IF PROCESSING-CODE OF BNWREGOP-RECORD  = 'P'                     
LRM014            CONTINUE                                                      
LRM014         ELSE                                                             
LRM010            MOVE SPACE TO BMFSOCL-COMM-AREA                               
LRM010            MOVE FRR-CLIENT-NBR(2 : 3)   TO BMFSOCL-CLIENT                
LRM010            MOVE PROCESSING-CODE OF BNWREGOP-RECORD                       
LRM010                                         TO BMFSOCL-PROCESS-TYPE          
LRM010            IF BH-MF3-SOCIAL-CD-TYPE-OPTION = '1'                         
LRM010               MOVE NAPPA-ADT-CUSTOMER-TYPE                               
LRM010                                         TO BMFSOCL-ACCT-CLASS            
LRM010            ELSE                                                          
LRM010               MOVE NAPPA-ACCT-CLASS-EXP TO BMFSOCL-ACCT-CLASS            
LRM010            END-IF                                                        
LRM010            MOVE NAPPA-IRA-KEOUGH-IND TO BMFSOCL-IRA-CODE                 
LRM010            SET  BMFSOCL-REQ-SEARCH   TO TRUE                             
LRM010                                                                          
LRM010            CALL BMFSOCL   USING  BMFSOCL-COMM-AREA                       
LRM010                                                                          
LRM010            IF BMFSOCL-RETURN-FOUND                                       
TEST******           DISPLAY 'REPLACED SOCIAL CODE ' FR-SOC-CD                  
TEST******              ' WITH BMFSOCL ' BMFSOCL-SOCIAL-CODE                    
LRM010               MOVE BMFSOCL-SOCIAL-CODE TO FR-SOC-CD                      
LRM010            ELSE                                                          
LRMTST                DISPLAY 'BMFSOCL RETURN NG ' BMFSOCL-RETURN-CODE          
LRM010                 ' ' FRR-CLIENT-NBR (2:3)  ' '                            
LRM010                     WS-BRCH                                              
LRM010                     '-'                                                  
LRM010                     WS-ACCT                                              
LRM010     END-IF.                                                              
                                                                                
LRM011     MOVE SPACES               TO BNW59CTY-PARM-INFO.                     
LRM011     MOVE NAPPA-GEO-LOC        TO BNW59CTY-GEO-CODE.                      
LRM011     MOVE NAPPA-ALC            TO BNW59CTY-ALC-CODE.                      
LRM011     MOVE PROCESSING-CODE OF BNWREGOP-RECORD                              
LRM011                               TO BNW59CTY-PROCESSING-CODE.               
LRM011                                                                          
LRM011     CALL C-BNW59CTY USING BNW59CTY-PARM-INFO.                            
LRMTST     IF BNW59CTY-COUNTRY-OF-ORIGIN NOT = NA-CNTRY-ORGN-CD                 
LRMTST      DISPLAY 'AFTER BNW59CTY COUNTRY ' BNW59CTY-COUNTRY-OF-ORIGIN        
LRMTST                          ' REPLACES '  NA-CNTRY-ORGN-CD                  
LRM011        MOVE BNW59CTY-COUNTRY-OF-ORIGIN TO NA-CNTRY-ORGN-CD               
LRM011                                           FR-CNTRY-ORGN-CD.              
LRMTST     IF BNW59CTY-STATE-OF-SALE NOT = NA-SL-ST-CD                          
LRMTST      DISPLAY '      BNW59CTY STATE CODE ' BNW59CTY-STATE-OF-SALE         
LRMTST                          ' REPLACES '    NA-SL-ST-CD                     
LRM011        MOVE BNW59CTY-STATE-OF-SALE     TO NA-SL-ST-CD                    
LRM011                                           FR-SL-ST-CD.                   
LRM001 FORMAT-W8-FIELDS.                                                        
                                                                                
           MOVE '0001-01-01' TO FR-W8-CERT-DT                                   
                                FR-W8-EXPTN-DT                                  
           MOVE ZEROS        TO FR-W8-OVRD-NRA-SPC-RT.                          
                                                                                
       FORMAT-W8-EXIT. EXIT.                                                    
           EJECT                                                                
      ***********************                                                   
       FORMAT-FR-NON-OMNIBUS.                                                   
      ***********************                                                   
                                                                                
           MOVE SPACES                      TO  FR-CUST-NM.                     
                                                                                
           MOVE FRR-RCV-CUST-NM             TO  FR-CUST-NM.                     
                                                                                
TEST*****  DISPLAY 'USING B1 EXCTG IN FR CREATE ' B1-BRKR-EXCTG-NBR             
           MOVE B1-BRKR-EXCTG-NBR           TO  FR-BRKR-EXCTG-NBR.              
LRM019     IF NTW-SHWB-ACCT                                                     
LRM019        MOVE '0164'                     TO FR-BRKR-EXCTG-NBR              
LRM019     END-IF.                                                              
                                                                                
           MOVE NA-ACCT-RR-CD               TO  FR-ACCT-RR-CD.                  
                                                                                
           MOVE NA-ACCT-RR-NM               TO  FR-ACCT-RR-NM.                  
                                                                                
           MOVE B1-NTWRK-CNTL-CD            TO  FR-NTWRK-CNTL-CD.               
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '0'                      TO  FR-NTWRK-CNTL-CD                
           ELSE                                                                 
              MOVE B1-NTWRK-CNTL-CD         TO  FR-NTWRK-CNTL-CD                
           END-IF.                                                              
                                                                                
LRM019     IF NTW-SHWB-ACCT                                                     
LRM019        MOVE '3'                        TO  FR-NTWRK-CNTL-CD              
LRM019        MOVE 'S'                        TO  FR-MF-SCHWAB                  
LRM019     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              SELECT  DVDND_CD                                                  
                     ,LTCG_CD                                                   
                     ,STCG_CD                                                   
              INTO  :WS-DVDND-CD                                                
                   ,:WS-LTCG-CD                                                 
                   ,:WS-STCG-CD                                                 
              FROM   VMF                                                        
              WHERE  CLIENT_NBR       = :FRR-CLIENT-NBR       AND               
                     ACAT_CONTROL_NBR = :FRR-ACAT-CONTROL-NBR AND               
                     ASSET_SEQ_NBR    = :FRR-ASSET-SEQ-NBR                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              MOVE WS-DVDND-CD              TO  FR-DVDND-CD                     
              MOVE WS-LTCG-CD               TO  FR-LTCG-CD                      
              MOVE WS-STCG-CD               TO  FR-STCG-CD                      
           END-IF.                                                              
LRM016     IF FR-DVDND-CD NOT GREATER SPACES                                    
LRM016        DISPLAY 'NON OMNI DVDND-CD MISSING REPL W/B1 ' B1-DVDND-CD        
LRM016        MOVE B1-DVDND-CD              TO  FR-DVDND-CD                     
LRM016        MOVE B1-LTCG-CD               TO  FR-LTCG-CD                      
LRM016        MOVE B1-STCG-CD               TO  FR-STCG-CD                      
LRM016     END-IF.                                                              
LRM015*   SSR 70534 NEW B1 434741 TO CAUSE NON OMNI FUND DVDND                  
LRM015     IF BH-ACAT-MF-DIV-CD-NON-OMNIBUS  = '1'                              
LRM019     AND NOT NTW-SHWB-ACCT                                                
LRM015        DISPLAY 'REPL NON OMNI '                                          
LRM015         ' DVD '  B1-DVDND-CD ' WAS ' FR-DVDND-CD                         
LRM015         ' LTCG ' B1-LTCG-CD  ' WAS ' FR-LTCG-CD                          
LRM015         ' STGC ' B1-STCG-CD  ' WAS ' FR-STCG-CD                          
LRM015        MOVE B1-DVDND-CD                 TO  FR-DVDND-CD                  
LRM015        MOVE B1-LTCG-CD                  TO  FR-LTCG-CD                   
LRM015        MOVE B1-STCG-CD                  TO  FR-STCG-CD                   
LRM015     END-IF.                                                              
                                                                                
           MOVE SPACES                      TO  FR-BRCH-NBR.                    
LRM006     IF BH-MF3-ACTIVE                                                     
LRM006     AND BH-MF3-ALT-BR-TO-FUND-OPT = '1'                                  
DJ0003     AND (NOT NNARPB-SEGMENT-MISSING)                                     
LRM006        MOVE NNARPB-ALT-BRANCH        TO  FR-BRCH-NBR                     
LRM006     ELSE                                                                 
           MOVE FRR-ACCT-RCV-NBR (1:3)      TO  FR-BRCH-NBR.                    
                                                                                
           MOVE B1-NAV-ACCT-IND          TO  FR-NAV-ACCT-IND                    
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '06'                     TO  FR-SOC-CD                       
           ELSE                                                                 
              MOVE B1-SOC-CD                TO  FR-SOC-CD                       
           END-IF.                                                              
                                                                                
           MOVE NA-SL-ST-CD                 TO  FR-SL-ST-CD.                    
                                                                                
           MOVE NA-CNTRY-ORGN-CD            TO  FR-CNTRY-ORGN-CD.               
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE BH-MF-SS-BKR-NAME-REGISTR TO WS-SSN-PACKED                   
537326        MOVE WS-SSN-PACKED            TO  WS-SSN-UNPACKED                 
              MOVE WS-SSN-ALPHA             TO  FR-SS-TIN-NBR                   
              MOVE '0'                      TO  FR-SS-TIN-CD                    
           END-IF.                                                              
                                                                                
           MOVE NA-NRA-TAX                  TO  FR-NRA-TAX-PCT.                 
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '1'                      TO  FR-BK-PHSCL-SHR-CD              
           ELSE                                                                 
              IF FR-NTWRK-CNTL-CD = '1' OR '2' OR '3' OR '4'                    
                 MOVE '0'                   TO  FR-BK-PHSCL-SHR-CD              
              ELSE                                                              
                 MOVE B1-BK-PHSCL-SHR-CD    TO  FR-BK-PHSCL-SHR-CD              
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NTW-HOUSE-ACCT                                                    
LRM019     OR (NTW-SHWB-ACCT                                                    
LRM019     AND NTW-HOUSE-ACCOUNT > SPACES)                                      
              MOVE NTW-HOUSE-ACCOUNT        TO  FR-FNBR                         
           ELSE                                                                 
              IF (FR-NTWRK-CNTL-CD = '1' OR '2' OR '3' OR '4')                  
DJ0002          IF B1-SINGLE-FUND-ACCOUNT = '1'                                 
DJ0002             MOVE FR-CLIENT-NBR (2:3) TO FR-FNBR (1:3)                    
DJ0002             MOVE W-CKDIGIT-ACCT-TC-1 TO FR-FNBR (4:10)                   
DJ0002          ELSE                                                            
                   MOVE FR-CLIENT-NBR (2:3) TO FR-FNBR (1:3)                    
DJ0002             MOVE W-CKDIGIT-ACCT-TC   TO FR-FNBR (4:10)                   
DJ0002          END-IF                                                          
DJ0002        ELSE                                                              
                IF FR-NTWRK-CNTL-CD = '6'                                       
                   MOVE CUST-ACCT-NO        TO  FR-FNBR (4:10)                  
DJ0002          END-IF                                                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
DJ0002     IF  FR-FNBR = ' '                                                    
DJ0002         IF  B1-SINGLE-FUND-ACCOUNT = '1'                                 
DJ0002             MOVE FR-CLIENT-NBR (2:3) TO FR-FNBR (1:3)                    
DJ0002             MOVE W-CKDIGIT-ACCT-TC-1 TO FR-FNBR (4:10)                   
DJ0002         ELSE                                                             
DJ0002             MOVE FR-CLIENT-NBR (2:3) TO FR-FNBR (1:3)                    
DJ0002             MOVE W-CKDIGIT-ACCT-TC   TO FR-FNBR (4:10)                   
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
                                                                                
DJ0001***FUND ACCOUNT NUMBER                                                    
DJ0001***B1#434608 1 = BBBAAAAATC                                               
DJ0001     IF  B1-ACAT-MF-REG-FUND-ACCT = '1'                                   
LRM019     AND NOT NTW-SHWB-ACCT                                                
DJ0002         IF  B1-SINGLE-FUND-ACCOUNT = '1'                                 
DJ0002             MOVE W-CKDIGIT-ACCT-TC-1 TO FR-FNBR                          
DJ0002         ELSE                                                             
DJ0002             MOVE W-CKDIGIT-ACCT-TC   TO FR-FNBR                          
DJ0002         END-IF                                                           
DJ0001     END-IF.                                                              
                                                                                
           MOVE B1-PYBL-INFO-CD             TO  FR-PYBL-INFO-CD.                
                                                                                
           MOVE B1-CHCK-WRTNG-IND           TO  FR-CHCK-WRTNG-IND.              
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '2'                      TO  FR-MF-TRANS-TYPE-CD             
           ELSE                                                                 
511129        IF BH-BTS2-MF-REG-REQ-TRANS-TYPE = '1' OR '2' OR '3'              
                 MOVE BH-BTS2-MF-REG-REQ-TRANS-TYPE                             
                                            TO  FR-MF-TRANS-TYPE-CD             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE B1-FRCTN-CD                 TO  FR-FRCTN-CD.                    
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '2'                      TO  FR-FUND-ACCT-CD                 
           ELSE                                                                 
434614        MOVE BH-ACAT-MF-REG-FUND-ACCT-IND                                 
511129*       MOVE BH-BTS2-MF-REG-REQ-FND-ACT-IND                               
                                            TO  FR-FUND-ACCT-CD                 
           END-IF.                                                              
                                                                                
           MOVE B1-DLRVY-CD                 TO  FR-PI-DLRVY-CD                  
                                                FR-DLRVY-CD.                    
                                                                                
           MOVE B1-ACH-IND                  TO  FR-ACH-IND.                     
                                                                                
           MOVE B1-PAC-IND                  TO  FR-PAC-IND.                     
                                                                                
           MOVE B1-SWP-IND                  TO  FR-SWP-IND.                     
                                                                                
           MOVE B1-MRGN-ACCT-IND            TO  FR-MRGN-ACCT-IND.               
                                                                                
           MOVE B1-TRD-RLTD-IND             TO  FR-TRD-RLTD-IND.                
                                                                                
           MOVE B1-DSBMT-FRCTN-CSH-CD       TO  FR-DSBMT-FRCTN-CSH-CD.          
                                                                                
           MOVE B1-DSBMT-ACCRL-CD           TO  FR-DSBMT-ACCRL-CD.              
                                                                                
           MOVE B1-DSBMT-RSDL-CD            TO  FR-DSBMT-RSDL-CD.               
                                                                                
           MOVE NA-NM-END-LN-QTY            TO  FR-NM-END-LN-QTY.               
                                                                                
           MOVE 0                            TO  FR-DSBMT-AMT.                  
                                                                                
      *-----------------------------------------------------------------        
      * BY DEFAULT FR-FUND-BK-CD IS SPACES, THEREFORE THE CHECK FOR BOOK        
      * CODE IS OMITTED.                                                        
      *-----------------------------------------------------------------        
                                                                                
           EVALUATE FR-NTWRK-CNTL-CD                                            
           WHEN '0'                                                             
             IF NTW-HOUSE-ACCT                                                  
               MOVE 'BB'                      TO  FR-FUND-BK-CD                 
537311         MOVE BH-MF-BKR-NAME-REG-LINE-1 TO  FR-NA-LINE (1)                
537312         MOVE BH-MF-BKR-NAME-REG-LINE-2 TO  FR-NA-LINE (2)                
537313         MOVE BH-MF-BKR-NAME-REG-LINE-3 TO  FR-NA-LINE (3)                
537314         MOVE BH-MF-BKR-NAME-REG-LINE-4 TO  FR-NA-LINE (4)                
               MOVE SPACES                    TO  FR-NA-LINE (5)                
               MOVE SPACES                    TO  FR-NA-LINE (6)                
               MOVE BH-MF-SS-BKR-NAME-REGISTR TO  WS-SSN-PACKED                 
537326         MOVE WS-SSN-PACKED             TO  WS-SSN-UNPACKED               
               MOVE WS-SSN-ALPHA              TO  FR-SS-TIN-NBR                 
               MOVE '0'                       TO  FR-SS-TIN-CD                  
               MOVE 1                         TO  FR-NM-END-LN-QTY              
               PERFORM FIND-ZIP-CODE                                            
             ELSE                                                               
               MOVE 'BC'                      TO  FR-FUND-BK-CD                 
               PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                      
                 MOVE NA-LINE (S1)            TO  FR-NA-LINE (S1)               
               END-PERFORM                                                      
               MOVE NA-SOC-SEC-NBR            TO  FR-SS-TIN-NBR                 
               MOVE NA-SOC-SEC-CD             TO  FR-SS-TIN-CD                  
               MOVE NA-NM-END-LN-QTY          TO  FR-NM-END-LN-QTY              
             END-IF                                                             
           WHEN '1'                                                             
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                       
                 MOVE NA-LINE (S1)           TO  FR-NA-LINE (S1)                
              END-PERFORM                                                       
              IF NA-IRA-IND = 'Y'                                               
537533           MOVE BH-MFN-IRA-TAX-ID      TO  WS-SSN-PACKED                  
                 MOVE WS-SSN-PACKED          TO  WS-SSN-UNPACKED                
                 MOVE WS-SSN-ALPHA           TO  FR-SS-TIN-NBR                  
                 MOVE '0'                    TO  FR-SS-TIN-CD                   
              ELSE                                                              
                 MOVE NA-SOC-SEC-NBR        TO  FR-SS-TIN-NBR                   
                 MOVE NA-SOC-SEC-CD         TO  FR-SS-TIN-CD                    
537503           IF BH-MFN-REGIS-SETUP-OPT = '7'                                
537536              MOVE BH-MFN-STR-NAME-REG-LINE-3 (21:5)                      
                                            TO  FR-ZIP5-CD                      
                    MOVE BH-MFN-STR-NAME-REG-LINE-3 (27:4)                      
                                            TO  FR-ZIP4-CD                      
                 ELSE                                                           
                    MOVE NA-ZIP (1:5)       TO  FR-ZIP5-CD                      
                    MOVE NA-ZIP (6:4)       TO  FR-ZIP4-CD                      
                 END-IF                                                         
              END-IF                                                            
              MOVE NA-NAME-IND              TO  FR-NM-END-LN-QTY                
           WHEN '2'                                                             
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                       
                 MOVE NA-LINE (S1)          TO  FR-NA-LINE (S1)                 
              END-PERFORM                                                       
              MOVE NA-SOC-SEC-NBR           TO  FR-SS-TIN-NBR                   
              MOVE NA-SOC-SEC-CD            TO  FR-SS-TIN-CD                    
              MOVE NA-NAME-IND              TO  FR-NM-END-LN-QTY                
           WHEN '3'                                                             
              IF NTW-HOUSE-REG  = '6'                                           
                 IF NA-IRA-IND = 'Y'                                            
                    PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                 
                       MOVE NA-LINE (S1)    TO  FR-NA-LINE (S1)                 
                    END-PERFORM                                                 
537532              MOVE BH-MFN-STREET-NAME-TAX-ID                              
                                            TO  WS-SSN-PACKED                   
                    MOVE WS-SSN-PACKED      TO  WS-SSN-UNPACKED                 
                    MOVE WS-SSN-ALPHA       TO  FR-SS-TIN-NBR                   
                    MOVE '0'                TO  FR-SS-TIN-CD                    
                    MOVE NA-ZIP (1:5)       TO  FR-ZIP5-CD                      
                    MOVE NA-ZIP (6:4)       TO  FR-ZIP4-CD                      
                    MOVE NA-NAME-IND        TO  FR-NM-END-LN-QTY                
                 ELSE                                                           
LRM009              ADD 1 TO NA-NAME-IND                                        
537534              MOVE BH-MFN-STR-NAME-REG-LINE-1                             
                                            TO  FR-NA-LINE (1)                  
TRDEL               DISPLAY '### FR-CLIENT-NBR = ' FR-CLIENT-NBR                
TRDEL                       ' CONTROL-NBR = ' FR-ACAT-CONTROL-NBR               
540207              IF BH-MF3-REG-NA-LINE-DROP-OPT NUMERIC                      
LRM008              AND BH-MF3-REG-NA-LINE-DROP-OPT > ZERO                      
LRM008              AND BH-MF3-REG-NA-LINE-DROP-OPT < 6                         
LRM008              AND NA-LINE (6) > SPACE                                     
LRM008                 PERFORM 2595-SETUP-NA-LINES                              
LRM009                 SUBTRACT 1 FROM NA-NAME-IND                              
LRM008              ELSE                                                        
                       PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 5              
                          MOVE NA-LINE (S1)    TO  FR-NA-LINE (S1 + 1)          
                       END-PERFORM                                              
LRM008              END-IF                                                      
537533              MOVE BH-MFN-IRA-TAX-ID  TO  WS-SSN-PACKED                   
                    MOVE WS-SSN-PACKED      TO  WS-SSN-UNPACKED                 
                    MOVE WS-SSN-ALPHA       TO  FR-SS-TIN-NBR                   
                    MOVE '0'                TO  FR-SS-TIN-CD                    
                    PERFORM FIND-ZIP-CODE                                       
LRM009              MOVE NA-NAME-IND        TO  FR-NM-END-LN-QTY                
LRM009****          IF NA-NAME-IND > 1                                          
LRM009****             MOVE 3               TO  FR-NM-END-LN-QTY                
LRM009****          ELSE                                                        
LRM009****             MOVE 2               TO  FR-NM-END-LN-QTY                
LRM009****          END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
537503           EVALUATE BH-MFN-REGIS-SETUP-OPT                                
                 WHEN '0'                                                       
                    PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                 
                       MOVE NA-LINE (S1)    TO  FR-NA-LINE (S1)                 
                    END-PERFORM                                                 
                    MOVE NA-SOC-SEC-NBR     TO  FR-SS-TIN-NBR                   
                    MOVE NA-SOC-SEC-CD      TO  FR-SS-TIN-CD                    
                    MOVE NA-ZIP (1:5)       TO  FR-ZIP5-CD                      
                    MOVE NA-ZIP (6:4)       TO  FR-ZIP4-CD                      
                    MOVE NA-NAME-IND        TO  FR-NM-END-LN-QTY                
                 WHEN '1'                                                       
537534              MOVE BH-MFN-STR-NAME-REG-LINE-1                             
                                            TO  FR-NA-LINE (1)                  
537535              MOVE BH-MFN-STR-NAME-REG-LINE-2                             
                                            TO  FR-NA-LINE (2)                  
537536              MOVE BH-MFN-STR-NAME-REG-LINE-3                             
                                            TO  FR-NA-LINE (3)                  
537537              MOVE BH-MFN-STR-NAME-REG-LINE-4                             
                                            TO  FR-NA-LINE (4)                  
                    MOVE SPACES             TO  FR-NA-LINE (5)                  
                    MOVE SPACES             TO  FR-NA-LINE (6)                  
537532              MOVE BH-MFN-STREET-NAME-TAX-ID                              
                                            TO  WS-SSN-PACKED                   
                    MOVE WS-SSN-PACKED      TO  WS-SSN-UNPACKED                 
                    MOVE WS-SSN-ALPHA       TO  FR-SS-TIN-NBR                   
                    MOVE '0'                TO  FR-SS-TIN-CD                    
                    MOVE 1                  TO  FR-NM-END-LN-QTY                
                    PERFORM FIND-ZIP-CODE                                       
                 WHEN '2'                                                       
537534              MOVE BH-MFN-STR-NAME-REG-LINE-1                             
                                            TO  FR-NA-LINE (1)                  
                    INSPECT FR-NA-LINE (1)                                      
                       REPLACING LEADING '    ' BY ' FBO'                       
DJ0001              MOVE NA-LINE (1)        TO  FR-NA-LINE (2)                  
537535              MOVE BH-MFN-STR-NAME-REG-LINE-2                             
                                            TO  FR-NA-LINE (3)                  
537536              MOVE BH-MFN-STR-NAME-REG-LINE-3                             
                                            TO  FR-NA-LINE (4)                  
537537              MOVE BH-MFN-STR-NAME-REG-LINE-4                             
                                            TO  FR-NA-LINE (5)                  
                    MOVE SPACES             TO  FR-NA-LINE (6)                  
537532              MOVE BH-MFN-STREET-NAME-TAX-ID                              
                                            TO  WS-SSN-PACKED                   
                    MOVE WS-SSN-PACKED      TO  WS-SSN-UNPACKED                 
                    MOVE WS-SSN-ALPHA       TO  FR-SS-TIN-NBR                   
                    MOVE '0'                TO  FR-SS-TIN-CD                    
                    MOVE 2                  TO  FR-NM-END-LN-QTY                
                    PERFORM FIND-ZIP-CODE                                       
                 WHEN '3'                                                       
                    IF NA-IRA-IND = 'Y'                                         
537538                 MOVE BH-MFN-IRA-REG-LINE-1                               
                                             TO  FR-NA-LINE (1)                 
                       MOVE WS-BRCH          TO  FR-NA-LINE (2) (1:3)           
                       MOVE '-'              TO  FR-NA-LINE (2) (4:10)          
                       MOVE WS-ACCT          TO  FR-NA-LINE (2) (5:5)           
                       MOVE '-'              TO  FR-NA-LINE (2) (10:1)          
                       MOVE WS-T             TO  FR-NA-LINE (2) (11:1)          
                       MOVE WS-C             TO  FR-NA-LINE (2) (12:1)          
                       MOVE SPACES           TO  FR-NA-LINE (2) (13:18)         
537539                 MOVE BH-MFN-IRA-REG-LINE-2                               
                                             TO  FR-NA-LINE (3)                 
537540                 MOVE BH-MFN-IRA-REG-LINE-3                               
                                             TO  FR-NA-LINE (4)                 
537541                 MOVE BH-MFN-IRA-REG-LINE-4                               
                                             TO  FR-NA-LINE (5)                 
                       MOVE SPACES           TO  FR-NA-LINE (6)                 
537533                 MOVE BH-MFN-IRA-TAX-ID TO WS-SSN-PACKED                  
                       MOVE WS-SSN-PACKED    TO  WS-SSN-UNPACKED                
                       MOVE WS-SSN-ALPHA     TO  FR-SS-TIN-NBR                  
                       MOVE '0'              TO  FR-SS-TIN-CD                   
                       MOVE 1                TO  FR-NM-END-LN-QTY               
                    ELSE                                                        
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
                                             TO  FR-NA-LINE (1)                 
                       MOVE WS-BRCH          TO  FR-NA-LINE (2) (1:3)           
                       MOVE '-'              TO  FR-NA-LINE (2) (4:1)           
                       MOVE WS-ACCT          TO  FR-NA-LINE (2) (5:5)           
                       MOVE '-'              TO  FR-NA-LINE (2) (10:1)          
                       MOVE WS-T             TO  FR-NA-LINE (2) (11:1)          
                       MOVE WS-C             TO  FR-NA-LINE (2) (12:1)          
                       MOVE SPACES           TO  FR-NA-LINE (2) (13:18)         
537535                 MOVE BH-MFN-STR-NAME-REG-LINE-2                          
                                             TO  FR-NA-LINE (3)                 
537536                 MOVE BH-MFN-STR-NAME-REG-LINE-3                          
                                             TO  FR-NA-LINE (4)                 
537537                 MOVE BH-MFN-STR-NAME-REG-LINE-4                          
                                             TO  FR-NA-LINE (5)                 
                       MOVE SPACES           TO  FR-NA-LINE (6)                 
537532                 MOVE BH-MFN-STREET-NAME-TAX-ID                           
                                             TO  WS-SSN-PACKED                  
                       MOVE WS-SSN-PACKED    TO  WS-SSN-UNPACKED                
                       MOVE WS-SSN-ALPHA     TO  FR-SS-TIN-NBR                  
                       MOVE '0'              TO  FR-SS-TIN-CD                   
                       MOVE 1                TO  FR-NM-END-LN-QTY               
                    END-IF                                                      
                    INSPECT FR-NA-LINE (1)                                      
                       REPLACING LEADING '    ' BY ' FBO'                       
                    PERFORM FIND-ZIP-CODE                                       
                 WHEN '4'                                                       
                    IF NA-IRA-IND = 'Y'                                         
537538                 MOVE BH-MFN-IRA-REG-LINE-1                               
                                            TO  FR-NA-LINE (1)                  
                       MOVE 'IRA CUST FBO'  TO  FR-NA-LINE (2)                  
                       MOVE NA-LINE (1)     TO  FR-NA-LINE (3)                  
537539                 MOVE BH-MFN-IRA-REG-LINE-2                               
                                            TO  FR-NA-LINE (4)                  
537540                 MOVE BH-MFN-IRA-REG-LINE-3                               
                                            TO  FR-NA-LINE (5)                  
537541                 MOVE BH-MFN-IRA-REG-LINE-4                               
                                            TO  FR-NA-LINE (6)                  
537533                 MOVE BH-MFN-IRA-TAX-ID                                   
                                            TO WS-SSN-PACKED                    
                       MOVE WS-SSN-PACKED   TO  WS-SSN-UNPACKED                 
                       MOVE WS-SSN-ALPHA    TO  FR-SS-TIN-NBR                   
                       MOVE '0'             TO  FR-SS-TIN-NBR                   
                       MOVE 3               TO  FR-NM-END-LN-QTY                
                    ELSE                                                        
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
                                            TO  FR-NA-LINE (1)                  
                       MOVE NA-LINE (1)     TO  FR-NA-LINE (2)                  
537535                 MOVE BH-MFN-STR-NAME-REG-LINE-2                          
                                            TO  FR-NA-LINE (3)                  
537536                 MOVE BH-MFN-STR-NAME-REG-LINE-3                          
                                            TO  FR-NA-LINE (4)                  
537537                 MOVE BH-MFN-STR-NAME-REG-LINE-4                          
                                            TO  FR-NA-LINE (5)                  
                       MOVE SPACES          TO  FR-NA-LINE (6)                  
537532                 MOVE BH-MFN-STREET-NAME-TAX-ID                           
                                            TO  WS-SSN-PACKED                   
                       MOVE WS-SSN-PACKED   TO  WS-SSN-UNPACKED                 
                       MOVE WS-SSN-ALPHA    TO  FR-SS-TIN-NBR                   
                       MOVE '0'             TO  FR-SS-TIN-CD                    
                       MOVE 2               TO  FR-NM-END-LN-QTY                
                    END-IF                                                      
                    INSPECT NA-LINE (1)                                         
                       REPLACING LEADING '    ' BY ' FBO'                       
                    PERFORM FIND-ZIP-CODE                                       
                 WHEN '5'                                                       
537538              MOVE BH-MFN-IRA-REG-LINE-1                                  
                                            TO  FR-NA-LINE (1)                  
                    MOVE 'FBO '             TO  FR-NA-LINE (2) (1:4)            
                    MOVE WS-BRCH            TO  FR-NA-LINE (2) (5:3)            
                    MOVE '-'                TO  FR-NA-LINE (2) (8:1)            
                    MOVE WS-ACCT            TO  FR-NA-LINE (2) (9:5)            
                    MOVE '-'                TO  FR-NA-LINE (2) (14:1)           
                    MOVE WS-T               TO  FR-NA-LINE (2) (15:1)           
                    MOVE WS-C               TO  FR-NA-LINE (2) (16:1)           
                    MOVE SPACES             TO  FR-NA-LINE (2) (17:14)          
537539              MOVE BH-MFN-IRA-REG-LINE-2                                  
                                            TO  FR-NA-LINE (3)                  
537540              MOVE BH-MFN-IRA-REG-LINE-3                                  
                                            TO  FR-NA-LINE (4)                  
537541              MOVE BH-MFN-IRA-REG-LINE-4                                  
                                            TO  FR-NA-LINE (5)                  
                    MOVE SPACES             TO  FR-NA-LINE (6)                  
537533              MOVE BH-MFN-IRA-TAX-ID  TO  WS-SSN-PACKED                   
                    MOVE WS-SSN-PACKED      TO  WS-SSN-UNPACKED                 
                    MOVE WS-SSN-ALPHA       TO  FR-SS-TIN-NBR                   
                    MOVE '0'                TO  FR-SS-TIN-CD                    
                    MOVE 1                  TO  FR-NM-END-LN-QTY                
                    PERFORM FIND-ZIP-CODE                                       
                 WHEN '7'                                                       
                    IF NA-NAME-IND > 1                                          
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
                                            TO  FR-NA-LINE (1)                  
                       MOVE NA-LINE (1)     TO  FR-NA-LINE (2)                  
                       MOVE NA-LINE (2)     TO  FR-NA-LINE (3)                  
                       MOVE 'EDJ# '         TO  FR-NA-LINE (4) (1:5)            
                       MOVE WS-BRCH         TO  FR-NA-LINE (4) (6:3)            
                       MOVE '-'             TO  FR-NA-LINE (4) (9:1)            
                       MOVE WS-ACCT         TO  FR-NA-LINE (4) (10:5)           
                       MOVE '-'             TO  FR-NA-LINE (4) (15:1)           
                       MOVE WS-T            TO  FR-NA-LINE (4) (16:1)           
                       MOVE WS-C            TO  FR-NA-LINE (4) (17:1)           
                       MOVE SPACES          TO  FR-NA-LINE (4) (19:13)          
537535                 MOVE BH-MFN-STR-NAME-REG-LINE-2                          
                                            TO  FR-NA-LINE (5)                  
537536                 MOVE BH-MFN-STR-NAME-REG-LINE-3                          
                                             TO  FR-NA-LINE (6)                 
537532                 MOVE BH-MFN-STREET-NAME-TAX-ID                           
                                             TO  WS-SSN-PACKED                  
                       MOVE WS-SSN-PACKED    TO  WS-SSN-UNPACKED                
                       MOVE WS-SSN-ALPHA     TO  FR-SS-TIN-NBR                  
                       MOVE '0'              TO  FR-SS-TIN-CD                   
                       MOVE 3                TO  FR-NM-END-LN-QTY               
                    ELSE                                                        
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
                                             TO  FR-NA-LINE (1)                 
                       MOVE NA-LINE (1)      TO  FR-NA-LINE (2)                 
                       MOVE 'EDJ# '          TO  FR-NA-LINE (3) (1:5)           
                       MOVE WS-BRCH          TO  FR-NA-LINE (3) (6:3)           
                       MOVE '-'              TO  FR-NA-LINE (3) (9:1)           
                       MOVE WS-ACCT          TO  FR-NA-LINE (3) (10:5)          
                       MOVE '-'              TO  FR-NA-LINE (3) (15:1)          
                       MOVE WS-T             TO  FR-NA-LINE (3) (16:1)          
                       MOVE WS-C             TO  FR-NA-LINE (3) (17:1)          
                       MOVE SPACES           TO  FR-NA-LINE (3) (19:13)         
537535                 MOVE BH-MFN-STR-NAME-REG-LINE-2                          
                                             TO  FR-NA-LINE (4)                 
537536                 MOVE BH-MFN-STR-NAME-REG-LINE-3                          
                                             TO  FR-NA-LINE (5)                 
                       MOVE SPACES           TO  FR-NA-LINE (6)                 
537532                 MOVE BH-MFN-STREET-NAME-TAX-ID                           
                                             TO  WS-SSN-PACKED                  
                       MOVE WS-SSN-PACKED    TO  WS-SSN-UNPACKED                
                       MOVE WS-SSN-ALPHA     TO  FR-SS-TIN-NBR                  
                       MOVE '0'              TO  FR-SS-TIN-CD                   
                       MOVE 2                TO  FR-NM-END-LN-QTY               
                    END-IF                                                      
537536              MOVE BH-MFN-STR-NAME-REG-LINE-3 (21:5)                      
                                             TO  FR-ZIP5-CD                     
537536              MOVE BH-MFN-STR-NAME-REG-LINE-3 (27:4)                      
                                             TO  FR-ZIP4-CD                     
LRM007           WHEN '8'                                                       
LRM009                 ADD 1 TO NA-NAME-IND                                     
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
LRM007                                       TO  FR-NA-LINE (1)                 
540207                 IF BH-MF3-REG-NA-LINE-DROP-OPT NUMERIC                   
LRM008                 AND BH-MF3-REG-NA-LINE-DROP-OPT > ZERO                   
LRM008                 AND BH-MF3-REG-NA-LINE-DROP-OPT < 6                      
LRM008                 AND NA-LINE (6) > SPACE                                  
LRM008                    PERFORM 2595-SETUP-NA-LINES                           
LRM009                    SUBTRACT 1 FROM NA-NAME-IND                           
LRM008                 ELSE                                                     
LRM007                    MOVE NA-LINE (1)      TO  FR-NA-LINE (2)              
LRM007                    MOVE NA-LINE (2)      TO  FR-NA-LINE (3)              
LRM007                    MOVE NA-LINE (3)      TO  FR-NA-LINE (4)              
LRM007                    MOVE NA-LINE (4)      TO  FR-NA-LINE (5)              
LRM007                    MOVE NA-LINE (5)      TO  FR-NA-LINE (6)              
LRN008                 END-IF                                                   
LRM007                 MOVE NA-SOC-SEC-NBR   TO  FR-SS-TIN-NBR                  
LRM007                 MOVE NA-SOC-SEC-CD    TO  FR-SS-TIN-CD                   
LRM009                 MOVE NA-NAME-IND      TO  FR-NM-END-LN-QTY               
LRM007*****            MOVE 2                TO  FR-NM-END-LN-QTY               
LRM007                 PERFORM FIND-ZIP-CODE                                    
LRM007           WHEN '9'                                                       
LRM007              IF NA-IRA-IND = 'Y'                                         
LRM009                 IF NA-NAME-IND < 3                                       
LRM009                    ADD 1 TO NA-NAME-IND                                  
LRM009                 END-IF                                                   
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
LRM007                                       TO  FR-NA-LINE (1)                 
LRM007                 MOVE NA-LINE (1)      TO  FR-NA-LINE (2)                 
LRM007                 MOVE NA-LINE (2)      TO  FR-NA-LINE (3)                 
LRM007                 MOVE NA-LINE (4)      TO  FR-NA-LINE (4)                 
LRM007                 MOVE NA-LINE (5)      TO  FR-NA-LINE (5)                 
LRM007                 MOVE NA-LINE (6)      TO  FR-NA-LINE (6)                 
LRM007*****            MOVE 4                TO  FR-NM-END-LN-QTY               
LRM008              ELSE                                                        
LRM009                 ADD 1 TO NA-NAME-IND                                     
537534                 MOVE BH-MFN-STR-NAME-REG-LINE-1                          
LRM008                                       TO  FR-NA-LINE (1)                 
540207                 IF BH-MF3-REG-NA-LINE-DROP-OPT NUMERIC                   
LRM008                 AND BH-MF3-REG-NA-LINE-DROP-OPT > ZERO                   
LRM008                 AND BH-MF3-REG-NA-LINE-DROP-OPT < 6                      
LRM008                 AND NA-LINE (6) > SPACE                                  
LRM008                    PERFORM 2595-SETUP-NA-LINES                           
LRM009                    SUBTRACT 1 FROM NA-NAME-IND                           
LRM008                 ELSE                                                     
LRM007                    MOVE NA-LINE (1)      TO  FR-NA-LINE (2)              
LRM007                    MOVE NA-LINE (2)      TO  FR-NA-LINE (3)              
LRM007                    MOVE NA-LINE (3)      TO  FR-NA-LINE (4)              
LRM007                    MOVE NA-LINE (4)      TO  FR-NA-LINE (5)              
LRM007                    MOVE NA-LINE (5)      TO  FR-NA-LINE (6)              
LRM008                 END-IF                                                   
LRM007*****            MOVE 2                TO  FR-NM-END-LN-QTY               
LRM008              END-IF                                                      
LRM009              MOVE NA-NAME-IND      TO  FR-NM-END-LN-QTY                  
LRM007              MOVE NA-SOC-SEC-NBR   TO  FR-SS-TIN-NBR                     
LRM007              MOVE NA-SOC-SEC-CD    TO  FR-SS-TIN-CD                      
LRM007              PERFORM FIND-ZIP-CODE                                       
                 WHEN OTHER                                                     
                    PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                 
                       MOVE NA-LINE (S1)     TO  FR-NA-LINE (S1)                
                    END-PERFORM                                                 
LRM025              IF BH-MFN-REGIS-SETUP-OPT = 'A'                             
LRM025                 MOVE NA-SOC-SEC-NBR   TO  FR-SS-TIN-NBR                  
LRM025                 MOVE NA-SOC-SEC-CD    TO  FR-SS-TIN-CD                   
LRM025              ELSE                                                        
                    IF NA-IRA-IND = 'Y'                                         
537533                 MOVE BH-MFN-IRA-TAX-ID TO WS-SSN-PACKED                  
                       MOVE WS-SSN-PACKED    TO  WS-SSN-UNPACKED                
                       MOVE WS-SSN-ALPHA     TO  FR-SS-TIN-NBR                  
LRM007                 MOVE '0'              TO  FR-SS-TIN-CD                   
                    ELSE                                                        
                       MOVE NA-SOC-SEC-NBR   TO  FR-SS-TIN-NBR                  
                       MOVE NA-SOC-SEC-CD    TO  FR-SS-TIN-CD                   
                    END-IF                                                      
LRM025              END-IF                                                      
TEST                DISPLAY 'IN OTHER 537506 = ? ' NA-ZIP (1:5)                 
                    MOVE NA-ZIP (1:5)        TO  FR-ZIP5-CD                     
                    MOVE NA-ZIP (6:4)        TO  FR-ZIP4-CD                     
                    MOVE NA-NAME-IND         TO  FR-NM-END-LN-QTY               
                 END-EVALUATE                                                   
              END-IF                                                            
           WHEN '4'                                                             
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                       
                 MOVE NA-LINE (S1)          TO  FR-NA-LINE (S1)                 
              END-PERFORM                                                       
              MOVE NA-SOC-SEC-NBR           TO  FR-SS-TIN-NBR                   
              MOVE NA-SOC-SEC-CD            TO  FR-SS-TIN-CD                    
537402        IF BH-MF-CUSTODIAN-ACCOUNT-TIN > 0   AND                          
                (NA-IRA-VALUE = '1' OR '2' OR '3' OR '4' OR '5' OR              
                                'X' OR 'H' OR 'J' OR 'O' OR 'Z' OR              
                                'I' OR 'W')                                     
                 MOVE BH-MF-CUSTODIAN-ACCOUNT-TIN                               
                                            TO  FR-SS-TIN-NBR                   
                 MOVE '0'                   TO  FR-SS-TIN-CD                    
              END-IF                                                            
              MOVE NA-ZIP (1:5)             TO  FR-ZIP5-CD                      
              MOVE NA-ZIP (1:4)             TO  FR-ZIP4-CD                      
              MOVE NA-NAME-IND              TO  FR-NM-END-LN-QTY                
           END-EVALUATE.                                                        
                                                                                
501363     IF BH-BTS-ACAT-AMFR-FUND-ACCT = '0'                                  
LRM019     OR NTW-SHWB-ACCT                                                     
               CONTINUE                                                         
           ELSE                                                                 
              IF NA-NAME-IND > 1                                                
537534           MOVE BH-MFN-STR-NAME-REG-LINE-1                                
                                            TO  FR-NA-LINE (1)                  
                 MOVE NA-LINE (1)           TO  FR-NA-LINE (2)                  
                 MOVE NA-LINE (2)           TO  FR-NA-LINE (3)                  
                 MOVE 'EDJ# '               TO  FR-NA-LINE (4) (1:5)            
                 MOVE WS-BRCH               TO  FR-NA-LINE (4) (6:3)            
                 MOVE '-'                   TO  FR-NA-LINE (4) (9:1)            
                 MOVE WS-ACCT               TO  FR-NA-LINE (4) (10:5)           
                 MOVE '-'                   TO  FR-NA-LINE (4) (15:1)           
                 MOVE WS-T                  TO  FR-NA-LINE (4) (16:1)           
                 MOVE WS-C                  TO  FR-NA-LINE (4) (17:1)           
                 MOVE SPACES                TO  FR-NA-LINE (4) (19:3)           
537535           MOVE BH-MFN-STR-NAME-REG-LINE-2                                
                                            TO  FR-NA-LINE (5)                  
537536           MOVE BH-MFN-STR-NAME-REG-LINE-2                                
                                            TO  FR-NA-LINE (6)                  
537532           MOVE BH-MFN-STREET-NAME-TAX-ID                                 
                                            TO  WS-SSN-PACKED                   
                 MOVE WS-SSN-PACKED         TO  WS-SSN-UNPACKED                 
                 MOVE WS-SSN-ALPHA          TO  FR-SS-TIN-NBR                   
                 MOVE '0'                   TO  FR-SS-TIN-CD                    
                 MOVE 3                     TO  FR-NM-END-LN-QTY                
              ELSE                                                              
537534           MOVE BH-MFN-STR-NAME-REG-LINE-1                                
                                            TO  FR-NA-LINE (1)                  
                 MOVE NA-LINE (1)           TO  FR-NA-LINE (2)                  
                 MOVE 'EDJ# '               TO  FR-NA-LINE (3) (1:5)            
                 MOVE WS-BRCH               TO  FR-NA-LINE (3) (6:3)            
                 MOVE '-'                   TO  FR-NA-LINE (3) (9:1)            
                 MOVE WS-ACCT               TO  FR-NA-LINE (3) (10:5)           
                 MOVE '-'                   TO  FR-NA-LINE (3) (16:2)           
                 MOVE WS-T                  TO  FR-NA-LINE (3) (19:1)           
                 MOVE WS-C                  TO  FR-NA-LINE (3) (20:1)           
                 MOVE SPACES                TO  FR-NA-LINE (3) (22:13)          
537535           MOVE BH-MFN-STR-NAME-REG-LINE-2                                
                                            TO  FR-NA-LINE (4)                  
537536           MOVE BH-MFN-STR-NAME-REG-LINE-3                                
                                            TO  FR-NA-LINE (5)                  
                 MOVE SPACES                TO  FR-NA-LINE (6)                  
537532           MOVE BH-MFN-STREET-NAME-TAX-ID                                 
                                            TO  WS-SSN-PACKED                   
                 MOVE WS-SSN-PACKED         TO  WS-SSN-UNPACKED                 
                 MOVE WS-SSN-ALPHA          TO  FR-SS-TIN-NBR                   
                 MOVE '0'                   TO  FR-SS-TIN-CD                    
                 MOVE 2                     TO  FR-NM-END-LN-QTY                
              END-IF                                                            
TEST********  DISPLAY 'OVERRIDE ZIP BY 537536 '                                 
537536        MOVE BH-MFN-STR-NAME-REG-LINE-3 (21:5)                            
                                            TO  FR-ZIP5-CD                      
537536        MOVE BH-MFN-STR-NAME-REG-LINE-3 (27:4)                            
                                            TO  FR-ZIP4-CD                      
           END-IF.                                                              
                                                                                
           IF NTW-HOUSE-ACCT                                                    
              MOVE '0'                      TO  FR-WTHLD-CD                     
           ELSE                                                                 
              MOVE SPACES                   TO  TAXW-SEARCH-KEY                 
              MOVE NA-WITHHOLD              TO  TAXW-NA-WITHHOLDING-IND         
              MOVE NA-IRA-IND               TO  TAXW-IRA-IND                    
              MOVE FR-NTWRK-CNTL-CD         TO  TAXW-MATRIX-LEVEL               
              MOVE NA-SOC-SEC-NBR           TO  TAXW-SS-OR-TAX                  
              MOVE FR-FUND-BK-CD            TO  TAXW-BOOK-CODE                  
              PERFORM 8000-TRANSLATE-TAX                                        
              MOVE TAXW-NSCC-WITHHOLDING-IND TO FR-WTHLD-CD                     
           END-IF.                                                              
                                                                                
TCK001*** ---- MAIN LOGIC FOR SSR#1733500 -----------------------***            
TCK001*** *** CORRECT THE PROBLEM THAT WHEN A MUTUAL FUND REGISTRATION          
TCK001******* IS SENT,THE SYSTEM WILL DEFAULT THE ACCOUNT TO A 'NEW             
TCK001******* ACCOUNT'                                                          
TCK001                                                                          
TCK001     PERFORM READ-BNWMAST.                                                
TCK001                                                                          
TCK001     IF NTW-HOUSE-ACCT                                                    
TCK001        CONTINUE                                                          
TCK001     ELSE                                                                 
TCK001        IF BNWMAST-OKAY                                                   
TCK001           IF NAPPA-GEO-LOC NUMERIC                                       
TCK001              IF ((NAPPA-GEO-LOC > '000' AND                              
TCK001                   NAPPA-GEO-LOC < '900')     OR                          
TCK001                 (NAPPA-GEO-LOC > '979' AND                               
TCK001                   NAPPA-GEO-LOC < '998')     OR                          
LRM021                  NAPPA-GEO-LOC = '999')                                  
TCK001                  MOVE '3' TO FR-FUND-ACCT-CD                             
TCK001                  MOVE '2' TO FR-MF-TRANS-TYPE-CD                         
LRM021                  IF NAPPA-GEO-LOC = '999'                                
LRM021                     DISPLAY 'GEO999 ACCT-CD = 3'                         
LRM021                  END-IF                                                  
TCK001              ELSE                                                        
TCK001                  IF (NAPPA-GEO-LOC > '900' AND                           
TCK001                      NAPPA-GEO-LOC < '956')                              
LRM005************* OR      NAPPA-GEO-LOC = '969'                               
TCK001                      MOVE '2' TO FR-FUND-ACCT-CD                         
TCK001                      MOVE '2' TO FR-MF-TRANS-TYPE-CD                     
LRM005                  ELSE                                                    
LRM005                      IF NAPPA-GEO-LOC = '969'                            
LRM005                         MOVE '5' TO FR-FUND-ACCT-CD                      
LRM005                         MOVE '2' TO FR-MF-TRANS-TYPE-CD                  
LRM005                      END-IF                                              
LRM005                  END-IF                                                  
LRM005              END-IF                                                      
TCK001           ELSE                                                           
TCK001               MOVE '0' TO FR-FUND-ACCT-CD                                
TCK001               MOVE '1' TO FR-MF-TRANS-TYPE-CD                            
TCK001           END-IF                                                         
TCK001        ELSE                                                              
TCK001           IF NAPPA-GEO-LOC NUMERIC                                       
TCK001              IF ((NAPPA-GEO-LOC > '000' AND                              
TCK001                   NAPPA-GEO-LOC < '900')     OR                          
TCK001                 (NAPPA-GEO-LOC > '979' AND                               
TCK001                   NAPPA-GEO-LOC < '998')     OR                          
LRM021                  NAPPA-GEO-LOC = '999')                                  
TCK001                  MOVE '1' TO FR-FUND-ACCT-CD                             
TCK001                  MOVE '1' TO FR-MF-TRANS-TYPE-CD                         
LRM021                  IF NAPPA-GEO-LOC = '999'                                
LRM021                     DISPLAY 'GEO999 ACCT-CD = 1'                         
LRM021                  END-IF                                                  
TCK001              ELSE                                                        
TCK001                  IF (NAPPA-GEO-LOC > '900' AND                           
TCK001                      NAPPA-GEO-LOC < '956')                              
LRM005************* OR      NAPPA-GEO-LOC = '969'                               
TCK001                      MOVE '0' TO FR-FUND-ACCT-CD                         
TCK001                      MOVE '1' TO FR-MF-TRANS-TYPE-CD                     
LRM005                  ELSE                                                    
LRM005                      IF NAPPA-GEO-LOC = '969'                            
LRM005                         MOVE '4' TO FR-FUND-ACCT-CD                      
LRM005                         MOVE '1' TO FR-MF-TRANS-TYPE-CD                  
LRM005                      END-IF                                              
LRM005                  END-IF                                                  
LRM005              END-IF                                                      
TCK001           ELSE                                                           
TCK001               MOVE '0' TO FR-FUND-ACCT-CD                                
TCK001               MOVE '1' TO FR-MF-TRANS-TYPE-CD                            
TCK001           END-IF                                                         
TCK001        END-IF                                                            
TCK001     END-IF.                                                              
                                                                                
LRM019     IF NTW-SHWB-ACCT                                                     
LRM019        MOVE '2'                      TO  FR-MF-TRANS-TYPE-CD             
LRM019        MOVE '2'                      TO  FR-FUND-ACCT-CD                 
LRM019        MOVE '1'                      TO  FR-FRCTN-CD                     
LRM019        MOVE '4'                      TO  FR-DSBMT-FRCTN-CSH-CD           
LRM019        MOVE '4'                      TO  FR-DSBMT-ACCRL-CD               
LRM019        MOVE '4'                      TO  FR-DSBMT-RSDL-CD                
LRM019        MOVE '3'                      TO  FR-NTWRK-CNTL-CD                
LRM019        MOVE '1'                      TO  FR-BK-PHSCL-SHR-CD              
LRM019*** 9/09/13 REMOVE/REINSTATE N/A SSN VALUES ON SCHWAB FUNDS.              
LRM019********MOVE '941637782'              TO  FR-SS-TIN-NBR                   
LRM019********MOVE '0'                      TO  FR-SS-TIN-CD                    
LRM019        MOVE NA-SOC-SEC-NBR           TO  FR-SS-TIN-NBR                   
LRM019        MOVE NA-SOC-SEC-CD            TO  FR-SS-TIN-CD                    
LRM019     END-IF.                                                              
LRM008*--------------------------------------------------------------*          
LRM008* THE FOLLOWING RTN COPIED FROM BNW59NTL                                  
LRM008*--------------------------------------------------------------*          
LRM008 2595-SETUP-NA-LINES.                                                     
LRM008                                                                          
LRM008     EVALUATE BH-MF3-REG-NA-LINE-DROP-OPT                                 
LRM008       WHEN 1                                                             
LRM008         MOVE NA-LINE(2)             TO FR-NA-LINE(2)                     
LRM008         MOVE NA-LINE(3)             TO FR-NA-LINE(3)                     
LRM008         MOVE NA-LINE(4)             TO FR-NA-LINE(4)                     
LRM008         MOVE NA-LINE(5)             TO FR-NA-LINE(5)                     
LRM008         MOVE NA-LINE(6)             TO FR-NA-LINE(6)                     
LRM008       WHEN 2                                                             
LRM008         MOVE NA-LINE(1)             TO FR-NA-LINE(2)                     
LRM008         MOVE NA-LINE(3)             TO FR-NA-LINE(3)                     
LRM008         MOVE NA-LINE(4)             TO FR-NA-LINE(4)                     
LRM008         MOVE NA-LINE(5)             TO FR-NA-LINE(5)                     
LRM008         MOVE NA-LINE(6)             TO FR-NA-LINE(6)                     
LRM008       WHEN 3                                                             
LRM008         MOVE NA-LINE(1)             TO FR-NA-LINE(2)                     
LRM008         MOVE NA-LINE(2)             TO FR-NA-LINE(3)                     
LRM008         MOVE NA-LINE(4)             TO FR-NA-LINE(4)                     
LRM008         MOVE NA-LINE(5)             TO FR-NA-LINE(5)                     
LRM008         MOVE NA-LINE(6)             TO FR-NA-LINE(6)                     
LRM008       WHEN 4                                                             
LRM008         MOVE NA-LINE(1)             TO FR-NA-LINE(2)                     
LRM008         MOVE NA-LINE(2)             TO FR-NA-LINE(3)                     
LRM008         MOVE NA-LINE(3)             TO FR-NA-LINE(4)                     
LRM008         MOVE NA-LINE(5)             TO FR-NA-LINE(5)                     
LRM008         MOVE NA-LINE(6)             TO FR-NA-LINE(6)                     
LRM008       WHEN 5                                                             
LRM008         MOVE NA-LINE(1)             TO FR-NA-LINE(2)                     
LRM008         MOVE NA-LINE(2)             TO FR-NA-LINE(3)                     
LRM008         MOVE NA-LINE(3)             TO FR-NA-LINE(4)                     
LRM008         MOVE NA-LINE(4)             TO FR-NA-LINE(5)                     
LRM008         MOVE NA-LINE(6)             TO FR-NA-LINE(6)                     
LRM008     END-EVALUATE.                                                        
           EJECT                                                                
      ***********************                                                   
       FORMAT-FR-FOR-OMNIBUS.                                                   
      ***********************                                                   
                                                                                
           MOVE 'N'                         TO  FR-NAV-ACCT-IND                 
                                                FR-MRGN-ACCT-IND                
                                                FR-CHCK-WRTNG-IND.              
                                                                                
434636     MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR TO FR-BRKR-EXCTG-NBR.             
                                                                                
           MOVE 'BB'                        TO  FR-FUND-BK-CD.                  
                                                                                
LRM013     IF FR-CLIENT-NBR = '0006'                                            
LRM013        MOVE 'ADI'                    TO  FR-ACCT-RR-CD                   
LRM013        MOVE 'HOUSE'                  TO  FR-ACCT-RR-NM                   
LRM013        MOVE '010AD'                  TO  FR-BRCH-NBR                     
LRM013        MOVE 'MN'                     TO  FR-SL-ST-CD                     
LRM013     END-IF.                                                              
                                                                                
LRM012     IF FR-CLIENT-NBR = '0010' OR '0030' OR '0210'                        
              MOVE '000'                    TO  FR-ACCT-RR-CD                   
              MOVE 'HOUSE'                  TO  FR-ACCT-RR-NM                   
              MOVE '001'                    TO  FR-BRCH-NBR                     
              MOVE 'NY'                     TO  FR-SL-ST-CD                     
           END-IF.                                                              
                                                                                
           IF FR-CLIENT-NBR = '0024' OR '0274'                                  
              MOVE '000'                    TO  FR-ACCT-RR-CD                   
              MOVE 'HOUSE'                  TO  FR-ACCT-RR-NM                   
              MOVE '001'                    TO  FR-BRCH-NBR                     
              MOVE 'MD'                     TO  FR-SL-ST-CD                     
           END-IF.                                                              
                                                                                
LRM013     IF NTW-PNC-SURPAS-ACCT                                               
LRM013        CONTINUE                                                          
LRM013     ELSE                                                                 
LRM006     IF BH-MF3-ACTIVE                                                     
LRM006     AND BH-MF3-ALT-BR-TO-FUND-OPT = '1'                                  
DJ0003     AND (NOT NNARPB-SEGMENT-MISSING)                                     
LRM006        MOVE NNARPB-ALT-BRANCH        TO  FR-BRCH-NBR                     
LRM006        DISPLAY 'FORCING ALT BR ' NNARPB-ALT-BRANCH ' ON ONMIBUS'         
LRM006        ' FOR ' FRR-CLIENT-NBR ' ' WS-BRCH '-' WS-ACCT                    
LRM006     END-IF.                                                              
                                                                                
                                                                                
           MOVE B1-DVDND-CD                 TO  FR-DVDND-CD.                    
           MOVE B1-LTCG-CD                  TO  FR-LTCG-CD.                     
           MOVE B1-STCG-CD                  TO  FR-STCG-CD.                     
                                                                                
           MOVE SPACES                      TO  NA-IRA-IND.                     
                                                                                
           MOVE '06'                        TO  FR-SOC-CD.                      
                                                                                
           MOVE '0'                         TO  FR-WTHLD-CD.                    
                                                                                
           MOVE '3'                         TO  FR-PYBL-INFO-CD.                
                                                                                
           MOVE '2'                         TO  FR-MF-TRANS-TYPE-CD.            
                                                                                
           MOVE B1-FRCTN-CD                 TO FR-FRCTN-CD.                     
                                                                                
           MOVE '2'                         TO  FR-FUND-ACCT-CD.                
                                                                                
                                                                                
           MOVE B1-DSBMT-FRCTN-CSH-CD       TO  FR-DSBMT-FRCTN-CSH-CD.          
                                                                                
           MOVE B1-DSBMT-ACCRL-CD           TO  FR-DSBMT-ACCRL-CD.              
                                                                                
           MOVE B1-DSBMT-RSDL-CD            TO  FR-DSBMT-RSDL-CD.               
                                                                                
           MOVE '0'                         TO  FR-NTWRK-CNTL-CD.               
           MOVE '1'                         TO  FR-BK-PHSCL-SHR-CD.             
                                                                                
LRM003     IF NTW-DST-MFE-ACCT                                                  
LRM003     AND (WS-DST-BOX-ACCT-TC NOT = SPACE AND LOW-VALUE)                   
LRM003       DISPLAY 'APPLY O-NSCC B1 537601 TO FUND NBR: '                     
LRM003                WS-DST-BOX-ACCT-TC                                        
LRM003       MOVE FR-CLIENT-NBR (2:3)   TO  FR-FNBR (1:3)                       
LRM003       MOVE  WS-DST-BOX-ACCT-TC   TO  FR-FNBR (4:  )                      
LRM003       MOVE '0'                   TO  FR-BK-PHSCL-SHR-CD                  
LRM003       MOVE '3'                   TO  FR-NTWRK-CNTL-CD                    
LRM003     ELSE                                                                 
LRM013*******IF BNWMAST-OKAY                                                    
LRM013*******AND MATRIX-LEVEL OF ACCT-MAST-RECORD = '6'                         
LRM013     IF NTW-PNC-SURPAS-ACCT                                               
LRM014       IF (WS-PNC-SURPAS-BOX-TC NOT = SPACE AND LOW-VALUE)                
LRM013          DISPLAY 'APPLY O-NSCC B1 540238 TO FUND NBR: '                  
LRM014                WS-PNC-SURPAS-BOX-TC                                      
LRM013          MOVE FR-CLIENT-NBR (2:3)   TO  FR-FNBR (1:3)                    
LRM013          MOVE WS-PNC-SURPAS-BOX-TC TO   FR-FNBR (4:  )                   
LRM013       END-IF                                                             
LRM013       MOVE '0'                   TO  FR-BK-PHSCL-SHR-CD                  
LRM013       MOVE '3'                   TO  FR-NTWRK-CNTL-CD                    
LRM013       IF TBL-TENDER                                                      
LRM013          MOVE 'C'                TO  FR-DVDND-CD                         
LRM013                                      FR-LTCG-CD                          
LRM013                                      FR-STCG-CD                          
LRM013       ELSE                                                               
LRM013          MOVE 'R'                TO  FR-DVDND-CD                         
LRM013                                      FR-LTCG-CD                          
LRM013                                      FR-STCG-CD                          
LRM013       END-IF                                                             
LRM013     ELSE                                                                 
           IF     NTW-NSCCSRC-ACCT                                              
             AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)                    
             DISPLAY 'APPLY O-NSCC B1 537596 TO FUND NBR: '                     
                      NS-BRCH-ACCT-TC                                           
             MOVE FR-CLIENT-NBR (2:3)   TO  FR-FNBR (1:3)                       
             MOVE NS-BRCH-ACCT-TC       TO  FR-FNBR (4:  )                      
             MOVE '0'                   TO  FR-BK-PHSCL-SHR-CD                  
             MOVE '3'                   TO  FR-NTWRK-CNTL-CD                    
           END-IF.                                                              
                                                                                
537311     MOVE BH-MF-BKR-NAME-REG-LINE-1   TO  FR-NA-LINE (1).                 
537312     MOVE BH-MF-BKR-NAME-REG-LINE-2   TO  FR-NA-LINE (2).                 
537313     MOVE BH-MF-BKR-NAME-REG-LINE-3   TO  FR-NA-LINE (3).                 
537314     MOVE BH-MF-BKR-NAME-REG-LINE-4   TO  FR-NA-LINE (4).                 
           MOVE SPACES                      TO  FR-NA-LINE (5).                 
           MOVE SPACES                      TO  FR-NA-LINE (6).                 
537326     MOVE BH-MF-SS-BKR-NAME-REGISTR   TO  WS-SSN-PACKED.                  
           MOVE WS-SSN-PACKED               TO  WS-SSN-UNPACKED.                
           MOVE WS-SSN-ALPHA                TO  FR-SS-TIN-NBR.                  
           MOVE '0'                         TO  FR-SS-TIN-CD.                   
           MOVE 1                           TO  FR-NM-END-LN-QTY.               
                                                                                
           PERFORM FIND-ZIP-CODE.                                               
                                                                                
           EJECT                                                                
      ***************                                                           
       FIND-ZIP-CODE.                                                           
      ***************                                                           
                                                                                
           MOVE SPACES                      TO  FR-ZIP5-CD                      
                                                FR-ZIP4-CD.                     
                                                                                
           SET ZIP-NOT-FOUND                TO  TRUE.                           
                                                                                
           IF FR-NA-LINE (6) > SPACES                                           
              MOVE FR-NA-LINE (6)           TO  W-ADDRESS-WORK-BYTES            
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND FR-NA-LINE (5) > SPACES                         
              MOVE FR-NA-LINE (5)           TO  W-ADDRESS-WORK-BYTES            
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND FR-NA-LINE (4) > SPACES                         
              MOVE FR-NA-LINE (4)           TO  W-ADDRESS-WORK-BYTES            
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND FR-NA-LINE (3) > SPACES                         
              MOVE FR-NA-LINE (3)           TO  W-ADDRESS-WORK-BYTES            
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       FIND-EMBEDDED-ZIP-CODE.                                                  
      ************************                                                  
                                                                                
           MOVE 5                           TO  ZIP-SUB.                        
           SET ZIP-NOT-FOUND                TO  TRUE.                           
           MOVE SPACES                      TO  W-ZIP-WORK-BYTES.               
                                                                                
           PERFORM VARYING ADDRESS-SUB FROM 35 BY -1 UNTIL                      
              (ADDRESS-SUB < 1 OR ZIP-FOUND)                                    
              EVALUATE W-ADDRESS-WORK-BYTE (ADDRESS-SUB)                        
                 WHEN '0' THRU '9'                                              
                   MOVE W-ADDRESS-WORK-BYTE (ADDRESS-SUB) TO                    
                        W-ZIP-WORK-BYTE (ZIP-SUB)                               
                   SUBTRACT 1 FROM ZIP-SUB                                      
                 WHEN '-'                                                       
                   MOVE W-ZIP-WORK-BYTE (5) TO  W-ZIP-WORK-BYTE (9)             
                   MOVE W-ZIP-WORK-BYTE (4) TO  W-ZIP-WORK-BYTE (8)             
                   MOVE W-ZIP-WORK-BYTE (3) TO  W-ZIP-WORK-BYTE (7)             
                   MOVE W-ZIP-WORK-BYTE (2) TO  W-ZIP-WORK-BYTE (6)             
                   MOVE 5                   TO  ZIP-SUB                         
                 WHEN OTHER                                                     
                   CONTINUE                                                     
              END-EVALUATE                                                      
              IF ZIP-SUB = 0                                                    
                 SET ZIP-FOUND              TO  TRUE                            
                 MOVE W-ZIP-WORK-BYTES (1:5) TO FR-ZIP5-CD                      
                 MOVE W-ZIP-WORK-BYTES (6:4) TO FR-ZIP4-CD                      
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
           COPY BNWTAXWP.                                                       
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           OPEN INPUT  FR-REQUEST                                               
TCK001                 BNWMAST-FILE                                             
                       BNWREGOP                                                 
                       MFRRNM-FILE.                                             
                                                                                
DJ0004     OPEN INPUT MFEXBR.                                                   
DJ0004     DISPLAY 'CAT575B: MFEXBR   OPENED FOR INPUT.  STATUS = '             
DJ0004                                        MFEXBR-STATUS                     
DJ0004     IF  MFEXBR-OKAY                                                      
DJ0004         CONTINUE                                                         
DJ0004     ELSE                                                                 
DJ0004         DISPLAY 'CAT575B: ERROR OPENING MFEXBR'                          
DJ0004         DISPLAY 'CAT575B: OPEN STATUS = ' MFEXBR-STATUS                  
DJ0004         DISPLAY 'CAT575B: U3001 - ABENDING ON BAD FILE STATUS'           
DJ0004         MOVE +3001    TO ABEND-CODE                                      
DJ0004         PERFORM ABEND-ROUTINE                                            
DJ0004     END-IF.                                                              
                                                                                
           OPEN OUTPUT FR-FILE.                                                 
                                                                                
           MOVE 'N'                         TO  EOF-FRR-REQUEST-SW.             
                                                                                
           READ FR-REQUEST                INTO  FRR-HEADER                      
              AT END SET EOF-FRR-REQUEST    TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-FRR-REQUEST                                                   
              DISPLAY '***'                                                     
              DISPLAY 'FR-REQUEST FILE HAS NO RECORDS - AT LEAST A HEADE        
      -               'R RECORD SHOULD BE PRESENT'                              
              DISPLAY 'CHECK CAT575A RUN!!!'                                    
              PERFORM ABEND-ROUTINE                                             
           ELSE                                                                 
              ADD 1                         TO  READ-CNTR                       
TEST          DISPLAY 'FIRST READ FR-REQUEST '                                  
              IF FRR-DATE-LIT NOT = 'DATE='                                     
                 DISPLAY '***'                                                  
                 DISPLAY 'FR-REQUEST FILE IS MISSING THE HEADER RECORD'         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           READ FR-REQUEST                INTO  FRR-RECORD                      
              AT END SET EOF-FRR-REQUEST    TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-FRR-REQUEST                                                   
              DISPLAY '***********************************'                     
              DISPLAY '* NO FUND/SERV ACTIVITY FOR TODAY *'                     
              DISPLAY '***********************************'                     
           ELSE                                                                 
              ADD 1                         TO  READ-CNTR                       
TEST          DISPLAY '2ND READ FR-REQUEST '                                    
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           MOVE 'DATE='                     TO  FR-DATE-LIT.                    
           MOVE WS-DATE-TIME                TO  FR-DATE-TIME.                   
DJ0002     MOVE 'CAT575B'                   TO  FR-PROGRAM-NAME.                
                                                                                
           WRITE FR-REC                   FROM  FR-HEADER.                      
           ADD 1                            TO  WRITE-CNTR.                     
                                                                                
           INITIALIZE GETNA-PARAMETERS.                                         
           MOVE 'CAT575B '                  TO  GETNA-PGM-NAME.                 
           MOVE 'O'                         TO  GETNA-REQ-FUNC.                 
           MOVE 'R'                         TO  GETNA-REQ-FUNC2.                
           MOVE 'R'                         TO  GETNA-REQ-FILE.                 
           MOVE 'N'                         TO  GETNA-REQ-YEAREND.              
           CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES.         
                                                                                
           IF GETNA-OPEN-ERROR                                                  
              DISPLAY '**************************'                              
              DISPLAY '* OPEN ERROR ON N&A FILE *'                              
              DISPLAY '**************************'                              
              PERFORM ABEND-ROUTINE                                             
            END-IF.                                                             
                                                                                
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                               
LRM002     MOVE  'CAT575B'   TO NTWIO-PGM-NAME.                                 
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                            
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                             
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                               
                                                                                
           EJECT                                                                
      ***************                                                           
       READ-BNWREGOP.                                                           
      ***************                                                           
                                                                                
           MOVE SPACES                  TO BNWREGOP-RECORD                      
           MOVE FRR-CLIENT-NBR (2:3)    TO CLIENT-NO OF BNWREGOP-RECORD         
           MOVE FRR-ISIN-SEC-ISSUE-CD   TO CUSIP-9   OF BNWREGOP-RECORD         
TEST       DISPLAY 'LOOKING FOR PROCESS CODE ' FRR-CLIENT-NBR (2:3)             
TEST            FRR-ISIN-SEC-ISSUE-CD ' IN FILE BNWREGOP'                       
                                                                                
           READ BNWREGOP.                                                       
                                                                                
TEST       DISPLAY 'BNWREGOP STATUS ' BNWREGOP-STATUS                           
TEST        ' PROCESS CODE ' PROCESSING-CODE OF BNWREGOP-RECORD                 
                                                                                
           MOVE SPACES                      TO  NTW-HOUSE-REG.                  
           MOVE SPACES                      TO  NTW-HOUSE-ACCOUNT.              
           SET NTW-NOT-HOUSE-ACCT           TO  TRUE.                           
           SET NTW-NOT-OMNIBUS-ACCT         TO  TRUE.                           
           SET NTW-NOT-NSCCSRC-ACCT         TO  TRUE.                           
LRM019     SET NTW-NOT-SHWB-ACCT            TO  TRUE.                           
LRM019     SET NTW-NOT-WAIVE-ACCT           TO  TRUE.                           
                                                                                
           IF BNWREGOP-STATUS = '00'                                            
           IF  FRR-CLIENT-NBR (2:3)  = CLIENT-NO OF BNWREGOP-RECORD             
           AND FRR-ISIN-SEC-ISSUE-CD = CUSIP-9   OF BNWREGOP-RECORD             
              MOVE NTWK-LVL-3-REG-OPTION    TO  NTW-HOUSE-REG                   
              IF REG-OP-HOUSE-ACCT > SPACES                                     
                 MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT               
                 SET NTW-HOUSE-ACCT         TO  TRUE                            
              ELSE                                                              
                 MOVE SPACES                TO  NTW-HOUSE-ACCOUNT               
                 SET NTW-NOT-HOUSE-ACCT     TO  TRUE                            
              END-IF                                                            
LRM003        IF (OMNIBUS-PROCESSING OF BNWREGOP-RECORD                         
LRM003                OR DST-DIRECT  OF BNWREGOP-RECORD                         
LRM013                OR PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD)              
LRM002        AND BH-MF-ACTIVE                                                  
LRM002        AND BH-MFN-OMNIBUS-MULTI-PLAT-OPT  =  '1'                         
LRM002           MOVE 'R'                 TO NTWIO-FUNCTION-CODE                
LRM002           MOVE FRR-CLIENT-NBR (2:3)  TO NTWIO-CLIENT                     
LRM002           MOVE FRR-ISIN-SEC-ISSUE-CD TO NTWIO-CUSIP-9                    
LRM002           MOVE SPACES              TO NTWIO-SYMBOL                       
LRM002           MOVE WS-BRCH-ACCT-TC     TO NTWIO-ACCT-ID                      
LRM002           DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS         
LRM002           CALL  BNWNTWIO  USING NTWIO-PARAMETERS                         
LRM002           IF NTWIO-RETURN-OK                                             
LRM002              MOVE NTWIO-PROCESSING-CODE                                  
LRM002                TO PROCESSING-CODE OF BNWREGOP-RECORD                     
LRM020              MOVE NTWIO-MATRIX-LEVEL                                     
LRM020                TO MATRIX-LEVEL OF ACCT-MAST-RECORD                       
LRM002              DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE TO '                
LRM002                   NTWIO-PROCESSING-CODE                                  
LRM002           ELSE                                                           
LRM002              DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE                   
LRM002           END-IF                                                         
LRM002        END-IF                                                            
TEST          DISPLAY 'AFTER NTWIO, PROCESS CODE IS '                           
TEST                     PROCESSING-CODE OF BNWREGOP-RECORD                     
TEST             ' MATRIX ' MATRIX-LEVEL OF ACCT-MAST-RECORD                    
              IF OMNIBUS-PROCESSING OF BNWREGOP-RECORD                          
                 SET NTW-OMNIBUS-ACCT       TO  TRUE                            
LRM003        ELSE                                                              
LRM003        IF DST-DIRECT OF BNWREGOP-RECORD                                  
LRM003           SET NTW-DST-MFE-ACCT       TO  TRUE                            
LRM013        ELSE                                                              
LRM013        IF PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD                       
LRM013           SET NTW-PNC-SURPAS-ACCT TO TRUE                                
              ELSE                                                              
                 SET NTW-NOT-OMNIBUS-ACCT   TO  TRUE                            
LRM013        END-IF END-IF END-IF                                              
              IF TBL-MNT-SOURCE-NSCC                                            
                 SET NTW-NSCCSRC-ACCT       TO  TRUE                            
              END-IF                                                            
LRM019        IF TBL-MNT-SOURCE-SHWB                                            
TEST             DISPLAY 'HAVE SHWB ON TBL MAINT ' FRR-ISIN-SEC-ISSUE-CD        
TEST                ' WAIVE=' TBL-WAIVE-ACCT                                    
TEST                ' PRVT7=' NNARPA-PRVT-FLD(7)                                
TEST                ' B1=' BH-MF-WRAP-ACCT-CODES                                
LRM019           SET NTW-SHWB-ACCT          TO  TRUE                            
LRM019           IF WS-BNWMAST-FOUND                                            
LRM019           AND NAV-WRAP-FEE-ACCOUNT                                       
LRM019           AND TBL-WAIVE-ACCT > SPACES                                    
LRM019              MOVE TBL-WAIVE-ACCT    TO  NTW-HOUSE-ACCOUNT                
LRM019              MOVE 'Y'               TO  FR-NAV-ACCT-IND                  
LRM019              DISPLAY 'USING WAIVE DUE TO BNWMAST'                        
LRM019           ELSE                                                           
LRM019           IF NOT WS-BNWMAST-FOUND                                        
LRM019             IF TBL-WAIVE-ACCT > SPACE                                    
LRM019             AND NOT NNARPA-SEGMENT-MISSING                               
LRM019             AND NNARPA-PRVT-FLD(7) > SPACES                              
LRM019               PERFORM VARYING SUB FROM 1 BY 1                            
LRM019                UNTIL SUB > BH-MF-WRAP-ACCT-CODES-NO                      
LRM019                OR BH-MF-WRAP-ACCT-CODE(SUB) = NNARPA-PRVT-FLD(7)         
LRM019               END-PERFORM                                                
LRM019               IF SUB NOT > BH-MF-WRAP-ACCT-CODES-NO                      
LRM019                 MOVE TBL-WAIVE-ACCT    TO  NTW-HOUSE-ACCOUNT             
LRM019                 MOVE 'Y'               TO  FR-NAV-ACCT-IND               
LRM019                 SET NTW-NOT-HOUSE-ACCT     TO  TRUE                      
LRM019                 SET NTW-WAIVE-ACCT         TO  TRUE                      
TEST                   DISPLAY 'USING WAIVE ACCT ' TBL-WAIVE-ACCT               
LRM019               END-IF END-IF                                              
LRM019           END-IF END-IF                                                  
LRM019           IF NOT NTW-WAIVE-ACCT                                          
LRM019           AND TBL-WAIVE-ACCT > SPACE                                     
LRM019           AND REG-OP-HOUSE-ACCT NOT > SPACES                             
LRM019               MOVE TBL-WAIVE-ACCT    TO  NTW-HOUSE-ACCOUNT               
LRM019               MOVE 'Y'               TO  FR-NAV-ACCT-IND                 
LRM019               SET NTW-NOT-HOUSE-ACCT     TO  TRUE                        
LRM019               SET NTW-WAIVE-ACCT         TO  TRUE                        
TEST                 DISPLAY 'USING WAIVE ONLY1 ACCT ' TBL-WAIVE-ACCT           
LRM019           END-IF                                                         
LRM019        END-IF                                                            
           ELSE                                                                 
              MOVE SPACES                   TO  NTW-HOUSE-REG                   
              MOVE SPACES                   TO  NTW-HOUSE-ACCOUNT               
              SET NTW-NOT-HOUSE-ACCT        TO  TRUE                            
              SET NTW-NOT-OMNIBUS-ACCT      TO  TRUE                            
              SET NTW-NOT-NSCCSRC-ACCT      TO  TRUE                            
LRM019        SET NTW-NOT-SHWB-ACCT         TO  TRUE                            
LRM019        SET NTW-NOT-WAIVE-ACCT        TO  TRUE                            
           END-IF                                                               
           END-IF.                                                              
           EJECT                                                                
TCK001******************                                                        
TCK001 READ-BNWMAST.                                                            
      ******************                                                        
                                                                                
TCK001     MOVE ' '                      TO WS-BNWMAST-FND-SW                   
           MOVE SPACES                   TO WS-BNWMAST-KEY                      
           MOVE ZEROES                   TO WS-BNWMAST-ACCT-ID                  
           MOVE FRR-CLIENT-NBR           TO WS-BNWMAST-CLT-NO                   
                                            WS-BNWMAST-CLT                      
           MOVE FRR-ISIN-SEC-ISSUE-CD    TO WS-BNWMAST-CUSIP                    
           MOVE WS-BRCH                  TO WS-BNWMAST-BRN-3                    
           MOVE WS-ACCT                  TO WS-BNWMAST-ACCT-5                   
           MOVE WS-T                     TO WS-BNWMAST-TYPE                     
           MOVE WS-C                     TO WS-BNWMAST-CHK                      
           MOVE 0                        TO WS-BNWMAST-PAYABLE-SEQ-NO           
           MOVE SPACES                   TO BNWMAST-REC                         
           MOVE WS-BNWMAST-KEY           TO MAST-KEY-AREA                       
                                                                                
           READ BNWMAST-FILE.                                                   
                                                                                
           ADD 1 TO WS-BNWMAST-CNT                                              
                                                                                
           IF  BNWMAST-OKAY                                                     
               MOVE 'Y'               TO WS-BNWMAST-FND-SW                      
               ADD 1 TO WS-BNWMAST-FND-CNT                                      
               DISPLAY         '   '                                            
DJ0004         DISPLAY         '   BNWMAST FOUND :'                             
                               ' FOR ' MAST-KEY-AREA                            
TCKTMP*                            ' ACCT = ' WS-BNWMAST-ACCT-ID                
TCKTMP*                            ' CUSIP = ' CUSIP-15                         
           ELSE                                                                 
               IF BNWMAST-END-OF-FILE                                           
               OR BNWMAST-NOT-FOUND                                             
                  MOVE 'N'                 TO WS-BNWMAST-FND-SW                 
DJ0004            DISPLAY      '   BNWMAST NOTFND:'                             
                               ' FOR ' MAST-KEY-AREA                            
               ELSE                                                             
                  DISPLAY ' ** CAT575B - BNWMAST FILE, READ ERROR'              
                          ' FILE-STATUS = ' BNWMAST-STATUS                      
                  DISPLAY 'MAST-KEY-AREA = ' MAST-KEY-AREA                      
                  MOVE +3999 TO ABEND-CODE                                      
                  PERFORM ABEND-ROUTINE                                         
               END-IF                                                           
TCK001     END-IF.                                                              
                                                                                
           EJECT                                                                
DJ0004***************                                                           
DJ0004 READ-MFMSD.                                                              
DJ0004***************                                                           
DJ0004     MOVE 'N'                TO W-MFMSD-FND-SW                            
DJ0004     ADD 1 TO W-MFMSD-CNT                                                 
DJ0004     INITIALIZE BMFSECIO-AREA                                             
DJ0004     MOVE FRR-ISIN-SEC-ISSUE-CD     TO BMFSECIO-SECURITY                  
DJ0004     SET BMFSECIO-REQUEST-MSD-MFMSD TO TRUE                               
DJ0004     CALL BMFSEC USING BMFSECIO-AREA                                      
DJ0004     EVALUATE TRUE                                                        
DJ0004       WHEN BMFSECIO-RETURN-OK                                            
DJ0004            ADD 1 TO W-MFMSD-FND-CNT                                      
DJ0004            MOVE 'Y'                 TO W-MFMSD-FND-SW                    
DJ0004            MOVE BMFSECIO-MFMSD-AREA TO MFMSD-REC                         
DJ0004       WHEN BMFSECIO-RC-MFMSD-NOT-FOUND                                   
DJ0004            DISPLAY '    BMFSEC NOTFND: ' FRR-ISIN-SEC-ISSUE-CD           
DJ0004                     ' ' BMFSECIO-ERROR-DESC                              
DJ0004       WHEN BMFSECIO-INVALID-RETURN                                       
DJ0004            DISPLAY 'BMFSECIO READ ERROR, RETURN CODE:'                   
DJ0004                     BMFSECIO-RETURN-CODE ' '                             
DJ0004                     BMFSECIO-ERROR-DESC                                  
DJ0004            DISPLAY '**     ABENDING *'                                   
DJ0004            MOVE +3888 TO ABEND-CODE                                      
DJ0004            CALL ABEND USING ABEND-CODE                                   
DJ0004     END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
DJ0004***************                                                           
DJ0004 READ-MFEXBR.                                                             
DJ0004***************                                                           
DJ0004     MOVE 'N'                TO W-MFEXBR-FND-SW                           
DJ0004     IF W-MFMSD-FND-SW = 'Y'                                              
DJ0004        MOVE ' '                   TO MFEXBR-REC                          
DJ0004        MOVE FRR-CLIENT-NBR        TO EXBR-CLIENT                         
DJ0004        MOVE WS-BRCH               TO EXBR-BRANCH                         
DJ0004        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                        
DJ0004        ADD 1 TO W-MFEXBR-CNT                                             
DJ0004        READ MFEXBR                                                       
DJ0004        IF MFEXBR-STATUS = '00'                                           
DJ0004           ADD 1 TO W-MFEXBR-FND-CNT                                      
DJ0004           MOVE 'Y'                TO W-MFEXBR-FND-SW                     
DJ0004           DISPLAY '    MFEXBR FOUND : ' EXBR-CLIENT                      
DJ0004                              ' BRANCH ' EXBR-BRANCH                      
DJ0004                             ' FUND-NO ' EXBR-FUND-NO                     
DJ0004                  ' EXECUTING-BROKER = ' EXBR-EXECUTING-BROKER            
DJ0004        ELSE                                                              
DJ0004           MOVE 'N'                TO W-MFEXBR-FND-SW                     
DJ0004        END-IF                                                            
DJ0004     END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       ABEND-ROUTINE.                                                           
      ***************                                                           
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '************************'                                   
           DISPLAY '* PROGRAM IS ABENDING! *'                                   
           DISPLAY '************************'                                   
           CALL ABEND                    USING  ABEND-CODE.                     
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE FR-REQUEST                                                     
TCK001           BNWMAST-FILE                                                   
                 BNWREGOP                                                       
                 MFRRNM-FILE                                                    
                 FR-FILE.                                                       
                                                                                
DJ0004     CLOSE MFEXBR                                                         
DJ0004     DISPLAY 'CAT575B: MFEXBR   CLOSED. STATUS = '                        
DJ0004                                       MFEXBR-STATUS.                     
DJ0004     DISPLAY 'CAT575B: W-MFMSD-CNT      = ' W-MFMSD-CNT                   
DJ0004                     ' W-MFMSD-FND-CNT  = ' W-MFMSD-FND-CNT               
DJ0004     DISPLAY 'CAT575B: W-MFEXBR-CNT     = ' W-MFEXBR-CNT                  
DJ0004                     ' W-MFEXBR-FND-CNT = ' W-MFEXBR-FND-CNT              
                                                                                
           MOVE 'P'                         TO  GETNA-REQ-FUNC.                 
                                                                                
           CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES.         
                                                                                
           IF GETNA-VSAM-STATUS NOT = '00'                                      
              DISPLAY '**********************'                                  
              DISPLAY '* CLOSE ERROR ON N&A *'                                  
              DISPLAY '**********************'                                  
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY 'TOTAL NUMBER OF RECORDS READ:    ' READ-CNTR             
              DISPLAY ' '                                                       
              DISPLAY 'TOTAL NUMBER OF RECORDS WRITTEN: ' WRITE-CNTR            
              DISPLAY ' '                                                       
              DISPLAY '*************************************'                   
              DISPLAY '* CAT575B: COMPLETION IS SUCCESSFUL *'                   
              DISPLAY '*************************************'                   
           END-IF.                                                              
                                                                                
