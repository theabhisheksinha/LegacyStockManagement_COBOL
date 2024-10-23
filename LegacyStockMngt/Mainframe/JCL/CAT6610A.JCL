//CAT6610A JOB (BA0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMA,                                                      
//             MSGCLASS=W,USER=BA0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BAAA,                                                        
//             HNB1=BAAA                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BAAA.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BAAA.CAT661.ACTPI(+1)'                                    
//*                                                                             
