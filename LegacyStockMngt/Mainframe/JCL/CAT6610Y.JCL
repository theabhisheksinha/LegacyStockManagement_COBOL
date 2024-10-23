//CAT6610Y JOB (BY0P,0000),'ACAT FS REPORT',USER=BY0P,CLASS=1,                  
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BYYY,                                                        
//             HNB1=BYYY                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BYYY.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BYYY.CAT661.ACTPI(+1)'                                    
//*                                                                             
