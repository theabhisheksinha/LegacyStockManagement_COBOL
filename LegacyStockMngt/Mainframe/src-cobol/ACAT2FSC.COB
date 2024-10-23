000001* PDX    - ACAT2FSC C0263391 04/11/08 13:34:58 TBLAMUR            00001000
LRM005* SSR# 55766 ASCENDIS INTERFACE. ALLOW UPDATE FOR ASCENDIS USER,          
LRM005* WHEN HE WOULD HAVE HAD UPDATE AUTH BASED ON SNON IF NOT ASCEND.         
000001* PDX    - ACAT2FSC C0240631 11/14/06 10:40:17 TBLAMUR            00001000
LRM004* SSR 0048591 ALLOW F/R ACCOUNT TYPES 4,5 NSCC NOTICE A6272.              
000001* PDX    - ACAT2FSC C0214488 12/08/04 11:59:24 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT2FSC C0151771 02/23/01 11:15:24 TBDOJUN            00001000
000001* PDX    - ACAT2FSC C0120352 01/24/99 17:51:16 TBTARYB            00001000
000001* PDX    - ACAT2FSC C0119770 12/28/98 12:38:45 TBTARYB            00001000
000001* PDX    - ACAT2FSC C0118708 12/28/98 10:33:29 TBTARYB            00001000
000001* PDX    - ACAT2FSC C0113942 11/11/98 14:00:38 TBTARYB            00001000
000001* PDX    - ACAT2FSC C0117820 11/06/98 12:03:02 TBTARYB            00001000
000001* PDX    - ACAT2FSC C0113942 10/30/98 13:39:18 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT2FSC.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * FUND/SERV: PORGRAM (XCTL'ED BY ACAT10CP) DISPLAYS              *        
      *      -  "RECEIVER REGISTRATION 2" SCREEN                       *        
      ******************************************************************        
                                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  FIRST-TIME-SW                  PIC  X(01).                           
           88  FIRST-TIME                              VALUE 'Y'.               
           88  NOT-FIRST-TIME                          VALUE 'N'.               
       77  BOOK-PHYS-SW                   PIC  X(01).                           
           88  BOOK-PHYS-VALID                         VALUE 'V'.               
           88  BOOK-PHYS-INVALID                       VALUE 'I'.               
       77  FUND-ACCT-SW                   PIC  X(01).                           
           88  FUND-ACCT-VALID                         VALUE 'V'.               
           88  FUND-ACCT-INVALID                       VALUE 'I'.               
                                                                                
       01  WS-TSQ-AREA.                                                         
           05  WS-TS-NAME.                                                      
               10 TERM-ID             PIC X(04).                                
               10 TRAN-ID             PIC X(04).                                
               10 ITEM-NUMBER         PIC S9(04) COMP VALUE +1.                 
            COPY ACAT0FIO.                                                      
                                                                                
       01  WS-DATE-AREA.                                                        
           05  WSABSTIME           PIC S9(08) COMP.                             
           05  WSMMDDYY.                                                        
               09 WS-CUR-MM        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-DD        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-YY        PIC XX.                                      
           05  WSDATESEP           PIC X(01) VALUE '/'.                         
           05  WSTIME.                                                          
               09  WS-TIME-HH      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-MM      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-SS      PIC XX.                                      
           05  WSTIMESEP           PIC X(01) VALUE ':'.                         
           05  WS-DB2-FORM-DATE.                                                
               09  WS-DATE-CC      PIC X(02).                                   
               09  WS-DATE-YY      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-MM      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-DD      PIC X(02).                                   
           05  WS-EDITED-DATE.                                                  
               09  WS-EDITED-MM    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-DD    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-YY             PIC X(02).                          
                                                                                
       01  WS-ROA-LOI-AMT.                                                      
           05  WS-ROA-LOI-AMT-INT           PIC  X(14).                         
           05  FILLER                       PIC  X(01)  VALUE '.'.              
           05  WS-ROA-LOI-AMT-FRAC          PIC  X(02).                         
                                                                                
       01  VALID-COUNTRY-CODES              PIC X(2).                           
           88 VALID-COUNTRY-CODE VALUE  '  ' 'AF' 'AL' 'AG' 'AQ' 'AN'           
               'AO' 'AV' 'AY' 'AC' 'AR' 'AT' 'AS' 'AU' 'PO' 'BF' 'BA'           
               'BG' 'BB' 'BS' 'BE' 'BH' 'BN' 'BD' 'BT' 'BL' 'BC' 'BV'           
               'BR' 'IO' 'VI' 'BX' 'BU' 'UV' 'BM' 'BY' 'CM' 'CB' 'CA'           
               'SP' 'EQ' 'CV' 'CJ' 'CT' 'CD' 'DC' 'CI' 'CH' 'KT' 'IP'           
               'CK' 'CO' 'CN' 'CF' 'CW' 'CR' 'CS' 'CU' 'CY' 'CZ' 'DA'           
               'DJ' 'DO' 'DR' 'EC' 'EG' 'ES' 'EK' 'ET' 'EU' 'FA' 'FO'           
               'FJ' 'FI' 'FR' 'FG' 'FP' 'FS' 'BF' 'GA' 'GZ' 'GC' 'GE'           
               'GH' 'GI' 'GS' 'GO' 'GR' 'GL' 'GJ' 'BP' 'GQ' 'GT' 'GK'           
               'GV' 'PU' 'GY' 'HA' 'HM' 'HO' 'HK' 'HU' 'IC' 'IN' 'ID'           
               'IR' 'IZ' 'IY' 'EI' 'IM' 'IS' 'IT' 'IV' 'JM' 'JN' 'JA'           
               'JE' 'JQ' 'JO' 'JU' 'CB' 'KE' 'KQ' 'KR' 'KN' 'KS' 'KU'           
               'LA' 'LE' 'LT' 'LI' 'LY' 'LS' 'LU' 'MC' 'MA' 'MI' 'MY'           
               'MV' 'ML' 'MT' 'MB' 'MR' 'MP' 'MF' 'MX' 'MQ' 'MN' 'MG'           
               'MH' 'MO' 'MZ' 'WA' 'NR' 'BQ' 'NP' 'NL' 'NA' 'NC' 'NZ'           
               'NU' 'NG' 'NI' 'NE' 'NF' 'UK' 'CQ' 'NO' 'MU' 'PK' 'LQ'           
               'PM' 'PP' 'PF' 'PA' 'PE' 'RP' 'PC' 'PL' 'PO' 'PT' 'RQ'           
               'QA' 'RE' 'RO' 'RW' 'SC' 'SH' 'ST' 'SB' 'VC' 'SM' 'TP'           
               'SA' 'SG' 'SE' 'SL' 'SN' 'BP' 'SO' 'SF' 'SP' 'PG' 'CE'           
               'SU' 'NS' 'SV' 'WZ' 'SW' 'SZ' 'SY' 'TW' 'TZ' 'TH' 'TO'           
               'TL' 'TN' 'TD' 'TE' 'NQ' 'TS' 'TU' 'TK' 'TV' 'UG' 'UR'           
               'TC' 'UK' 'US' 'UV' 'UY' 'NH' 'VT' 'VE' 'VM' 'VQ' 'WQ'           
               'WF' 'WE' 'WI' 'WS' 'YS' 'YE' 'YO' 'CG' 'ZA' 'ZI' 'OC'.          
                                                                                
       01  ERROR-MESSAGES.                                                      
           05  ERROR-MSG-1                  PIC  X(78)  VALUE                   
               'MARK WITH X EITHER ONE OF THESE FIELDS'.                        
           05  ERROR-MSG-2                  PIC  X(78)  VALUE                   
               'ONLY ONE CAN BE SELECTED'.                                      
           05  ERR-BAD-DB2.                                                     
               10  FILLER                   PIC  X(26)  VALUE                   
                   'DB2 FAILED WITH SQLCODE = '.                                
               10  ERR-BAD-DB2-CODE         PIC  -999.                          
           05  ERR-ACAT1FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT1FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT3FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT3FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT4FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT4FSC IS NOT AVAILABLE'.                             
                                                                                
           EJECT                                                                
           COPY ACATF2M.                                                        
                                                                                
           EJECT                                                                
           COPY ACAT1FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT2FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT3FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT4FIO.                                                       
                                                                                
           EJECT                                                        01660002
           COPY ACATCOM.                                                        
                                                                                
           EJECT                                                                
           COPY DFHAID.                                                         
                                                                                
           EJECT                                                                
           COPY ATTR.                                                           
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA.                                                         
           05  FILLER                       PIC  X(2000).                       
                                                                                
           EJECT                                                                
           COPY TWACOMMN.                                                       
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           EJECT                                                                
      ****************                                                          
       INITIALIZATION.                                                          
      ****************                                                          
                                                                                
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
                                                                                
           EXEC CICS                                                            
              ASSIGN TWALENG(TWA-SIZE)                                          
           END-EXEC.                                                            
                                                                                
           IF TWA-SIZE  = ZERO                                                  
              MOVE LOW-VALUES               TO  ACATF2MO                        
              MOVE 'TWA SIZE EQUAL ZERO - PROGRAM CANNOT FUNCTION'              
                                            TO  M2ERRMSGO                       
              PERFORM WRITE-ACAT2FIO-COMMAREA                                   
              PERFORM SEND-MAP-ERASE                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EXEC CICS                                                            
              ADDRESS TWA (ADDRESS OF TWA-AREA)                                 
           END-EXEC.                                                            
                                                                                
           MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT2FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
                                                                                
      *    IF  ACAT-PROGRAM-NAME = 'ACAT2FSC'                                   
      *        MOVE SPACES                  TO  ACAT-CALLING-PROG-NAME          
      *        PERFORM CONTINUE-PROCESSESING                                    
      *    ELSE                                                                 
      *        MOVE 'ACAT2FSC'              TO  ACAT-PROGRAM-NAME               
      *        PERFORM FIRST-TIME-RTN                                           
      *    END-IF.                                                              
                                                                                
           IF ACAT2FIO-FIRST-TIME                                               
              PERFORM FIRST-TIME-RTN                                            
           ELSE                                                                 
              PERFORM RECEIVE-MAP                                               
              EVALUATE ACAT2FIO-NSCC-PEND-CD                                    
                 WHEN 'Y'                                                       
                    PERFORM XCTL-RTN                                            
                 WHEN OTHER                                                     
                    PERFORM BASIC-PROCESSING                                    
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       FIRST-TIME-RTN.                                                          
      ******************                                                        
                                                                                
           SET FIRST-TIME                   TO  TRUE.                           
           SET ACAT2FIO-NOT-FIRST-TIME      TO  TRUE.                           
           SET ACAT2FIO-READ-DATABASE       TO  TRUE.                           
                                                                                
           PERFORM LINK-TO-DB2.                                                 
                                                                                
           PERFORM PREPARE-FIELDS.                                              
           PERFORM FORMAT-MAP-OUTPUT.                                           
                                                                                
           EVALUATE ACAT2FIO-NSCC-PEND-CD                                       
              WHEN 'Y'                                                          
                 PERFORM PROTECT-ALL-FIELDS                                     
                 MOVE 'RECORD HAS ALREADY BEEN SENT TO NSCC - NO UPDATES        
      -               ' CAN BE DONE AT THIS TIME'                               
                                            TO  M2ERRMSGO                       
              WHEN 'A'                                                          
                 MOVE 'RECORD HAS BEEN ACKNOWLEDGED BY NSCC - UPDATES WI        
      -               'LL CAUSE RETRANSMISSION'                                 
                                             TO M2ERRMSGO                       
              WHEN OTHER                                                        
                 CONTINUE                                                       
           END-EVALUATE.                                                        
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
LRM005     OR  ACAT-SIGN-ON-ASCENDIS-RSTRCT                                     
DJ0001         CONTINUE                                                         
DJ0001     ELSE                                                                 
DJ0001         PERFORM PROTECT-ALL-FIELDS                                       
DJ0001         MOVE '(BROWSE ONLY)'         TO  M2LITERO                        
DJ0001         MOVE ATT-PROT                TO  M2VALUEA                        
DJ0001     END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
                                                                                
           SET NOT-FIRST-TIME               TO  TRUE.                           
                                                                                
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       FORMAT-MAP-OUTPUT.                                                       
      *******************                                                       
                                                                                
           INITIALIZE ACATF2MO.                                                 
                                                                                
           MOVE -1                          TO  M2MFTRANL.                      
           MOVE ACAT2FIO-ACAT-CONTROL-NBR   TO  M2CNTLNO.                       
           MOVE ACAT2FIO-DLVR-NBR           TO  M2DELBKRO.                      
           MOVE ACAT2FIO-BRKR-EXCTG-NBR     TO  M2EXBKRO.                       
           MOVE ACAT2FIO-BRANCH             TO  M2BRCHO.                        
           MOVE ACAT2FIO-ACCOUNT            TO  M2ACCTO.                        
           MOVE ACAT2FIO-TC                 TO  M2TCO.                          
           MOVE ACAT2FIO-ISIN-SEC-ISSUE-CD  TO  M2SECO.                         
           EVALUATE ACAT2FIO-MF-TRANS-TYPE-CD                                   
              WHEN '1'                                                          
                 MOVE 'N'                   TO  M2MFTRANO                       
                                                ACAT2FIO-M2MFTRAN               
              WHEN '2'                                                          
                 MOVE 'E'                   TO  M2MFTRANO                       
                                                ACAT2FIO-M2MFTRAN               
              WHEN '3'                                                          
                 MOVE 'D'                   TO  M2MFTRANO                       
                                                ACAT2FIO-M2MFTRAN               
           END-EVALUATE.                                                        
           MOVE ACAT2FIO-FUND-ACCT-CD       TO  M2FUNDACO                       
                                                ACAT2FIO-M2FUNDAC.              
           MOVE ACAT2FIO-CNTRY-ORGN-CD      TO  M2CNTRYO                        
                                                ACAT2FIO-M2CNTRY.               
           EVALUATE ACAT2FIO-BK-PHSCL-SHR-CD                                    
              WHEN '0'                                                          
                 MOVE 'B'                   TO  M2BKPHYSO                       
                                                ACAT2FIO-M2BKPHYS               
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M2BKPHYSO                       
                                                ACAT2FIO-M2BKPHYS               
              WHEN '2'                                                          
                 MOVE 'P'                   TO  M2BKPHYSO                       
                                                ACAT2FIO-M2BKPHYS               
           END-EVALUATE.                                                        
           EVALUATE ACAT2FIO-DLRVY-CD                                           
              WHEN '0'                                                          
                 MOVE 'C'                   TO  M2DLVRCDO                       
                                                ACAT2FIO-M2DLVRCD               
              WHEN '1'                                                          
                 MOVE 'B'                   TO  M2DLVRCDO                       
                                                ACAT2FIO-M2DLVRCD               
              WHEN '2'                                                          
                 MOVE 'E'                   TO  M2DLVRCDO                       
                                                ACAT2FIO-M2DLVRCD               
           END-EVALUATE.                                                        
           MOVE ACAT2FIO-ACH-IND            TO  M2CLRHSEO                       
                                                ACAT2FIO-M2CLRHSE.              
           MOVE ACAT2FIO-PAC-IND            TO  M2PACO                          
                                                ACAT2FIO-M2PAC.                 
           MOVE ACAT2FIO-SWP-IND            TO  M2SWPO                          
                                                ACAT2FIO-M2SWP.                 
           MOVE ACAT2FIO-MRGN-ACCT-IND      TO  M2MRGNO                         
                                                ACAT2FIO-M2MRGN.                
           MOVE ACAT2FIO-TRD-RLTD-IND       TO  M2RELTRDO                       
                                                ACAT2FIO-M2RELTRD.              
           MOVE ACAT2FIO-ABA-ROUTING-NBR    TO  M2ABANBRO                       
                                                ACAT2FIO-M2ABANBR.              
           MOVE ACAT2FIO-DSBMT-FRCTN-CSH-CD TO  M2DISBRSO                       
                                                ACAT2FIO-M2DISBRS.              
           EVALUATE ACAT2FIO-DSBMT-ACCRL-CD                                     
              WHEN '2'                                                          
                 MOVE 'C'                   TO  M2ACCRLO                        
                                                ACAT2FIO-M2ACCRL                
              WHEN '4'                                                          
                 MOVE 'B'                   TO  M2ACCRLO                        
                                                ACAT2FIO-M2ACCRL                
           END-EVALUATE.                                                        
           MOVE ACAT2FIO-DSBMT-RSDL-CD      TO  M2RESIDO                        
                                                ACAT2FIO-M2RESID.               
           MOVE ACAT2FIO-TPA-NBR            TO  M2TPAO                          
                                                ACAT2FIO-M2TPA.                 
           MOVE ACAT2FIO-MEMO-TXT           TO  M2MEMOO                         
                                                ACAT2FIO-M2MEMO.                
           MOVE ACAT2FIO-ASSET-DESC         TO  M2FUNDO.                        
           MOVE 'UNDO CHANGES:'             TO  M2LITERO.                       
           MOVE ' '                         TO  M2VALUEO.                       
                                                                                
           EJECT                                                                
      ******************                                                        
       BASIC-PROCESSING.                                                        
      ******************                                                        
                                                                                
           IF M2LITERI = 'UNDO CHANGES:'                                        
              PERFORM CHECK-FOR-UPDATES                                         
              IF ACAT2FIO-UPDATE-DATABASE                                       
                 PERFORM UNDO-CHANGES-VALIDATION                                
                 IF M2VALUEI = ' '                                              
                    PERFORM PREPARE-FIELDS                                      
                    PERFORM DATA-VALIDATION                                     
                    IF M2ERRMSGO = SPACES OR LOW-VALUES                         
                       IF EIBAID = DFHENTER                                     
                          PERFORM XCTL-RTN                                      
                       ELSE                                                     
                          MOVE '     CONFIRM:' TO M2LITERO                      
                          MOVE -1              TO M2VALUEL                      
                       MOVE 'YOU ARE ABOUT TO UPDATE THE DATABASE - PLEA        
      -                     'SE CONFIRM WITH Y, OR REJECT WITH N'               
                                            TO  M2ERRMSGO                       
                       END-IF                                                   
      *             ELSE                                                        
      *                IF EIBAID NOT = DFHENTER                                 
      *                   PERFORM XCTL-RTN                                      
      *                END-IF                                                   
                    END-IF                                                      
                    PERFORM SEND-MAP-DATAONLY                                   
                    PERFORM RETURN-TO-CICS                                      
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                    PERFORM XCTL-RTN                                            
                 END-IF                                                         
              ELSE                                                              
                 IF EIBAID = DFHENTER                                           
                    PERFORM PREPARE-FIELDS                                      
                    MOVE SPACES             TO  M2ERRMSGO                       
                                                M2VALUEO                        
                 END-IF                                                         
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           ELSE                                                                 
              IF M2LITERI = '     CONFIRM:'                                     
                 PERFORM CONFIRMATION-VALIDATION                                
                 IF M2VALUEI = 'Y'                                              
                    IF ACAT2FIO-NSCC-PEND-CD = 'A'                              
                       MOVE ' '                TO  ACAT2FIO-NSCC-PEND-CD        
                    END-IF                                                      
                    PERFORM LINK-TO-DB2                                         
                    PERFORM FORMAT-MAP-OUTPUT                                   
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
                 MOVE SPACES                   TO  M2ERRMSGO                    
                                                   M2VALUEO                     
                 MOVE 'UNDO CHANGES:'          TO  M2LITERO                     
                 PERFORM XCTL-RTN                                               
              ELSE                                                              
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       CHECK-FOR-UPDATES.                                                       
      *******************                                                       
                                                                                
           IF M2MFTRANI NOT = ACAT2FIO-M2MFTRAN  OR                             
              M2FUNDACI NOT = ACAT2FIO-M2FUNDAC  OR                             
              M2BKPHYSI NOT = ACAT2FIO-M2BKPHYS  OR                             
              M2DLVRCDI NOT = ACAT2FIO-M2DLVRCD  OR                             
              M2CLRHSEI NOT = ACAT2FIO-M2CLRHSE  OR                             
              M2PACI    NOT = ACAT2FIO-M2PAC     OR                             
              M2SWPI    NOT = ACAT2FIO-M2SWP     OR                             
              M2MRGNI   NOT = ACAT2FIO-M2MRGN    OR                             
              M2RELTRDI NOT = ACAT2FIO-M2RELTRD  OR                             
              M2ABANBRI NOT = ACAT2FIO-M2ABANBR  OR                             
              M2DISBRSI NOT = ACAT2FIO-M2DISBRS  OR                             
              M2ACCRLI  NOT = ACAT2FIO-M2ACCRL   OR                             
              M2RESIDI  NOT = ACAT2FIO-M2RESID   OR                             
              M2TPAI    NOT = ACAT2FIO-M2TPA     OR                             
              M2CNTRYI  NOT = ACAT2FIO-M2CNTRY   OR                             
              M2MEMOI   NOT = ACAT2FIO-M2MEMO                                   
              SET ACAT2FIO-UPDATE-DATABASE  TO  TRUE                            
           ELSE                                                                 
              MOVE 'N'                 TO  ACAT2FIO-READ-UPDATE-DATABASE        
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       UNDO-CHANGES-VALIDATION.                                                 
      ************************                                                  
                                                                                
           EVALUATE TRUE                                                        
              WHEN M2VALUEI = (' ' OR 'Y')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'UNDO CHANGES FIELD SHOULD BE BLANK TO CONTINUE, O        
      -               'R Y TO STOP AND UNDO CHANGES'                            
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************************                                                 
       CONFIRMATION-VALIDATION.                                                 
      *************************                                                 
                                                                                
           EVALUATE TRUE                                                        
              WHEN M2VALUEI = ('Y' OR 'N')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'CONFIRMATION FIELD CAN BE ONLY Y OR N'                   
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
                                                                                
           EJECT                                                                
      ****************                                                          
       SEND-MAP-ERASE.                                                          
      ****************                                                          
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE 'AMFX'                      TO  M2TRIDO.                        
           MOVE WSMMDDYY                    TO  M2DATEO.                        
           MOVE WSTIME                      TO  M2TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF2M')                                        
                          MAPSET('ACATF2M')                                     
                          FROM(ACATF2MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *******************                                                       
       SEND-MAP-DATAONLY.                                                       
      *******************                                                       
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
           MOVE 'AMFX'                      TO  M2TRIDO.                        
           MOVE WSMMDDYY                    TO  M2DATEO.                        
           MOVE WSTIME                      TO  M2TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF2M')                                        
                          MAPSET('ACATF2M')                                     
                          FROM(ACATF2MO)                                        
                          DATAONLY                                              
                          CURSOR                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       RECEIVE-MAP.                                                             
      *************                                                             
                                                                                
           MOVE LOW-VALUES                 TO  ACATF2MI.                        
                                                                                
           EXEC CICS  RECEIVE MAP('ACATF2M')                                    
                              MAPSET('ACATF2M')                                 
                              INTO(ACATF2MI)                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       DATA-VALIDATION.                                                         
      *****************                                                         
                                                                                
           MOVE SPACES                      TO  M2ERRMSGO.                      
                                                                                
           MOVE M2MEMOI                  TO  ACAT2FIO-MEMO-TXT.                 
                                                                                
           IF M2TPAI = SPACES OR LOW-VALUES OR ZEROES                           
              MOVE SPACES                TO  ACAT2FIO-TPA-NBR                   
           ELSE                                                                 
              IF M2TPAI NUMERIC                                                 
                 MOVE M2TPAI             TO  ACAT2FIO-TPA-NBR                   
              ELSE                                                              
                 MOVE 'TPA NUMBER MUST BE NUMERIC'                              
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2TPAL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M2TPAA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2RESIDI = ('0' OR '1' OR '2' OR '3' OR '4' OR '5')               
              MOVE M2RESIDI              TO  ACAT2FIO-DSBMT-RSDL-CD             
           ELSE                                                                 
              MOVE 'RESIDUAL INDICATOR MUST BE 0, 1, 2, 3, 4 OR 5'              
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2RESIDL                           
              MOVE ATT-UNPROT-BRT-MDT    TO  M2RESIDA                           
           END-IF.                                                              
                                                                                
           IF M2DISBRSI = SPACES OR LOW-VALUES                                  
              MOVE 'DISBURSMENT RESIDUAL CODE IS REQUIRED'                      
                                          TO  M2ERRMSGO                         
              MOVE -1                     TO  M2DISBRSL                         
           ELSE                                                                 
              IF M2DISBRSI = ('0' OR '1' OR '2' OR '3' OR '4' OR '5')           
                 MOVE M2DISBRSI        TO  ACAT2FIO-DSBMT-FRCTN-CSH-CD          
              ELSE                                                              
                 MOVE 'DISBURSMENT INDICATOR MUST BE 0, 1, 2, 3, 4 OR 5'        
                                          TO  M2ERRMSGO                         
                 MOVE -1                  TO  M2DISBRSL                         
                 MOVE ATT-UNPROT-BRT-MDT  TO  M2DISBRSA                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2ACCRLI = SPACES OR LOW-VALUES                                   
              MOVE 'DISBURSMENT ACCRUALS CODE IS REQUIRED'                      
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2ACCRLL                           
           ELSE                                                                 
              EVALUATE M2ACCRLI                                                 
                 WHEN 'C'                                                       
                    MOVE '2'             TO  ACAT2FIO-DSBMT-ACCRL-CD            
                 WHEN 'B'                                                       
                    MOVE '4'             TO  ACAT2FIO-DSBMT-ACCRL-CD            
                 WHEN OTHER                                                     
                    MOVE 'ACCRUAL INDICATOR MUST C OR B'                        
                                         TO  M2ERRMSGO                          
                    MOVE -1              TO  M2ACCRLL                           
                    MOVE ATT-UNPROT-BRT-MDT TO M2ACCRLA                         
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF ACAT2FIO-PYBL-INFO-CD = '2'                                       
              IF M2ABANBRI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE 'ABA ROUT. NUMBER IS REQUIRED, WHEN PAYABLE IN FO.        
      -               ' IND. IS ACH'     TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2ABANBRL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M2ABANBRA                          
              ELSE                                                              
                 IF M2ABANBRI NUMERIC                                           
                    MOVE M2ABANBRI       TO  ACAT2FIO-ABA-ROUTING-NBR           
                 ELSE                                                           
                    MOVE 'ABA ROUTING NUMBER MUST BE NUMERIC'                   
                                         TO  M2ERRMSGO                          
                    MOVE -1              TO  M2ABANBRL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M2ABANBRA                       
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF M2ABANBRI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE SPACES              TO ACAT2FIO-ABA-ROUTING-NBR           
                                                M2ABANBRO                       
              ELSE                                                              
                 IF M2ABANBRI NUMERIC                                           
                    MOVE M2ABANBRI       TO  ACAT2FIO-ABA-ROUTING-NBR           
                 ELSE                                                           
                    MOVE 'ABA ROUTING NUMBER MUST BE NUMERIC'                   
                                            TO  M2ERRMSGO                       
                    MOVE -1              TO  M2ABANBRL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M2ABANBRA                       
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2RELTRDI = SPACES OR LOW-VALUES                                  
              MOVE SPACES                TO  ACAT2FIO-TRD-RLTD-IND              
           ELSE                                                                 
              IF M2RELTRDI = ('Y' OR 'N')                                       
                 MOVE M2RELTRDI          TO  ACAT2FIO-TRD-RLTD-IND              
              ELSE                                                              
                 MOVE 'RELATED TRADE INDICATOR MUST BE Y OR N'                  
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2RELTRDL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M2RELTRDA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2MRGNI = SPACES OR LOW-VALUES                                    
              MOVE 'MARGIN ACCOUNT INDICATOR IS REQUIRED'                       
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2MRGNA                            
           ELSE                                                                 
              IF M2MRGNI = ('Y' OR 'N')                                         
                 MOVE M2MRGNI            TO  ACAT2FIO-MRGN-ACCT-IND             
              ELSE                                                              
                 MOVE 'MARGIN INDICATOR MUST BE Y OR N'                         
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2MRGNL                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M2MRGNA                            
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2SWPI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT2FIO-SWP-IND                   
           ELSE                                                                 
              IF M2SWPI = ('Y' OR 'N')                                          
                 MOVE M2SWPI             TO  ACAT2FIO-SWP-IND                   
              ELSE                                                              
                 MOVE 'SWP INDICATOR MUST BE Y OR N'                            
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2SWPL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M2SWPA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2PACI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT2FIO-PAC-IND                   
           ELSE                                                                 
              IF M2PACI = ('Y' OR 'N')                                          
                 MOVE M2PACI             TO  ACAT2FIO-PAC-IND                   
              ELSE                                                              
                 MOVE 'PAC INDICATOR MUST BE Y OR N'                            
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2PACL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M2PACA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2CLRHSEI = SPACES OR LOW-VALUES                                  
              MOVE SPACES                TO  ACAT2FIO-ACH-IND                   
           ELSE                                                                 
              IF M2CLRHSEI = ('Y' OR 'N')                                       
                 MOVE M2CLRHSEI          TO  ACAT2FIO-ACH-IND                   
              ELSE                                                              
                 MOVE 'CLEARING HOUSE INDICATOR MUST BE Y OR N'                 
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2CLRHSEL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M2CLRHSEA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET BOOK-PHYS-VALID              TO  TRUE.                           
           IF M2BKPHYSI = SPACES OR LOW-VALUES                                  
              MOVE 'BOOK/PHYSICAL SHARE INDICATOR IS REQUIRED'                  
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2BKPHYSL                          
              SET BOOK-PHYS-INVALID      TO  TRUE                               
           ELSE                                                                 
              EVALUATE M2BKPHYSI                                                
                 WHEN 'B'                                                       
                    MOVE '0'             TO  ACAT2FIO-BK-PHSCL-SHR-CD           
                 WHEN 'F'                                                       
                    MOVE '1'             TO  ACAT2FIO-BK-PHSCL-SHR-CD           
                 WHEN 'P'                                                       
                    MOVE '2'             TO  ACAT2FIO-BK-PHSCL-SHR-CD           
                 WHEN OTHER                                                     
                    MOVE 'BOOK-PHYSICAL INDICATOR MUST BE B, F OR P'            
                                         TO  M2ERRMSGO                          
                    MOVE -1              TO  M2BKPHYSL                          
                    MOVE ATT-UNPROT-BRT-MDT TO M2BKPHYSA                        
                    SET BOOK-PHYS-INVALID   TO TRUE                             
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF BOOK-PHYS-VALID                                                   
              IF M2BKPHYSI = 'P'                                                
                 IF M2DLVRCDI = SPACES OR LOW-VALUES                            
                    MOVE 'PI DELIVERY INDICATOR IS REQUIRED, BECAUSE BOO        
      -                  'K/PHYSICAL IS P'  TO  M2ERRMSGO                       
                    MOVE -1                 TO  M2DLVRCDL                       
                 ELSE                                                           
                    EVALUATE M2DLVRCDI                                          
                       WHEN 'C'                                                 
                          MOVE '0'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN 'B'                                                 
                          MOVE '1'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN 'E'                                                 
                          MOVE '2'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN OTHER                                               
                          MOVE 'DELIVERY CODE MUST BE C, B OR E'                
                                            TO  M2ERRMSGO                       
                          MOVE -1           TO  M2DLVRCDL                       
                          MOVE ATT-UNPROT-BRT-MDT TO M2DLVRCDA                  
                    END-EVALUATE                                                
                 END-IF                                                         
              ELSE                                                              
                 IF M2DLVRCDI = SPACES OR LOW-VALUES                            
                    MOVE SPACES             TO  ACAT2FIO-DLRVY-CD               
                 ELSE                                                           
                    EVALUATE M2DLVRCDI                                          
                       WHEN 'C'                                                 
                          MOVE '0'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN 'B'                                                 
                          MOVE '1'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN 'E'                                                 
                          MOVE '2'          TO  ACAT2FIO-DLRVY-CD               
                       WHEN OTHER                                               
                          MOVE 'DELIVERY CODE MUST BE C, B OR E'                
                                            TO  M2ERRMSGO                       
                          MOVE -1           TO  M2DLVRCDL                       
                          MOVE ATT-UNPROT-BRT-MDT TO M2DLVRCDA                  
                    END-EVALUATE                                                
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET FUND-ACCT-VALID              TO  TRUE.                           
           IF M2FUNDACI = SPACES OR LOW-VALUES                                  
              MOVE 'FUND ACCOUNT INDICATOR IS REQUIRED'                         
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2FUNDACL                          
              SET FUND-ACCT-INVALID      TO  TRUE                               
           ELSE                                                                 
LRM004        IF M2FUNDACI = ('0' OR '1' OR '2' OR '3' OR '4' OR '5')           
                 MOVE M2FUNDACI          TO  ACAT2FIO-FUND-ACCT-CD              
              ELSE                                                              
                 MOVE                                                           
LRM004           'FUND ACCOUNT INDICATOR MUST BE 0,1,2,3,4 OR 5'                
                                         TO  M2ERRMSGO                          
                 MOVE -1                 TO  M2FUNDACL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M2FUNDACA                          
                 SET FUND-ACCT-INVALID   TO  TRUE                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF FUND-ACCT-VALID                                                   
              IF (M2FUNDACI = '1' OR '3') AND                                   
                 M2CNTRYI = SPACES OR LOW-VALUES                                
                 MOVE 'COUNTRY OF ORIGIN IS REQUIRED WHEN FUND ACCOUNT C        
      -               'ODE IS 1 OR 3'       TO  M2ERRMSGO                       
                 MOVE -1                    TO  M2CNTRYL                        
              ELSE                                                              
                 MOVE M2CNTRYI              TO  VALID-COUNTRY-CODES             
                 IF VALID-COUNTRY-CODE                                          
                    MOVE M2CNTRYI            TO  ACAT2FIO-CNTRY-ORGN-CD         
                    MOVE ATT-UNPROT-MDT      TO  M2CNTRYA                       
                 ELSE                                                           
                    MOVE 'COUNTRY CODE IS NOT RECOGNIZED'                       
                                            TO  M2ERRMSGO                       
                    MOVE -1                 TO  M2CNTRYL                        
                    MOVE ATT-UNPROT-BRT-MDT TO  M2CNTRYA                        
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M2MFTRANI = SPACES OR LOW-VALUES                                  
              MOVE 'MF TRANSACTION TYPE IS REQUIRED'                            
                                         TO  M2ERRMSGO                          
              MOVE -1                    TO  M2MFTRANL                          
           ELSE                                                                 
              EVALUATE M2MFTRANI                                                
                 WHEN 'N'                                                       
                    MOVE '1'             TO ACAT2FIO-MF-TRANS-TYPE-CD           
                 WHEN 'E'                                                       
                    MOVE '2'             TO ACAT2FIO-MF-TRANS-TYPE-CD           
                 WHEN 'D'                                                       
                    MOVE '3'             TO ACAT2FIO-MF-TRANS-TYPE-CD           
                 WHEN OTHER                                                     
                    MOVE 'TRANSACTION TYPE MUST BE N, E OR D'                   
                                         TO  M2ERRMSGO                          
                    MOVE -1              TO  M2MFTRANL                          
                    MOVE ATT-UNPROT-BRT-MDT TO M2MFTRANA                        
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********                                                                
       XCTL-RTN.                                                                
      **********                                                                
                                                                                
           EVALUATE TRUE                                                        
              WHEN EIBAID = DFHPF11 OR DFHCLEAR                                 
                 PERFORM RETURN-CONTROL-RTN                                     
              WHEN EIBAID = DFHPF10 OR DFHPF12                                  
                 PERFORM RETURN-CONTROL-TO-MAIN                                 
              WHEN EIBAID = DFHENTER                                            
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
              WHEN EIBAID = DFHPF1                                              
                 PERFORM XCTL-RECEIVER-REGISTRATION-1                           
              WHEN EIBAID = DFHPF2                                              
                 INITIALIZE ACAT2FIO                                            
                 PERFORM FIRST-TIME-RTN                                         
              WHEN EIBAID = DFHPF3                                              
                 PERFORM XCTL-PIP-SWP                                           
              WHEN EIBAID = DFHPF4                                              
                 PERFORM XCTL-PAYABLES                                          
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'      TO  M2ERRMSGO                       
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************                                                             
       LINK-TO-DB2.                                                             
      *************                                                             
                                                                                
           EXEC CICS LINK PROGRAM('ACAT2FDB')                                   
                         COMMAREA(ACAT2FIO-COMMAREA)                            
           END-EXEC.                                                            
                                                                                
           IF ACAT2FIO-DB2-BAD-RETURN                                           
              MOVE LOW-VALUES               TO  ACATF2MO                        
              MOVE ACAT2FIO-DB2-RETURN-CODE TO  ERR-BAD-DB2-CODE                
              MOVE ERR-BAD-DB2              TO  M2ERRMSGO                       
              IF FIRST-TIME                                                     
                 PERFORM SEND-MAP-ERASE                                         
              ELSE                                                              
                 PERFORM SEND-MAP-DATAONLY                                      
              END-IF                                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-1.                                            
      ******************************                                            
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                   TO  TERM-ID.                         
           MOVE 'AMF1'                     TO  TRAN-ID.                         
           MOVE +1                         TO  ITEM-NUMBER.                     
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT1FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT1FIO-FIRST-TIME         TO  TRUE.                            
           MOVE ACAT2FIO-NSCC-PEND-CD      TO  ACAT1FIO-NSCC-PEND-CD.           
           INITIALIZE ACAT1FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT1FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT1FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT1FSC                TO  M2ERRMSGO.                      
           MOVE -1                          TO  M2TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **************                                                            
       XCTL-PIP-SWP.                                                            
      **************                                                            
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT3FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT3FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT2FIO-NSCC-PEND-CD       TO  ACAT3FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT3FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT3FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER) REWRITE                        
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT3FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT3FSC                TO  M2ERRMSGO.                      
           MOVE -1                          TO  M2TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       XCTL-PAYABLES.                                                           
      ***************                                                           
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT4FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT4FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT2FIO-NSCC-PEND-CD       TO  ACAT4FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT4FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT4FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER) REWRITE                        
           END-EXEC.                                                            
                                                                                
                                                                                
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT4FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT4FSC                TO  M2ERRMSGO.                      
           MOVE -1                          TO  M2TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-FIELDS.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-UNPROT-MDT              TO  M2MFTRANA                       
                                                M2CNTRYA                        
                                                M2FUNDACA                       
                                                M2BKPHYSA                       
                                                M2DLVRCDA                       
                                                M2CLRHSEA                       
                                                M2PACA                          
                                                M2SWPA                          
                                                M2MRGNA                         
                                                M2RELTRDA                       
                                                M2ABANBRA                       
                                                M2DISBRSA                       
                                                M2ACCRLA                        
                                                M2RESIDA                        
                                                M2TPAA                          
                                                M2MEMOA.                        
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-FIELDS.                                                            
      **************                                                            
                                                                                
           MOVE SPACES                      TO  M2CNTLNO                        
                                                M2DELBKRO                       
                                                M2EXBKRO                        
                                                M2BRCHO                         
                                                M2ACCTO                         
                                                M2TCO                           
                                                M2SECO                          
                                                M2MFTRANO                       
                                                M2CNTRYO                        
                                                M2FUNDACO                       
                                                M2BKPHYSO                       
                                                M2DLVRCDO                       
                                                M2CLRHSEO                       
                                                M2PACO                          
                                                M2SWPO                          
                                                M2MRGNO                         
                                                M2RELTRDO                       
                                                M2ABANBRO                       
                                                M2DISBRSO                       
                                                M2ACCRLO                        
                                                M2RESIDO                        
                                                M2TPAO                          
                                                M2MEMOO                         
                                                M2FUNDO                         
                                                M2ERRMSGO.                      
           PERFORM PROTECT-ALL-FIELDS.                                          
                                                                                
           EJECT                                                                
      ********************                                                      
       PROTECT-ALL-FIELDS.                                                      
      ********************                                                      
                                                                                
           MOVE ATT-PROT                    TO  M2CNTLNA                        
                                                M2DELBKRA                       
                                                M2EXBKRA                        
                                                M2BRCHA                         
                                                M2ACCTA                         
                                                M2TCA                           
                                                M2SECA                          
                                                M2MFTRANA                       
                                                M2CNTRYA                        
                                                M2FUNDACA                       
                                                M2BKPHYSA                       
                                                M2DLVRCDA                       
                                                M2CLRHSEA                       
                                                M2PACA                          
                                                M2SWPA                          
                                                M2MRGNA                         
                                                M2RELTRDA                       
                                                M2ABANBRA                       
                                                M2DISBRSA                       
                                                M2ACCRLA                        
                                                M2RESIDA                        
                                                M2TPAA                          
                                                M2MEMOA                         
                                                M2FUNDA.                        
                                                                                
           EJECT                                                                
      *******************                                                       
       GET-DATE-AND-TIME.                                                       
      *******************                                                       
                                                                                
           EXEC  CICS ASKTIME                                                   
                 ABSTIME(WSABSTIME)                                             
           END-EXEC.                                                            
                                                                                
           EXEC  CICS FORMATTIME                                                
                 ABSTIME(WSABSTIME)                                             
                 MMDDYY(WSMMDDYY)                                               
                 DATESEP(WSDATESEP)                                             
                 TIME(WSTIME)                                                   
                 TIMESEP(WSTIMESEP)                                             
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       SEND-CONTROL-ERASE.                                                      
      ********************                                                      
                                                                                
           EXEC CICS SEND CONTROL                                               
                          ERASE                                                 
                          FREEKB                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************************                                                 
       WRITE-ACAT2FIO-COMMAREA.                                                 
      *************************                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT2FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       DELETE-ALL-TSQS.                                                         
      *****************                                                         
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           MOVE 'AXB1'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       RETURN-CONTROL-RTN.                                                      
      ********************                                                      
                                                                                
           PERFORM SEND-CONTROL-ERASE.                                          
                                                                                
           PERFORM DELETE-ALL-TSQS.                                             
                                                                                
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ****************                                                          
       RETURN-TO-CICS.                                                          
      ****************                                                          
                                                                                
           MOVE '2'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
           PERFORM WRITE-ACAT2FIO-COMMAREA.                                     
                                                                                
           EXEC CICS RETURN                                                     
                     TRANSID('AMFX')                                            
                     COMMAREA(ACATCOMM-COMMAREA)                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ************************                                                  
       RETURN-CONTROL-TO-MAIN.                                                  
      ************************                                                  
                                                                                
           PERFORM SEND-CONTROL-ERASE                                           
                                                                                
           PERFORM DELETE-ALL-TSQS.                                             
                                                                                
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
LRM003     IF ACAT2FIO-CALL-RTN-PROGRAM = 'ACAT05RN'                            
LRM003        EXEC CICS XCTL PROGRAM('ACAT05RN')                                
LRM003                       COMMAREA(ACATCOMM-COMMAREA)                        
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
           EXEC CICS XCTL PROGRAM('ACAT04RS')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT04RS IS NOT AVAILABLE'                             
                                            TO  M2ERRMSGO.                      
           MOVE -1                          TO  M2TRIDL.                        
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
