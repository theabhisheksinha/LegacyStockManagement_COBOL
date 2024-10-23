//CAT500TJ JOB (BJ0P,0000),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMJ,                                                      
//         CLASS=U,MSGCLASS=W,USER=BJ0P,                                        
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BJJJ.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BJJJ.CAT500D.TRAC(0)'                                           
