//CAT810TR JOB (BR0P,0000),'RESIDUAL CREDIT RPT ',CLASS=U,MSGCLASS=W,           
//         SECLABEL=BISG,                                                       
//             USER=BR0P                                                        
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT813.RCRPI(0)'                                       
//*                                                                             
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT813.NONPI(0)'                                       
//*                                                                             
//STEP30  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT813.EXCPI(0)'                                       
