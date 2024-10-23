//CAT500TL JOB (BL0P,DY00),'ACAT NSCC REPORST',                                 
//         SCHENV=STREAML,                                                      
//         CLASS=U,MSGCLASS=W,USER=BL0P,                                        
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BLLL.CAT500R.TRAC(0)'                                           
//**********************************************************************        
//BTR0420  EXEC BTR004,                                                         
//         PARAM='AUTO,REPLACE',                                                
//         DSN='BLLL.CAT500D.TRAC(0)'                                           
