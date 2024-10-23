//CAT527MJ JOB (BJ0P,DY00),'ACAT MSD EXCP RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMJ,                                                      
//         USER=BJ0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BJJJ.CAT527.MSDPI(0)'                                       
