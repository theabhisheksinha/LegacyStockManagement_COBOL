//CAT731MZ JOB (BZ0P,0000),                                                     
//             'ACATS',                                                         
//             CLASS=U,                                                         
//             MSGCLASS=W,                                                      
//             SECLABEL=BISG,                                                   
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*                                                                             
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB                                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             DSN='BZZZ.CAT731R.ACPI(+000)',                                   
//             PARAM='AUTO,REPLACE'                                             
//*                                                                             
//STEP20  EXEC BTR004,                                                          
//             DSN='BZZZ.CAT731R.ADPI(+000)',                                   
//             PARM='AUTO,REPLACE'                                              
//*                                                                             
//STEP30  EXEC BTR004,                                                          
//             DSN='BZZZ.CAT731R.DLPI(+000)',                                   
//             PARM='AUTO,REPLACE'                                              
