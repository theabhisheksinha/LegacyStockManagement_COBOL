//CAT810TT JOB (BT0P,DY00),'RESIDUAL CREDIT RPT ',CLASS=O,MSGCLASS=W,           
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//         SECLABEL=BISG                                                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BTTT.CAT813.RCRPI(0)'                                       
//*                                                                             
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BTTT.CAT813.NONPI(0)'                                       
//*                                                                             
//STEP30  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BTTT.CAT813.EXCPI(0)'                                       
