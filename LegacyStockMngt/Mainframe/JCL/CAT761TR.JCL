//CAT761TR JOB (BR0P,0000),'AUDIT CONTROL REPORT',CLASS=U,MSGCLASS=W,           
//         USER=BR0P,SCHENV=STREAMR,SECLABEL=BISG                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT761.ACTPI(0)'                                       
