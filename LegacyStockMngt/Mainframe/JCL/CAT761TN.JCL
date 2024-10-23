//CAT761TN JOB (BN1P,DAC0),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BN1P,SCHENV=STREAMN,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BNNN.CAT761.ACTPI(0)'                                       
