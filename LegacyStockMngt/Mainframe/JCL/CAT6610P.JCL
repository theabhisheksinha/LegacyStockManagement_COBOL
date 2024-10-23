//CAT6610P JOB (BP0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMP,                                                      
//             MSGCLASS=W,USER=BP0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BPPP,                                                        
//             HNB1=BPPP                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BPPP.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BPPP.CAT661.ACTPI(+1)'                                    
//*                                                                             
