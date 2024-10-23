//CAT816TP JOB (BP0P,DY00),'WITHHELD ASSETS RPT ',CLASS=U,MSGCLASS=W,           
//         SCHENV=STREAMP,                                                      
//         USER=BP0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BPPP.CAT816.WHDPI(0)'                                       
