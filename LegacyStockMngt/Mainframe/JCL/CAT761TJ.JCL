//CAT761TJ JOB (BJ0P,DY00),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BJ0P,SCHENV=STREAMJ,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BJJJ.CAT761.ACTPI(0)'                                       
