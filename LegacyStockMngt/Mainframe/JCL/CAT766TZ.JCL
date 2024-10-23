//CAT766TZ JOB (BZ0P,0000),'ACATS MSD MATCH RPT',CLASS=U,MSGCLASS=W,            
//         SECLABEL=BISG,                                                       
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BZZZ.CAT766A.MSPI(0)'                                       
