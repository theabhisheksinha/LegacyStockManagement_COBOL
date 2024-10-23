PARM LINK(CAT661  R)                                                            
*       PDX    - CAT661   C0166376 11/01/01 09:12:05 TBLAMUR                    
*       PDX    - CAT661   C0123113 03/23/99 09:31:08 TBELPIN                    
*       PDX    - CAT661   C0120335 01/23/99 11:36:17 TBELPIN                    
*                                                                               
*   THIS PROGRAM PRINTS ACAT PENDING BY DISTRIBUTION SIDE AND                   
*   ACTION TYPE(ACCEPTED,PENDING OR REJECTED)                                   
*                                                                               
*   PDX 123113  E. PINTO                                                        
*              - CHANGE REPORT LAYOUT TO MOVE MSD DESCRIPTION TO                
*                LINE 1, ADD TOTALS AND CHANGE SORT SEQUENCE                    
*                                                                               
FILE REJTAB TABLE (200)                                                         
ARG    1  3  A.                                                                 
DESC   4 50  A                                                                  
*                                                                               
FILE IPENS                                                                      
   I-CLT          1    3  N                                                     
   I-HDR-LIT      1    5  A                                                     
   I-CUST-BACCT   5   20  A                                                     
   I-CUST-BR      5    3  A                                                     
   I-CUST-ACCT    8    5  A                                                     
   I-CNTL-NBR    25   14  A HEADING('ACAT/FUND' 'CONTROL NO.')                  
   I-ASSET-SEQ   41    4  N                                                     
   I-CASH-MGN    45    1  A                                                     
   I-DIST-SIDE   46    1  A                                                     
   I-BKR-CLEAR   47    4  A                                                     
   I-CONTRA      51    4  A HEADING('CNTRA')                                    
   I-CUSIP       55    9  A HEADING('CUSIP')                                    
   I-SEC-NO      64    7  A                                                     
   I-FNBR        71   20  A                                                     
   I-ACTION-TYP  91    1  A                                                     
   I-REJ-CD      92    3  A                                                     
   I-NTW-CNTL    95    1  A HEADING('NTW' 'LEV')                                
   I-FS-CNTL     96   11  A                                                     
   I-DESC1      107   29  A   HEADING('DESCRIPTION')                            
   I-DESC2      137   30  A                                                     
   I-ASSET-QTY  171   13  N 5 HEADING('QUANTITY')                               
   I-ASSET-AMT  191   10  N 2 HEADING('VALUE')                                  
   I-ACAT-SD    201    8  N MASK('9999/99/99')                                  
   I-CUR-SD     209    8  N HEADING('FUND/ACAT' 'STL DT') +                     
                            MASK('9999/99/99')                                  
*                                                                               
FILE PRTFLE PRINTER FB(133 27930)                                               
*                                                                               
ACODE                W   4  B VALUE 0                                           
DUMPSW               W   1  A VALUE 'D'                                         
*                                                                               
PREV-CLT             W   3  N VALUE 0                                           
P-CLIENT-NAME        W  30  A VALUE ' '                                         
P-SIDE-DESC          W  25  A VALUE ' '                                         
P-STAT-DESC          W  30  A VALUE ' '                                         
*                                                                               
W-REJ-LINE           W   56 A HEADING('ACAT/FUND' 'CONTROL NO.')                
W-REJ-CD    W-REJ-LINE        4 A                                               
W-REJ-DASH  W-REJ-LINE  +4    2 A VALUE '-'                                     
W-REJ-DESC  W-REJ-LINE  +6   50 A                                               
*                                                                               
W-CNTL-NBR           W   19 A HEADING('ACAT/FUND' 'CONTROL NO.')                
W-FUND-CTL  W-CNTL-NBR       14 A                                               
W-FIL0      W-CNTL-NBR  +14   1 A VALUE '-'                                     
W-ASSET-SEQ W-CNTL-NBR  +15   4 N                                               
*                                                                               
W-BR-ACCT            W   11 A HEADING('ACAT/FUND' 'ACCOUNT')                    
W-BR    W-BR-ACCT         3 A                                                   
W-FIL1  W-BR-ACCT   +3    1 A VALUE '-'                                         
W-ACCT  W-BR-ACCT   +4    5 A                                                   
W-FIL2  W-BR-ACCT   +9    1 A VALUE '-'                                         
W-TYPE  W-BR-ACCT  +10    1 A                                                   
*                                                                               
B1-BROKER               W  218 A                                                
B1-BRK-NO    B1-BROKER       3 N                                                
B1-REC-CODE  B1-BROKER +3    3 A                                                
B1-BRK-NAME  B1-BROKER +64  30 A                                                
B1-BRK-STAT  B1-BROKER +94   1 A                                                
*                                                                               
W-CCYYMMDD               W     8 N                                              
W-XCC     W-CCYYMMDD           2 N                                              
W-XYY     W-CCYYMMDD    +2     2 N                                              
W-XMM     W-CCYYMMDD    +4     2 N                                              
W-XDD     W-CCYYMMDD    +6     2 N                                              
LD-PROC-DATE             W     6 N MASK('99/99/99')                             
W-PMM     LD-PROC-DATE         2 N                                              
W-PDD     LD-PROC-DATE  +2     2 N                                              
W-PYY     LD-PROC-DATE  +4     2 N                                              
*                                                                               
BPDATES-PARM             W   500 A                                              
BP-PGM-NAME    BPDATES-PARM         8 A                                         
BP-REQ-TYPE    BPDATES-PARM   +8    1 A                                         
BP-PROV-CDE    BPDATES-PARM   +9    2 A                                         
BP-BASE-DT     BPDATES-PARM  +11    8 A                                         
BP-DISP-IND    BPDATES-PARM  +19    1 A                                         
BP-REQ-SEAR    BPDATES-PARM  +20    1 A                                         
BP-DISP        BPDATES-PARM  +21    4 N                                         
BP-RET-CDE     BPDATES-PARM  +100   2 A                                         
BP-ERR-CDE     BPDATES-PARM  +102   2 A                                         
BP-ERR-MSG     BPDATES-PARM  +104  50 A                                         
BP-PROC-DATE   BPDATES-PARM  +154   8 N MASK('9999/99/99')                      
BP-JUL-PROC    BPDATES-PARM  +162   7 A                                         
BP-PRIOR-DTE   BPDATES-PARM  +257   8 A                                         
*                                                                               
*****************                                                               
CALL-PGM              W   8 A                                                   
CALL-PARM-NO          W   2 B                                                   
*                                                                               
JOB INPUT NULL                                                                  
BP-PGM-NAME = 'CAT661'                                                          
BP-REQ-TYPE = 'C'                                                               
**CALL ZBPDATES USING (BPDATES-PARM)                                            
CALL-PGM     = 'ZBPDATES'                                                       
CALL-PARM-NO = 1                                                                
CALL CALLPGM USING (CALL-PGM, CALL-PARM-NO, BPDATES-PARM)                       
W-CCYYMMDD = BP-PROC-DATE                                                       
W-PMM = W-XMM                                                                   
W-PDD = W-XDD                                                                   
W-PYY = W-XYY                                                                   
STOP                                                                            
*                                                                               
JOB INPUT IPENS                                                                 
*                                                                               
IF  I-HDR-LIT = 'DATE='                                                         
    GOTO JOB                                                                    
END-IF                                                                          
*                                                                               
IF  PREV-CLT NE I-CLT                                                           
    PREV-CLT =  I-CLT                                                           
    PERFORM 0100-GETB1                                                          
END-IF                                                                          
*                                                                               
W-BR    = I-CUST-BR                                                             
W-ACCT  = I-CUST-ACCT                                                           
IF I-CASH-MGN = 'M'                                                             
   W-TYPE = '2'                                                                 
ELSE                                                                            
   W-TYPE = '1'                                                                 
END-IF                                                                          
IF I-DIST-SIDE = 'R'                                                            
   P-SIDE-DESC = 'RECEIVER BROKER SECTION'                                      
ELSE                                                                            
   P-SIDE-DESC = 'DELIVER BROKER SECTION'                                       
END-IF                                                                          
*                                                                               
W-REJ-LINE = ' '                                                                
IF I-ACTION-TYP = 'R'                                                           
   P-STAT-DESC = 'REJECTED BY FUND'                                             
   IF  I-REJ-CD NE ' '                                                          
       W-REJ-CD   = I-REJ-CD                                                    
       W-REJ-DASH = '-'                                                         
       SEARCH REJTAB WITH I-REJ-CD GIVING W-REJ-DESC                            
   END-IF                                                                       
END-IF                                                                          
IF I-ACTION-TYP = 'P'                                                           
   P-STAT-DESC = 'PENDING STATUS AT FUND'                                       
END-IF                                                                          
IF I-ACTION-TYP = ' '                                                           
   I-ACTION-TYP = 'Q'                                                           
   P-STAT-DESC = 'PENDING FUND ACKNOWLEDGEMENT'                                 
END-IF                                                                          
IF I-ACTION-TYP = 'A'                                                           
   P-STAT-DESC = 'ACCEPTED BY FUND'                                             
END-IF                                                                          
*                                                                               
W-CNTL-NBR                                                                      
W-FUND-CTL    = I-CNTL-NBR                                                      
W-ASSET-SEQ   = I-ASSET-SEQ                                                     
*                                                                               
PRINT RPT                                                                       
*                                                                               
0100-GETB1. PROC                                                                
B1-BRK-NO = I-CLT                                                               
B1-REC-CODE = '010'                                                             
*CALL ZGETB1V USING(B1-BROKER)                                                  
CALL-PGM     = 'ZGETB1V '                                                       
CALL-PARM-NO = 1                                                                
CALL CALLPGM USING (CALL-PGM, CALL-PARM-NO, BPDATES-PARM)                       
P-CLIENT-NAME = ' '                                                             
IF  B1-BRK-STAT = 'A'                                                           
    P-CLIENT-NAME = B1-BRK-NAME                                                 
END-IF                                                                          
END-PROC                                                                        
*                                                                               
REPORT RPT PRINTER PRTFLE LINESIZE 132 NODATE NOADJUST DTLCTL EVERY +           
    SPACE 1  NOSPREAD                                                           
SEQUENCE I-CLT I-DIST-SIDE I-ACTION-TYP I-ACAT-SD  W-BR-ACCT                    
CONTROL FINAL NOPRINT I-CLT NOPRINT NEWPAGE RENUM +                             
      I-DIST-SIDE NEWPAGE NOPRINT  I-ACTION-TYP NEWPAGE NOPRINT +               
      I-ACAT-SD NOPRINT                                                         
TITLE   'CLIENT' +2 I-CLT +2  P-CLIENT-NAME +2 +                                
    '  AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM' +                            
    '      DATE' +2  BP-PROC-DATE                                               
TITLE 2 +56 P-SIDE-DESC                                                         
TITLE 3 +56 P-STAT-DESC                                                         
LINE W-BR-ACCT I-ASSET-QTY    W-CNTL-NBR     +                                  
        I-CUSIP        I-DESC1     I-NTW-CNTL +                                 
        I-ASSET-AMT    I-CUR-SD    I-CONTRA                                     
LINE 2 I-FNBR  POS +3 I-FS-CNTL POS +4 I-SEC-NO POS +8 I-ACAT-SD                
LINE 3 W-REJ-LINE                                                               
AFTER-BREAK. PROC                                                               
IF LEVEL = 01, 02                                                               
   DISPLAY SKIP 1 '  TOTAL NO. OF RECORDS = ' TALLY   +49  +                    
           '  TOTAL AMOUNT = ' I-ASSET-AMT                                      
   DISPLAY SKIP 1 ' '                                                           
END-IF                                                                          
END-PROC                                                                        
*                                                                               
