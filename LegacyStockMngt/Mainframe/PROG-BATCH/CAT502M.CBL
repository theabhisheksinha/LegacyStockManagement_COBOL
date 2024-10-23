PARM LINK(CAT502M R)                                                            
*       PDX    - CAT502M  C0310447 06/21/11 15:28:45 TBLAMUR                    
*                                                                               
*   THIS PROGRAM MASKS THE SSN(S) WITH ASTERISKS ON THE OUTBOUND                
*   ACAT CYCLE FILE.                                                            
*                                                                               
*                                                                               
FILE FILEA VB(2995 27998)                                                       
   RECID         1    2  A                                                      
   ISSN          133  9  A                                                      
   ISSN2         142  9  A                                                      
*                                                                               
FILE FILE2 VB(2995 27998)                                                       
   RECO        1   1   A                                                        
*                                                                               
*                                                                               
JOB INPUT(FILEA) FINISH(EOJ-PROC)                                               
*                                                                               
IF RECID  = 'TI'                                                                
  IF ISSN > '         '                                                         
     IF ISSN NE '000000000'                                                     
        ISSN = '*********'                                                      
     END-IF                                                                     
  END-IF                                                                        
  IF ISSN2 > '         '                                                        
     IF ISSN2 NE '000000000'                                                    
        ISSN2 = '*********'                                                     
     END-IF                                                                     
  END-IF                                                                        
END-IF                                                                          
PUT FILE2 FROM FILEA                                                            
EOJ-PROC. PROC                                                                  
STOP EXECUTE                                                                    
END-PROC                                                                        
*                                                                               
