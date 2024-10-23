//CAT6610B JOB (BB0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMB,                                                      
//             MSGCLASS=W,USER=BB0P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BBBB,                                                        
//             HNB1=BBBB                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BBBB.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BBBB.CAT661.ACTPI(+1)'                                    
//*                                                                             
