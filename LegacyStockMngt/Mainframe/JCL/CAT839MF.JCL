//CAT839MF JOB (BF0P,DY00),'ACAT OFAC REPORT',CLASS=3,MSGCLASS=W,               
//         SCHENV=STREAMF,                                                      
//         USER=BF0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF SYSTEMA                                                               
//*JOBAFF SYSTEMA                                                               
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BFFF.CAT839.OFCPI(0)'                                       
