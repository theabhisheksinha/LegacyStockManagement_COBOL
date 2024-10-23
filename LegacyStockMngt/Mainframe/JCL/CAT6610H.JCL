//CAT6610H JOB (BH0P,0000),'ACAT FS REPORT',CLASS=1,                            
//         SCHENV=STREAMH,                                                      
//             MSGCLASS=W,USER=BH0P,                                            
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
//             HNB=BHHH,                                                        
//             HNB1=BHHH,                                                       
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
//             PRTPI='BHHH.CAT661.ACTPI(+1)',                                   
//             PR133='BHHH.CAT661.ACTRPT.TMP',                                  
//             RUNDATE=                                                         
