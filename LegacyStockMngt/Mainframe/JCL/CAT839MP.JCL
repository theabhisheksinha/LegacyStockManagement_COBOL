//CAT839MP JOB (BP0P,DY00),'ACAT OFAC REPORT',CLASS=U,MSGCLASS=W,               
//         SCHENV=STREAMP,                                                      
//         USER=BP0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BPPP.CAT839.OFCPI(0)'                                       
