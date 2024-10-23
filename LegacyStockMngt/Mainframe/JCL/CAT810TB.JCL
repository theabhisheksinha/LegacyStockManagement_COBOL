//CAT810TB JOB (BB0P,DY00),'RESIDUAL CREDIT RPT ',CLASS=U,MSGCLASS=W,           
//         SCHENV=STREAMB,                                                      
//         USER=BB0P,                                                           
//         SECLABEL=BISG                                                        
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT813.RCRPI(0)'                                       
//*                                                                             
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT813.NONPI(0)'                                       
//*                                                                             
//STEP30  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT813.EXCPI(0)'                                       
