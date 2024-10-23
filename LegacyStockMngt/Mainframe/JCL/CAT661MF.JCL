//CAT661MF JOB (BF0P,0000),'ACAT FS REPORT',CLASS=U,                    00010000
//         SCHENV=STREAMF,                                                      
//             MSGCLASS=W,REGION=4M,USER=BF0P,                          00011000
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                  00101000
//             PARAM='AUTO,REPLACE,AC=BP',                              00102000
//             DSN='BFFF.CAT661.ACTPI(0)'                               00103000
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
