//CAT839MX JOB (BX0P,DY00),'ACAT OFAC REPORT',USER=BX0P,CLASS=U,                
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BXXX.CAT839.OFCPI(0)'                                       
