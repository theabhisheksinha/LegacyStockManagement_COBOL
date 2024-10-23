//CAT732TZ JOB (BZ0P,0000),'RESTRICTED SEC REPT ',CLASS=U,MSGCLASS=W,           
//        USER=BZ0P,SECLABEL=BISG,SCHENV=STREAMZ                                
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BZZZ.CAT732R.RSPI(0)'                                       
