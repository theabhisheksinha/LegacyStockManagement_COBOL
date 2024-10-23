//CAT612TP JOB (BP0P,DY00),'NA INTRA DAY RPTPT ',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMP,                                                      
//         USER=BP0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BPPP.CAT611.NA2PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
