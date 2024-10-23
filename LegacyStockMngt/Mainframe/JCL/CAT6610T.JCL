//CAT6610T JOB (BT0P,0000),'ACAT FS REPORT',CLASS=O,MSGCLASS=W,                 
//         SCHENV=STREAMT,                                                      
//             REGION=8M,PRTY=9,USER=BT0P,                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//JOBLIB DD DSN=BTTT.ADP.DATELIB,DISP=SHR                                       
//PROCLIB DD DSN=BISG.T3.PROCLIB,DISP=SHR                                       
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*                                                                             
//STEP1   EXEC CAT661,                                                          
//             HNB=BTTT,                                                        
//             HNB1=BTTT                                                        
//*                                                                             
//STEP2   EXEC BMF994,                                                          
//             PR133='BTTT.CAT661.ACTRPT.TMP',                                  
//             IPDISP='(OLD,DELETE,KEEP)',                                      
//             IPUNIT=BATCH,                                                    
//             OPDISP='(,CATLG,DELETE)',                                        
//             OPUNIT=BATCH,                                                    
//             OPSPACE='(CYL,(15,15),RLSE)',                                    
//             PRTPI='BTTT.CAT661.ACTPI(+1)'                                    
//*                                                                             
