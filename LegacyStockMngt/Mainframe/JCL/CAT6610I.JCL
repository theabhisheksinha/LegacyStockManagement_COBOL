//CAT6610I JOB (BI0P,0000),'ACAT FS REPORT',CLASS=Y,                            
//         SCHENV=STREAMI,                                                      
//             MSGCLASS=W,REGION=4M,USER=BI0P,                                  
//  SECLABEL=BISG                                                               
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BIII,                                                        
//             HNB1=BIII                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BIII.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BIII.CAT661.ACTPI(+1)'                                    
//*                                                                             
