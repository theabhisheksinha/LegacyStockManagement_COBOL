//CAT761TS JOB (BS0P,0000),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BS0P,SCHENV=STREAMS,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BSSS.CAT761.ACTPI(0)'                                       
