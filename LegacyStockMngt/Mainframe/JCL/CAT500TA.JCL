//CAT500TA JOB (BA0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMA,                                                      
//             CLASS=U,MSGCLASS=W,USER=BA0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BAAA.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BAAA.CAT500D.TRAC(0)'                                           
