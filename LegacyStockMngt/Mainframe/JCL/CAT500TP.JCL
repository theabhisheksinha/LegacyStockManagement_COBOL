//CAT500TP JOB (BP0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMP,                                                      
//             CLASS=U,MSGCLASS=W,USER=BP0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BPPP.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BPPP.CAT500D.TRAC(0)'                                           
