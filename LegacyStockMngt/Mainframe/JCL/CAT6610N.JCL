//CAT6610N JOB (BN1P,DAC0),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMN,                                                      
//             MSGCLASS=W,USER=BN1P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP1   EXEC CAT661,                                                          
//             B1HDR='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT661=,                                                         
//             GEN0='(0)',                                                      
//             HNB=BNNN,                                                        
//             HNB1=BNNN,                                                       
//             RUNDATE=,                                                        
//             UNIT=BATCH                                                       
//STEP2   EXEC BMF994,                                                          
//             BMF994=,                                                         
//             GDG='GDG,',                                                      
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             IPVOL=,                                                          
//             OPBLK='27885',                                                   
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             OPUNIT=BATCH,                                                    
//             OPVOL=,                                                          
//             PRTPI='BNNN.CAT661.ACTPI(+1)',                                   
//             PR133='BNNN.CAT661.ACTRPT.TMP',                                  
//             RUNDATE=                                                         
