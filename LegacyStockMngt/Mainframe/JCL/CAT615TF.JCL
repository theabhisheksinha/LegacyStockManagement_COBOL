//CAT615TF JOB (BF0P,DY00),'NA INTRA DAY RPTPT',CLASS=U,MSGCLASS=W,             
//         SCHENV=STREAMF,                                                      
//         USER=BF0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT611.NA5PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT611.AL5PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
