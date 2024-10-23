//CAT000OZ JOB (BZ0P,0000),'ACATS REWRITE',CLASS=5,MSGCLASS=W,          00010000
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//*****************************************************                 00012000
//**** OPENS CICS ACAX TRANSACTION IN ALL USA REGIONS                   00013000
//*****************************************************                 00014000
//**ONE-STEP-RESTARTABLE JOB                                                    
//STEP10  EXEC OCPSPROD,                                                00018000
//             MBR='ACAX00OZ'                                           00019000
