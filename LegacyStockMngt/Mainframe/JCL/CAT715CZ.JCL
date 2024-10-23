//CAT715CZ JOB (BZ0P,0000),'ACATS REWRITE',CLASS=1,MSGCLASS=W,          00010000
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**************************************************************        00012000
//**** CLOSE ACAX CAGE TAG INDEX FILE (ACAXCG) IN ALL BTS REGIONS       00013000
//**************************************************************        00014000
//**ONE-STEP-RESTARTABLE JOB                                                    
//STEP10  EXEC OCPSPROD,                                                00018000
//             MBR='CAT715CZ'                                           00019000
