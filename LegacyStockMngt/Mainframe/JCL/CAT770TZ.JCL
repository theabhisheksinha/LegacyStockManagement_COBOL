//CAT770TZ JOB (BZ0P,0000),'MUTUAL FUND ADJ RPT ',CLASS=U,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BZZZ.CAT770.MFAPI(0)'                                       
