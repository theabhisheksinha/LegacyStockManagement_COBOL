//CAT839MH JOB (BH0P,DY00),'ACAT OFAC REPORT',CLASS=U,MSGCLASS=W,               
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BHHH.CAT839.OFCPI(0)'                                       
