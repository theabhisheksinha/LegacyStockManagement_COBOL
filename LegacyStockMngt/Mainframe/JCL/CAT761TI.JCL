//CAT761TI JOB (BI0P,DY00),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BI0P,SCHENV=STREAMI,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BIII.CAT761.ACTPI(0)'                                       
