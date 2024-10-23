//CAT661MY JOB (BY0P,0000),'ACAT FS REPORT',USER=BY0P,CLASS=U,                  
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,REGION=4M,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE,AC=BP',                                      
//             DSN='BYYY.CAT661.ACTPI(0)'                                       
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BYYY.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BYYY.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
