//CAT6610X JOB (BX0P,0000),'ACAT FS REPORT',USER=BX0P,CLASS=1,                  
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BXXX,                                                        
//             HNB1=BXXX                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BXXX.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BXXX.CAT661.ACTPI(+1)'                                    
//*                                                                             
