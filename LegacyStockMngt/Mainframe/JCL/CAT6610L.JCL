//CAT6610L JOB (BL0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAML,                                                      
//             MSGCLASS=W,USER=BL0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BLLL,                                                        
//             HNB1=BLLL                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BLLL.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BLLL.CAT661.ACTPI(+1)'                                    
//*                                                                             
