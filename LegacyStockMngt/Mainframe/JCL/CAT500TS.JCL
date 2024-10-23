//CAT500TS JOB (BS0P,0000),'ACAT NSCC REPORTS',                                 
//             CLASS=U,MSGCLASS=W,                                              
//  SECLABEL=BISG,                                                              
//             USER=BS0P                                                        
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BSSS.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BSSS.CAT500D.TRAC(0)'                                           
