//CAT500TU JOB (BU1P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMU,                                                      
//             CLASS=U,MSGCLASS=W,USER=BU1P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BUUU.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BUUU.CAT500D.TRAC(0)'                                           
