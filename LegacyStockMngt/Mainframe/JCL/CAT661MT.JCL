//CAT661MT JOB (BT0P,0000),'ACAT FS REPORT',CLASS=O,                    00010001
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
//             DSN='BTTT.CAT661.ACTPI(0)'                               00103001
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BTTT.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BTTT.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
