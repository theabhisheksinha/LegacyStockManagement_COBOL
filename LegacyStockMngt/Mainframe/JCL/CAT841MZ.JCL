//CAT841MZ JOB (BZ0P,0000),'ACATS FUND REV RPT',CLASS=U,MSGCLASS=W,             
//             SECLABEL=BISG,                                                   
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*                                                                             
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB                                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             DSN='BZZZ.CAT840.RVFPI(+000)',                                   
//             PARAM='AUTO,REPLACE'                                             
