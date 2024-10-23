//CAT761TB JOB (BB0P,DY00),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BB0P,SCHENV=STREAMB,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT761.ACTPI(0)'                                       
