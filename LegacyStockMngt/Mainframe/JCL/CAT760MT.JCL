//CAT760MT JOB (BT0P,0000),'ACAT RV REPORT',CLASS=O,                    00010001
//         SCHENV=STREAMT,                                                      
//             MSGCLASS=W,REGION=4M,USER=BT0P,                          00011001
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//JOBLIB    DD DISP=SHR,DSN=BTTT.ADP.DATELIB                                    
//PROCLIB   DD DISP=SHR,DSN=BISG.T3.PROCLIB                                     
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                  00101003
//             PARAM='AUTO,REPLACE',                                    00102001
//             DSN='BTTT.CAT760.RPTPI(0)'                               00103001
