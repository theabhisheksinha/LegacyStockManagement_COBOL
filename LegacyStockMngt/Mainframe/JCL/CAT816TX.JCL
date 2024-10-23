//CAT816TX JOB (BX0P,DY00),'WITHHELD ASSETS RPT ',USER=BX0P,CLASS=U,            
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BXXX.CAT816.WHDPI(0)'                                       
