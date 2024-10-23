//CAT760MA JOB (BA0P,0000),'ACAT RV RPT TRAC',CLASS=U,                  00010000
//         SCHENV=STREAMA,                                                      
//             MSGCLASS=W,USER=BA0P,                                    00011000
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP01  EXEC BTR004,                                                  00028000
//             PARAM='AUTO,REPLACE,AC=BP',                              00029000
//             DSN='BAAA.CAT760.RPTPI(0)'                               00030000
