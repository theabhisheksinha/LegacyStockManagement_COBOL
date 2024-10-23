//CAT661MA JOB (BA0P,0000),'ACAT FS RPT TRAC',CLASS=U,                  00010000
//         SCHENV=STREAMA,                                                      
//             MSGCLASS=W,USER=BA0P,                                    00011000
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP01  EXEC BTR004,                                                  00028000
//             PARAM='AUTO,REPLACE,AC=BP',                              00029000
//             DSN='BAAA.CAT661.ACTPI(0)'                               00030000
//STEP02    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BAAA.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP03    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BAAA.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
