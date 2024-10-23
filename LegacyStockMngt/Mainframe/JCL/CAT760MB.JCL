//CAT760MB JOB (BB0P,0000),'ACAT RV REPORT',CLASS=U,                    00010000
//         SCHENV=STREAMB,                                                      
//             MSGCLASS=W,REGION=4M,USER=BB0P,                          00011000
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                        00012002
//STEP10  EXEC BTR004,                                                  00101000
//             PARAM='AUTO,REPLACE,AC=BP',                              00102000
//             DSN='BBBB.CAT760.RPTPI(0)'                               00103000
