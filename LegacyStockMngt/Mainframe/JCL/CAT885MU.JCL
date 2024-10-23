//CAT885MU JOB (BU1P,DY00),'ACAT FRGN CUR RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BUUU.CAT885.RPTFC(0)'                                       
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BUUU.CAT885.EXOPR(0)'                                       
