//CAT784MY JOB (BY0P,DY00),'ACAT TAXLOT RPT',CLASS=U,MSGCLASS=W,                
//         SCHENV=STREAMY,                                                      
//        USER=BY0P,SECLABEL=BISG                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BYYY.CAT784R.TLPI(0)'                                       
