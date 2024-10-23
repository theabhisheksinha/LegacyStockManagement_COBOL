//CAT500TX JOB (BX0P,DY00),'ACAT NSCC REPORTS',USER=BX0P,                       
//         SCHENV=STREAMX,                                                      
//             CLASS=U,MSGCLASS=W,                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BXXX.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BXXX.CAT500D.TRAC(0)'                                           
