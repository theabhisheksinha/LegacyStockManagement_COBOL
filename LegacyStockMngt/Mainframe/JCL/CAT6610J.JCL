//CAT6610J JOB (BJ0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMJ,                                                      
//             MSGCLASS=W,USER=BJ0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BJJJ,                                                        
//             HNB1=BJJJ                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BJJJ.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BJJJ.CAT661.ACTPI(+1)'                                    
//*                                                                             
