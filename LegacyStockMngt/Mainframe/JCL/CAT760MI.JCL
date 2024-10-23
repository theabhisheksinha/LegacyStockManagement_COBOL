//CAT760MI JOB (BI0P,0000),'ACAT RV REPORT',CLASS=U,                    00010002
//         SCHENV=STREAMI,                                                      
//             MSGCLASS=W,REGION=4M,USER=BI0P,                          00011000
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                        00012001
//STEP10  EXEC BTR004,                                                  00101000
//             PARAM='AUTO,REPLACE,AC=BP',                              00102000
//             DSN='BIII.CAT760.RPTPI(0)'                               00103000
