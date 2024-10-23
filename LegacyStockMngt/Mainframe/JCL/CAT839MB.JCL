//CAT839MB JOB (BB0P,DY00),'ACAT OFAC REPORT',CLASS=3,MSGCLASS=W,               
//         SCHENV=STREAMB,                                                      
//         USER=BB0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF SYSTEMA                                                               
//*JOBAFF SYSTEMA                                                               
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004N,                                                         
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT839.OFCPI(0)'                                       
