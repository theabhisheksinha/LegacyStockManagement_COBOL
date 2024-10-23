//CAT761TY JOB (BY0P,DY00),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BY0P,SCHENV=STREAMY,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BYYY.CAT761.ACTPI(0)'                                       
