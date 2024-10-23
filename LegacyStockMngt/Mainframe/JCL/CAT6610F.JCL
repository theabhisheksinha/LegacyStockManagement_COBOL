//CAT6610F JOB (BF0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMF,                                                      
//             MSGCLASS=W,USER=BF0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BFFF,                                                        
//             HNB1=BFFF                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BFFF.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BFFF.CAT661.ACTPI(+1)'                                    
//*                                                                             
