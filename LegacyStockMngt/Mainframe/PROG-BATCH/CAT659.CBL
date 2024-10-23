PARM LINK(CAT659  R)                                                            
*       PDX    - CAT659   C0272055 11/11/08 18:23:43 TBLAMUR                    
*       PDX    - CAT659   C0158537 06/25/01 16:28:41 TBDOJUN                    
*       PDX    - CAT659   C0125263 06/14/99 13:35:19 TBDOJUN                    
*       PDX    - CAT659   C0122694 03/05/99 11:05:50 TBELPIN                    
*       PDX    - CAT659   C0122288 02/25/99 17:50:49 TBELPIN                    
*       PDX    - CAT659   C0120335 01/24/99 12:19:35 TBELPIN                    
*       PDX    - CAT659   C0120207 01/20/99 16:36:29 TBELPIN                    
*       PDX    - CAT659   C0120335 01/14/99 10:29:20 TBELPIN                    
*       PDX    - CAT659   C0119761 12/27/98 15:17:40 TBELPIN                    
*       PDX    - CAT659   C0117772 12/23/98 11:59:39 TBELPIN                    
*                                                                               
*  THIS PROGRAM GENERATES PEND EXTRACT WRAP AROUND FILE                         
*                                                                               
*  01/14/99 - CHANGED PROGRAM TO SELECT NON-CNS                                 
*             (SETTLEMENT LOCATION CODES 30 & 50)                               
*             FOR NOLOAD INTERFACE FILE IN PROGRAM CAT660.                      
*                                                                               
*  01/22/99 - BYPASS ACAT PENDING RECORD IF NOT SETTLING TODAY                  
*  06/01/99 DJ  - ALLOW ACAT PENDING RECORD IF NOT SETTLING TODAY               
*                 THEY WILL BE USED BY CAT661 FOR FAC REPORT ONLY               
*                                                                               
* 05/08/01 DJ SSR# R5246800 NEW TRANSFER TYPE MFC -MUTUAL FUND CLEANUP          
*             ADD LOGIC TO BYPASS MFC RECORDS                                   
*                                                                               
FILE IPEND VB(1004  27998)                                                      
  I-KEY               1  60 A                                                   
    I-HDR-LIT        31   5 A                                                   
    I-HDR-DATE       36   8 N                                                   
  I-CLT               1   3 N                                                   
  I-CUST-ACCT         4  20 A                                                   
  I-CNTRL-NUM        24  14 A                                                   
  I-REC-TYP          38   1 A                                                   
  I-CLR-NO           39   4 A                                                   
  I-DST-SIDE         43   1 A                                                   
  I-STTL-DTE         44   8 N                                                   
  I-CUSIP            52   9 A                                                   
  I-ASST-SEQ         61   4 N                                                   
  I-ADP-SEC          65   7 A                                                   
  I-PSTN-CD          72   1 A                                                   
  I-STTL-LOC         73   2 A                                                   
  I-ACTION-TYP      320   1 A                                                   
*                                                                               
FILE PENDIN VB(1004  27998)                                                     
  P-KEY               1  60 A                                                   
    P-HDR-IND         1   1 A                                                   
    P-HDR-LIT        31   5 A                                                   
    P-HDR-DATE       36   8 N                                                   
  P-CLT               1   3 N                                                   
  P-CUST-ACCT         4  20 A                                                   
  P-CNTRL-NUM        24  14 A                                                   
  P-REC-TYP          38   1 A                                                   
  P-CLR-NO           39   4 A                                                   
  P-DST-SIDE         43   1 A                                                   
  P-STTL-DTE         44   8 N                                                   
  P-CUSIP            52   9 A                                                   
  P-TRNFR-TYPE       52   3 A                                                   
  P-ASST-SEQ         61   4 N                                                   
  P-ADP-SEC          65   7 A                                                   
  P-PSTN-CD          72   1 A                                                   
  P-STTL-LOC         73   2 A                                                   
*                                                                               
FILE OPEND  VB(1004  27998)                                                     
  O-KEY               1  60 A                                                   
    O-HDR-IND         1   1 A                                                   
    O-HDR-LIT        31   5 A                                                   
    O-HDR-DATE       36   8 N                                                   
*                                                                               
*                                                                               
ACODE                  W   4 B VALUE 0                                          
DUMPSW                 W   1 A VALUE 'D'                                        
*                                                                               
FIRST-TIME            W   1 A VALUE 'Y'                                         
*                                                                               
W-REC-CTR             W  11 N VALUE 0                                           
*                                                                               
W-TRNFR-TYPE          W   3 A                                                   
*                                                                               
PARM-INFO                W    12 A                                              
PARM-LTH    PARM-INFO          2 B                                              
PARM-DATA   PARM-INFO   +2    10 A                                              
DATE-BYP    PARM-DATA          1 A                                              
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
LD-PRIOR-DATE             W     6 N MASK('99/99/99')                            
W-RMM     LD-PRIOR-DATE         2 N                                             
W-RDD     LD-PRIOR-DATE  +2     2 N                                             
W-RYY     LD-PRIOR-DATE  +4     2 N                                             
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
BP-PROC-DTE    BPDATES-PARM  +154   8 N                                         
BP-JUL-PROC    BPDATES-PARM  +162   7 A                                         
BP-PRIOR-DTE   BPDATES-PARM  +257   8 N                                         
BP-DAY-TYPE    BPDATES-PARM  +337   1 N                                         
BP-DAY-CDE     BPDATES-PARM  +338   1 N                                         
BP-WK-END      BPDATES-PARM  +339   1 A                                         
BP-CAL-ME      BPDATES-PARM  +340   1 A                                         
BP-CAL-ME-DT   BPDATES-PARM  +342   8 A                                         
BP-DT-CALDATE  BPDATES-PARM  +454   8 N                                         
BP-DT-JULDATE  BPDATES-PARM  +462   7 N                                         
BP-DT-DAYCODE  BPDATES-PARM  +469   1 N                                         
BP-DT-DAYTYPE  BPDATES-PARM  +470   1 N                                         
*                                                                               
*****************                                                               
*                                                                               
JOB INPUT NULL                                                                  
DISPLAY 'CAT659 - GENERATE ACAT PEND EXTRACT WRAP AROUND FILE'                  
DISPLAY 'PDX    - CAT659   C0158537 05/08/01 EZTRIEVE PLUS (EZTP)'              
BP-PGM-NAME = 'XXXXXX'                                                          
BP-REQ-TYPE = 'C'                                                               
CALL BPDATES USING (BPDATES-PARM)                                               
DISPLAY '**  PROCESS DATE = ' BP-PROC-DTE                                       
W-CCYYMMDD = BP-PROC-DTE                                                        
W-PMM = W-XMM                                                                   
W-PDD = W-XDD                                                                   
W-PYY = W-XYY                                                                   
DISPLAY '**  PRIOR   DATE = ' BP-PRIOR-DTE                                      
W-CCYYMMDD = BP-PRIOR-DTE                                                       
W-RMM = W-XMM                                                                   
W-RDD = W-XDD                                                                   
W-RYY = W-XYY                                                                   
*                                                                               
* PARM INFO EDITS                                                               
*                                                                               
PARM-LTH = 10                                                                   
CALL EZTPX01  USING(PARM-REGISTER PARM-INFO)                                    
IF  PARM-LTH = 1                                                                
    DISPLAY '**  JOB PARM(DATE-BYP) = '  DATE-BYP                               
END-IF                                                                          
STOP                                                                            
*                                                                               
*                                                                               
JOB INPUT (IPEND KEY(I-KEY)                     +                               
           PENDIN KEY(P-KEY)) START(0100-WRT-HDR)                               
*                                                                               
IF IPEND                                                                        
    IF I-HDR-LIT = 'DATE='                                                      
       IF  I-HDR-DATE NE BP-PRIOR-DTE AND DATE-BYP NE '1'                       
           DISPLAY '*** IPEND FILE HEADER DATE ERROR = ' I-HDR-DATE             
           DISPLAY '*** PRIOR PROCESS DATE     = ' BP-PRIOR-DTE                 
           DISPLAY '*************'                                              
           ACODE = 1010                                                         
           CALL ABEND USING(ACODE, DUMPSW)                                      
       ELSE                                                                     
           DISPLAY '**  IPEND  FILE HEADER DATE = ' I-HDR-DATE ' OK.'           
       END-IF                                                                   
    ELSE                                                                        
       IF  I-ACTION-TYP =  ' ', 'P'                                             
           IF  I-STTL-DTE GE 19990225                                           
               OPEND:RECORD-LENGTH = IPEND:RECORD-LENGTH                        
               PUT OPEND   FROM IPEND                                           
           END-IF                                                               
       END-IF                                                                   
    END-IF                                                                      
END-IF                                                                          
*                                                                               
IF PENDIN                                                                       
    IF P-HDR-LIT = 'DATE='                                                      
       IF  P-HDR-DATE NE BP-PROC-DTE AND DATE-BYP NE '1'                        
           DISPLAY '*** PENDIN FILE HEADER DATE ERROR = ' P-HDR-DATE            
           DISPLAY '*** PROCESS DATE             = ' BP-PROC-DTE                
           DISPLAY '*************'                                              
           ACODE = 1020                                                         
           CALL ABEND USING(ACODE, DUMPSW)                                      
       ELSE                                                                     
           DISPLAY '**  PENDIN FILE HEADER DATE = ' P-HDR-DATE ' OK.'           
       END-IF                                                                   
       GOTO JOB                                                                 
    END-IF                                                                      
    IF  P-REC-TYP = '2' AND P-STTL-LOC = '10', '30', '50'  AND +                
        W-TRNFR-TYPE NE 'MFC'                                                   
        DISPLAY  'PENDIN'    +                                                  
             ' ' P-CLT       +                                                  
             ' ' P-CUST-ACCT +                                                  
             ' ' P-CNTRL-NUM +                                                  
             ' ' P-REC-TYP   +                                                  
             ' ' P-STTL-LOC  +                                                  
             ' ' P-ADP-SEC   +                                                  
               ' TRNFR-TYPE=' W-TRNFR-TYPE                                      
        OPEND:RECORD-LENGTH = PENDIN:RECORD-LENGTH                              
        PUT OPEND   FROM PENDIN                                                 
    ELSE                                                                        
      IF  P-REC-TYP = '1'                                                       
          W-TRNFR-TYPE = P-TRNFR-TYPE                                           
      END-IF                                                                    
    END-IF                                                                      
END-IF                                                                          
*                                                                               
0100-WRT-HDR. PROC                                                              
O-KEY = ' '                                                                     
O-HDR-IND = 'H'                                                                 
O-HDR-LIT = 'DATE='                                                             
O-HDR-DATE = BP-PROC-DTE                                                        
OPEND:RECORD-LENGTH = 80                                                        
PUT OPEND                                                                       
END-PROC                                                                        
*                                                                               
