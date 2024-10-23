//CAT761TU JOB (BU1P,DY00),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BU1P,SCHENV=STREAMU,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BUUU.CAT761.ACTPI(0)'                                       
