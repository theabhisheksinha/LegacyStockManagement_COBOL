//CAT814TR JOB (BR0P,DY00),'LQR/ACT/RR/BAL RPT ',CLASS=U,MSGCLASS=W,            
//  SECLABEL=BISG,USER=BR0P,SCHENV=STREAMR                                      
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BRRR.CAT880.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT31.RPRTPI(0)'                                       
//STEP45  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT880C.CSPI(0)'                                       
//STEP47  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT880E.CSPI(0)'                                       
