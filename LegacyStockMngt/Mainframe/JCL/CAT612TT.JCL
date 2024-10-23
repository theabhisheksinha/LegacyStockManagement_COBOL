//CAT612TT JOB (BT0P,DY00),'NA INTRA DAY RPTPT ',CLASS=O,MSGCLASS=W,            
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BTTT.CAT611.NA2PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
