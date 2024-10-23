//CAT765TZ JOB (BZ0P,0000),'ACATS NON STD REPORT',CLASS=U,MSGCLASS=W,           
//         SECLABEL=BISG,                                                       
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BZZZ.CAT765.TRNPI(0)'                                       
//*                                                                             
//STEP20  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BZZZ.CAT765CV.CPI(0)'                                       
