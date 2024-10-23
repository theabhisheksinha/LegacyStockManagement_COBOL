//CAT500TI JOB (BI0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMI,                                                      
//             CLASS=U,MSGCLASS=W,USER=BI0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BIII.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BIII.CAT500D.TRAC(0)'                                           
