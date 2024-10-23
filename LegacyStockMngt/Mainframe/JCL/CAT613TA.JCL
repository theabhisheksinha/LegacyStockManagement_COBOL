//CAT613TA JOB (BA0P,DY00),'NA INTRA DAY RPTPT ',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMA,                                                      
//         USER=BA0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BAAA.CAT611.NA3PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
