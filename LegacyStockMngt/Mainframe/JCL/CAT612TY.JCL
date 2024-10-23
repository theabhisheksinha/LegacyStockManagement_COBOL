//CAT612TY JOB (BY0P,DY00),'NA INTRA DAY RPTPT ',USER=BY0P,CLASS=U,             
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BYYY.CAT611.NA2PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
