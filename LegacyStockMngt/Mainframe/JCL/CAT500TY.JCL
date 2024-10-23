//CAT500TY JOB (BY0P,DY00),'ACAT NSCC EXTRACT',USER=BY0P,                       
//         SCHENV=STREAMY,                                                      
//             CLASS=U,MSGCLASS=W,                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BYYY.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BYYY.CAT500D.TRAC(0)'                                           
