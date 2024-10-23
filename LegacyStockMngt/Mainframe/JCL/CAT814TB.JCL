//CAT814TB JOB (BB0P,DY00),'LQR/ACT/RR/BAL RPT',CLASS=U,MSGCLASS=W,             
//         SCHENV=STREAMB,                                                      
//         USER=BB0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT820.LQRPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT836.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT872.ACTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP40    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT880.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP45    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT880C.CSPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP47    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT880E.CSPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP50    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT610.NAUPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP60    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT610.PNDPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP70  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BBBB.CAT31.RPRTPI(0)'                                       
