//CAT885MA JOB (BA0P,DY00),'ACAT FRGN CUR RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMA,                                                      
//         USER=BA0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BAAA.CAT885.RPTFC(0)'                                       
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BAAA.CAT885.EXOPR(0)'                                       
