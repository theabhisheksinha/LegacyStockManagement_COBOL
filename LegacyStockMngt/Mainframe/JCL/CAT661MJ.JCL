//CAT661MJ JOB (BJ0P,0000),'ACAT FS REPORT',CLASS=U,MSGCLASS=W,                 
//         SCHENV=STREAMJ,                                                      
//             REGION=4M,USER=BJ0P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             DSN='BJJJ.CAT661.ACTPI(0)',                                      
//             PARAM='AUTO,REPLACE'                                             
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BJJJ.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BJJJ.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
