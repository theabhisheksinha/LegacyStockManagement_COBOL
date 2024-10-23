//CAT661MX JOB (BX0P,0000),'ACAT FS REPORT',USER=BX0P,CLASS=U,                  
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,REGION=4M,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE,AC=BP',                                      
//             DSN='BXXX.CAT661.ACTPI(0)'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BXXX.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP40    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BXXX.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
