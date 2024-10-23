//CAT500TF JOB (BF0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMF,                                                      
//             CLASS=U,MSGCLASS=W,USER=BF0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BFFF.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BFFF.CAT500D.TRAC(0)'                                           
