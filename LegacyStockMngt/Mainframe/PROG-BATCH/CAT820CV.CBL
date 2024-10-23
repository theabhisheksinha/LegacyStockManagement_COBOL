PARM LINK(CAT820CV R)                                                           
*       PDX    - CAT820CV C0296621 08/27/10 08:58:28 TBLAMUR                    
*                                                                               
*   THIS PROGRAM CONVERTS CAT820.RET(0) FILE FROM 631 TO 644 BYTES              
*                                                                               
FILE FILEA VB(631 27998)                                                        
   IRET-PREFIX    1   25  A                                                     
   IRET-SUFFIX    26  200 A                                                     
   IRET-SUFFIX2  226  200 A                                                     
   IRET-SUFFIX3  426  206 A                                                     
FILE FILE2 VB(644 27998)                                                        
   ORET-PREFIX    1   25  A                                                     
   ORET-FILLER    26  13  A                                                     
   ORET-SUFFIX    39  200 A                                                     
   ORET-SUFFIX2  239  200 A                                                     
   ORET-SUFFIX3  439  206 A                                                     
*                                                                               
*---------------------- PROCEDURE SECTION --------------------------*           
JOB INPUT(FILEA) FINISH(EOJ-PROC)                                               
***********************************                                             
 ORET-PREFIX = IRET-PREFIX                                                      
 ORET-FILLER = ' '                                                              
 ORET-SUFFIX = IRET-SUFFIX                                                      
 ORET-SUFFIX2 = IRET-SUFFIX2                                                    
 ORET-SUFFIX3 = IRET-SUFFIX3                                                    
 PUT FILE2                                                                      
 EOJ-PROC. PROC                                                                 
 STOP EXECUTE                                                                   
 END-PROC                                                                       
