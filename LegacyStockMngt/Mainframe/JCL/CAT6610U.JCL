//CAT6610U JOB (BU1P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMU,                                                      
//             MSGCLASS=W,USER=BU1P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BUUU,                                                        
//             HNB1=BUUU                                                        
//STEP2   EXEC BMF994,                                                          
//             PR133='BUUU.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BUUU.CAT661.ACTPI(+1)'                                    
