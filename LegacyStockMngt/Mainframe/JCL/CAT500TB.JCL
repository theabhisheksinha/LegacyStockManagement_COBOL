//CAT500TB JOB (BB0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMB,                                                      
//             CLASS=U,MSGCLASS=W,USER=BB0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BBBB.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BBBB.CAT500D.TRAC(0)'                                           
