//CAT992TZ JOB (BZ0P,0000),'ACATS: REPORT LOAD',CLASS=U,MSGCLASS=W,             
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB                                                                
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BZZZ.CAT992.EODPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
